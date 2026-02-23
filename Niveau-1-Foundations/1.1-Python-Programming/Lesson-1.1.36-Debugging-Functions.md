# Lesson 1.1.36: Debugging Functions

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.1.24-1.1.35 (Functions fundamentals)

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Use print statements effectively for debugging
- Understand Python debuggers (pdb)
- Use breakpoints and step through code
- Inspect variables and call stacks
- Identify common function bugs
- Use logging for production debugging
- Apply debugging strategies systematically

---

## 1. Debugging Basics (60 min)

### 1.1 Print-Based Debugging

```python
# Simple print debugging
def calculate_discount(price, discount_rate):
    print(f"Input: price={price}, discount_rate={discount_rate}")
    
    discounted = price * (1 - discount_rate)
    print(f"Discounted: {discounted}")
    
    tax = discounted * 0.1
    print(f"Tax: {tax}")
    
    total = discounted + tax
    print(f"Total: {total}")
    
    return total

result = calculate_discount(100, 0.2)
print(f"Final result: {result}")
```

### 1.2 Strategic Print Statements

```python
# Good: print at key points
def process_user(user_data):
    print(f"DEBUG: Received user_data: {user_data}")
    
    if not user_data:
        print("DEBUG: user_data is empty!")
        return None
    
    name = user_data.get("name")
    print(f"DEBUG: Extracted name: {name}")
    
    if not name:
        print("DEBUG: Name is missing!")
        return None
    
    return name.upper()

# Bad: too many prints
def confusing_function(x):
    print(x)
    y = x * 2
    print(y)
    z = y + 1
    print(z)
    return z  # Hard to see what's important
```

### 1.3 Using repr() for Debugging

```python
# repr() shows actual values more clearly
value = "test"
print(value)        # test
print(repr(value))  # 'test' (shows it's a string)

none_value = None
print(none_value)        # None
print(repr(none_value))  # None

empty_list = []
print(empty_list)        # []
print(repr(empty_list))  # []

# Useful in debugging:
def debug_function(data):
    print(f"Data type: {type(data)}, Value: {repr(data)}")
    # Much clearer output!
```

---

## 2. Using Python Debugger (pdb) (75 min)

### 2.1 Setting Breakpoints

```python
# Method 1: breakpoint() - Python 3.7+
def buggy_function(x, y):
    breakpoint()  # Debugger stops here
    result = x + y
    return result

# Method 2: import pdb; pdb.set_trace()
import pdb

def another_buggy(x, y):
    pdb.set_trace()  # Debugger stops here
    result = x * y
    return result

# When breakpoint() is hit, you get pdb prompt:
# > function_name()
# -> code line that will execute next
# (Pdb) _
```

### 2.2 pdb Commands

```python
# Common pdb commands:
def example_for_debugging():
    x = 10
    y = 20
    breakpoint()  # Debugger starts
    z = x + y
    # (Pdb) commands:
    # 
    # l - list current code
    # n - next line (step over)
    # s - step into (into function calls)
    # c - continue execution
    # p variable - print variable value
    # pp variable - pretty-print variable
    # h - help
    # w - where (show call stack)
    # u - up (go up in call stack)
    # d - down (go down in call stack)
    # q - quit debugger
    #
    return z

# Example debugging session
example_for_debugging()
# (Pdb) p x
# 10
# (Pdb) p y
# 20
# (Pdb) n
# > example_for_debugging()
# -> z = x + y
# (Pdb) n
# (Pdb) p z
# 30
# (Pdb) c
```

### 2.3 Conditional Breakpoints

```python
# Break only when condition is true
def process_items(items):
    for i, item in enumerate(items):
        # Break only when item fails condition
        if item < 0:
            breakpoint()  # Only hits for negative values
        
        process(item)

# More sophisticated: conditional trigger
def search_for_bug(data_list):
    for item in data_list:
        if item == "PROBLEM_VALUE":  # Specific condition
            breakpoint()  # Stop here
        
        process(item)
```

---

## 3. Common Function Bugs (75 min)

### 3.1 Off-by-One Errors

```python
# BUG: Off-by-one in range
def sum_range_wrong(n):
    total = 0
    for i in range(n):  # Goes 0 to n-1, missing n!
        total += i
    return total

print(sum_range_wrong(5))  # 10, but should be 15

# FIXED:
def sum_range_correct(n):
    total = 0
    for i in range(1, n + 1):  # 1 to n inclusive
        total += i
    return total

print(sum_range_correct(5))  # 15 ✓

# Debugging:
def sum_range_debug(n):
    total = 0
    for i in range(n):
        print(f"i={i}, total before={total}")
        total += i
        print(f"total after={total}")
    return total

sum_range_debug(3)
# i=0, total before=0
# total after=0
# i=1, total before=0
# total after=1
# i=2, total before=1
# total after=3
# Missing i=3!
```

