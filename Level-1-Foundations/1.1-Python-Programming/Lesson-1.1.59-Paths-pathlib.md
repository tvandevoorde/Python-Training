# Lesson 1.1.59: Paths & pathlib

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.52 (File I/O Basics)

---

## Learning Objectives

By the end of this lesson, you will:

1. Understand filesystem paths and path notation
2. Use `pathlib.Path` for cross-platform path handling
3. Manipulate paths programmatically
4. Check file existence and properties
5. List and iterate directories
6. Handle path joins and resolution
7. Work with relative and absolute paths
8. Handle paths across Windows, macOS, and Linux

---

## 1. The Path Problem

### The Old Way: String Concatenation

```python
import os

# ❌ Manual path manipulation
base = "C:\\Users\\Tom\\Documents"
filename = "data.txt"
full_path = base + "\\" + filename  # Works on Windows, breaks on Linux!

# ❌ Different on different OS
if os.name == "nt":  # Windows
    path = "data\\files\\file.txt"
else:  # Unix
    path = "data/files/file.txt"
```

### The Modern Way: pathlib.Path

```python
from pathlib import Path

# ✅ Cross-platform, always works
base = Path("C:\\Users\\Tom\\Documents")  # Works on all platforms!
full_path = base / "data.txt"  # Clean syntax

print(full_path)  # C:\Users\Tom\Documents\data.txt (on Windows)
```

---

## 2. Creating Paths

### From String

```python
from pathlib import Path

# Absolute path
path = Path("/home/user/documents/file.txt")

# Relative path
path = Path("../data/file.txt")

# Windows path (cross-platform!)
path = Path("C:\\Users\\Tom\\Documents\\file.txt")
```

### Building Paths

```python
from pathlib import Path

# Using /  operator
base = Path("/home/user")
file_path = base / "documents" / "file.txt"
print(file_path)  # /home/user/documents/file.txt

# Using joinpath method
file_path = base.joinpath("documents", "file.txt")
print(file_path)  # /home/user/documents/file.txt
```

---

## 3. Path Components

```python
from pathlib import Path

path = Path("/home/user/documents/data.txt")

# Parts
print(path.name)         # data.txt (filename)
print(path.stem)         # data (filename without extension)
print(path.suffix)       # .txt (file extension)
print(path.parent)       # /home/user/documents
print(path.parents)      # (/home/user/documents, /home/user, /home)
print(path.parts)        # ('/', 'home', 'user', 'documents', 'data.txt')
```

---

## 4. Path Types

### Absolute vs. Relative

```python
from pathlib import Path

# Absolute path
abs_path = Path("/home/user/documents")
print(abs_path.is_absolute())  # True

# Relative path
rel_path = Path("documents/data.txt")
print(rel_path.is_absolute())  # False

# Get absolute path
abs_from_rel = rel_path.resolve()
```

---

## 5. Checking Paths

### Existence and Type

```python
from pathlib import Path

path = Path("data.txt")

# Check existence
print(path.exists())      # True/False

# Check type
print(path.is_file())     # True (is regular file)
print(path.is_dir())      # False (not directory)
print(path.is_symlink())  # False (not symlink)
```

### File Properties

```python
from pathlib import Path

path = Path("data.txt")

# Size in bytes
size = path.stat().st_size
print(f"File size: {size} bytes")

# Modification time
import time
mtime = path.stat().st_mtime
print(f"Last modified: {time.ctime(mtime)}")

# Permissions
mode = path.stat().st_mode
```

---

## 6. Working with Directories

### List Files

```python
from pathlib import Path

directory = Path("/home/user/documents")

# List all items
for item in directory.iterdir():
    print(item)

# List only files
for file in directory.glob("*.txt"):
    print(file)

# List recursively
for file in directory.glob("**/*.txt"):
    print(file)  # Finds .txt files in subdirectories too
```

### Create Directories

```python
from pathlib import Path

# Create single directory (fails if parent doesn't exist)
path = Path("new_folder")
path.mkdir()  # Creates "new_folder" in current directory

# Create with parents (like mkdir -p)
path = Path("a/b/c/new_folder")
path.mkdir(parents=True, exist_ok=True)

# Exists after creation
print(path.exists())  # True
```

---

## 7. File Operations with Paths

### Reading/Writing

```python
from pathlib import Path

# Read entire file
path = Path("data.txt")
content = path.read_text()  # Returns str
# Equivalent to: with open(path) as f: f.read()

# Read bytes
binary = path.read_bytes()  # Returns bytes

# Write file
path.write_text("Hello, World!")
path.write_bytes(b"\x48ello")

# Append (not built-in, use open)
with open(path, "a") as f:
    f.write("\nMore data")
```

---

## 8. Path Manipulation

