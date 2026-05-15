# Lesson 1.1.93: Virtual Environments with `venv`

> Previous Lesson: [Lesson 1.1.92: MILESTONE TEST Modules & Packages](Lesson-1.1.92-MILESTONE-TEST-Modules.md)

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.1.92

---

## Learning Objectives

1. **Create** virtual environments
2. **Activate** and deactivate environments
3. **Isolate** project dependencies
4. **Manage** Python versions
5. **Share** projects reproducibly

---

## Introduction: Why This Matters

Virtual Environments with `venv` matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## What is a Virtual Environment?

A virtual environment isolates project dependencies from your system Python:

```
System Python Package Store
├── requests 2.28
├── numpy 1.24
└── ...

Project A Virtual Env
├── requests 2.25 (isolated)
├── django 3.2
└── ...

Project B Virtual Env
├── requests 2.28 (isolated)
├── flask 2.0
└── ...
```

---

## Creating a Virtual Environment

### On Windows

```powershell
# Create environment
python -m venv myenv

# Activate
myenv\Scripts\activate

# Deactivate
deactivate
```

### On macOS/Linux

```bash
# Create environment
python3 -m venv myenv

# Activate
source myenv/bin/activate

# Deactivate
deactivate
```

---

## Using Virtual Environments

### Typical Workflow

```bash
# Create
python -m venv venv

# Activate
source venv/bin/activate  # Mac/Linux
# OR
venv\Scripts\activate     # Windows

# Install packages
pip install requests

# Work on project
python app.py

# Deactivate
deactivate
```

### Shell Indicator

When activated, your prompt shows the environment:

```
(venv) user@computer:project$
```

---

## Checking Environment Info

```bash
# Which Python
which python

# Installed packages
pip list

# Environment path
python -c "import sys; print(sys.prefix)"
```

---

## Self-Assessment

- [ ] I create virtual environments
- [ ] I activate/deactivate correctly
- [ ] I understand isolation
- [ ] I use best practices

---

**Next: [Lesson 1.1.94: pip & Package Management](Lesson-1.1.94-pip-Package-Management.md)**




---

## Core Teaching Content

Focus on one clear concept and connect it to a real workflow scenario.

```python
def run_example(value: int) -> int:
    return value * 2

print(run_example(3))
```

---

## Best Practices (Step-by-Step)

1. Clarify one concrete goal for: Virtual Environments with `venv`.
2. Implement the smallest working version for: Virtual Environments with `venv`.
3. Handle one invalid-input case explicitly.
4. Refactor repeated logic into a named function.

```python
LESSON_ID = "1.1.93"
LESSON_TOPIC = "Virtual Environments with `venv`"

def normalize_name(value: str) -> str:
    text = value.strip()
    if not text:
        raise ValueError("name must not be empty")
    return text.title()

print(normalize_name("  python learner "))
```

## Quick Practice

- Exercise: Modify the example to handle one edge case.
- Quiz: What would break if input validation was removed?

---

**Next Lesson**: [Lesson 1.1.94: pip & Package Management](Lesson-1.1.94-pip-Package-Management.md)