### 3.2 Mutable Default Arguments

```python
# BUG: Mutable default creates shared state!
def add_item_wrong(item, lst=[]):
    lst.append(item)
    return lst

result1 = add_item_wrong(1)       # [1]
result2 = add_item_wrong(2)       # [1, 2] - NOT [2]!
print(result1 is result2)         # True - same list!

# Debugging this bug:
print(id(result1), id(result2))   # Same memory address!

# FIXED: Use None default
def add_item_correct(item, lst=None):
    if lst is None:
        lst = []
    lst.append(item)
    return lst

result1 = add_item_correct(1)     # [1]
result2 = add_item_correct(2)     # [2] ✓
print(result1 is result2)         # False ✓
```

### 3.3 Scope Issues

```python
# BUG: Forgot global keyword
counter = 0

def increment_wrong():
    counter += 1  # UnboundLocalError!
    return counter

# UnboundLocalError: local variable 'counter' referenced before assignment

# FIXED: Use global
def increment_correct():
    global counter
    counter += 1
    return counter

# BETTER: Avoid global, use parameter
def increment_better(current_value):
    return current_value + 1

counter = 0
counter = increment_better(counter)
```

---

## 4. Logging for Debugging (60 min)

### 4.1 Basic Logging Setup

```python
import logging

# Configure logging
logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)

logger = logging.getLogger(__name__)

def function_with_logging(x, y):
    logger.debug(f"Starting function with x={x}, y={y}")
    
    result = x + y
    logger.info(f"Calculation complete: {result}")
    
    if result > 100:
        logger.warning(f"Result {result} exceeds threshold!")
    
    return result

function_with_logging(50, 40)
# Output:
# 2024-01-01 12:34:56,789 - __main__ - DEBUG - Starting with x=50, y=40
# 2024-01-01 12:34:56,790 - __main__ - INFO - Calculation complete: 90
# 2024-01-01 12:34:56,791 - __main__ - WARNING - Result 90 exceeds threshold!
```

### 4.2 Log Levels

```python
import logging

logger = logging.getLogger(__name__)

# Different severity levels:
logger.debug("Detailed information for debugging")      # DEBUG
logger.info("General informational messages")           # INFO
logger.warning("Warning - something unusual")           # WARNING
logger.error("Error - serious problem")                 # ERROR
logger.critical("Critical - system may fail")           # CRITICAL

# Exception logging with traceback
try:
    result = 1 / 0
except ZeroDivisionError:
    logger.exception("An error occurred")  # Logs exception with traceback
```

### 4.3 File Logging

```python
import logging

# Log to file
logging.basicConfig(
    filename='app.log',
    level=logging.DEBUG,
    format='%(asctime)s - %(levelname)s - %(message)s'
)

logger = logging.getLogger(__name__)

def process_data(data):
    try:
        logger.info(f"Processing {len(data)} items")
        result = dangerous_operation(data)
        logger.info(f"Successfully processed")
        return result
    except Exception as e:
        logger.error(f"Failed to process: {e}")
        logger.exception("Full traceback:")
        return None

# Log file created: app.log
```

---

## 5. Stack Traces and Exceptions (75 min)

### 5.1 Reading Stack Traces

```python
# Traceback tells story of where error occurred
def function_a():
    return function_b()

def function_b():
    return function_c()

def function_c():
    return 1 / 0  # Error here

try:
    function_a()
except ZeroDivisionError as e:
    # Traceback shows:
    # 1. Where error occurred (function_c, line X)
    # 2. Who called what (call chain)
    # 3. What went wrong (ZeroDivisionError)
    import traceback
    traceback.print_exc()
```

### 5.2 Catching and Inspecting Exceptions

```python
def process_file(filename):
    try:
        with open(filename) as f:
            data = f.read()
            return int(data)
    except FileNotFoundError as e:
        # Inspect exception
        print(f"File not found: {e.filename}")
        print(f"Error details: {e}")
        return None
    except ValueError as e:
        print(f"Invalid data: {e}")
        return None
    except Exception as e:
        print(f"Unexpected error: {type(e).__name__}: {e}")
        import traceback
        traceback.print_exc()
        return None

process_file("nonexistent.txt")
```

### 5.3 Debugging with Exceptions

```python
# Use exceptions to validate function behavior
def validate_input(value):
    if value < 0:
        raise ValueError(f"Value must be non-negative, got {value}")
    if not isinstance(value, (int, float)):
        raise TypeError(f"Expected number, got {type(value).__name__}")
    return True

# Test function
def safe_calculate(x, y):
    try:
        validate_input(x)
        validate_input(y)
        return x * y
    except ValueError as e:
        print(f"Validation failed: {e}")
        return None

print(safe_calculate(-5, 10))  # Validation failed: Value must be non-negative...
```

