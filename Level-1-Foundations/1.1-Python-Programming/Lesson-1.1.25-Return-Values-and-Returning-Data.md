# Lesson 1.1.25: Return Values & Returning Data

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.24 (Scope & Namespaces) | **Topic**: Functions - Return Values

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Return single and multiple values from functions
- Use tuple unpacking for return values
- Return functions and data structures
- Understand None as default return value
- Use early returns for clean code
- Apply return value patterns effectively

---

## 1. Understanding Return Values (90 min)

### 1.1 What is a Return Value?

```python
# A return value is data a function sends BACK to caller

# Function returns a value
def greet(name):
    message = f"Hello, {name}!"
    return message

result = greet("Alice")
print(result)  # Hello, Alice!

# Without explicit return, returns None
def no_return():
    x = 10
    # Implicitly returns None

result = no_return()
print(result)  # None
print(type(result))  # <class 'NoneType'>
```

### 1.2 Returning Different Data Types

```python
print("=== RETURNING TYPES ===\n")

# Return integer
def add(a, b):
    return a + b

result = add(5, 3)
print(f"Integer: {result}")  # 8

# Return string
def format_greeting(name, age):
    return f"{name} is {age} years old"

result = format_greeting("Bob", 25)
print(f"String: {result}")

# Return list
def get_numbers():
    return [1, 2, 3, 4, 5]

result = get_numbers()
print(f"List: {result}")

# Return dictionary
def create_person():
    return {
        'name': 'Charlie',
        'age': 30,
        'city': 'NYC'
    }

result = create_person()
print(f"Dictionary: {result}")

# Return boolean
def is_adult(age):
    return age >= 18

result = is_adult(20)
print(f"Boolean: {result}")

# Return multiple types (use function logic)
def process_data(value):
    if value < 0:
        return "Negative"
    elif value == 0:
        return 0
    else:
        return value * 2

print(f"Multiple types: {process_data(-5)}")
print(f"Multiple types: {process_data(10)}")
```

### 1.3 Early Returns

```python
print("\n=== EARLY RETURNS ===\n")

# Early return: Exit function early when condition met

# ❌ NESTED: Hard to follow
def validate_age_nested(age):
    if age >= 0:
        if age <= 150:
            if age >= 18:
                return "Adult"
            else:
                return "Minor"
        else:
            return "Invalid age"
    else:
        return "Invalid age"

# ✅ EARLY RETURNS: Clearer logic
def validate_age(age):
    if age < 0:
        return "Invalid: negative"
    if age > 150:
        return "Invalid: too old"
    if age >= 18:
        return "Adult"
    return "Minor"

print(f"Age 25: {validate_age(25)}")
print(f"Age 10: {validate_age(10)}")
print(f"Age -5: {validate_age(-5)}")
print(f"Age 200: {validate_age(200)}")

# Another example
def find_user(users, user_id):
    """Find user by ID, return early if not found"""
    if not users:
        return None
    
    if not isinstance(user_id, int):
        return None
    
    for user in users:
        if user['id'] == user_id:
            return user  # Early return when found
    
    return None  # Not found

users = [
    {'id': 1, 'name': 'Alice'},
    {'id': 2, 'name': 'Bob'},
    {'id': 3, 'name': 'Charlie'}
]

print(f"\nFind user 2: {find_user(users, 2)}")
print(f"Find user 99: {find_user(users, 99)}")
```

---

## 2. Multiple Return Values (90 min)

### 2.1 Returning Tuples

```python
print("=== MULTIPLE RETURN VALUES ===\n")

# Python supports returning multiple values as tuple

def get_credentials():
    username = "alice"
    password = "secret123"
    return username, password  # Returns tuple

# Unpack immediately
user, pwd = get_credentials()
print(f"Username: {user}, Password: {pwd}")

# Or receive as tuple
creds = get_credentials()
print(f"Credentials: {creds}")

# Return many values
def get_stats(numbers):
    """Return count, sum, and average"""
    count = len(numbers)
    total = sum(numbers)
    average = total / count if count > 0 else 0
    return count, total, average

nums = [10, 20, 30, 40, 50]
count, total, avg = get_stats(nums)
print(f"\nStats: count={count}, total={total}, avg={avg}")
```

