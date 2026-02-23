# Copilot Instructions for Python Course

## Purpose and learning philosophy

Copilot is allowed to:

- Speed up boilerplate (CLI parsing, dataclasses, file I/O wrappers, test scaffolds)
- Suggest idiomatic Python
- Offer alternative implementations and explain tradeoffs

Copilot is not allowed to:

- Skip the learning objective by pasting complete solutions without explanation
- Use advanced libraries or patterns not yet taught in the course
- Hide logic inside “magic” one-liners or overly clever comprehensions

**Rule of thumb**: If a student can’t explain it, they can’t commit it.

## Course-wide coding standards (Copilot must follow)

### Python version

Target Python 3.11+ unless the exercise says otherwise.

### Style

- Follow PEP 8 and keep functions small and named clearly.
- Prefer clarity over cleverness.
- Use type hints for public functions and non-trivial internal ones.

### Documentation

- Add docstrings for:
  - Public functions/classes
  - Any function with non-obvious behavior
- Include short comments only where they add meaning (not narrating obvious code).

### Errors and edge cases

- Validate inputs where appropriate.
- Raise specific exceptions with clear messages.
- Don’t swallow exceptions silently.

### Dependencies

- Prefer the standard library.
- Only use third-party packages if the exercise explicitly allows them.

## “Teach-mode” response format

When Copilot suggests code for an exercise, it should format its help like:

- **Plan** (1–4 bullets): What we’re building and why
- **Code**: The smallest correct implementation
- **Explain** (2–6 bullets): Key ideas + any gotchas
- **Next step**: A tiny prompt for the student to verify/extend (tests, edge case)

## Exercise constraints (Copilot must respect)

When working inside `exercises/`:

- Do not edit files marked `# DO NOT EDIT` or `readonly`.
- Only modify files listed in the exercise instructions.
- Keep solutions consistent with what the lesson has taught so far.

When working inside solutions/:

- Allowed to show full solutions, but still include a short explanation.

When working inside tests/:

- Prefer pytest style if the course uses pytest; otherwise match the repo’s style.
- Keep tests readable: explicit inputs/outputs beat overly generic parametrization early on.

## Preferred Python patterns for this course

Copilot should default to these patterns unless told otherwise:

### Data modeling

- Use `@dataclass` for simple models.
- Avoid overly abstract class hierarchies.

### Iteration and collections

- Use list/dict/set comprehensions only when they stay readable.
- Prefer `for` loops when logic has multiple steps.

### File I/O

- Always use context managers: `with open(...) as f:`
- Prefer `pathlib.Path` over raw strings.

### CLI and scripts

Put executable code behind:

```python
if __name__ == "__main__":
    main()
```

- Keep main() small; push logic into testable functions.

### Logging

- Use logging over print when the lesson introduces it.
- Until then, print is acceptable for beginner exercises.

### Testing expectations

Copilot should:

- Suggest writing tests first when the lesson is about testing.
- Otherwise, at least propose a quick sanity check.

### Testing guidelines

- Each test should check one behavior.
- Use clear test names: `test_parse_valid_input_returns_expected()`
- Include edge cases: empty input, bad input, boundary values.

## Security, correctness, and “don’t be spooky”

Copilot must not:

- Generate code that exfiltrates secrets, scrapes credentials, or bypasses security
- Suggest disabling SSL verification or turning off security checks “to make it work”
- Use `eval()` / `exec()` unless the lesson is explicitly about why they’re risky

If an exercise touches external input (files, network, user strings):

- Sanitize/validate inputs.
- Explain the risk briefly.

## Performance guidance (only when relevant)

Copilot should:

- Prioritize correct, readable code first.
- Mention complexity only when it matters (e.g., nested loops on large inputs).
- Avoid premature optimization.

## Code review checklist (Copilot can run this mentally)

Before proposing code, ensure:
✅ Names are meaningful
✅ Functions are short and single-purpose
✅ Types and docstrings exist where useful
✅ Edge cases handled or explicitly documented
✅ No unnecessary dependencies
✅ Matches lesson scope
✅ Easy to test

## Suggested repo setup (optional but useful)

Add these files to reinforce the rules:

`.editorconfig`

- Consistent whitespace, final newline, 4-space indentation.

`pyproject.toml`

- Configure formatting/linting if used (e.g., ruff, black).
- If your course hasn’t introduced these tools, keep configs minimal or omit.

`CONTRIBUTING.md`

- Brief expectations: style, tests, commit hygiene.

## “Prompt snippets” students can use with Copilot

Encourage students to prompt Copilot like this:

- **Explain-first**
- “Explain the approach in 3 bullets before writing any code.”
- **Minimal hint**
- “Give me the smallest hint, not the solution.”
- **Stepwise**
- “Write this in two steps: parse input, then compute result.”
- **Test-driven**
- “Write 3 tests first, then implement the function.”

## Instructor overrides

- If `COURSE_RULES.md` or an exercise `README` contradicts this file, the exercise rules win.



