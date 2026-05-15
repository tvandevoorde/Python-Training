# Lesson 1.1.62: Exception Basics

> Previous Lesson: [Lesson 1.1.61: MILESTONE TEST: File I/O](Lesson-1.1.61-MILESTONE-TEST-File-IO.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.11 (if Statement), Lesson 1.1.39 (Intro to Data Structures)

---

## Learning Objectives

By the end of this lesson, you will:

1. Understand what exceptions are and how they work
2. Use try-except blocks to catch errors
3. Handle specific exceptions appropriately
4. Understand the exception hierarchy
5. Distinguish between common exception types
6. Write defensive code that anticipates errors
7. Use exceptions for flow control (occasionally)
8. Create clear error messages for debugging

---

## Introduction: Why This Matters

Exception Basics matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## 1. What Are Exceptions?

An exception is an event that disrupts normal program flow. Instead of crashing, Python allows you to catch and handle exceptions.

### Common Exceptions

```python
# ZeroDivisionError
result = 10 / 0  # ❌ Exception!

# ValueError
int("abc")  # ❌ Exception!

# KeyError
data = {"name": "Alice"}
print(data["age"])  # ❌ Exception!

# IndexError
numbers = [1, 2, 3]
print(numbers[10])  # ❌ Exception!

# FileNotFoundError
with open("missing.txt") as f:
    pass  # ❌ Exception!
```

---

## 2. The try-except Block

### Basic Structure

```python
try:
    # Code that might raise an exception
    result = 10 / 0
except:
    # Code to handle the exception
    print("Error occurred!")

print("Program continues")
```

**Control flow diagram:**
1. Execute code in `try` block
2. If exception occurs, jump to `except` block
3. Continue after try-except

---

## 3. Catching Specific Exceptions

### One Exception Type

```python
try:
    number = int("abc")
except ValueError:
    print("Invalid number format")

print("Program continues")
```

### Multiple Exception Types

```python
try:
    # Try to access file and parse data
    with open("data.txt") as f:
        data = int(f.read())
except FileNotFoundError:
    print("File not found")
except ValueError:
    print("File doesn't contain a valid number")
```

---

## 4. Exception Objects

### Access Exception Details

```python
try:
    result = 10 / 0
except ZeroDivisionError as e:
    print(f"Error: {e}")
    print(f"Type: {type(e)}")
    # Output: 
    # Error: division by zero
    # Type: <class 'ZeroDivisionError'>
```

### Exception Attributes

```python
try:
    data = {"name": "Alice"}
    print(data["missing_key"])
except KeyError as e:
    print(f"Missing key: {e}")
    # Output: Missing key: 'missing_key'
```

---

## 5. Common Exception Types

| Exception | Cause | Example |
|-----------|-------|---------|
| `ValueError` | Invalid value for operation | `int("abc")` |
| `TypeError` | Wrong type for operation | `"5" + 5` |
| `IndexError` | Index out of range | `[1,2][10]` |
| `KeyError` | Dictionary key not found | `{"a":1}["b"]` |
| `ZeroDivisionError` | Division by zero | `5 / 0` |
| `FileNotFoundError` | File doesn't exist | `open("missing")` |
| `AttributeError` | Attribute doesn't exist | `obj.missing_attr` |
| `NameError` | Variable not defined | `print(undefined)` |

---

## 6. Writing Better error messages

```python
# ❌ BAD: No context
try:
    result = int(user_input)
except ValueError:
    print("Error")

# ✅ GOOD: Clear message
try:
    result = int(user_input)
except ValueError:
    print(f"'{user_input}' is not a valid integer. Please enter a number.")

# ✅ BEST: Include context
def convert_to_number(value):
    try:
        return int(value)
    except ValueError:
        raise ValueError(f"Cannot convert '{value}' to integer. Expected format: digits only")
```

---

## 7. The Exception Hierarchy

Most exceptions inherit from `Exception`:

```
BaseException
├── SystemExit
├── KeyboardInterrupt  
└── Exception
    ├── ValueError
    ├── TypeError
    ├── KeyError
    ├── IndexError
    ├── FileNotFoundError
    ├── ZeroDivisionError
    └── ... (many more)
```

**Important**: Catch `Exception` only as last resort, be specific!

---

## 8. Mini-Project: Robust Input Handler

```python
def get_positive_integer(prompt):
    """Get positive integer from user, retry on error"""
    while True:
        try:
            value = int(input(prompt))
            if value <= 0:
                print("Please enter a positive number")
                continue
            return value
        except ValueError:
            print("Invalid input. Please enter a whole number.")

def get_choice(options, prompt):
    """Get choice from menu with error handling"""
    while True:
        try:
            choice = get_positive_integer(prompt)
            if choice not in range(1, len(options) + 1):
                print(f"Please choose 1-{len(options)}")
                continue
            return choice
        except KeyboardInterrupt:
            print("\\nCancelled")
            return None

# Usage
age = get_positive_integer("Enter your age: ")
print(f"You are {age} years old")
```

---

## 9. Graded Exercises

### Starter Level

**Exercise 1**: Basic Exception Handling

```python
# Wrap in try-except:
num = int(input("Enter a number: "))
result = 100 / num
print(result)
```

**Exercise 2**: Dictionary Safety

```python
# Handle KeyError when accessing dict
user = {"name": "Alice", "age": 30}
email = user["email"]  # Might not exist
```

### Intermediate Level

**Exercise 3**: Multiple Handlers

```python
def convert_and_save(filename, values):
    # Try to:
    # 1. Convert strings to numbers
    # 2. Write to file
    # Handle: ValueError, FileNotFoundError
```

### Advanced Level

**Exercise 4**: Robust Data Processor

```python
def process_data_file(filename):
    # Read file, parse CSV, convert numbers
    # Handle errors at each stage
    # Return (success, data, errors)
```

---

## 11. Self-Assessment Checklist

- [ ] I understand what exceptions are
- [ ] I can use try-except blocks correctly
- [ ] I catch specific exception types
- [ ] I access exception objects with `as`
- [ ] I know common exception types
- [ ] I write helpful error messages
- [ ] I understand exception hierarchy
- [ ] I don't catch generic `Exception` unless necessary

---

## 12. Additional Resources

- [Built-in Exceptions](https://docs.python.org/3/library/exceptions.html)
- [Handling Exceptions](https://docs.python.org/3/tutorial/errors.html)
- Real Python: [Exception Handling](https://realpython.com/python-exceptions/)

---

**Previous Lesson**: [1.1.61 - MILESTONE TEST: File I/O](Lesson-1.1.61-MILESTONE-TEST-File-IO.md)




---

## Best Practices (Step-by-Step)

1. Define expected behavior for: Exception Basics.
2. Add one happy-path and one edge-case test.
3. Assert exact output and clear error messages.
4. Keep test names explicit and focused on one behavior.

```python
LESSON_ID = "1.1.62"
LESSON_TOPIC = "Exception Basics"

def parse_positive(value: str) -> int:
    number = int(value)
    if number <= 0:
        raise ValueError("value must be positive")
    return number

def test_parse_positive_returns_int() -> None:
    assert parse_positive("5") == 5

def test_parse_positive_rejects_zero() -> None:
    try:
        parse_positive("0")
    except ValueError as exc:
        assert "positive" in str(exc)
```

## Quick Practice

- Exercise: Modify the example to handle one edge case.
- Quiz: What would break if input validation was removed?

---

**Next Lesson**: [Lesson 1.1.63: Specific Exception Handling](Lesson-1.1.63-Specific-Exception-Handling.md)

