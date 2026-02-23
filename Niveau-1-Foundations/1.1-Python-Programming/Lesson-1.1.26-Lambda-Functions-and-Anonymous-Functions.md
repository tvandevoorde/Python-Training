# Lesson 1.1.26: Lambda Functions & Anonymous Functions

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.25 (Return Values) | **Topic**: Functions - Lambda Expressions

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Create and use lambda functions
- Understand when to use lambdas vs regular functions
- Use lambdas with map(), filter(), and sorted()
- Apply lambda functions in practical scenarios
- Write clean, readable lambda expressions
- Avoid lambda anti-patterns

---

## 1. Lambda Fundamentals (90 min)

### 1.1 What is a Lambda Function?

```python
# Lambda: Anonymous (unnamed) single-expression function

# Regular function
def add(a, b):
    return a + b

result = add(5, 3)
print(f"Regular: {result}")  # 8

# Lambda equivalent
add_lambda = lambda a, b: a + b
result = add_lambda(5, 3)
print(f"Lambda: {result}")  # 8

# Syntax: lambda parameters: expression
square = lambda x: x ** 2
print(f"Square of 5: {square(5)}")  # 25

# Multiple parameters
multiply = lambda x, y: x * y
print(f"Multiply 4 * 7: {multiply(4, 7)}")  # 28

# No parameters
greet = lambda: "Hello, World!"
print(f"Greet: {greet()}")

# With default parameters
power = lambda x, n=2: x ** n
print(f"5^2: {power(5)}")      # 25
print(f"5^3: {power(5, 3)}")   # 125
```

### 1.2 Why Use Lambdas?

```python
print("=== WHEN TO USE LAMBDAS ===\n")

# Good: Short, one-time function
numbers = [1, 2, 3, 4, 5]

# Convert to list of squares
squares_lambda = list(map(lambda x: x ** 2, numbers))
print(f"Squares: {squares_lambda}")

# Bad: Complex logic needs named function
# ❌ DON'T do this:
# complex = lambda x: x**2 if x % 2 == 0 else -x if x < 10 else x*2

# ✅ DO this instead:
def complex_operation(x):
    """Apply complex logic"""
    if x % 2 == 0:
        return x ** 2
    elif x < 10:
        return -x
    else:
        return x * 2

result = complex_operation(8)
print(f"Complex: {result}")
```

### 1.3 Lambda vs Regular Functions

```python
print("\n=== LAMBDA VS REGULAR ===\n")

# Lambda: Single expression only
get_absolute = lambda x: abs(x)

# Regular: Can have multiple statements
def get_absolute_regular(x):
    value = abs(x)
    print(f"Absolute: {value}")
    return value

print(f"Lambda: {get_absolute(-5)}")
print(f"Regular: {get_absolute_regular(-5)}")

# Lambdas are functions too
print(f"\nLambda type: {type(get_absolute)}")
print(f"Lambda callable: {callable(get_absolute)}")

# Can nesting lambdas (avoid - hard to read!)
nested = lambda x: (lambda y: x + y)
add_5 = nested(5)
result = add_5(3)
print(f"Nested lambda result: {result}")  # 8 (hard to understand)
```

---

## 2. Lambda with Higher-Order Functions (90 min)

### 2.1 Map: Transform Elements

```python
print("=== LAMBDA WITH MAP ===\n")

# map(function, iterable) - Apply function to each element

numbers = [1, 2, 3, 4, 5]

# Convert to list using lambda
doubled = list(map(lambda x: x * 2, numbers))
print(f"Doubled: {doubled}")  # [2, 4, 6, 8, 10]

# Convert temperatures
celsius = [0, 10, 20, 30]
fahrenheit = list(map(lambda c: (c * 9/5) + 32, celsius))
print(f"Celsius: {celsius}")
print(f"Fahrenheit: {fahrenheit}")

# Extract data from list of dicts
users = [
    {'name': 'Alice', 'age': 25},
    {'name': 'Bob', 'age': 30},
    {'name': 'Charlie', 'age': 35}
]

names = list(map(lambda user: user['name'], users))
print(f"\nUser names: {names}")

# Convert strings to integers
string_nums = ['1', '2', '3', '4', '5']
integers = list(map(lambda s: int(s), string_nums))
print(f"Converted: {integers}")

# ✅ Better: Use built-in when possible
integers_better = list(map(int, string_nums))
print(f"Better: {integers_better}")
```

