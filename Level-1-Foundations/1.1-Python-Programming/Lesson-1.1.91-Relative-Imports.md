# Lesson 1.1.91: Relative Imports

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




