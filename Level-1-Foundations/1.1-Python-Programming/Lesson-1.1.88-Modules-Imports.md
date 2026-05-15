# Lesson 1.1.88: Modules & Imports

> Previous Lesson: [Lesson 1.1.87: MILESTONE TEST OOP Basics](Lesson-1.1.87-MILESTONE-TEST-OOP-Basics.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.24 (Function Basics)

---

## Learning Objectives

By the end of this lesson, you will:

1. Understand what modules are
2. Import modules and use their contents
3. Create your own modules
4. Organize code across multiple files
5. Use the `if __name__ == "__main__"` pattern
6. Understand module namespaces and scope
7. Avoid circular imports
8. Structure projects with packages

---

## Introduction: Why This Matters

Modules & Imports matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## 1. What Are Modules?

A module is a Python file containing code (functions, classes, variables).

### Importing Modules

```python
# Import entire module
import math
print(math.pi)           # 3.14159...
print(math.sqrt(16))     # 4.0

# Import specific items
from math import pi, sqrt
print(pi)                # 3.14159...
print(sqrt(16))          # 4.0

# Import with alias
import math as m
print(m.sqrt(9))         # 3.0

from math import sqrt as square_root
print(square_root(25))   # 5.0
```

---

## 2. Standard Library Modules

```python
import os              # Operating system operations
import sys             # System-specific parameters
import random          # Random number generation
import datetime        # Date and time
import json            # JSON data handling
import csv             # CSV file processing
import re              # Regular expressions
import collections     # Specialized containers
import itertools       # Iteration tools
```

---

## 3. Creating Your Own Module

### File: `math_utils.py`

```python
"""
Utility functions for mathematical operations
"""

def add(a, b):
    """Add two numbers"""
    return a + b

def multiply(a, b):
    """Multiply two numbers"""
    return a * b

PI = 3.14159

def circle_area(radius):
    """Calculate circle area"""
    return PI * radius ** 2
```

### File: `main.py`

```python
import math_utils

result = math_utils.add(5, 3)
print(result)  # 8

area = math_utils.circle_area(5)
print(area)  # 78.53975
```

---

## 4. The `if __name__ == "__main__"` Pattern

This allows code to be both importable and executable:

```python
# File: calculator.py

def add(a, b):
    return a + b

def multiply(a, b):
    return a * b

# This code only runs if calculator.py is run directly
if __name__ == "__main__":
    print(add(5, 3))
    print(multiply(4, 6))

# If imported as a module, the above code doesn't run
```

### Usage:

```python
# Direct execution
# python calculator.py
# Output: 8, 24

# As import
import calculator
result = calculator.add(10, 5)  # 15
# No output from calculator's __main__ block
```

---

## 5. Module Search Path

Python searches for modules in this order:

```python
import sys

# View search path
print(sys.path)
# ['.', '/usr/lib/python3.x', ...]
```

---

## 6. Mini-Project: Multi-file Application

### File Structure:

```
app/
├── main.py
├── utils.py
├── config.py
```

### `config.py`

```python
DATABASE_URL = "sqlite:///app.db"
DEBUG = True
MAX_CONNECTIONS = 10
```

### `utils.py`

```python
import config

def connect_to_db():
    """Connect to database"""
    print(f"Connecting to {config.DATABASE_URL}")
    return None

def log(message):
    """Log message"""
    if config.DEBUG:
        print(f"[DEBUG] {message}")
```

### `main.py`

```python
import utils
import config

def main():
    utils.log("Starting application")
    utils.log(f"Max connections: {config.MAX_CONNECTIONS}")
    db = utils.connect_to_db()
    print("Application running")

if __name__ == "__main__":
    main()
```

---

## 7. Graded Exercises

Create a multi-file calculator application with:
- `operations.py`: Functions for basic math
- `advanced.py`: Functions for advanced math (sqrt, power)
- `main.py`: User interface

---

## Best Practices (Step-by-Step)

1. Clarify one concrete goal for: Modules & Imports.
2. Implement the smallest working version for: Modules & Imports.
3. Handle one invalid-input case explicitly.
4. Refactor repeated logic into a named function.

```python
LESSON_ID = "1.1.88"
LESSON_TOPIC = "Modules & Imports"

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

**Next Lesson**: [Lesson 1.1.89: Creating Modules](Lesson-1.1.89-Creating-Modules.md)