### 2.2 Unpacking Return Values

```python
print("\n=== UNPACKING ===\n")

# Basic unpacking
def coordinates():
    return 10, 20

x, y = coordinates()
print(f"X: {x}, Y: {y}")

# Ignore some values with _
def get_info():
    return "Alice", 25, "NYC", "Engineer"

name, age, _, job = get_info()
print(f"{name} ({age}): {job}")

# Unpack with *
def math_result():
    return 5, 10, 15, 20, 25

first, *middle, last = math_result()
print(f"First: {first}, Middle: {middle}, Last: {last}")

# Can't unpack wrong number
def two_values():
    return 1, 2

# a, b, c = two_values()  # ❌ ValueError: too many values

# ✅ Correct unpacking
a, b = two_values()
print(f"\nValues: {a}, {b}")
```

### 2.3 Returning Multiple Outputs

```python
print("\n=== COMPLEX RETURNS ===\n")

# Return dict for multiple named values
def analyze_text(text):
    """Return multiple analysis results"""
    words = text.split()
    
    return {
        'word_count': len(words),
        'char_count': len(text),
        'words': words,
        'longest': max(words, key=len) if words else None
    }

analysis = analyze_text("Hello world Python rules")
print(f"Analysis: {analysis}")

for key, value in analysis.items():
    print(f"  {key}: {value}")

# Return class instance (more advanced)
class Analysis:
    def __init__(self, word_count, char_count, words):
        self.word_count = word_count
        self.char_count = char_count
        self.words = words
    
    def summary(self):
        return f"{self.word_count} words, {self.char_count} chars"

result = Analysis(4, 20, ["Hello", "world", "Python", "rules"])
print(f"\nClass result: {result.summary()}")
```

---

## 3. Advanced Return Patterns (90 min)

### 3.1 Conditional Returns

```python
print("=== CONDITIONAL RETURNS ===\n")

# Return different types based on condition
def square_root(n):
    """Return sqrt or error message"""
    if n < 0:
        return None  # or could return error tuple
    return n ** 0.5

print(f"sqrt(16): {square_root(16)}")
print(f"sqrt(-4): {square_root(-4)}")

# Better: Return tuple with status
def safe_divide(a, b):
    """Return (success, result)"""
    if b == 0:
        return False, None
    return True, a / b

success, result = safe_divide(10, 2)
if success:
    print(f"Result: {result}")
else:
    print("Division by zero!")

success, result = safe_divide(10, 0)
if success:
    print(f"Result: {result}")
else:
    print("Division by zero!")
```

### 3.2 Returning Functions

```python
print("\n=== RETURNING FUNCTIONS ===\n")

# Function can return another function
def create_greeter(greeting):
    """Create greeting function"""
    def greet(name):
        return f"{greeting}, {name}!"
    return greet

# Different greeters
say_hello = create_greeter("Hello")
say_goodbye = create_greeter("Goodbye")

print(say_hello("Alice"))
print(say_goodbye("Bob"))

# More complex example
def operation_factory(op):
    """Create function for math operation"""
    def operate(a, b):
        if op == "add":
            return a + b
        elif op == "subtract":
            return a - b
        elif op == "multiply":
            return a * b
        elif op == "divide":
            return a / b if b != 0 else None
    return operate

add = operation_factory("add")
multiply = operation_factory("multiply")

print(f"\nadd(5, 3) = {add(5, 3)}")
print(f"multiply(5, 3) = {multiply(5, 3)}")
```

### 3.3 Return Value Chains

```python
print("\n=== FUNCTION CHAINS ===\n")

# Chain functions using returns
def process_text(text):
    """Start chain"""
    return text.strip()

def to_upper(text):
    """Continue chain"""
    return process_text(text).upper()

def add_exclamation(text):
    """End chain"""
    return to_upper(text) + "!"

result = add_exclamation("  hello world  ")
print(f"Chained: {result}")

# Better: Method chaining on objects (coming later)
# For now, can nest:
result = add_exclamation(process_text("  hello  "))
print(f"Nested: {result}")

# Or build transformation pipeline
def pipeline(value, *functions):
    """Apply multiple transformations"""
    for func in functions:
        value = func(value)
    return value

def add_spaces(text):
    return f"  {text}  "

def count_chars(text):
    return len(text)

result = pipeline("hello", add_spaces, str.upper, str.strip, len)
print(f"Pipeline result: {result}")
```

