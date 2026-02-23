# Lesson 1.1.63: Specific Exception Handling

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.62 (Exception Basics)

---

## Learning Objectives

By the end of this lesson, you will be able to:

1. **Identify** common Python exceptions and their causes
2. **Catch** specific exception types instead of generic errors
3. **Handle** different exceptions with different strategies
4. **Understand** exception inheritance hierarchy
5. **Provide** context-specific error messages
6. **Distinguish** between recoverable and fatal exceptions
7. **Design** functions that fail gracefully with appropriate exception types
8. **Debug** using exception information

---

## Part 1: Common Exception Types

### Built-in Exception Hierarchy

```python
# Python's exception hierarchy (simplified)
BaseException
├── SystemExit
├── KeyboardInterrupt
├── GeneratorExit
└── Exception  # Most user code catches this
    ├── StopIteration
    ├── ArithmeticError
    │   ├── ZeroDivisionError
    │   ├── FloatingPointError
    │   └── OverflowError
    ├── AssertionError
    ├── AttributeError
    ├── EOFError
    ├── ImportError
    ├── LookupError
    │   ├── IndexError
    │   └── KeyError
    ├── MemoryError
    ├── NameError
    │   └── UnboundLocalError
    ├── OSError (file/system operations)
    │   ├── FileNotFoundError
    │   ├── PermissionError
    │   ├── TimeoutError
    │   └── ...
    ├── ReferenceError
    ├── RuntimeError
    ├── SyntaxError
    ├── IndentationError
    ├── TabError
    ├── SystemError
    ├── TypeError
    ├── ValueError
    └── Warning
```

### ValueError - Invalid Value

```python
# When a function argument is of correct type but inappropriate value
def parse_age(age_str):
    try:
        age = int(age_str)
        if age < 0:
            raise ValueError("Age cannot be negative")
        return age
    except ValueError as e:
        print(f"Invalid age: {e}")
        return None

print(parse_age("25"))    # 25
print(parse_age("-5"))    # Invalid age: Age cannot be negative
print(parse_age("abc"))   # Invalid age: invalid literal for int()
```

### TypeError - Wrong Type

```python
# When an operation or function is applied to wrong type
def add_numbers(a, b):
    try:
        return a + b
    except TypeError:
        print(f"Cannot add {type(a).__name__} and {type(b).__name__}")
        return None

print(add_numbers(5, 3))        # 8
print(add_numbers(5, "hello"))  # Cannot add int and str
print(add_numbers([1, 2], [3])) # [1, 2, 3] (list concatenation works!)
```

### ZeroDivisionError - Division by Zero

```python
# When dividing by zero
def safe_divide(a, b):
    try:
        return a / b
    except ZeroDivisionError:
        print("Cannot divide by zero")
        return None
    except TypeError:
        print("Both arguments must be numbers")
        return None

print(safe_divide(10, 2))   # 5.0
print(safe_divide(10, 0))   # Cannot divide by zero
print(safe_divide(10, "2")) # Both arguments must be numbers
```

### IndexError - Invalid Index

```python
# When accessing list/sequence with invalid index
def safe_get_item(lst, index):
    try:
        return lst[index]
    except IndexError:
        print(f"Index {index} out of range. List length: {len(lst)}")
        return None
    except TypeError:
        print("First argument must be a list")
        return None

items = ['a', 'b', 'c']
print(safe_get_item(items, 1))    # 'b'
print(safe_get_item(items, 10))   # Index 10 out of range
print(safe_get_item("abc", 0))    # 'a' (strings also have indexing)
```

### KeyError - Missing Dictionary Key

```python
# When accessing dictionary with non-existent key
def safe_get_value(dictionary, key):
    try:
        return dictionary[key]
    except KeyError:
        print(f"Key '{key}' not found in dictionary")
        return None
    except TypeError:
        print("First argument must be a dictionary")
        return None

config = {'host': 'localhost', 'port': 8000}
print(safe_get_value(config, 'host'))     # localhost
print(safe_get_value(config, 'password')) # Key 'password' not found
```

### AttributeError - Missing Attribute

```python
# When accessing non-existent attribute
class Person:
    def __init__(self, name):
        self.name = name

def get_attribute(obj, attr_name):
    try:
        return getattr(obj, attr_name)
    except AttributeError:
        print(f"Object has no attribute '{attr_name}'")
        return None

person = Person("Alice")
print(get_attribute(person, 'name'))  # Alice
print(get_attribute(person, 'age'))   # Object has no attribute 'age'
```

### FileNotFoundError - Missing File

```python
# When trying to open non-existent file
def read_file_safe(filename):
    try:
        with open(filename, 'r') as f:
            return f.read()
    except FileNotFoundError:
        print(f"File '{filename}' not found")
        return None
    except IOError as e:
        print(f"Error reading file: {e}")
        return None
```

---

## Part 2: Catching Specific Exceptions

### Single Exception Type

```python
def convert_to_float(value):
    """Convert value to float, catching ValueError only."""
    try:
        return float(value)
    except ValueError:
        print(f"Cannot convert '{value}' to float")
        return 0.0

print(convert_to_float("3.14"))  # 3.14
print(convert_to_float("abc"))   # Cannot convert 'abc' to float
```

### Multiple Specific Exceptions

