# Lesson 1.1.7: Boolean Logic & Truth Values

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.1.6 (Special Numbers & Math) | **Topic**: Boolean Operators & Logic

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Understand truthy and falsy values in Python
- Master boolean operators (`and`, `or`, `not`)
- Apply De Morgan's Laws to simplify boolean expressions
- Use short-circuit evaluation to write efficient code
- Understand boolean algebra and truth tables

---

## 1. Truthy and Falsy Values (90 min)

### 1.1 Understanding Truthiness

Every value in Python has a "truth value" - it evaluates to `True` or `False` in a boolean context.

```python
# FALSY values (evaluate to False in boolean context)
falsy_values = [
    None,           # No value
    False,          # Literal False
    0,              # Zero (int)
    0.0,            # Zero (float)
    '',             # Empty string
    [],             # Empty list
    {},             # Empty dictionary
    (),             # Empty tuple
    set(),          # Empty set
]

# Everything else is TRUTHY
truthy_values = [
    True,           # Literal True
    1,              # Non-zero number
    -5,             # Negative numbers are truthy
    'Hello',        # Non-empty string
    [1, 2],         # Non-empty list
    {'a': 1},       # Non-empty dictionary
]

# Test truthiness with bool() function
for value in [0, '', [], None, False]:
    print(f"{repr(value):15} -> {bool(value)}")

# Output:
# 0              -> False
# ''             -> False
# []             -> False
# None           -> False
# False          -> False
```

### 1.2 Using Truthiness in Conditionals

```python
# ❌ Explicit (verbose)
if user_name != '':
    print("Name provided")

# ✅ PYTHONIC: Use truthiness directly
if user_name:
    print("Name provided")

# This works because empty strings are falsy, non-empty are truthy

# Real examples:
def process_data(data):
    if not data:  # Checks if list/dict is empty
        print("No data to process")
        return
    
    for item in data:
        print(f"Processing: {item}")

# Works for empty and non-empty
process_data([])  # Prints "No data to process"
process_data([1, 2, 3])  # Processes each item
```

### 1.3 Common Truthy/Falsy Patterns

```python
# Checking for non-empty collections
users = []
if users:  # True if list has items, False if empty
    print(f"Found {len(users)} users")
else:
    print("No users found")

# Checking for None vs default value
config = None
active_config = config or {"default": "settings"}  # ← See "or" usage below
print(active_config)  # Output: {'default': 'settings'}

# String validation
password = input("Enter password: ")
if password and len(password) >= 8:  # ← Two conditions checked
    print("Password accepted")
else:
    print("Password too short or empty")

# Checking if value exists in collection
if some_value in my_list:  # This is better than truthiness
    print("Found!")
```

### 1.4 Edge Cases with Truthiness

```python
# Numbers and truthiness
print(bool(0))      # False
print(bool(1))      # True
print(bool(-1))     # True (negative numbers are truthy!)
print(bool(0.0))    # False
print(bool(0.00001))  # True

# Strings and truthiness
print(bool("0"))    # True! (non-empty string)
print(bool("False")) # True! (non-empty string)
print(bool(""))     # False (empty string)

# Collections and truthiness
print(bool([0]))    # True (list with one element, even if 0)
print(bool([]))     # False (empty list)
print(bool({0: "zero"}))  # True (dict with one key-value pair)

# None is special
print(bool(None))   # False
value = None
if value is None:  # ← Prefer "is None" over "if not value"
    print("Value is None")
```

---

## 2. Boolean Operators (90 min)

### 2.1 The `and` Operator

`and` returns `True` only if BOTH conditions are True.

```python
# Truth table for AND
print(True and True)    # True
print(True and False)   # False
print(False and True)   # False
print(False and False)  # False

# Real-world examples
age = 25
has_license = True

if age >= 18 and has_license:
    print("Can drive")  # Prints this
else:
    print("Cannot drive")

# Password validation
password = "MyP@ssw0rd!"
if len(password) >= 8 and '@' in password and any(c.isdigit() for c in password):
    print("Strong password!")
```

### 2.2 The `or` Operator