---

## 4. None and Special Returns (60 min)

### 4.1 Understanding None

```python
print("=== NONE RETURN ===\n")

# Every function returns something (None if not specified)
def no_explicit_return():
    x = 10

result = no_explicit_return()
print(f"Result: {result}")      # None
print(f"Type: {type(result)}")  # <class 'NoneType'>

# Useful for functions that perform action without returning data
def log_message(message):
    print(f"[LOG] {message}")
    # No return = returns None

result = log_message("System started")
print(f"Returned: {result}")

# Checking for None is common pattern
def safe_get(data, key):
    """Return value or None if not found"""
    if key in data:
        return data[key]
    return None  # Explicit None

user = {'name': 'Alice', 'age': 25}
print(f"\nName: {safe_get(user, 'name')}")
print(f"Email: {safe_get(user, 'email')}")

# Check if None
email = safe_get(user, 'email')
if email is None:
    print("Email not found")
else:
    print(f"Email: {email}")
```

### 4.2 Empty Returns

```python
print("\n=== EMPTY RETURNS ===\n")

# return with no value also returns None
def early_exit(value):
    if value < 0:
        return  # Returns None
    return value * 2

print(f"negative: {early_exit(-5)}")
print(f"positive: {early_exit(5)}")

# Useful in loops/searches
def find_match(items, target):
    """Return item or None if not found"""
    for item in items:
        if item == target:
            return item
        if item > target:
            return  # Early exit, returns None
    return None

items = [1, 3, 5, 7, 9]
print(f"\nFind 5: {find_match(items, 5)}")
print(f"Find 2: {find_match(items, 2)}")
```

### 4.3 Return Type Hints

```python
print("\n=== TYPE HINTS ===\n")

# Indicate expected return type with hint syntax
def add_numbers(a: int, b: int) -> int:
    """Add two numbers, return int"""
    return a + b

result = add_numbers(5, 3)
print(f"add_numbers(5, 3) = {result}")

# Multiple returns can be Optional or Union
def find_user(user_id: int) -> dict:
    """Find user, returning dict or None"""
    users = {1: {'name': 'Alice'}, 2: {'name': 'Bob'}}
    return users.get(user_id)

user = find_user(1)
print(f"Found: {user}")

# Return type can be complex
from typing import Tuple, List

def get_stats(numbers: List[int]) -> Tuple[int, float]:
    """Return count and average"""
    return len(numbers), sum(numbers) / len(numbers) if numbers else 0

count, avg = get_stats([10, 20, 30])
print(f"\nStats: count={count}, avg={avg}")
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.25.1**: Simple Return
```python
def double(x):
    # Return double of x
    pass

result = double(5)
print(result)  # Should be 10
```

**Exercise 1.1.25.2**: Return Boolean
```python
def is_even(n):
    # Return True if even, False if odd
    pass

print(is_even(4))  # True
print(is_even(7))  # False
```

**Exercise 1.1.25.3**: Return Multiple
```python
def get_name_age():
    # Return name and age as tuple
    pass

name, age = get_name_age()
print(f"{name} is {age}")
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.25.4**: Conditional Return
```python
def validate_password(password):
    # Return True if valid (8+ chars), False otherwise
    pass

print(validate_password("short"))     # False
print(validate_password("longpass"))  # True
```

**Exercise 1.1.25.5**: Multiple Unpacking
```python
def get_rgb():
    # Return RGB color values
    return 255, 128, 64

r, g, b = get_rgb()
print(f"RGB: {r}, {g}, {b}")
```

**Exercise 1.1.25.6**: Early Return
```python
def process_user(user_data):
    # Check if user_data is None, return "Invalid"
    # Check if 'name' key missing, return "Missing name"
    # Otherwise return "Valid"
    pass
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.25.7**: Return Function
```python
def create_power(exponent):
    # Return function that raises to exponent power
    pass

square = create_power(2)
cube = create_power(3)

