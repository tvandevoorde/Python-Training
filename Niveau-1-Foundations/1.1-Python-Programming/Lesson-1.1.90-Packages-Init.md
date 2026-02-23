# Lesson 1.1.90: Packages & `__init__.py`

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
