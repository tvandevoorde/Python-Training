# Lesson 1.1.90: Packages & `__init__.py`

> Previous Lesson: [Lesson 1.1.89: Creating Modules](Lesson-1.1.89-Creating-Modules.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.89

---

## Learning Objectives

1. **Create** Python packages
2. **Organize** modules into packages
3. **Use** `__init__.py`
4. **Control** package imports
5. **Build** larger projects

---

## Introduction: Why This Matters

Packages & `__init__.py` matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Package Structure

### Basic Layout

```
my_project/
├── main.py
└── mypackage/
    ├── __init__.py
    ├── module1.py
    ├── module2.py
    └── subpackage/
        ├── __init__.py
        └── module3.py
```

### Empty `__init__.py`

A package with empty `__init__.py`:

```python
# mypackage/__init__.py
# Empty file makes this a package
```

Usage:
```python
import mypackage.module1
from mypackage import module2
```

---

## Package Initialization

### Exposing API

**mypackage/__init__.py**:
```python
"""Data processing utilities."""

from .module1 import calculate
from .module2 import validate

__all__ = ['calculate', 'validate']

__version__ = "1.0.0"
```

**main.py**:
```python
from mypackage import calculate, validate

result = calculate([1, 2, 3])
```

---

## Subpackages

**Structure**:
```
utils/
├── __init__.py
├── text/
│   ├── __init__.py
│   └── string_ops.py
└── math/
    ├── __init__.py
    └── numbers.py
```

**Usage**:
```python
from utils.text import string_ops
from utils.math.numbers import add

text = string_ops.capitalize("hello")
result = add(5, 3)
```

---

## Self-Assessment

- [ ] I create package structures
- [ ] I use `__init__.py`
- [ ] I organize subpackages
- [ ] I control package imports

---

**Next: [Lesson 1.1.91: Relative Imports](Lesson-1.1.91-Relative-Imports.md)**




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

1. Clarify one concrete goal for: Packages & `__init__.py`.
2. Implement the smallest working version for: Packages & `__init__.py`.
3. Handle one invalid-input case explicitly.
4. Refactor repeated logic into a named function.

```python
LESSON_ID = "1.1.90"
LESSON_TOPIC = "Packages & `__init__.py`"

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

**Next Lesson**: [Lesson 1.1.91: Relative Imports](Lesson-1.1.91-Relative-Imports.md)

