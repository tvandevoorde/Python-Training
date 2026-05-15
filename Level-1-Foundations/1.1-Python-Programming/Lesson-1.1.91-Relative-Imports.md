# Lesson 1.1.91: Relative Imports

> Previous Lesson: [Lesson 1.1.90: Packages & `__init__.py`](Lesson-1.1.90-Packages-Init.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.90

---

## Learning Objectives

1. **Use** relative imports
2. **Navigate** package hierarchies
3. **Avoid** circular imports
4. **Build** maintainable packages
5. **Refactor** code flexibly

---

## Introduction: Why This Matters

Relative Imports matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Relative Import Syntax

### Dot Notation

**Structure**:
```
utils/
├── __init__.py
├── calculation.py
├── validation.py
└── data/
    ├── __init__.py
    └── processing.py
```

**From same level** (in utils/processing.py):
```python
from .calculation import add        # Current package
from .validation import check       # Current package
```

**From parent** (in utils/data/processing.py):
```python
from .. import __version__         # Parent package
from ..calculation import add      # Parent package module
```

**From sibling**:
```python
from ..validation import check     # Sister package
```

---

## Absolute vs Relative

### Absolute Import

```python
from utils.calculation import add
from utils.data.processing import process
```

**Pros**: Clear, works from anywhere  
**Cons**: Tightly coupled, hard to move packages

### Relative Import

```python
from .calculation import add
from ..data.processing import process
```

**Pros**: Flexible, can move packages  
**Cons**: Only works inside packages

---

## Common Patterns

### Package Initialization with Relative

**utils/__init__.py**:
```python
from .calculation import add, subtract
from .validation import validate
from .data import process_data

__all__ = ['add', 'subtract', 'validate', 'process_data']
```

**Usage** (in main.py):
```python
from utils import add, validate

result = add(5, 3)
```

---

## Self-Assessment

- [ ] I use relative imports
- [ ] I navigate package hierarchies
- [ ] I avoid circular imports
- [ ] I build maintainable packages

---

**Next: [Lesson 1.1.92: MILESTONE TEST Modules & Packages](Lesson-1.1.92-MILESTONE-TEST-Modules.md)**




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

1. Clarify one concrete goal for: Relative Imports.
2. Implement the smallest working version for: Relative Imports.
3. Handle one invalid-input case explicitly.
4. Refactor repeated logic into a named function.

```python
LESSON_ID = "1.1.91"
LESSON_TOPIC = "Relative Imports"

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

**Next Lesson**: [Lesson 1.1.92: MILESTONE TEST Modules & Packages](Lesson-1.1.92-MILESTONE-TEST-Modules.md)

