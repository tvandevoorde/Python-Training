# Lesson 1.1.27: Pure Functions & Side Effects

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.26 (Lambda Functions) | **Topic**: Functions - Purity & Effects

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Understand pure functions and their benefits
- Identify side effects in code
- Distinguish between pure and impure functions
- Write pure functions where possible
- Manage side effects responsibly
- Apply functional programming principles

---

## 1. Pure Functions Explained (90 min)

### 1.1 What is a Pure Function?

```python
# Pure function: Same input ALWAYS produces same output, no side effects

# ✅ PURE: Output depends only on input
def add(a, b):
    """Always returns same result for same inputs"""
    return a + b

result1 = add(5, 3)  # 8
result2 = add(5, 3)  # 8 (always 8)
print(f"Pure function: {result1} == {result2}: {result1 == result2}")

# ✅ PURE: Multiple calls, same result
def square(x):
    """Square a number"""
    return x * x

print(f"square(4) = {square(4)}")  # 16
print(f"square(4) = {square(4)}")  # 16 (always 16)

# ❌ IMPURE: Depends on external state
import random

counter = 0

def increment_and_random():
    """Mixes pure and impure"""
    global counter
    counter += 1  # Side effect!
    return counter + random.randint(1, 10)  # Non-deterministic!

result1 = increment_and_random()
result2 = increment_and_random()
print(f"\nImpure: {result1} != {result2}")  # Likely different each time
```

### 1.2 Benefits of Pure Functions

```python
print("=== BENEFITS OF PURE FUNCTIONS ===\n")

# ✅ Testable
def calculate_discount(price, discount_rate):
    """Pure: Same input always gives same output"""
    return price * (1 - discount_rate)

# Easy to test!
assert calculate_discount(100, 0.1) == 90
assert calculate_discount(50, 0.2) == 40
print("Discount function tests pass!")

# ✅ Reusable
def get_total_price(items, discount_rate):
    """Reusable pure function"""
    subtotal = sum(items)
    return calculate_discount(subtotal, discount_rate)

items = [10, 20, 30]
total = get_total_price(items, 0.1)
print(f"Total with discount: ${total}")

# ✅ Composable (combine functions)
def apply_tax(amount, tax_rate):
    """Another pure function"""
    return amount * (1 + tax_rate)

def final_price(items, discount_rate, tax_rate):
    """Compose pure functions"""
    discounted = get_total_price(items, discount_rate)
    with_tax = apply_tax(discounted, tax_rate)
    return with_tax

final = final_price([100, 200], 0.1, 0.08)
print(f"Final price: ${final:.2f}")

# ✅ Cacheable/Memoizable
def expensive_calculation(n):
    """Pure function - can cache results"""
    return sum(i ** 2 for i in range(n))

cache = {}

def memoized_calculation(n):
    """Cache results of expensive calculation"""
    if n not in cache:
        cache[n] = expensive_calculation(n)
    return cache[n]

print(f"\nFirst call: {memoized_calculation(1000)}")
print(f"Second call (cached): {memoized_calculation(1000)}")
```

### 1.3 Pure vs Impure

```python
print("\n=== PURE VS IMPURE ===\n")

# ❌ IMPURE: Modifies external data
user_db = {'alice': {'name': 'Alice', 'email': 'alice@example.com'}}

def update_user_email_bad(user_id, new_email):
    """Modifies external database"""
    user_db[user_id]['email'] = new_email  # Mutation!
    return user_db[user_id]

result = update_user_email_bad('alice', 'newemail@example.com')
print(f"After mutation: {user_db['alice']['email']}")

# ✅ PURE: Returns new data without modifying
def update_user_email(user, new_email):
    """Returns new user dict, doesn't modify original"""
    return {**user, 'email': new_email}

original = {'name': 'Alice', 'email': 'alice@example.com'}
updated = update_user_email(original, 'newemail@example.com')

print(f"Original: {original['email']}")  # unchanged
print(f"Updated: {updated['email']}")    # changed

# ❌ IMPURE: Reads external state
from datetime import datetime

def get_greeting_impure(name):
    """Depends on current time"""
    hour = datetime.now().hour
    if hour < 12:
        return f"Good morning, {name}!"
    else:
        return f"Good afternoon, {name}!"

# Different results at different times!

# ✅ PURE: Takes time as parameter
def get_greeting(name, hour):
    """No dependency on external state"""
    if hour < 12:
        return f"Good morning, {name}!"
    else:
        return f"Good afternoon, {name}!"

print(f"\nMorning: {get_greeting('Alice', 8)}")
print(f"Afternoon: {get_greeting('Alice', 14)}")
```