`or` returns `True` if AT LEAST ONE condition is True.

```python
# Truth table for OR
print(True or True)     # True
print(True or False)    # True
print(False or True)    # True
print(False or False)   # False

# Real-world examples
day = "Saturday"
if day == "Saturday" or day == "Sunday":
    print("It's the weekend!")

# Providing defaults using `or`
user_theme = None
theme = user_theme or "light"  # If user_theme is falsy, use default
print(theme)  # Output: "light"

# Multiple conditions
status = input("Are you (S)tudent, (E)mployee, or (R)etired? ").upper()
if status == 'S' or status == 'E' or status == 'R':
    print("Valid status")
```

### 2.3 The `not` Operator

`not` reverses the truth value.

```python
# NOT operator
print(not True)   # False
print(not False)  # True
print(not 0)      # True (0 is falsy, so not 0 is True)
print(not 1)      # False (1 is truthy, so not 1 is False)

# Practical examples
logged_in = False
if not logged_in:
    print("Please log in")

# Negating complex expressions
temperature = 15
if not (temperature > 25 and temperature < 30):
    print("Temperature not in comfort zone")
```

### 2.4 Combining Boolean Operators

```python
# Combining AND, OR, NOT
age = 30
has_experience = True
is_certified = False

# Condition: Person should have experience AND either be 25+ OR certified
if has_experience and (age >= 25 or is_certified):
    print("Person qualifies")

# Note: Parentheses matter! Shows order of evaluation

# Common pattern: Check if value is NOT None before using it
value = None
if value is not None and len(value) > 5:
    print("Value is long enough")

# Multiple checks in sequence
def approve_loan(credit_score, income, employment_years):
    if credit_score >= 700 and income > 50000 and employment_years >= 2:
        return True
    return False

print(approve_loan(750, 60000, 3))   # True
print(approve_loan(650, 60000, 3))   # False (credit score too low)
```

---

## 3. De Morgan's Laws & Logic Simplification (60 min)

### 3.1 De Morgan's Laws

These laws allow you to simplify complex boolean expressions:

**Law 1**: `not (A and B)` = `(not A) or (not B)`  
**Law 2**: `not (A or B)` = `(not A) and (not B)`

```python
# Example 1: Simplifying with Law 1
A = True
B = False

# Complex (harder to read)
result1 = not (A and B)
print(result1)  # False

# Simplified (easier to read)
result2 = (not A) or (not B)
print(result2)  # False
print(result1 == result2)  # True - they're equivalent!

# Real-world: "Disqualified if NOT (has degree AND has experience)"
has_degree = False
has_experience = True

# Original form
qualified_original = not (has_degree and has_experience)
print(f"Qualified (original): {qualified_original}")

# Simplified form (clearer intent)
qualified_simplified = (not has_degree) or (not has_experience)
print(f"Qualified (simplified): {qualified_simplified}")
# Both print True - person is disqualified because they lack degree
```

### 3.2 When to Use De Morgan's Laws

```python
# ❌ HARD TO READ: Double negation
if not (user == None):
    print("User exists")

# ✅ CLEAR: Simplified
if user is not None:
    print("User exists")

# ❌ CONFUSING: Complex negation
if not (has_permission and is_authenticated):
    print("Access denied")

# ✅ CLEAR: De Morgan's Law applied
if (not has_permission) or (not is_authenticated):
    print("Access denied")

# ✅ EVEN CLEARER: Instead of negating, check for success
if has_permission and is_authenticated:
    print("Access granted")
    return

print("Access denied")
```

### 3.3 Building Truth Tables

```python
def truth_table(title, operation):
    """Display truth table for a boolean operation"""
    print(f"\n{title}")
    print("A\tB\tResult")
    for a in [True, False]:
        for b in [True, False]:
            result = operation(a, b)
            print(f"{str(a):5}\t{str(b):5}\t{str(result):5}")

# Create truth tables
truth_table("A AND B:", lambda a, b: a and b)
truth_table("A OR B:", lambda a, b: a or b)
truth_table("NOT (A AND B):", lambda a, b: not (a and b))
truth_table("(NOT A) OR (NOT B):", lambda a, b: (not a) or (not b))

# Output shows that the last two are identical (De Morgan's Law 1)
```