print(square(5))  # 25
print(cube(5))    # 125
```

**Exercise 1.1.25.8**: Complex Returns
```python
def analyze_list(items):
    # Return tuple: (count, sum, average, max, min)
    pass

result = analyze_list([2, 4, 6, 8])
count, total, avg, maximum, minimum = result
```

**Exercise 1.1.25.9**: Status Returns
```python
def attempt_calculation(a, b, op):
    # Return (success, result) tuple
    # Handle division by zero
    # Handle unknown operations
    pass

success, result = attempt_calculation(10, 2, "divide")
print(f"Success: {success}, Result: {result}")
```

---

## Mini-Project: Data Processor

Create function that processes data and returns multiple analysis results.

```python
def process_scores(scores):
    """
    Analyze test scores.
    
    Returns dict with:
    - count: number of scores
    - sum: total of all scores
    - average: mean score
    - highest: max score
    - lowest: min score
    - percentage: (sum / (count * 100)) * 100
    - grade: letter grade based on average
    """
    if not scores:
        return None
    
    count = len(scores)
    total = sum(scores)
    average = total / count
    highest = max(scores)
    lowest = min(scores)
    percentage = (total / (count * 100)) * 100
    
    # Determine letter grade
    if average >= 90:
        grade = 'A'
    elif average >= 80:
        grade = 'B'
    elif average >= 70:
        grade = 'C'
    else:
        grade = 'F'
    
    return {
        'count': count,
        'sum': total,
        'average': round(average, 2),
        'highest': highest,
        'lowest': lowest,
        'percentage': round(percentage, 2),
        'grade': grade
    }

# Test
scores = [85, 92, 78, 95, 88]
analysis = process_scores(scores)

if analysis:
    print("Score Analysis:")
    for key, value in analysis.items():
        print(f"  {key}: {value}")
    
    # Use early return pattern
    if analysis['average'] < 80:
        print("\nNeed improvement!")
    else:
        print("\nGood work!")
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **A function without `return` statement returns `None`.**
   - Answer: True

2. **Multiple return values must use a list.**
   - Answer: False (can use tuple, dict, or class)

3. **Early return makes code harder to read.**
   - Answer: False (usually makes it clearer)

4. **Can return a function from a function.**
   - Answer: True

---

### Conceptual Questions

5. **Why return multiple values instead of using global variables?**
   - Expected: Functions are independent, reusable, easier to test

6. **What's the purpose of early returns?**
   - Expected: Reduce nesting, make edge cases clear, improve readability

7. **When should you use `None` as return value?**
   - Expected: When operation fails, data not found, or just performing action

---

### Coding Challenge

8. **Create calculator function:**
   - Takes two numbers and operation string
   - Returns (success, result) tuple
   - Handles division by zero
   - Handles unknown operations

   ```python
   def calculate(a, b, operation):
       if operation == "add":
           return True, a + b
       elif operation == "subtract":
           return True, a - b
       elif operation == "multiply":
           return True, a * b
       elif operation == "divide":
           if b == 0:
               return False, None
           return True, a / b
       else:
           return False, None
   ```

---

## Key Takeaways

✅ **Return value is data sent back to caller** - Function completes and returns data  
✅ **Multiple returns use tuple unpacking** - More and clean  
✅ **Early returns reduce nesting** - Handles edge cases first  
✅ **None indicates no data** - Default return when not specified  
✅ **Return patterns vary by use case** - dict, tuple, function, status flag

---

## Additional Resources

- [Python Return Statement](https://docs.python.org/3/reference/simple_stmts.html#return)
- [Tuple Unpacking](https://realpython.com/python-args-kwargs/#argument-unpacking)
- [Type Hints in Python](https://docs.python.org/3/library/typing.html)

---

## Next Lesson Preview

**Lesson 1.1.26**: Lambda Functions & Anonymous Functions
- Single-line functions
- Using lambdas with map/filter/sort
- When to use lambdas
- Lambda best practices

---

## Homework

- [ ] Complete Exercises 1.1.25.1 - 1.1.25.9
- [ ] Build and test Data Processor
- [ ] Create function returning dict with 5+ keys
- [ ] Chain at least 3 functions together
- [ ] Quiz: Answer all assessment questions

**Expected time**: 3-4 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.26** when you're ready.