---

## 2. Side Effects (90 min)

### 2.1 Understanding Side Effects

```python
print("=== SIDE EFFECTS ===\n")

# Side effect: Function changes something outside itself

# ❌ SIDE EFFECT: Print statement
def add_with_print(a, b):
    """Has side effect: printing"""
    print(f"Adding {a} + {b}")  # Side effect!
    return a + b

result = add_with_print(5, 3)

# ❌ SIDE EFFECT: Modifying parameter
def double_list(items):
    """Modifies input list"""
    for i in range(len(items)):
        items[i] *= 2  # Mutation!
    return items

nums = [1, 2, 3]
result = double_list(nums)
print(f"Original modified: {nums}")  # [2, 4, 6] - oops!

# ✅ NO SIDE EFFECT: Return new data
def double_list_pure(items):
    """Returns new list"""
    return [x * 2 for x in items]

nums = [1, 2, 3]
result = double_list_pure(nums)
print(f"Original unchanged: {nums}")  # [1, 2, 3]
print(f"Result: {result}")            # [2, 4, 6]

# Common side effects
# 1. Modifying mutable arguments
# 2. Modifying global variables
# 3. Writing to files
# 4. Writing to databases
# 5. Making network requests
# 6. Printing to console
# 7. Throwing exceptions
```

### 2.2 Managing Mutable Arguments

```python
print("\n=== MUTABLE ARGUMENTS ===\n")

# ❌ PROBLEM: Modifying list argument
def add_item_bad(items, item):
    """Modifies original list"""
    items.append(item)
    return items

my_list = [1, 2, 3]
add_item_bad(my_list, 4)
print(f"Original changed: {my_list}")  # [1, 2, 3, 4]

# ✅ SOLUTION 1: Copy the data
def add_item_copy(items, item):
    """Works on copy"""
    new_items = items.copy()  # Make copy
    new_items.append(item)
    return new_items

my_list = [1, 2, 3]
result = add_item_copy(my_list, 4)
print(f"Original preserved: {my_list}")  # [1, 2, 3]
print(f"Result: {result}")               # [1, 2, 3, 4]

# ✅ SOLUTION 2: Slice notation (for sequences)
def add_item_slice(items, item):
    """Using slice to copy"""
    return items[:] + [item]

my_list = [1, 2, 3]
result = add_item_slice(my_list, 4)
print(f"Original: {my_list}")  # [1, 2, 3]
print(f"Result: {result}")     # [1, 2, 3, 4]

# ✅ SOLUTION 3: List comprehension
def add_item_comprehension(items, item):
    """Using comprehension"""
    return [x for x in items] + [item]

# ❌ PROBLEM: Modifying dict argument
def update_user_bad(user, email):
    """Modifies original dict"""
    user['email'] = email
    return user

user = {'name': 'Alice', 'email': 'old@example.com'}
update_user_bad(user, 'new@example.com')
print(f"\nOriginal dict modified: {user}")

# ✅ SOLUTION: Dict unpacking
def update_user(user, email):
    """Returns new dict"""
    return {**user, 'email': email}

user = {'name': 'Alice', 'email': 'old@example.com'}
updated = update_user(user, 'new@example.com')
print(f"Original: {user}")      # unchanged
print(f"Updated: {updated}")    # changed
```

### 2.3 When Side Effects Are Necessary