---

## 4. Short-Circuit Evaluation (60 min)

### 4.1 How Short-Circuiting Works

Python doesn't always evaluate both sides of `and`/`or`. It stops when it knows the answer.

```python
# AND short-circuit: If first is False, result must be False
print("AND short-circuit:")
print(False and expensive_calculation())  # expensive_calculation() NOT called!

# OR short-circuit: If first is True, result must be True
print("OR short-circuit:")
print(True or expensive_calculation())  # expensive_calculation() NOT called!

# Contrast with cases where both are evaluated:
print(True and expensive_calculation())   # expensive_calculation() IS called
print(False or expensive_calculation())   # expensive_calculation() IS called
```

### 4.2 Practical Short-Circuit Usage

```python
# Safe to check existence before accessing
user_list = []
if user_list and user_list[0].name == "Alice":
    print("Found Alice")  # Doesn't run - user_list is empty, so second part not checked

# Getting default value
value = None
result = value or "default"
print(result)  # Output: "default"

# Using short-circuit for early returns
def validate_input(data):
    if not data:  # Short-circuits if data is falsy
        return False
    
    if not data.get('name'):  # Returns False if name missing
        return False
    
    if len(data['name']) < 2:  # Only checked if name exists
        return False
    
    return True

# Efficiency: Process files only if directory exists and has files
import os

directory = "./data"
if os.path.exists(directory) and os.listdir(directory):  # Short-circuits
    for file in os.listdir(directory):
        print(f"Processing {file}")
```

### 4.3 Using Short-Circuit for Conditional Assignment

```python
# Getting first truthy value (useful for defaults)
user_color = None
theme_color = "blue"
default_color = "white"

color = user_color or theme_color or default_color
print(color)  # Output: "blue"

# Checking permission level
def get_permission_required(user_type):
    if user_type == 'admin':
        return 0
    elif user_type == 'moderator':
        return 1
    elif user_type == 'user':
        return 2
    return None

# More efficient with and/or
is_admin = True
is_moderator = False

current_permission = is_admin and 'admin' or is_moderator and 'moderator' or 'user'
print(current_permission)  # Output: 'admin'

# Note: The above pattern is common but modern Python prefers if/elif/else
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.7.1**: Checking Truthiness
```python
# What does this print? Fill in the blanks
value = []
if value:
    print("Truthy")
else:
    print("Falsy")

# Output: ???

# Repeat with these values
print("Empty list:", bool([]))
print("List with item:", bool([0]))
print("Empty string:", bool(""))
print("String '0':", bool("0"))
```

**Exercise 1.1.7.2**: Using `and` Operator
```python
# Check if user can vote
# Requirements: age >= 18 AND is_citizen == True

age = 25
is_citizen = True

if ???:  # Fill in condition
    print("Can vote")
else:
    print("Cannot vote")
```

**Exercise 1.1.7.3**: Using `or` Operator
```python
# Check if person gets student discount
# Condition: age <= 12 OR age >= 65

age = 70

if ???:  # Fill in condition
    print("Student discount applies")
else:
    print("Regular price")
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.7.4**: Combining Operators
```python
# Traffic light logic: Go if (color is green) AND (not pedestrians crossing)

light_color = "green"
pedestrians_crossing = False

if ???:  # Combine conditions
    print("Go")
else:
    print("Stop")
```

**Exercise 1.1.7.5**: De Morgan's Law Practice
```python
# Original condition: NOT (temperature > 30 AND humidity > 80)
# This means: "Uncomfortable if it's BOTH hot AND humid"

temperature = 32
humidity = 75

# Write TWO versions: original form and De Morgan's Law simplified form
# Both should give the same result

# Original form:
if not (temperature > 30 and humidity > 80):
    print("Comfortable")

# Simplified form (using De Morgan's Law):
if ???:
    print("Comfortable")
```