### 2.2 Filter: Select Elements

```python
print("\n=== LAMBDA WITH FILTER ===\n")

# filter(function, iterable) - Keep elements where function=True

numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Get even numbers
evens = list(filter(lambda x: x % 2 == 0, numbers))
print(f"Even numbers: {evens}")  # [2, 4, 6, 8, 10]

# Get numbers greater than 5
greater_than_5 = list(filter(lambda x: x > 5, numbers))
print(f"Greater than 5: {greater_than_5}")

# Filter negative numbers
mixed = [-5, -2, 0, 3, -1, 8, -4]
positive = list(filter(lambda x: x > 0, mixed))
print(f"Positive numbers: {positive}")  # [3, 8]

# Filter strings by length
words = ['a', 'hello', 'hi', 'world', 'code']
long_words = list(filter(lambda w: len(w) > 3, words))
print(f"Words > 3 chars: {long_words}")

# Filter dicts
users = [
    {'name': 'Alice', 'age': 25, 'active': True},
    {'name': 'Bob', 'age': 17, 'active': False},
    {'name': 'Charlie', 'age': 30, 'active': True}
]

adults = list(filter(lambda user: user['age'] >= 18, users))
print(f"\nAdult users: {adults}")

active_users = list(filter(lambda user: user['active'], users))
print(f"Active users: {active_users}")

# ✅ Often better: Use list comprehension
evens_comp = [x for x in numbers if x % 2 == 0]
print(f"\nList comprehension: {evens_comp}")
```

### 2.3 Sorted: Custom Sorting

```python
print("\n=== LAMBDA WITH SORTED ===\n")

# sorted(iterable, key=function) - Sort by custom criteria

# Sort by absolute value
numbers = [-5, 3, -2, 8, -1]
by_absolute = sorted(numbers, key=lambda x: abs(x))
print(f"By absolute value: {by_absolute}")

# Sort by string length
words = ['python', 'code', 'ai', 'function', 'lambda']
by_length = sorted(words, key=lambda w: len(w))
print(f"By length: {by_length}")

# Sort dicts by value
people = [
    {'name': 'Alice', 'age': 25},
    {'name': 'Bob', 'age': 17},
    {'name': 'Charlie', 'age': 30}
]

by_age = sorted(people, key=lambda p: p['age'])
print(f"Sorted by age: {by_age}")

# Sort descending
by_age_desc = sorted(people, key=lambda p: p['age'], reverse=True)
print(f"By age (descending): {by_age_desc}")

# Sort strings case-insensitive
words = ['Python', 'apple', 'Zebra', 'banana']
case_insensitive = sorted(words, key=lambda w: w.lower())
print(f"Case-insensitive: {case_insensitive}")

# Multiple sort criteria
records = [
    {'team': 'A', 'score': 85},
    {'team': 'B', 'score': 90},
    {'team': 'A', 'score': 95},
    {'team': 'B', 'score': 80}
]

# Sort by team, then score
sorted_records = sorted(records, key=lambda r: (r['team'], r['score']))
print(f"\nSorted records: {sorted_records}")
```

---

## 3. Practical Lambda Applications (90 min)

### 3.1 Data Transformation

```python
print("=== DATA TRANSFORMATION ===\n")

# Clean and transform data
raw_data = [' hello ', 'WORLD  ', '  code']

# Strip and lowercase
cleaned = list(map(lambda s: s.strip().lower(), raw_data))
print(f"Cleaned: {cleaned}")

# Extract parts from strings
emails = ['alice@example.com', 'bob@company.org', 'charlie@test.net']

usernames = list(map(lambda e: e.split('@')[0], emails))
print(f"Usernames: {usernames}")

domains = list(map(lambda e: e.split('@')[1], emails))
print(f"Domains: {domains}")

# Convert prices
prices = ['$19.99', '$5.50', '$100.00']
amount = list(map(lambda p: float(p[1:]), prices))
print(f"Prices: {amount}")

# Apply discount
discounted = list(map(lambda p: p * 0.9, amount))
print(f"With 10% discount: {discounted}")
```