```python
print("\n=== ACCEPTABLE SIDE EFFECTS ===\n")

# Some side effects are necessary and acceptable

# ✅ Logging (controlled side effect)
def process_payment(amount):
    """Process payment with logging"""
    print(f"[LOG] Processing payment: ${amount}")  # Acceptable side effect
    
    # Pure calculation
    fee = amount * 0.03
    total = amount + fee
    
    print(f"[LOG] Total with fee: ${total}")  # Acceptable side effect
    return total

total = process_payment(100)

# ✅ File I/O (necessary side effect)
def save_config(config, filename):
    """Save config to file"""
    with open(filename, 'w') as f:  # Side effect: writes file
        f.write(str(config))
    return True

config = {'setting': 'value'}
# save_config(config, 'config.txt')

# ✅ Database operations (necessary side effect)
def insert_user(user_data):
    """Insert user to database"""
    # db.insert('users', user_data)  # Would be side effect
    print(f"[DB] Inserting user: {user_data}")
    return True

insert_user({'name': 'Alice', 'email': 'alice@example.com'})

# Pattern: Separate pure logic from side effects
def calculate_total(items, tax_rate):
    """Pure: only calculation"""
    return sum(items) * (1 + tax_rate)

def process_order(items, tax_rate):
    """Orchestrates: side effects + pure logic"""
    total = calculate_total(items, tax_rate)
    print(f"[LOG] Order total: ${total}")  # Side effect
    # save_to_database(...)  # Side effect
    return total

process_order([100, 200, 150], 0.08)
```

---

## 3. Immutability Patterns (90 min)

### 3.1 Immutable Data

```python
print("=== IMMUTABILITY ===\n")

# Immutable: Can't be changed after creation

# ✅ Immutable: Strings
text = "hello"
# text[0] = 'H'  # ❌ Can't modify strings
new_text = text.upper()  # Returns new string
print(f"Original: {text}")
print(f"New: {new_text}")

# ✅ Immutable: Tuples
coordinates = (10, 20)
# coordinates[0] = 15  # ❌ Can't modify tuples
new_coords = (coordinates[0] + 5, coordinates[1])
print(f"Original coords: {coordinates}")
print(f"Modified: {new_coords}")

# ❌ Mutable: Lists
items = [1, 2, 3]
items[0] = 10  # ✅ Can modify
print(f"Modified list: {items}")

# ❌ Mutable: Dicts
config = {'theme': 'light'}
config['theme'] = 'dark'  # ✅ Can modify
print(f"Modified dict: {config}")
```

### 3.2 Creating Immutable Versions

```python
print("\n=== IMMUTABLE PATTERNS ===\n")

# Pattern: Tuple instead of list for fixed data
def create_point(x, y):
    """Return immutable point"""
    return (x, y)  # Tuple, not list

point = create_point(10, 20)
print(f"Point: {point}")

# Pattern: Named tuple for clarity
from collections import namedtuple

Point = namedtuple('Point', ['x', 'y'])
p = Point(10, 20)
print(f"Named tuple: x={p.x}, y={p.y}")

# Pattern: Dataclass with frozen=True
from dataclasses import dataclass

@dataclass(frozen=True)
class Color:
    """Immutable color"""
    red: int
    green: int
    blue: int

color = Color(255, 128, 0)
print(f"Color: RGB({color.red}, {color.green}, {color.blue})")
# color.red = 200  # ❌ Would raise error

# Pattern: NamedTuple for more control
from typing import NamedTuple

class Person(NamedTuple):
    """Immutable person"""
    name: str
    age: int

person = Person("Alice", 25)
print(f"Person: {person.name}, {person.age}")
```

### 3.3 Functional Patterns