```python
def process_list_data(data, index):
    """Process data with multiple possible errors."""
    try:
        value = data[index]
        result = 100 / value
        return result
    except IndexError:
        print(f"Index {index} is out of range")
        return None
    except ZeroDivisionError:
        print("Cannot divide by zero; value must be non-zero")
        return None
    except TypeError:
        print("Data must be a list/sequence of numbers")
        return None

# Test cases
numbers = [10, 20, 5, 0]

print(process_list_data(numbers, 0))  # 10.0
print(process_list_data(numbers, 10)) # Index 10 is out of range
print(process_list_data(numbers, 3))  # Cannot divide by zero
```

### Catching Multiple Exceptions in One Handler

```python
def get_json_value(data, key, index):
    """Get value from nested structure."""
    try:
        value = data[key][index]
        return float(value)
    except (KeyError, ValueError) as e:
        print(f"Invalid data structure or value: {e}")
        return None
    except (TypeError, IndexError) as e:
        print(f"Sequence error: {e}")
        return None

data = {'values': [10, 20, 30]}
print(get_json_value(data, 'values', 1))     # 20.0
print(get_json_value(data, 'invalid', 0))    # Invalid data structure
print(get_json_value(data, 'values', 10))    # Sequence error
```

---

## Part 3: Exception Objects

### Accessing Exception Information

```python
def safe_operation(value):
    """Demonstrate exception object attributes."""
    try:
        result = int(value)
        return 100 / result
    except ValueError as ve:
        # Access exception details
        print(f"Exception type: {type(ve).__name__}")
        print(f"Exception message: {ve}")
        print(f"Args: {ve.args}")
        return None
    except ZeroDivisionError as zde:
        print(f"Error: {zde}")
        print(f"Attempting division by zero detected")
        return None

safe_operation("abc")    # ValueError info
safe_operation("0")      # ZeroDivisionError info
```

### Using Exception for Better Diagnostics

```python
import traceback

def diagnose_error(value):
    """Use traceback for debugging."""
    try:
        data = {'x': 10, 'y': 20}
        result = data['z'] / value
    except Exception as e:
        print(f"Error occurred: {e}")
        print(f"Exception type: {type(e).__name__}")
        # Print full traceback
        traceback.print_exc()
        return None

diagnose_error(5)  # Shows full stack trace
```

---

## Part 4: Re-raising Exceptions

### When to Re-raise

```python
def calculate_average(numbers):
    """Perform operation, but re-raise after logging."""
    try:
        if not numbers:
            raise ValueError("List cannot be empty")
        return sum(numbers) / len(numbers)
    except ValueError as e:
        # Log the error (we'd send to logging system)
        print(f"[ERROR] Invalid input: {e}")
        # Re-raise so caller knows operation failed
        raise

# Caller must handle
try:
    avg = calculate_average([])
except ValueError:
    print("Could not calculate average")
```

### Raising Different Exception

```python
def load_config(filename):
    """Load config, converting OSError to RuntimeError."""
    try:
        with open(filename, 'r') as f:
            return f.read()
    except FileNotFoundError as e:
        # Wrap in more meaningful exception
        raise RuntimeError(f"Configuration file not found: {filename}") from e
    except IOError as e:
        raise RuntimeError(f"Cannot read configuration: {e}") from e
```

---

## Part 5: Validation Patterns

### Input Validation

```python
def divide(a, b):
    """Divide with complete validation."""
    # Type checking
    if not isinstance(a, (int, float)):
        raise TypeError(f"a must be number, got {type(a).__name__}")
    if not isinstance(b, (int, float)):
        raise TypeError(f"b must be number, got {type(b).__name__}")
    
    # Value validation
    if b == 0:
        raise ValueError("b cannot be zero")
    
    return a / b

# Usage
try:
    print(divide(10, 2))      # 5.0
    print(divide(10, 0))      # Raises ValueError
    print(divide(10, "2"))    # Raises TypeError
except (TypeError, ValueError) as e:
    print(f"Error: {e}")
```

### Default Values vs Exceptions

```python
# Approach 1: Return default value
def safe_divide_v1(a, b):
    try:
        return a / b
    except ZeroDivisionError:
        return 0  # Silent default

# Approach 2: Raise exception
def safe_divide_v2(a, b):
    if b == 0:
        raise ValueError("cannot divide by zero")
    return a / b

# Use Approach 2 for critical operations
# Use Approach 1 for non-critical fallbacks
```

---

## Graded Exercises

### Starter Level

1. **Write 5 exception handlers** for different exception types
2. **Catch and handle** ValueError, TypeError, IndexError, KeyError, FileNotFoundError
3. **Test with invalid input** to confirm correct exception is caught

### Intermediate Level

1. **Create function with multiple except blocks** handling different errors
2. **Include exception object usage** (printing message, type)
3. **Validate inputs** before operation to catch errors early
4. **Write test cases** showing each exception handling path

### Advanced Level

1. **Implement custom error handling strategy** across multiple functions
2. **Create wrapper function** that catches and logs errors
3. **Re-raise exceptions** appropriately for caller handling
4. **Use exception information** for debugging and diagnosis

---

## Self-Assessment

- [ ] I can identify common exception types
- [ ] I can catch specific exceptions instead of generic Exception
- [ ] I understand exception hierarchy
- [ ] I can access exception information (message, type)
- [ ] I know when to catch vs. let exception propagate
- [ ] I use appropriate exception types in validation
- [ ] I provide context-specific error messages

---

## Resources

- **Python Built-in Exceptions**: https://docs.python.org/3/library/exceptions.html
- **PEP 8 - Exception Naming**: https://www.python.org/dev/peps/pep-0008/
- **Real Python - Exception Handling**: https://realpython.com/python-exceptions/

---

**Next: [Lesson 1.1.64: Multiple Except Blocks](Lesson-1.1.64-Multiple-Except-Blocks.md)**