### 3.2 Data Validation

```python
print("\n=== DATA VALIDATION ===\n")

# Validate data
numbers = [1, -5, 3, -2, 8, 0, -1]

# Find valid (non-negative)
valid = list(filter(lambda x: x >= 0, numbers))
print(f"Non-negative: {valid}")

# Validate email format (simple)
emails = ['alice@example.com', 'bob@', '@test.com', 'charlie@domain.org']

valid_emails = list(filter(lambda e: '@' in e and '.' in e, emails))
print(f"Valid emails: {valid_emails}")

# Age filter
users = [
    {'name': 'Alice', 'age': 25},
    {'name': 'Bob', 'age': 17},
    {'name': 'Charlie', 'age': 30},
    {'name': 'Diana', 'age': 16}
]

adults = list(filter(lambda u: u['age'] >= 18, users))
print(f"Adults: {adults}")

# Multiple validators
numbers = [5, 10, 15, 20, 25]

# Filter: between 10 and 20, divisible by 5
filtered = list(filter(lambda x: 10 <= x <= 20 and x % 5 == 0, numbers))
print(f"Filtered: {filtered}")
```

### 3.3 Combining Operations

```python
print("\n=== COMBINING OPERATIONS ===\n")

# Chain map and filter operations
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Double each number, then keep only those > 5
result = list(filter(
    lambda x: x > 5,
    map(lambda x: x * 2, numbers)
))
print(f"Doubled and filtered: {result}")

# Read: [2,4,6,8,10,12,14,16,18,20] filtered to [6,8,10,12,14,16,18,20]

# Process and sort
products = [
    {'name': 'Widget', 'price': 19.99, 'stock': 5},
    {'name': 'Gadget', 'price': 49.99, 'stock': 2},
    {'name': 'Doohickey', 'price': 9.99, 'stock': 10}
]

# Get names of items in stock, sorted by price
in_stock = filter(lambda p: p['stock'] > 0, products)
names = map(lambda p: p['name'], in_stock)
result = sorted(names)
print(f"In stock products: {result}")

# ✅ Can chain but keep it readable:
affordable = list(filter(
    lambda p: p['price'] < 30,
    products
))
sorted_by_price = sorted(
    affordable,
    key=lambda p: p['price']
)
for product in sorted_by_price:
    print(f"  {product['name']}: ${product['price']}")
```

---

## 4. Lambda Best Practices & Pitfalls (60 min)

### 4.1 When Not to Use Lambda

```python
print("=== ANTIPATTERNS ===\n")

# ❌ DON'T: Assign lambda to variable then use elsewhere
# This defeats the purpose!

add = lambda x, y: x + y

# Better: Use regular function
def add_func(x, y):
    return x + y

# Even better: Just add directly
result = add_func(5, 3)

# ❌ DON'T: Complex logic in lambda
process = lambda data: (
    sum([x for x in data if x > 0]) / len([x for x in data if x > 0])
    if any(x > 0 for x in data) else 0
)  # Way too complex!

# ✅ DO: Use regular function for complex logic
def calculate_average_positive(data):
    """Calculate average of positive numbers"""
    positives = [x for x in data if x > 0]
    return sum(positives) / len(positives) if positives else 0

result = calculate_average_positive([1, -2, 3, -4, 5])
print(f"Average of positives: {result}")

# ❌ DON'T: Multiple statements in lambda
# This won't even work - lambdas only allow expressions!
# bad = lambda x: (y = x * 2, print(y), return y)

# ✅ DO: Use regular function instead
def process_value(x):
    y = x * 2
    print(f"Doubled: {y}")
    return y
```

### 4.2 Lambda Readability