```python
print("\n=== FUNCTIONAL PATTERNS ===\n")

# Instead of modifying data, transform it

# ❌ IMPERATIVE: Modify in place
def remove_duplicates_bad(items):
    """Modifies original"""
    seen = set()
    i = 0
    while i < len(items):
        if items[i] in seen:
            items.pop(i)
        else:
            seen.add(items[i])
            i += 1
    return items

# ✅ FUNCTIONAL: Return new list
def remove_duplicates(items):
    """Return new list without modifying original"""
    seen = set()
    result = []
    for item in items:
        if item not in seen:
            result.append(item)
            seen.add(item)
    return result

# ✅ EVEN BETTER: Dict ordering (Python 3.7+)
def remove_duplicates_dict(items):
    """Using dict to preserve order"""
    return list(dict.fromkeys(items))

nums = [1, 2, 2, 3, 3, 3, 4]
print(f"Original: {nums}")
print(f"Deduplicated: {remove_duplicates(nums)}")
print(f"Original unchanged: {nums}")

# Functional: Map, filter, reduce
from functools import reduce

def sum_of_evens(numbers):
    """Functional approach"""
    evens = filter(lambda x: x % 2 == 0, numbers)
    result = reduce(lambda a, b: a + b, evens, 0)
    return result

nums = [1, 2, 3, 4, 5, 6]
total = sum_of_evens(nums)
print(f"\nSum of evens: {total}")
```

---

## 4. Testing Pure Functions (60 min)

### 4.1 Testing Pure Functions

```python
print("=== TESTING PURE FUNCTIONS ===\n")

# Pure functions are easy to test!

def celsius_to_fahrenheit(celsius):
    """Convert temperature"""
    return (celsius * 9/5) + 32

# ✅ Easy to test
assert celsius_to_fahrenheit(0) == 32
assert celsius_to_fahrenheit(100) == 212
assert celsius_to_fahrenheit(-40) == -40
print("Temperature conversion tests pass!")

def calculate_grade(score):
    """Return letter grade"""
    if score >= 90:
        return 'A'
    elif score >= 80:
        return 'B'
    elif score >= 70:
        return 'C'
    else:
        return 'F'

# Comprehensive tests
test_cases = [
    (95, 'A'),
    (85, 'B'),
    (75, 'C'),
    (65, 'F'),
    (100, 'A'),
    (70, 'C')
]

for score, expected_grade in test_cases:
    result = calculate_grade(score)
    assert result == expected_grade
    print(f"Score {score} -> {result} ✓")
```

### 4.2 Unit Testing

```python
# Use testing framework
import unittest

def add(a, b):
    """Addition function"""
    return a + b

def multiply(a, b):
    """Multiplication function"""
    return a * b

class TestMathFunctions(unittest.TestCase):
    """Test suite for math functions"""
    
    def test_add_positive(self):
        """Test adding positive numbers"""
        self.assertEqual(add(2, 3), 5)
        self.assertEqual(add(10, 20), 30)
    
    def test_add_negative(self):
        """Test adding with negative numbers"""
        self.assertEqual(add(-5, 3), -2)
        self.assertEqual(add(-5, -3), -8)
    
    def test_multiply(self):
        """Test multiplication"""
        self.assertEqual(multiply(3, 4), 12)
        self.assertEqual(multiply(-2, 5), -10)

# Run tests
if __name__ == '__main__':
    unittest.main(argv=[''], exit=False, verbosity=2)
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.27.1**: Identify Pure Function
```python
def is_pure(x):
    return x ** 2

def is_impure(x):
    print(x)
    return x ** 2

# Which is pure? Why?
```

**Exercise 1.1.27.2**: Mutable vs Immutable
```python
names = ['Alice', 'Bob']
# Is this list mutable? 
# Show how to add 'Charlie' without modifying original
```

**Exercise 1.1.27.3**: Side Effects
```python
# List 5 examples of side effects in functions
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.27.4**: Make Pure
```python
global_count = 0

def increment():
    global global_count
    global_count += 1
    return global_count

# Rewrite without global variable
```

**Exercise 1.1.27.5**: Immutable Data
```python
user = {'name': 'Alice', 'age': 25}
# Create updated user without modifying original
updated = # Your solution
```

