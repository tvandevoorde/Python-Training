[CmdletBinding()]
param(
    [string]$SourceRoot = (Get-Location).Path,
    [string]$OutputRoot = (Join-Path (Get-Location).Path "docs")
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function ConvertTo-ForwardSlashPath {
  param(
    [string]$Path
  )

  return $Path.Replace('\\', '/').Replace('\', '/')
}

function Get-PageTitle {
    param(
        [string[]]$Lines,
        [string]$Fallback
    )

    foreach ($line in $Lines) {
        if ($line -match '^\s*#\s+(.+?)\s*$') {
            return $matches[1].Trim()
        }
    }

    return $Fallback
}

function Get-OutputRelativePath {
    param(
        [string]$SourceRelativePath
    )

    $normalizedPath = ConvertTo-ForwardSlashPath -Path $SourceRelativePath

    if ($normalizedPath -ieq "README.md") {
        return "index.html"
    }

    return ConvertTo-ForwardSlashPath -Path ([System.IO.Path]::ChangeExtension($SourceRelativePath, ".html"))
}

function Get-RelativeHref {
    param(
        [string]$FromOutputRelativePath,
        [string]$ToOutputRelativePath
    )

    $fromDirectory = Split-Path -Path $FromOutputRelativePath -Parent

    if ([string]::IsNullOrWhiteSpace($fromDirectory)) {
        $fromDirectory = "."
    }

    $fromFullPath = [System.IO.Path]::GetFullPath((Join-Path $OutputRootResolved $fromDirectory))
    $toFullPath = [System.IO.Path]::GetFullPath((Join-Path $OutputRootResolved $ToOutputRelativePath))
    $relativePath = [System.IO.Path]::GetRelativePath($fromFullPath, $toFullPath)

    return ConvertTo-ForwardSlashPath -Path $relativePath
}

function Get-HtmlEncodedText {
    param(
        [AllowNull()]
        [string]$Text
    )

    return [System.Net.WebUtility]::HtmlEncode($Text)
}

function Update-RelativeMarkdownLinks {
    param(
        [string]$Html,
        [string]$CurrentSourceRelativePath,
        [string]$CurrentOutputRelativePath
    )

    $currentDirectory = Split-Path -Path $CurrentSourceRelativePath -Parent

    if ([string]::IsNullOrWhiteSpace($currentDirectory)) {
        $currentDirectory = "."
    }

    return [regex]::Replace(
        $Html,
        'href="(?!https?:|mailto:|#)([^"?#]+?)\.md([?#][^"]*)?"',
        {
            param($m)
            $pathPart = $m.Groups[1].Value.Replace('/', [System.IO.Path]::DirectorySeparatorChar)
            $suffix = $m.Groups[2].Value
            $resolvedSourcePath = [System.IO.Path]::GetFullPath((Join-Path (Join-Path $sourceRootResolved $currentDirectory) $pathPart))

            if (-not $resolvedSourcePath.StartsWith($sourceRootResolved, [System.StringComparison]::OrdinalIgnoreCase)) {
                return $m.Value
            }

            $targetSourceRelativePath = [System.IO.Path]::GetRelativePath($sourceRootResolved, $resolvedSourcePath)
            $targetOutputRelativePath = Get-OutputRelativePath -SourceRelativePath $targetSourceRelativePath
            $targetHref = Get-RelativeHref -FromOutputRelativePath $CurrentOutputRelativePath -ToOutputRelativePath $targetOutputRelativePath

            'href="{0}{1}"' -f $targetHref, $suffix
        }
    )
}

function New-LinkItem {
    param(
        [string]$Href,
        [string]$Label,
        [bool]$IsCurrent = $false,
        [string]$CssClass = ""
    )

    return [PSCustomObject]@{
        Href = $Href
        Label = $Label
        IsCurrent = $IsCurrent
        CssClass = $CssClass
    }
}

function Convert-LinkItemsToHtml {
    param(
        [object[]]$Items,
        [string]$ListClass
    )

    if (-not $Items -or $Items.Count -eq 0) {
        return ""
    }

    $listItems = foreach ($item in $Items) {
        $activeClass = if ($item.IsCurrent) { " is-current" } else { "" }
        $extraClass = if ([string]::IsNullOrWhiteSpace($item.CssClass)) { "" } else { " $($item.CssClass)" }
        '<li><a class="{0}{1}{2}" href="{3}">{4}</a></li>' -f $ListClass, $activeClass, $extraClass, $item.Href, (Get-HtmlEncodedText -Text $item.Label)
    }

    return $listItems -join "`n"
}

function Get-DirectoryDisplayName {
    param(
        [string]$DirectoryKey
    )

    if ([string]::IsNullOrWhiteSpace($DirectoryKey) -or $DirectoryKey -eq ".") {
        return "Home"
    }

    $segments = (ConvertTo-ForwardSlashPath -Path $DirectoryKey).Split('/', [System.StringSplitOptions]::RemoveEmptyEntries)
    return $segments[-1]
}

  function Get-LevelKey {
    param(
      [string]$DirectoryKey
    )

    if ([string]::IsNullOrWhiteSpace($DirectoryKey) -or $DirectoryKey -eq ".") {
      return ""
    }

    $normalized = ConvertTo-ForwardSlashPath -Path $DirectoryKey
    $segments = $normalized.Split('/', [System.StringSplitOptions]::RemoveEmptyEntries)

    if ($segments.Count -eq 0) {
      return ""
    }

    if ($segments[0] -match '^Level-\d+-') {
      return $segments[0]
    }

    return ""
  }

function Build-BreadcrumbHtml {
    param(
        [pscustomobject]$Page,
        [hashtable]$DirectoryLandingPages
    )

    $items = @()
    $items += '<li><a href="{0}">Home</a></li>' -f (Get-RelativeHref -FromOutputRelativePath $Page.OutputRelativePath -ToOutputRelativePath "index.html")

    if (-not [string]::IsNullOrWhiteSpace($Page.SourceDirectory) -and $Page.SourceDirectory -ne ".") {
        $segments = $Page.SourceDirectory.Split('/', [System.StringSplitOptions]::RemoveEmptyEntries)
        $currentPath = ""

        foreach ($segment in $segments) {
            $currentPath = if ([string]::IsNullOrWhiteSpace($currentPath)) { $segment } else { "$currentPath/$segment" }

            if ($DirectoryLandingPages.ContainsKey($currentPath)) {
                $directoryPage = $DirectoryLandingPages[$currentPath]
                $href = Get-RelativeHref -FromOutputRelativePath $Page.OutputRelativePath -ToOutputRelativePath $directoryPage.OutputRelativePath
                $items += '<li><a href="{0}">{1}</a></li>' -f $href, (Get-HtmlEncodedText -Text (Get-DirectoryDisplayName -DirectoryKey $currentPath))
            }
            else {
                $items += '<li><span>{0}</span></li>' -f (Get-HtmlEncodedText -Text $segment)
            }
        }
    }

    $items += '<li><span>{0}</span></li>' -f (Get-HtmlEncodedText -Text $Page.Title)

    return $items -join "`n"
}

function Build-TopNavigationHtml {
    param(
        [pscustomobject]$Page,
        [object[]]$AllPages,
        [hashtable]$DirectoryLandingPages
    )

    $items = @()
    $items += New-LinkItem -Href (Get-RelativeHref -FromOutputRelativePath $Page.OutputRelativePath -ToOutputRelativePath "index.html") -Label "Home" -IsCurrent ($Page.OutputRelativePath -ieq "index.html")

    $levelKeys = $AllPages |
      ForEach-Object { $_.TopLevelDirectory } |
      Where-Object { $_ -match '^Level-\d+-' } |
      Sort-Object -Unique

    foreach ($levelKey in $levelKeys) {
      if ($DirectoryLandingPages.ContainsKey($levelKey)) {
        $landingPage = $DirectoryLandingPages[$levelKey]
      }
      else {
        $landingPage = $AllPages |
          Where-Object { $_.TopLevelDirectory -eq $levelKey } |
          Sort-Object -Property OutputRelativePath |
          Select-Object -First 1
      }

      if ($null -ne $landingPage) {
        $items += New-LinkItem -Href (Get-RelativeHref -FromOutputRelativePath $Page.OutputRelativePath -ToOutputRelativePath $landingPage.OutputRelativePath) -Label $levelKey -IsCurrent ($Page.TopLevelDirectory -eq $levelKey)
      }
    }

    return Convert-LinkItemsToHtml -Items $items -ListClass "nav-link"
}

function Build-SidebarHtml {
    param(
        [pscustomobject]$Page,
        [object[]]$AllPages,
        [hashtable]$DirectoryLandingPages
    )

    $items = @()
    $items += '<li><a class="sidebar-link sidebar-home{0}" href="{1}">README / Home</a></li>' -f ($(if ($Page.OutputRelativePath -ieq "index.html") { " is-current" } else { "" })), (Get-RelativeHref -FromOutputRelativePath $Page.OutputRelativePath -ToOutputRelativePath "index.html")

    $levelKeys = $AllPages |
      ForEach-Object { $_.TopLevelDirectory } |
      Where-Object { $_ -match '^Level-\d+-' } |
      Sort-Object -Unique

    foreach ($levelKey in $levelKeys) {
      if ($DirectoryLandingPages.ContainsKey($levelKey)) {
        $levelLandingPage = $DirectoryLandingPages[$levelKey]
      }
      else {
        $levelLandingPage = $AllPages |
          Where-Object { $_.TopLevelDirectory -eq $levelKey } |
          Sort-Object -Property OutputRelativePath |
          Select-Object -First 1
      }

      if ($null -eq $levelLandingPage) {
        continue
      }

      $isLevelCurrent = $Page.TopLevelDirectory -eq $levelKey
      $levelCurrentClass = if ($isLevelCurrent) { " is-current" } else { "" }
      $levelOpen = if ($isLevelCurrent) { " open" } else { "" }
      $levelHref = Get-RelativeHref -FromOutputRelativePath $Page.OutputRelativePath -ToOutputRelativePath $levelLandingPage.OutputRelativePath
      $levelHeader = '<span class="sidebar-caret" aria-hidden="true">▸</span><a class="sidebar-link sidebar-level-heading{0}" href="{1}">{2}</a>' -f $levelCurrentClass, $levelHref, (Get-HtmlEncodedText -Text $levelKey)

      $items += '<li class="sidebar-group"><details class="sidebar-details sidebar-level"{0}><summary class="sidebar-summary">{1}</summary><ul class="sidebar-sublist">' -f $levelOpen, $levelHeader

      $sublevelKeys = $DirectoryLandingPages.Keys |
        Where-Object {
          $_.StartsWith("$levelKey/", [System.StringComparison]::OrdinalIgnoreCase) -and
          ($_.Substring($levelKey.Length + 1) -notmatch '/')
        } |
        Sort-Object

      foreach ($sublevelKey in $sublevelKeys) {
        $sublevelLandingPage = $DirectoryLandingPages[$sublevelKey]
        $sublevelCurrent = $Page.SourceDirectory -eq $sublevelKey -or $Page.SourceDirectory.StartsWith("$sublevelKey/", [System.StringComparison]::OrdinalIgnoreCase)
        $sublevelCurrentClass = if ($sublevelCurrent) { " is-current" } else { "" }
        $sublevelOpen = if ($sublevelCurrent) { " open" } else { "" }
        $sublevelHref = Get-RelativeHref -FromOutputRelativePath $Page.OutputRelativePath -ToOutputRelativePath $sublevelLandingPage.OutputRelativePath
        $sublevelHeader = '<span class="sidebar-caret" aria-hidden="true">▸</span><a class="sidebar-link sidebar-sublevel-heading{0}" href="{1}">{2}</a>' -f $sublevelCurrentClass, $sublevelHref, (Get-HtmlEncodedText -Text (Get-DirectoryDisplayName -DirectoryKey $sublevelKey))

        $items += '<li><details class="sidebar-details sidebar-sublevel"{0}><summary class="sidebar-summary">{1}</summary><ul class="sidebar-sublist sidebar-lesson-list">' -f $sublevelOpen, $sublevelHeader

        $lessonPages = $AllPages |
          Where-Object {
            $_.SourceDirectory -eq $sublevelKey -and
            $_.SourceRelativePath -notmatch '(^|/)CURRICULUM-INDEX\.md$'
          } |
          Sort-Object -Property SourceRelativePath

        foreach ($lessonPage in $lessonPages) {
          $lessonCurrentClass = if ($lessonPage.OutputRelativePath -eq $Page.OutputRelativePath) { " is-current" } else { "" }
          $items += '<li><a class="sidebar-link sidebar-lesson{0}" href="{1}">{2}</a></li>' -f $lessonCurrentClass, (Get-RelativeHref -FromOutputRelativePath $Page.OutputRelativePath -ToOutputRelativePath $lessonPage.OutputRelativePath), (Get-HtmlEncodedText -Text $lessonPage.Title)
        }

        $items += '</ul></details></li>'
      }

      $items += '</ul></details></li>'
    }

    return ($items -join "`n")
}

function Build-PageHtml {
    param(
        [pscustomobject]$Page,
        [string]$HtmlFragment,
        [string]$TopNavigationHtml,
        [string]$SidebarHtml,
        [string]$BreadcrumbHtml
    )

    return @"
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>$($Page.Title)</title>
  <style>
    :root {
      color-scheme: light;
      --bg: #eef3f8;
      --panel: #ffffff;
      --panel-alt: #f7f9fc;
      --text: #1e2938;
      --muted: #627085;
      --line: #d9e1ec;
      --link: #1459b8;
      --accent: #0c8346;
      --code-bg: #eff3f9;
      --shadow: 0 14px 32px rgba(21, 40, 74, 0.08);
    }

    * { box-sizing: border-box; }

    body {
      margin: 0;
      background:
        radial-gradient(circle at top left, rgba(20, 89, 184, 0.08), transparent 26%),
        linear-gradient(180deg, #f5f8fc 0%, var(--bg) 100%);
      color: var(--text);
      font-family: "Segoe UI", Tahoma, sans-serif;
      line-height: 1.6;
    }

    .shell {
      max-width: 1400px;
      margin: 0 auto;
      padding: 1.5rem;
    }

    .topbar {
      background: rgba(255, 255, 255, 0.92);
      backdrop-filter: blur(10px);
      border: 1px solid var(--line);
      border-radius: 16px;
      padding: 1rem 1.25rem;
      box-shadow: var(--shadow);
      margin-bottom: 1rem;
    }

    .topbar-title {
      display: flex;
      justify-content: space-between;
      gap: 1rem;
      align-items: center;
      margin-bottom: 0.75rem;
    }

    .topbar-title h1 {
      font-size: 1.3rem;
      margin: 0;
    }

    .topbar-title p {
      margin: 0;
      color: var(--muted);
      font-size: 0.95rem;
    }

    .nav-list,
    .breadcrumb-list,
    .sidebar-list {
      list-style: none;
      margin: 0;
      padding: 0;
    }

    .nav-list {
      display: flex;
      flex-wrap: wrap;
      gap: 0.6rem;
    }

    .nav-link,
    .sidebar-link {
      display: block;
      text-decoration: none;
      color: var(--text);
      border: 1px solid var(--line);
      background: var(--panel-alt);
      border-radius: 999px;
      padding: 0.45rem 0.8rem;
      transition: background 120ms ease, border-color 120ms ease, color 120ms ease;
    }

    .sidebar-link {
      border-radius: 10px;
      padding: 0.6rem 0.75rem;
      margin-bottom: 0.45rem;
    }

    .sidebar-home {
      font-weight: 600;
    }

    .nav-link:hover,
    .sidebar-link:hover {
      background: #eaf1fb;
      border-color: #bfd0ea;
      color: var(--link);
    }

    .is-current {
      background: #e5f5eb;
      border-color: #b7dfc8;
      color: var(--accent);
      font-weight: 600;
    }

    .sidebar-level-heading {
      background: #f0f6ff;
      border-style: dashed;
      font-weight: 700;
      margin-bottom: 0;
    }

    .sidebar-sublevel-heading {
      background: #f8fbff;
      font-weight: 600;
      margin-bottom: 0;
    }

    .sidebar-lesson {
      margin-left: 1.6rem;
      font-size: 0.93rem;
      background: #ffffff;
    }

    .sidebar-group {
      margin-bottom: 0.4rem;
    }

    .sidebar-details {
      border: 1px solid #dce5f2;
      border-radius: 10px;
      background: #ffffff;
      padding: 0.25rem;
    }

    .sidebar-details.sidebar-level {
      background: #fbfdff;
    }

    .sidebar-details.sidebar-sublevel {
      margin-top: 0.35rem;
      margin-left: 0.45rem;
      border-color: #e5ebf6;
    }

    .sidebar-details > summary {
      list-style: none;
      cursor: pointer;
    }

    .sidebar-details > summary::-webkit-details-marker {
      display: none;
    }

    .sidebar-summary {
      display: flex;
      align-items: center;
      gap: 0.35rem;
      margin: 0;
    }

    .sidebar-caret {
      color: #5f7494;
      font-size: 0.8rem;
      transition: transform 120ms ease;
    }

    .sidebar-details[open] > summary .sidebar-caret {
      transform: rotate(90deg);
    }

    .sidebar-sublist {
      list-style: none;
      margin: 0.35rem 0 0;
      padding: 0;
    }

    .sidebar-lesson-list {
      margin-top: 0.4rem;
    }

    .layout {
      display: grid;
      grid-template-columns: 290px minmax(0, 1fr);
      gap: 1rem;
      align-items: start;
    }

    aside,
    .content {
      background: var(--panel);
      border: 1px solid var(--line);
      border-radius: 16px;
      box-shadow: var(--shadow);
    }

    aside {
      padding: 1rem;
      position: sticky;
      top: 1rem;
    }

    aside h2 {
      font-size: 1rem;
      margin: 0 0 0.75rem;
    }

    .content {
      padding: 1.5rem 2rem 2rem;
    }

    .breadcrumb-list {
      display: flex;
      flex-wrap: wrap;
      gap: 0.45rem;
      margin-bottom: 1.25rem;
      color: var(--muted);
      font-size: 0.95rem;
    }

    .breadcrumb-list li:not(:last-child)::after {
      content: "/";
      margin-left: 0.45rem;
      color: #9aa8bc;
    }

    .breadcrumb-list a {
      color: var(--link);
      text-decoration: none;
    }

    .breadcrumb-list a:hover {
      text-decoration: underline;
    }

    h1, h2, h3, h4, h5, h6 {
      line-height: 1.25;
      margin-top: 1.35em;
      margin-bottom: 0.45em;
    }

    h1 { margin-top: 0; }

    a {
      color: var(--link);
    }

    pre {
      background: var(--code-bg);
      border: 1px solid var(--line);
      border-radius: 10px;
      padding: 0.9rem;
      overflow-x: auto;
    }

    code {
      font-family: Consolas, "Courier New", monospace;
    }

    table {
      border-collapse: collapse;
      width: 100%;
    }

    th, td {
      border: 1px solid var(--line);
      padding: 0.55rem 0.65rem;
      text-align: left;
      vertical-align: top;
    }

    blockquote {
      margin: 1rem 0;
      padding: 0.2rem 1rem;
      border-left: 4px solid #b8c5db;
      color: var(--muted);
      background: #f9fbff;
    }

    img {
      max-width: 100%;
      height: auto;
    }

    @media (max-width: 960px) {
      .layout {
        grid-template-columns: 1fr;
      }

      aside {
        position: static;
      }

      .content {
        padding: 1.25rem;
      }
    }
  </style>
</head>
<body>
  <div class="shell">
    <header class="topbar">
      <div class="topbar-title">
        <div>
          <h1>$([System.Net.WebUtility]::HtmlEncode($Page.Title))</h1>
          <p>$([System.Net.WebUtility]::HtmlEncode($Page.SourceRelativePath))</p>
        </div>
      </div>
      <nav>
        <ul class="nav-list">
$TopNavigationHtml
        </ul>
      </nav>
    </header>

    <div class="layout">
      <aside>
        <h2>Navigation</h2>
        <ul class="sidebar-list">
$SidebarHtml
        </ul>
      </aside>

      <main class="content">
        <nav aria-label="Breadcrumbs">
          <ul class="breadcrumb-list">
$BreadcrumbHtml
          </ul>
        </nav>
$HtmlFragment
      </main>
    </div>
  </div>
</body>
</html>
"@
}

if (-not (Get-Command -Name ConvertFrom-Markdown -ErrorAction SilentlyContinue)) {
    throw "ConvertFrom-Markdown is not available. Run this script with PowerShell 7+ (pwsh)."
}

if (-not (Test-Path -Path $SourceRoot -PathType Container)) {
    throw "Source root does not exist: $SourceRoot"
}

$sourceRootResolved = (Resolve-Path -Path $SourceRoot).Path

if (-not (Test-Path -Path $OutputRoot -PathType Container)) {
  New-Item -Path $OutputRoot -ItemType Directory | Out-Null
}
else {
  Get-ChildItem -Path $OutputRoot -Force | Remove-Item -Recurse -Force
}

$outputRootResolved = (Resolve-Path -Path $OutputRoot).Path

$markdownFiles = Get-ChildItem -Path $sourceRootResolved -Recurse -File -Filter "*.md" |
    Where-Object {
        $_.FullName -notlike "$outputRootResolved*" -and
    $_.FullName -notlike "*\.git\*" -and
    -not (($_.FullName.Substring($sourceRootResolved.Length).TrimStart('\', '/')) -split '[\\/]' | Where-Object { $_ -like ".*" })
    } |
    Sort-Object -Property FullName

if ($markdownFiles.Count -eq 0) {
    Write-Host "No markdown files found under $sourceRootResolved"
    return
}

$generatedPages = foreach ($file in $markdownFiles) {
    $relativePath = ConvertTo-ForwardSlashPath -Path ([System.IO.Path]::GetRelativePath($sourceRootResolved, $file.FullName))
  $sourceDirectory = ConvertTo-ForwardSlashPath -Path (Split-Path -Path $relativePath -Parent)
    if ([string]::IsNullOrWhiteSpace($sourceDirectory)) {
        $sourceDirectory = "."
    }

    $outputRelativePath = Get-OutputRelativePath -SourceRelativePath $relativePath
    $topLevelDirectory = if ($sourceDirectory -eq ".") { "" } else { $sourceDirectory.Split('/')[0] }

    [PSCustomObject]@{
        SourcePath = $file.FullName
        SourceRelativePath = $relativePath
        SourceDirectory = $sourceDirectory
        OutputRelativePath = $outputRelativePath
        Title = Get-PageTitle -Lines (Get-Content -Path $file.FullName) -Fallback $file.BaseName
        TopLevelDirectory = $topLevelDirectory
    }
}

$directoryLandingPages = @{}

foreach ($page in $generatedPages) {
    if ($page.SourceRelativePath -match '(^|/)CURRICULUM-INDEX\.md$') {
        $directoryLandingPages[$page.SourceDirectory] = $page
    }
}

foreach ($page in $generatedPages) {
    if ($page.SourceRelativePath -match '(^|/)README\.md$' -and -not $directoryLandingPages.ContainsKey($page.SourceDirectory)) {
        $directoryLandingPages[$page.SourceDirectory] = $page
    }
}

foreach ($page in $generatedPages) {
    if (-not $directoryLandingPages.ContainsKey($page.SourceDirectory)) {
        $directoryLandingPages[$page.SourceDirectory] = $page
    }
}

foreach ($page in $generatedPages) {
    $outputFile = Join-Path $outputRootResolved $page.OutputRelativePath
    $outputDir = Split-Path -Path $outputFile -Parent

    if (-not (Test-Path -Path $outputDir -PathType Container)) {
        New-Item -Path $outputDir -ItemType Directory -Force | Out-Null
    }

    $markdownContent = Get-Content -Path $page.SourcePath -Raw
    $htmlFragment = (ConvertFrom-Markdown -InputObject $markdownContent).Html
    $htmlFragment = Update-RelativeMarkdownLinks -Html $htmlFragment -CurrentSourceRelativePath $page.SourceRelativePath -CurrentOutputRelativePath $page.OutputRelativePath
    $pageHtml = Build-PageHtml -Page $page -HtmlFragment $htmlFragment -TopNavigationHtml (Build-TopNavigationHtml -Page $page -AllPages $generatedPages -DirectoryLandingPages $directoryLandingPages) -SidebarHtml (Build-SidebarHtml -Page $page -AllPages $generatedPages -DirectoryLandingPages $directoryLandingPages) -BreadcrumbHtml (Build-BreadcrumbHtml -Page $page -DirectoryLandingPages $directoryLandingPages)

    Set-Content -Path $outputFile -Value $pageHtml -Encoding utf8
}

Write-Host "Generated $($generatedPages.Count) pages in $outputRootResolved"