```python
print("\n=== READABILITY ===\n")

# ❌ HARD TO READ: Dense lambda
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
result = list(filter(lambda x: x % 2 == 0 and x > 3, 
    map(lambda x: x ** 2 if x % 2 == 0 else x, numbers)))

# ✅ READABLE: Break into steps
squared_evens = [x ** 2 if x % 2 == 0 else x for x in numbers]
filtered = [x for x in squared_evens if x % 2 == 0 and x > 3]
print(f"Readable result: {filtered}")

# ✅ ALSO READABLE: List comprehension
result = [
    x ** 2 
    for x in numbers 
    if x % 2 == 0 and x > 3
]
print(f"List comprehension: {result}")

# ❌ CRYPTIC: Lambda with limited variable names
mystery = lambda a, b, c: a[b:c] if len(a) >= c else a[b:]

# ✅ CLEAR: Named function
def get_substring(text, start, end):
    """Extract substring from start to end index"""
    if len(text) >= end:
        return text[start:end]
    return text[start:]
```

### 4.3 Common Lambda Gotchas

```python
print("\n=== GOTCHAS ===\n")

# Gotcha 1: Closure in loop
# ❌ WRONG: All lambdas reference same variable
funcs = []
for i in range(3):
    funcs.append(lambda x: x + i)

# All return the same value!
print(f"Results: {funcs[0](10)}, {funcs[1](10)}, {funcs[2](10)}")
# Output: 12, 12, 12 (not 10, 11, 12!)

# ✅ FIX 1: Use default parameter
funcs = []
for i in range(3):
    funcs.append(lambda x, i=i: x + i)

print(f"Fixed: {funcs[0](10)}, {funcs[1](10)}, {funcs[2](10)}")

# ✅ FIX 2: Use regular function
def make_adder(n):
    def adder(x):
        return x + n
    return adder

funcs = [make_adder(i) for i in range(3)]
print(f"Function: {funcs[0](10)}, {funcs[1](10)}, {funcs[2](10)}")

# Gotcha 2: None vs False
numbers = [0, 1, 2, 3, None, 5]

# Filter out falsy values
result = list(filter(lambda x: x, numbers))
print(f"\nFiltered falsy: {result}")  # [1, 2, 3, 5]

# Filter out None only
result = list(filter(lambda x: x is not None, numbers))
print(f"Filtered None: {result}")  # [0, 1, 2, 3, 5]
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.26.1**: Simple Lambda
```python
square = # Create lambda for x**2
print(square(5))  # 25
```

**Exercise 1.1.26.2**: Lambda with Map
```python
numbers = [1, 2, 3, 4, 5]
doubled = list(map(# Create lambda for x*2, numbers))
print(doubled)  # [2, 4, 6, 8, 10]
```

**Exercise 1.1.26.3**: Lambda with Filter
```python
numbers = [1, 2, 3, 4, 5, 6]
evens = list(filter(# Create lambda for even check, numbers))
print(evens)  # [2, 4, 6]
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.26.4**: Sort with Lambda
```python
students = [
    {'name': 'Alice', 'grade': 85},
    {'name': 'Bob', 'grade': 92},
    {'name': 'Charlie', 'grade': 78}
]
# Sort by grade, highest first
```

**Exercise 1.1.26.5**: Chain Operations
```python
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
# Map to double, then filter > 10
# Result: [12, 14, 16, 18, 20]
```

**Exercise 1.1.26.6**: Transform Data
```python
prices = ['$19.99', '$5.50', '$100.00']
# Extract numbers and apply 10% discount
# Result: [17.991, 4.95, 90.0]
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.26.7**: Complex Filtering
```python
data = [
    {'name': 'Alice', 'age': 25, 'salary': 60000},
    {'name': 'Bob', 'age': 30, 'salary': 75000},
    {'name': 'Charlie', 'age': 28, 'salary': 55000}
]
# Filter age >= 28, extract names
```

**Exercise 1.1.26.8**: Multi-Level Sort
```python
records = [
    {'dept': 'Sales', 'name': 'Alice', 'sales': 1000},
    {'dept': 'IT', 'name': 'Bob', 'sales': 500},
    {'dept': 'Sales', 'name': 'Charlie', 'sales': 1500}
]
# Sort by department, then by sales (descending)
```

**Exercise 1.1.26.9**: Closure in Lambda
```python
# Create function that returns lambda
# Lambda should add a multiplier
def make_multiplier(n):
    return # Your lambda here

times_2 = make_multiplier(2)
times_5 = make_multiplier(5)

print(times_2(10))  # 20
print(times_5(10))  # 50
```

---

## Mini-Project: Data Pipeline

Process real-world data using lambda and higher-order functions.

```python
import json

# Sample data: Student records
students_data = [
    {'id': 1, 'name': 'Alice', 'math': 85, 'english': 90, 'science': 88},
    {'id': 2, 'name': 'Bob', 'math': 92, 'english': 85, 'science': 90},
    {'id': 3, 'name': 'Charlie', 'math': 78, 'english': 82, 'science': 75},
    {'id': 4, 'name': 'Diana', 'math': 95, 'english': 93, 'science': 96},
    {'id': 5, 'name': 'Eve', 'math': 70, 'english': 75, 'science': 72}
]

# 1. Calculate average score for each student
students_with_avg = list(map(
    lambda s: {
        **s,
        'average': (s['math'] + s['english'] + s['science']) / 3
    },
    students_data
))

print("Step 1: Calculate averages")
for s in students_with_avg:
    print(f"  {s['name']}: {s['average']:.1f}")

# 2. Filter high performers (average >= 85)
high_performers = list(filter(
    lambda s: s['average'] >= 85,
    students_with_avg
))

print("\nStep 2: High performers (avg >= 85)")
for s in high_performers:
    print(f"  {s['name']}: {s['average']:.1f}")

# 3. Sort by average descending
top_to_bottom = sorted(
    students_with_avg,
    key=lambda s: s['average'],
    reverse=True
)

print("\nStep 3: Ranking")
for rank, s in enumerate(top_to_bottom, 1):
    print(f"  {rank}. {s['name']}: {s['average']:.1f}")

# 4. Extract names of honor roll students
honor_roll = list(map(
    lambda s: s['name'],
    filter(lambda s: s['average'] >= 90, students_with_avg)
))

print(f"\nStep 4: Honor Roll: {', '.join(honor_roll)}")
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **Lambda functions can contain multiple statements.**
   - Answer: False (single expression only)

2. **You can assign lambda to variable and reuse it.**
   - Answer: True (but defeats purpose)

3. **map() always returns a list.**
   - Answer: False (returns iterator, need list())

4. **Lambda can have default parameters.**
   - Answer: True

---

### Conceptual Questions

5. **Why use lambda instead of regular function?**
   - Expected: Short one-time functions, cleaner code when used with map/filter/sorted

6. **What's the difference between map and filter?**
   - Expected: map transforms elements, filter selects elements

7. **When should you NOT use lambda?**
   - Expected: Complex logic, multiple statements, when you need to reuse often

---

### Coding Challenge

8. **Create data processing pipeline:**
   - Transform prices (remove $, convert to float)
   - Filter prices between 10-100
   - Sort from lowest to highest
   - Apply 15% discount

   ```python
   prices = ['$5.99', '$25.50', '$150', '$75.25', '$15.99']
   
   # Solution uses map, filter, sorted, map
   ```

---

## Key Takeaways

✅ **Lambda: Anonymous single-expression function** - Compact syntax for simple operations  
✅ **map(): Transform data** - Apply function to each element  
✅ **filter(): Select data** - Keep elements where condition is true  
✅ **sorted(): Custom sorting** - Sort by any criteria with key parameter  
✅ **Keep lambdas simple** - If complex, use regular function instead

---

## Additional Resources

- [Lambda Functions](https://docs.python.org/3/tutorial/controlflow.html#lambda-expressions)
- [map(), filter(), reduce()](https://docs.python.org/3/howto/functional.html)
- [Comprehensions vs map/filter](https://realpython.com/list-comprehensions/)

---

## Next Lesson Preview

**Lesson 1.1.27**: Pure Functions & Side Effects
- Pure functions: same input → same output
- Functions with side effects
- Understanding mutability
- Immutability patterns

---

## Homework

- [ ] Complete Exercises 1.1.26.1 - 1.1.26.9
- [ ] Build and test Data Pipeline
- [ ] Create 3 different lambda examples
- [ ] Compare lambda vs list comprehension
- [ ] Quiz: Answer all assessment questions

**Expected time**: 3-4 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.27** when you're ready.