**Exercise 1.1.27.6**: Copy vs Modify
```python
def process_list(items):
    # Currently modifies original
    items.sort()
    return items

# Rewrite to not modify original
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.27.7**: Pure Function Design
```python
# Design pure function version of:
def calculate_total_bad(items):
    print(f"Calculating total of {len(items)} items")
    total = sum(items)
    with open('log.txt', 'a') as f:
        f.write(f"Total: {total}\n")
    return total
```

**Exercise 1.1.27.8**: Testing Pure Functions
```python
def calculate_discount(price, discount_percent):
    return price * (1 - discount_percent / 100)

# Write 5 comprehensive tests
```

**Exercise 1.1.27.9**: Functional Composition
```python
# Create pure functions:
# - apply_tax(amount, rate)
# - apply_discount(amount, rate)  
# - chain them: price -> discount -> tax
```

---

## Mini-Project: Calculator with Pure Functions

Build a calculator using pure functions with no side effects.

```python
def add(a, b):
    """Pure addition"""
    return a + b

def subtract(a, b):
    """Pure subtraction"""
    return a - b

def multiply(a, b):
    """Pure multiplication"""
    return a * b

def divide(a, b):
    """Pure division with error handling"""
    if b == 0:
        return None
    return a / b

def calculate(a, b, operation):
    """Pure: Routes to correct operation"""
    operations = {
        '+': add,
        '-': subtract,
        '*': multiply,
        '/': divide
    }
    
    if operation not in operations:
        return None
    
    return operations[operation](a, b)

def format_result(result):
    """Pure: Format output"""
    if result is None:
        return "Error"
    return f"Result: {result:.2f}"

# Usage
result = calculate(100, 0.08, '+')
print(format_result(result))

result = calculate(100, 0, '/')
print(format_result(result))

# Test: Same input always gives same output
assert calculate(5, 3, '+') == 8
assert calculate(5, 3, '+') == 8
assert calculate(5, 3, '+') == 8
print("\nAll tests pass! Pure function confirmed.")
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **Pure functions must return a value.**
   - Answer: False (can return None)

2. **Modifying global variable is a side effect.**
   - Answer: True

3. **Tuples are immutable, lists are mutable.**
   - Answer: True

4. **All functions should be pure.**
   - Answer: False (some side effects necessary)

---

### Conceptual Questions

5. **What makes a function pure?**
   - Expected: Same input always produces same output, no side effects

6. **Why are pure functions easier to test?**
   - Expected: Predictable, no external dependencies, repeatable results

7. **Give 2 examples of necessary side effects.**
   - Expected: File I/O, database operations, printing, network requests

---

### Coding Challenge

8. **Create temperature converter:**
   - Pure function: celsius_to_fahrenheit(c)
   - Test: Same celsius always gives same fahrenheit
   - Return immutable tuple: (original, converted)

---

## Key Takeaways

✅ **Pure functions: Same input = Same output** - No side effects  
✅ **Side effects: Changes outside function scope** - Logging, files, databases  
✅ **Immutable data: Can't be changed** - Safer, easier to reason about  
✅ **Test pure functions easily** - Predictable, repeatable  
✅ **Separate concerns** - Keep pure logic separate from side effects

---

## Additional Resources

- [Pure Functions](https://en.wikipedia.org/wiki/Pure_function)
- [Functional Programming](https://docs.python.org/3/howto/functional.html)
- [Immutability in Python](https://realpython.com/python-data-structures/)

---

## Next Lesson Preview

**Lesson 1.1.28**: Recursion Fundamentals
- What is recursion?
- Base case and recursive case
- Stack overflow and limits
- Practical recursion examples

---

## Homework

- [ ] Complete Exercises 1.1.27.1 - 1.1.27.9
- [ ] Build and test Pure Calculator
- [ ] Write 3 pure functions
- [ ] Identify side effects in code
- [ ] Quiz: Answer all assessment questions

**Expected time**: 3-4 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.28** when you're ready.




