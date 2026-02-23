# Lesson 1.1.1: Intro to Python and Variables

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: None | **Topic**: Variables, Types, Operators

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Set up and run Python on your system
- Understand what Python is and why it's used
- Create and assign variables
- Understand variable naming conventions
- Print output to the console
- Understand basic data types: `int`, `float`, `str`, `bool`

---

## 1. What is Python?

Python is a high-level, interpreted programming language known for:
- **Readability**: Simple, English-like syntax
- **Versatility**: Web, data science, AI, automation, scientific computing
- **Community**: Massive ecosystem with libraries for everything
- **Job market**: 2026 demand: High (AI boom driving Python adoption)

**Why learn Python for AI/ML?**
- Dominates data science and machine learning
- Industry standard: NumPy, Pandas, PyTorch, Hugging Face all Python-based
- 90% of AI jobs require Python proficiency

---

## 2. Setting Up Python

### 2.1 Installation

**Windows/Mac/Linux**: Download from [python.org](https://www.python.org)
- Verify installation: Open terminal/command prompt and run:
  ```bash
  python --version
  # or
  python3 --version
  ```

### 2.2 Running Python Code

**Three ways:**
1. **Interactive mode** (REPL - Read-Eval-Print Loop):
   ```bash
   python
   >>> print("Hello World")
   Hello World
   >>> exit()
   ```

2. **Script files** (.py):
   ```bash
   # Create file: hello.py
   print("Hello World")
   
   # Run it:
   python hello.py
   ```

3. **IDE/Notebook**: VS Code, PyCharm, Jupyter (we'll use Jupyter later)

---

## 3. Your First Python Program

### 3.1 Hello World

Create a file `hello.py`:
```python
print("Hello, World!")
```

Run it:
```bash
python hello.py
# Output: Hello, World!
```

**Key concept**: `print()` is a built-in function that displays output.

---

## 4. Variables: Storing Data

### 4.1 What is a Variable?

A variable is a named container that holds data. Think of it as a labeled box.

```python
# Creating a variable
name = "Alice"          # Variable named 'name' contains the string "Alice"
age = 30               # Variable named 'age' contains the number 30
height = 5.7           # Variable named 'height' contains a decimal number

# Print the variables
print(name)            # Output: Alice
print(age)             # Output: 30
print(height)          # Output: 5.7
```

### 4.2 Variable Assignment

```python
# Basic assignment
x = 10

# Update a variable
x = 20
print(x)               # Output: 20

# Swap variables
a = 5
b = 10
a, b = b, a           # Swap using tuple unpacking
print(a, b)           # Output: 10 5

# Multiple assignment
x = y = z = 0
print(x, y, z)        # Output: 0 0 0
```

---

## 5. Data Types

### 5.1 Integers (int)

Whole numbers, positive or negative, no decimals.

```python
age = 25
temperature = -10
balance = 1000000

print(type(age))      # Output: <class 'int'>
print(age + 5)        # Output: 30 (can do math)
```

### 5.2 Floats (float)

Numbers with decimal points.

```python
price = 19.99
pi = 3.14159
temperature = 98.6

print(type(price))    # Output: <class 'float'>
print(price * 2)      # Output: 39.98
```

### 5.3 Strings (str)

Text data, enclosed in quotes (single, double, or triple).

```python
# Single quotes
greeting = 'Hello'

# Double quotes
message = "Welcome to Python"

# Triple quotes (multiline)
poem = """
Roses are red,
Violets are blue,
Python is cool,
And so are you.
"""

print(type(message))  # Output: <class 'str'>
print(greeting + " " + message)  # Output: Hello Welcome to Python
```

**String concatenation:**
```python
first_name = "John"
last_name = "Doe"
full_name = first_name + " " + last_name
print(full_name)      # Output: John Doe
```

### 5.4 Booleans (bool)

True or False values.

```python
is_student = True
is_completed = False

print(type(is_student))  # Output: <class 'bool'>
print(is_student and is_completed)  # Output: False (AND logic)
```

### 5.5 Type Conversion

```python
# String to int
age_str = "25"
age_int = int(age_str)
print(age_int + 5)       # Output: 30 (can now do math)

# Int to string
number = 42
text = str(number)
print(text + " is the answer")  # Output: 42 is the answer

# Float to int
price = 19.99
price_rounded = int(price)
print(price_rounded)     # Output: 19 (truncates, doesn't round)

# To float
age = 25
age_float = float(age)
print(age_float)         # Output: 25.0
```

---

## 6. Variable Naming Conventions

### 6.1 Good Naming Rules

```python
# ✅ GOOD
user_name = "Alice"      # Snake case (preferred in Python)
age = 30
is_active = True
total_price = 99.99

# ❌ BAD (avoid)
username = "Alice"                    # No underscore (works, but less readable)
UserName = "Alice"                    # Camel case (Java style, not Pythonic)
x = "Alice"                          # Not descriptive
3user = "Alice"                      # Can't start with number (syntax error)
user-name = "Alice"                  # Hyphens not allowed (syntax error)
```

### 6.2 Python Naming Standards (PEP 8)

- **Variables**: `snake_case` (lowercase, underscores between words)
- **Constants**: `UPPER_SNAKE_CASE` (all caps)
- **Classes**: `PascalCase` (capitalize first letter of each word)

```python
# Constants
PYTHON_VERSION = "3.11"
MAX_USERS = 1000

# Variables
current_user = "Alice"
user_age = 30

# Classes (we'll see later)
class UserProfile:
    pass
```

---

## 7. Basic Math with Variables

```python
# Arithmetic operations
a = 10
b = 3

print(a + b)           # Output: 13 (addition)
print(a - b)           # Output: 7 (subtraction)
print(a * b)           # Output: 30 (multiplication)
print(a / b)           # Output: 3.333... (division, returns float)
print(a // b)          # Output: 3 (integer division, rounds down)
print(a % b)           # Output: 1 (modulo, remainder)
print(a ** b)          # Output: 1000 (exponentiation)

# Compound assignment
x = 5
x = x + 3              # x is now 8
x += 3                 # Shorthand, same as above, x is now 11
x -= 2                 # x is now 9
x *= 2                 # x is now 18
x /= 3                 # x is now 6.0
print(x)
```

---

## 8. Comments and Code Documentation

```python
# This is a single-line comment
print("Hello")  # Comment after code

# Multi-line comments (multiple #)
# This is a longer explanation
# spread across multiple lines

"""
This is a multi-line string.
It can be used as a comment too.
Often used as docstrings (we'll see later).
"""

# Good practice: Explain WHY, not WHAT
# ✅ Calculate discount for loyal customers (older than 65)
age = 70
discount = 0.1 if age > 65 else 0.0

# ❌ Add 10 percent (this just repeats the code)
# discount = 0.1
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.1.1**: Create and print variables
```python
# Create variables for your personal info:
# - name (string)
# - age (integer)
# - height_cm (float)
# - is_student (boolean)
# Then print all of them

# Solution:
name = "Alice"
age = 25
height_cm = 165.5
is_student = True

print(name)
print(age)
print(height_cm)
print(is_student)
```

**Exercise 1.1.1.2**: Type conversion
```python
# Convert and calculate
age_string = "25"
years_to_retirement = 40
retirement_age = int(age_string) + years_to_retirement
print(f"You will retire at age {retirement_age}")  # Output: You will retire at age 65
```

**Exercise 1.1.1.3**: Simple math
```python
# Calculate the perimeter of a rectangle
length = 10
width = 5
perimeter = 2 * (length + width)
print(f"Perimeter: {perimeter}")  # Output: Perimeter: 30
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.1.4**: Currency conversion
```python
# You have $100 USD. Convert to EUR (assume 1 USD = 0.92 EUR)
usd = 100
exchange_rate = 0.92
eur = usd * exchange_rate
print(f"${usd} USD = €{eur} EUR")  # Output: $100 USD = €92.0 EUR
```

**Exercise 1.1.1.5**: Combining strings and numbers
```python
# Create a sentence using variables
product = "Laptop"
price = 999.99
quantity = 2
total = price * quantity
message = f"I bought {quantity} {product}(s) at ${price} each, total: ${total}"
print(message)
# Output: I bought 2 Laptop(s) at $999.99 each, total: $1999.98
```

**Exercise 1.1.1.6**: Age calculation
```python
# Calculate age in days
name = "Bob"
age_years = 30
days_per_year = 365.25  # Account for leap years
age_days = age_years * days_per_year
print(f"{name} is approximately {int(age_days)} days old")
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.1.7**: Temperature conversion
```python
# Convert Celsius to Fahrenheit: F = (C * 9/5) + 32
celsius = 25
fahrenheit = (celsius * 9/5) + 32
print(f"{celsius}°C = {fahrenheit}°F")  # Output: 25°C = 77.0°F

# Experiment with different temperatures
```

**Exercise 1.1.1.8**: Data type exploration
```python
# Investigate type() function with different inputs
print(type(42))              # <class 'int'>
print(type(3.14))           # <class 'float'>
print(type("hello"))        # <class 'str'>
print(type(True))           # <class 'bool'>
print(type(42.0))           # <class 'float'> (notice: 42.0 is float, not int)

# What happens when you add int + float?
result = 5 + 2.5
print(type(result))         # <class 'float'> (Python converts to float)
```

**Exercise 1.1.1.9**: Circle area calculation
```python
# Calculate circle area: A = π * r²
# Use pi = 3.14159
import math  # (Don't worry about this line yet - for now, just know it gives us pi)
# Actually, let's do it without import:
pi = 3.14159
radius = 5
area = pi * radius ** 2
print(f"Circle with radius {radius} has area {area}")
```

---

## Mini-Project: Personal Business Card

Create a Python script that stores your information and displays it as a business card.

```python
# business_card.py

name = "Alice Johnson"
title = "Python Developer"
email = "alice@example.com"
phone = "+1-555-1234"
years_experience = 3

print("=" * 40)
print(name.center(40))
print(title.center(40))
print("=" * 40)
print(f"Email: {email}")
print(f"Phone: {phone}")
print(f"Experience: {years_experience} years")
print("=" * 40)

# Output:
# ========================================
#           Alice Johnson
#          Python Developer
# ========================================
# Email: alice@example.com
# Phone: +1-555-1234
# Experience: 3 years
# ========================================
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **In Python, a variable name can start with a number.** 
   - Answer: False

2. **The `type()` function tells you what data type a variable contains.**
   - Answer: True

3. **You can change a variable's value after it's created.**
   - Answer: True

4. **"25" (in quotes) and 25 (without quotes) are the same in Python.**
   - Answer: False

---

### Conceptual Questions

5. **What's the difference between `int` and `float`?**
   - `int`: Whole numbers (no decimals) | `float`: Numbers with decimal points

6. **How would you convert the string "100" to a number so you can do math with it?**
   - `int("100")` for integer or `float("100")` for decimal

7. **What's the proper way to name a variable in Python?**
   - Use `snake_case`: lowercase letters with underscores between words

---

### Coding Challenge

8. **Write a script that:**
   - Stores your birth year in a variable
   - Calculates your age (assume current year is 2026)
   - Prints: "I am [age] years old"

   Solution:
   ```python
   birth_year = 1995
   current_year = 2026
   age = current_year - birth_year
   print(f"I am {age} years old")  # Output: I am 31 years old
   ```

---

## Key Takeaways

✅ **Variables** are named containers for data  
✅ **Data types** determine what kind of data a variable holds (int, float, str, bool)  
✅ **Naming convention**: Use `snake_case` for variable names  
✅ **Math operations** work with `int` and `float` types  
✅ **Type conversion** lets you change between types using `int()`, `float()`, `str()`  

---

## Additional Resources

- **Official Docs**: [Python Data Types](https://docs.python.org/3/tutorial/introduction.html)
- **Interactive Practice**: [Exercism - Python](https://exercism.org/tracks/python)
- **Video**: 3Blue1Brown - "What is a Variable?" (YouTube)

---

## Next Lesson Preview

**Lesson 1.1.2**: Operators (Arithmetic, Comparison, Logical)
- Learn more operators: `==`, `!=`, `<`, `>`, `and`, `or`, `not`
- Combine multiple conditions
- Build more complex expressions

---

## Homework

1. **Create 5 variables** with different data types and print them with `type()`
2. **Solve 3 problems** from the Advanced exercises section
3. **Build the business card script** and customize it with your own information
4. **Prepare for Quiz**: Review the Quiz & Assessment section above

**Expected time**: 1-2 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.2** when you're ready.
