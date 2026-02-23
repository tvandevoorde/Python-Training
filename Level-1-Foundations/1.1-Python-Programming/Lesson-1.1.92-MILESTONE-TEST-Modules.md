# Lesson 1.1.92: MILESTONE TEST Modules & Packages

**Estimated Time**: 6 hours | **Difficulty**: Assessment  
**Prerequisites**: All Topic 8 lessons (1.1.88-1.1.91)

---

## Assessment Overview

This milestone test covers modules, packages, imports, and organizing Python code.

**Format**: 50 points total
- Written Questions: 15 points
- File Organization: 20 points
- Code Challenge: 15 points

---

## Section 1: Written Questions (15 points)

### Question 1 (3 points)
**What is a Python module? How do you create one?**

*Expected Answer*:
- Module = a .py file containing Python code
- Create by writing Python in a file
- Can contain functions, classes, variables

### Question 2 (3 points)
**What is the purpose of `__init__.py` in a package?**

*Expected Answer*:
- Marks directory as a package
- Allows importing from the package
- Can contain initialization code

### Question 3 (3 points)
**Explain the difference between absolute and relative imports.**

*Expected Answer*:
- Absolute: Full path to module
- Relative: Uses dots to reference current/parent packages
- Relative more flexible for moving packages

### Question 4 (3 points)
**What does `if __name__ == "__main__":` do?**

*Expected Answer*:
- Code runs only when file executed directly
- Does not run when file is imported
- Allows tests/demos within module files

### Question 5 (3 points)
**How do you make a function or class available when importing a package?**

*Expected Answer*:
- Import in `__init__.py`
- Use `__all__` to specify public API
- Makes items accessible directly from package

---

## Section 2: File Organization (20 points)

### Challenge: Create Package Structure

Create this package structure in your workspace:

```
analytics/
├── __init__.py
├── stats.py
├── reporting.py
└── data_utils/
    ├── __init__.py
    ├── loader.py
    └── validator.py
```

### stats.py

```python
"""Statistical calculations."""

def mean(values):
    """Calculate mean."""
    return sum(values) / len(values)

def std_dev(values):
    """Calculate standard deviation."""
    mean_val = mean(values)
    variance = sum((x - mean_val) ** 2 for x in values) / len(values)
    return variance ** 0.5
```

### reporting.py

```python
"""Reporting utilities."""

from .stats import mean, std_dev

def summary(values):
    """Create summary report."""
    return {
        'mean': mean(values),
        'std_dev': std_dev(values),
        'min': min(values),
        'max': max(values)
    }
```

### data_utils/loader.py

```python
"""Load data from files."""

def load_csv(filename):
    """Load CSV file."""
    with open(filename, 'r') as f:
        return [line.strip().split(',') for line in f]
```

### data_utils/validator.py

```python
"""Validate data."""

def validate_numbers(values):
    """Check all values are numeric."""
    try:
        return all(isinstance(v, (int, float)) for v in values)
    except:
        return False
```

### analytics/__init__.py

**Create proper package initialization**:

```python
"""Analytics package for data analysis."""

from .stats import mean, std_dev
from .reporting import summary
from .data_utils.loader import load_csv
from .data_utils.validator import validate_numbers

__all__ = ['mean', 'std_dev', 'summary', 'load_csv', 'validate_numbers']
__version__ = "1.0.0"
```

### data_utils/__init__.py

```python
"""Data utilities subpackage."""

from .loader import load_csv
from .validator import validate_numbers

__all__ = ['load_csv', 'validate_numbers']
```

### Testing

```python
# main.py - Should work with above package

from analytics import mean, std_dev, summary

data = [1, 2, 3, 4, 5]
print(summary(data))  # {'mean': 3.0, 'std_dev': 1.41..., ...}
```

**Grading**:
- [ ] Correct directory structure (5 pts)
- [ ] All files created (5 pts)
- [ ] Imports work correctly (5 pts)
- [ ] `__init__.py` files properly configured (5 pts)

---

## Section 3: Code Challenge (15 points)

### Create Configuration Module

Build a configuration management module system:

```python
# config/default.py
"""Default configuration."""

DEBUG = False
LOG_LEVEL = "INFO"
DB_HOST = "localhost"
DB_PORT = 5432
```

```python
# config/development.py
"""Development configuration."""

from .default import *

DEBUG = True
LOG_LEVEL = "DEBUG"
DB_HOST = "127.0.0.1"
```

```python
# config/__init__.py
"""Configuration package."""

from .default import *
from . import development

__all__ = ['DEBUG', 'LOG_LEVEL', 'DB_HOST', 'DB_PORT']
```

```python
# main.py
"""Application using config."""

from config import DEBUG, LOG_LEVEL

print(f"Debug: {DEBUG}")
print(f"Log Level: {LOG_LEVEL}")
```

**Requirements**:
- [ ] Base configuration module (3 pts)
- [ ] Overrideable configuration (3 pts)
- [ ] Proper imports in `__init__.py` (3 pts)
- [ ] Working example (3 pts)
- [ ] Clear organization (3 pts)

---

## Self-Assessment

- [ ] I create modules effectively
- [ ] I organize packages properly
- [ ] I use imports correctly
- [ ] I structure projects well

---

**Course Progress**: 92/102 lessons complete (90%)

---

**Next: [Lesson 1.1.93: Virtual Environments with `venv`](Lesson-1.1.93-Virtual-Environments.md)**