---

## 6. Debugging Strategies (45 min)

### 6.1 Isolate the Problem

```python
# Break down complex function to find bug
def complex_calculation(data):
    # Step 1: Validate input
    if not data:
        return None
    
    # Step 2: Transform data
    transformed = [x * 2 for x in data]
    
    # Step 3: Filter
    filtered = [x for x in transformed if x > 5]
    
    # Step 4: Final calculation
    result = sum(filtered)
    
    return result

# Test each step separately:
test_data = [1, 2, 3, 4]
print(f"Input: {test_data}")
print(f"After transform: {[x * 2 for x in test_data]}")
print(f"After filter: {[x for x in [x * 2 for x in test_data] if x > 5]}")
print(f"Sum: {sum([x for x in [x * 2 for x in test_data] if x > 5])}")
```

### 6.2 Binary Elimination

```python
# Remove chunks to find which part breaks
def buggy_process(data):
    step1 = data * 2
    step2 = step1 + 10
    step3 = step2 / 0  # Bug somewhere - which step?
    step4 = step3 * 5
    return step4

# Comment out parts:
def debug_process(data):
    step1 = data * 2
    # step2 = step1 + 10
    # step3 = step2 / 0
    # step4 = step3 * 5
    return step1  # Test if this works

# If works, uncomment next step, repeat until you find bug
```

### 6.3 Adding Assertions

```python
# Assert expected conditions
def fibonacci(n):
    assert n >= 0, "n must be non-negative"
    assert isinstance(n, int), "n must be integer"
    
    if n <= 1:
        return n
    
    result = fibonacci(n-1) + fibonacci(n-2)
    assert result >= 0, f"Unexpected negative result: {result}"
    
    return result

print(fibonacci(5))      # Works
# print(fibonacci(-1))   # AssertionError: n must be non-negative
```

---

## 7. Mini-Project: Debug This Code

```python
# BUGGY CODE - find all bugs!
def calculate_statistics(numbers):
    total = 0
    for num in numbers:  # BUG 1: Off-by-one?
        total += num
    
    average = total / len(numbers)
    
    max_val = numbers[0]
    for i in range(len(numbers)):  # BUG 2: Range issue?
        if numbers[i] > max_val:
            max_val = numbers[i]
    
    def find_min():  # BUG 3: Global reference?
        min_val = numbers[0]
        for num in numbers:
            if num < min_val:
                min_val = num
        return min_val
    
    return {
        "average": average,
        "max": max_val,
        "min": find_min()
    }

# Test to find bugs:
test_data = [1, 2, 3, 4, 5]
result = calculate_statistics(test_data)
print(result)

# FIXED version:
def calculate_statistics_fixed(numbers):
    if not numbers:
        return None
    
    total = sum(numbers)
    average = total / len(numbers)
    max_val = max(numbers)
    min_val = min(numbers)
    
    return {
        "average": average,
        "max": max_val,
        "min": min_val
    }
```

---

## 8. Graded Exercises

### Starter Exercises (40 minutes)

**Starter 1: Print Debugging**
```python
# TODO: Add print statements to debug:
def calculate(x, y):
    result = x + y
    return result * 2

print(calculate(5, 3))  # Should be 16?
```

**Starter 2: Identify Bug**
```python
# TODO: Find the bug:
def double_list(lst=[]):
    lst.append(1)
    return lst

a = double_list()
b = double_list()
# Why is b wrong?
```

### Intermediate Exercises (60 minutes)

**Intermediate 1: Use pdb**
```python
# TODO: Use breakpoint() to debug
def complex_function(data):
    # Add breakpoint and explore
    pass
```

**Intermediate 2: Add Logging**
```python
# TODO: Add logging to track function execution
```

### Advanced Exercises (90 minutes)

**Advanced 1: Fix Multiple Bugs**
```python
# TODO: Fix all bugs in provided function
```

**Advanced 2: Create Test Suite**
```python
# TODO: Write tests to catch bugs
```

---

## 9. Self-Assessment Checklist

- [ ] I can use print statements effectively
- [ ] I understand pdb commands
- [ ] I can set and use breakpoints
- [ ] I can identify common bugs
- [ ] I can read stack traces
- [ ] I understand logging

---

## 10. Assessment Questions

**True/False:**
1. breakpoint() requires importing pdb
2. Mutable defaults are a common source of bugs
3. Global variables never cause debugging problems

**Coding:**
1. Debug a buggy function
2. Find the issue with mutable defaults
3. Add appropriate logging

---

## 11. Additional Resources

- pdb documentation
- Logging best practices
- Stack trace interpretation
- Next Lesson: Lesson 1.1.37 - Mini-Project: Function Library

---

**Next Lesson:** Lesson 1.1.37 - Mini-Project: Function Library
