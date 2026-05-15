# Lesson 1.1.94: pip & Package Management

> Previous Lesson: [Lesson 1.1.93: Virtual Environments with `venv`](Lesson-1.1.93-Virtual-Environments.md)

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.1.93

---

## Learning Objectives

1. **Use** pip to install packages
2. **Manage** dependencies with requirements.txt
3. **Update** and remove packages
4. **Resolve** dependency issues
5. **Share** dependencies

---

## Introduction: Why This Matters

pip & Package Management matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Installing Packages

### Basic Installation

```bash
# Install latest version
pip install requests

# Install specific version
pip install requests==2.28.0

# Install with version constraint
pip install "requests>=2.25,<3.0"

# Install multiple packages
pip install requests numpy pandas
```

---

## Requirements Files

### Creating requirements.txt

```bash
# Generate from current environment
pip freeze > requirements.txt
```

**Example requirements.txt**:
```
requests==2.28.0
numpy==1.24.0
pandas==1.5.0
```

### Installing from requirements

```bash
# Install all dependencies
pip install -r requirements.txt

# Install for development
pip install -r requirements-dev.txt
```

---

## Managing Packages

### View and Search

```bash
# List installed packages
pip list

# Show specific package info
pip show requests

# Search for packages (less common now)
pip search flask
```

### Update and Remove

```bash
# Update a package
pip install --upgrade requests

# Upgrade pip itself
pip install --upgrade pip

# Remove package
pip uninstall requests

# Remove all (with confirmation prompt)
pip uninstall -r requirements.txt
```

---

## Requirements File Organization

### Project Structure

```
project/
├── venv/
├── requirements.txt           # Production deps
├── requirements-dev.txt       # Development deps
└── app.py
```

**requirements.txt** (production):
```
requests==2.28.0
flask==2.2.0
sqlalchemy==2.0.0
```

**requirements-dev.txt** (development):
```
-r requirements.txt    # Include production deps
pytest==7.0.0
black==22.0.0
flake8==4.0.0
```

---

## Self-Assessment

- [ ] I install packages with pip
- [ ] I use requirements.txt
- [ ] I update packages
- [ ] I organize dependencies

---

**Next: [Lesson 1.1.95: Poetry for Modern Python](Lesson-1.1.95-Poetry.md)**




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

1. Clarify one concrete goal for: pip & Package Management.
2. Implement the smallest working version for: pip & Package Management.
3. Handle one invalid-input case explicitly.
4. Refactor repeated logic into a named function.

```python
LESSON_ID = "1.1.94"
LESSON_TOPIC = "pip & Package Management"

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

**Next Lesson**: [Lesson 1.1.95: Poetry for Modern Python](Lesson-1.1.95-Poetry.md)