**Exercise 1.1.7.6**: Using Multiple Conditions
```python
# Approve credit card application if:
# - Credit score >= 650
# - AND Income >= 30000
# - AND No recent bankruptcy

credit_score = 720
income = 45000
recent_bankruptcy = False

if ???:
    print("Approved")
else:
    print("Rejected")
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.7.7**: Short-Circuit Evaluation
```python
# Create a program that demonstrates short-circuit evaluation

call_count = 0

def expensive_operation():
    global call_count
    call_count += 1
    return True

# Test 1: AND with False first (short-circuit)
call_count = 0
result1 = False and expensive_operation()
print(f"Test 1 - Function called {call_count} times")  # Should be 0

# Test 2: OR with True first (short-circuit)
call_count = 0
result2 = True or expensive_operation()
print(f"Test 2 - Function called {call_count} times")  # Should be 0

# Test 3: AND with True first (NO short-circuit)
call_count = 0
result3 = True and expensive_operation()
print(f"Test 3 - Function called {call_count} times")  # Should be 1
```

**Exercise 1.1.7.8**: Boolean Algebra Verification
```python
# Verify De Morgan's Laws by testing all truth value combinations

def verify_demorgan_law1():
    """Verify: NOT (A AND B) = (NOT A) OR (NOT B)"""
    for a in [True, False]:
        for b in [True, False]:
            left = not (a and b)
            right = (not a) or (not b)
            match = "✓" if left == right else "✗"
            print(f"A={a}, B={b}: not(A and B)={left}, (not A) or (not B)={right} {match}")

verify_demorgan_law1()
# All should show ✓ if De Morgan's Law is correct
```

**Exercise 1.1.7.9**: Complex Conditional Logic
```python
# Build a comprehensive validation function

def validate_password(password, username):
    """
    Valid password if:
    - At least 8 characters
    - Contains at least one digit
    - Contains at least one uppercase letter
    - Is NOT the same as username
    """
    
    has_length = len(password) >= 8
    has_digit = any(c.isdigit() for c in password)
    has_upper = any(c.isupper() for c in password)
    not_username = password.lower() != username.lower()
    
    # Combine conditions (all must be True)
    is_valid = ???
    
    return is_valid

# Test cases
print(validate_password("MyPass123", "john"))      # Should be True
print(validate_password("pass", "john"))           # Should be False (too short)
print(validate_password("PASSWORD", "john"))       # Should be False (no digit)
print(validate_password("MyPassword", "john"))     # Should be False (no digit)
print(validate_password("MyPassword1", "MyPassword1"))  # Should be False (same as username)
```

---

## Mini-Project: Access Control System

Build a system that determines user access levels based on multiple conditions.

```python
def check_access(user_data):
    """
    Determine access level based on user data
    Access levels: 'admin', 'moderator', 'user', 'guest'
    """
    
    is_authenticated = user_data.get('authenticated', False)
    is_employee = user_data.get('employee', False)
    years_employed = user_data.get('years_employed', 0)
    is_manager = user_data.get('manager', False)
    account_verified = user_data.get('account_verified', False)
    
    # Admin: Must be authenticated employee, manager, with 3+ years
    if is_authenticated and is_employee and is_manager and years_employed >= 3:
        return 'admin'
    
    # Moderator: Authenticated employee with 5+ years OR manager (any tenure)
    elif is_authenticated and is_employee and (years_employed >= 5 or is_manager):
        return 'moderator'
    
    # User: Authenticated and account verified
    elif is_authenticated and account_verified:
        return 'user'
    
    # Guest: Authenticated but not verified, OR just verified
    elif is_authenticated or account_verified:
        return 'guest'
    
    # No access
    else:
        return None

# Test cases
test_users = [
    {
        'name': 'Alice',
        'authenticated': True,
        'employee': True,
        'manager': True,
        'years_employed': 5,
        'account_verified': True
    },
    {
        'name': 'Bob',
        'authenticated': True,
        'employee': True,
        'manager': False,
        'years_employed': 2,
        'account_verified': True
    },
    {
        'name': 'Charlie',
        'authenticated': True,
        'employee': False,
        'manager': False,
        'years_employed': 0,
        'account_verified': True
    },
    {
        'name': 'Diana',
        'authenticated': False,
        'employee': False,
        'manager': False,
        'years_employed': 0,
        'account_verified': False
    },
]