### Changing Filename

```python
from pathlib import Path

path = Path("/home/user/data.txt")

# Change filename
new_path = path.with_name("backup.txt")
print(new_path)  # /home/user/backup.txt

# Change extension
new_path = path.with_suffix(".json")
print(new_path)  # /home/user/data.json

# Add to stem
new_path = path.with_stem(path.stem + "_backup")
print(new_path)  # /home/user/data_backup.txt
```

### Relative Paths

```python
from pathlib import Path

# Get relative path
abs_path = Path("/home/user/documents/file.txt")
base = Path("/home/user")

relative = abs_path.relative_to(base)
print(relative)  # documents/file.txt
```

---

## 9. Common Patterns

### Working Directory

```python
from pathlib import Path

# Current directory
cwd = Path.cwd()
print(cwd)  # /home/user/projects/myproject

# User home directory
home = Path.home()
print(home)  # /home/user

# Temp directory
import tempfile
tmp = Path(tempfile.gettempdir())
print(tmp)  # /tmp or C:\Users\...\AppData\Local\Temp
```

### Temporary Files

```python
from pathlib import Path
import tempfile

# Create temporary file
with tempfile.NamedTemporaryFile(mode="w", delete=False) as f:
    temp_path = Path(f.name)
    f.write("temporary data")

print(temp_path.exists())  # True
temp_path.unlink()  # Delete file
print(temp_path.exists())  # False
```

---

## 10. Mini-Project: File Organizer

Create a program to organize files by type:

```python
from pathlib import Path
import shutil

def organize_files(source_dir):
    """Organize files into subdirectories by type"""
    source = Path(source_dir)
    
    # Define file type categories
    categories = {
        "images": ["*.jpg", "*.png", "*.gif"],
        "documents": ["*.txt", "*.pdf", "*.docx"],
        "archives": ["*.zip", "*.rar", "*.7z"],
        "code": ["*.py", "*.js", "*.java"]
    }
    
    # Create category directories and organize files
    for category, patterns in categories.items():
        category_dir = source / category
        category_dir.mkdir(exist_ok=True)
        
        # Move matching files
        for pattern in patterns:
            for file in source.glob(pattern):
                destination = category_dir / file.name
                shutil.move(str(file), str(destination))
                print(f"Moved {file.name} to {category}/")

# Usage
organize_files("./downloads")
```

**Extension**: Show statistics before/after organization

---

## 11. Graded Exercises

### Starter Level

**Exercise 1**: Path Navigation

```python
# 1. Get current working directory
# 2. Navigate to parent directory
# 3. List all items in current directory
```

**Exercise 2**: File Properties

```python
# 1. Check if a file exists
# 2. Get file size
# 3. Get creation/modification time
```

### Intermediate Level

**Exercise 3**: Batch Rename

```python
# Create a function:
'''
def batch_rename(directory, old_suffix, new_suffix):
    # Find all files with old_suffix
    # Rename to new_suffix
    # Return count of renamed files
    ...
'''
```

**Exercise 4**: Find Duplicates

```python
# Find duplicate files:
# - Same size? Same content?
# - List duplicates with paths
# - Optionally delete/move duplicates
```

### Advanced Level

**Exercise 5**: File Backup

```python
# Create backup system:
# - Copy files to backup directory
# - Preserve directory structure
# - Add timestamp to backups
# - List and verify backups
```

**Exercise 6**: Recursive File Search

```python
# Search for files:
# - By name pattern
# - By size range
# - By modification date
# - Return formatted results
```

---

## 11. Self-Assessment Checklist

- [ ] I use `pathlib.Path` for all path operations
- [ ] I understand the `/` operator for path joining
- [ ] I can access path components (name, stem, suffix, parent)
- [ ] I can check if paths are absolute or relative
- [ ] I can check file existence and type (is_file, is_dir)
- [ ] I can list directory contents with iterdir() and glob()
- [ ] I can create directories with mkdir()
- [ ] I can read/write files using Path methods
- [ ] I can manipulate filenames (change extension, rename)
- [ ] I understand how Path handles cross-platform issues

---

## 12. Additional Resources

- [pathlib documentation](https://docs.python.org/3/library/pathlib.html)
- [os.path vs pathlib](https://docs.python.org/3/library/pathlib.html#pathlib-vs-ospath)
- Real Python: [pathlib module](https://realpython.com/python-pathlib/)
- [shutil for file operations](https://docs.python.org/3/library/shutil.html)

---

**Next Lesson**: [1.1.60 - Mini-Project: Data Importer](Lesson-1.1.60-Mini-Project-Data-Importer.md)  
**Previous Lesson**: [1.1.58 - CSV Files & csv Module](Lesson-1.1.58-CSV-Files-csv-Module.md)




