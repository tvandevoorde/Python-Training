# Lesson 1.1.89: Creating Modules

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.88

---

## Learning Objectives

1. **Create** Python modules
2. **Organize** code into files
3. **Use** module attributes
4. **Execute** modules as scripts
5. **Share** code effectively

---

## Creating Modules

### Simple Module

**math_utils.py**:
```python
"""Utilities for mathematical operations."""

PI = 3.14159
E = 2.71828

def add(a, b):
    """Add two numbers."""
    return a + b

def multiply(a, b):
    """Multiply two numbers."""
    return a * b

class Calculator:
    """Simple calculator."""
    
    def divide(self, a, b):
        if b == 0:
            raise ValueError("Cannot divide by zero")
        return a / b
```

**Using the module**:
```python
import math_utils

print(math_utils.PI)           # 3.14159
print(math_utils.add(5, 3))    # 8

calc = math_utils.Calculator()
print(calc.divide(10, 2))      # 5.0
```

### Import Styles

```python
# Import module
import math_utils

# Import specific items
from math_utils import add, PI

# Import with alias
import math_utils as mu
from math_utils import Calculator as Calc

# Import all (not recommended)
from math_utils import *
```

---

## Module Execution

### `__name__` and `__main__`

**stats.py**:
```python
"""Statistical calculations."""

def mean(values):
    """Calculate mean."""
    return sum(values) / len(values)

def median(values):
    """Calculate median."""
    sorted_vals = sorted(values)
    n = len(sorted_vals)
    return (sorted_vals[n//2 - 1] + 
            sorted_vals[n//2]) / 2 if n % 2 == 0 else sorted_vals[n//2]

if __name__ == "__main__":
    # Test when run directly
    data = [1, 2, 3, 4, 5]
    print(f"Mean: {mean(data)}")
    print(f"Median: {median(data)}")
```

**Test1**: `python stats.py` → Runs the main block  
**Test2**: `python` then `import stats` → Does not run main block

---

## Module Attributes

```python
import math_utils

print(dir(math_utils))          # All attributes
print(math_utils.__name__)      # 'math_utils'
print(math_utils.__file__)      # Path to file
print(math_utils.__doc__)       # Module docstring
```

---

## Self-Assessment

- [ ] I create Python modules
- [ ] I organize code into files
- [ ] I use `__name__` correctly
- [ ] I share code effectively

---

**Next: [Lesson 1.1.90: Packages & `__init__.py`](Lesson-1.1.90-Packages-Init.md)**