for user in test_users:
    access = check_access(user)
    print(f"{user['name']:8} -> {access}")

# Output:
# Alice    -> admin
# Bob      -> user
# Charlie  -> guest
# Diana    -> None
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **An empty list is falsy in Python.**
   - Answer: True

2. **`not (True and False)` equals `(not True) or (not False)`.**
   - Answer: True (De Morgan's Law)

3. **-5 is falsy because it's negative.**
   - Answer: False

4. **In the expression `False or expensive_function()`, the function is always called.**
   - Answer: False (wrong - it IS called; short-circuit only applies when first value determines answer)

---

### Conceptual Questions

5. **Explain the difference between `is False` and `== False`. When would each be appropriate?**
   - Expected: `is` checks identity (same object), `==` checks equality (same value); `is False` for literal boolean, `== False` for boolean comparison

6. **Why is the expression `if user:` considered more "Pythonic" than `if user != None:`?**
   - Expected: Embraces truthiness principle; more concise; readable for most cases; Python culture accepts implicit truthiness

7. **What is an example of short-circuit evaluation making code more efficient?**
   - Expected: Checking list exists before accessing element; calling function only if condition met; default values with `or`

---

### Coding Challenge

8. **Write a function that returns the appropriate shipping method based on complex conditions:**

   - Standard: weight < 10 lbs, no rush
   - Express: weight < 10 lbs AND rush request
   - Freight: weight >= 10 lbs AND NOT (fragile AND international)
   - Special: fragile AND international (regardless of weight)
   - Blocked: weight > 500 lbs

   ```python
   def determine_shipping(weight, is_rush, is_fragile, is_international):
       """Determine shipping method based on conditions"""
       
       if weight > 500:
           return 'Blocked'
       
       if is_fragile and is_international:
           return 'Special'
       
       if weight >= 10:
           if not (is_fragile and is_international):
               return 'Freight'
       
       if is_rush:
           return 'Express'
       
       return 'Standard'
   
   # Test cases
   print(determine_shipping(5, False, False, False))  # Standard
   print(determine_shipping(5, True, False, False))   # Express
   print(determine_shipping(15, False, False, False)) # Freight
   print(determine_shipping(10, False, True, True))   # Special
   print(determine_shipping(600, False, False, False))  # Blocked
   ```

---

## Key Takeaways

✅ **Every value has truthiness** - Falsy (None, False, 0, '', [], {}) vs truthy (everything else)  
✅ **Boolean operators: `and`, `or`, `not`** - Combine conditions; `and` returns first falsy, `or` returns first truthy  
✅ **De Morgan's Laws simplify expressions** - `not (A and B)` = `(not A) or (not B)`  
✅ **Short-circuit evaluation saves computation** - Python stops evaluating when answer is known  
✅ **Pythonic code embraces truthiness** - Write `if value:` instead of `if value != None:`

---

## Additional Resources

- [Python Documentation: Truth Value Testing](https://docs.python.org/3/library/stdtypes.html#truth-value-testing)
- [De Morgan's Laws Explained](https://en.wikipedia.org/wiki/De_Morgan%27s_laws)
- [Boolean Algebra Basics](https://www.khanacademy.org/computing/computer-science/informatics/info-games/a/boolean-logic)
- [PEP 8: Comparisons to Singletons](https://www.python.org/dev/peps/pep-0008/#comparisons-to-singletons) - Best practices

---

## Next Lesson Preview

**Lesson 1.1.8**: Variable Scope & Reassignment
- Understanding LEGB rule (Local, Enclosing, Global, Built-in)
- Variable shadowing and name conflicts
- Global vs local variables
- Reassignment patterns

---

## Homework

- [ ] Complete Exercises 1.1.7.1 - 1.1.7.9
- [ ] Build and test the Access Control System
- [ ] Create your own complex condition scenarios
- [ ] Challenge: Verify all De Morgan's Laws combinations
- [ ] Quiz: Answer all assessment questions

**Expected time**: 2-3 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.8** when you're ready.
