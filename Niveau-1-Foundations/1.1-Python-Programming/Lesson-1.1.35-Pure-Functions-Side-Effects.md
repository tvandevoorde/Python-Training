# Lesson 1.1.35: Pure Functions & Side Effects

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.1.24-1.1.34 (Functions and recursion)

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Understand what makes a function "pure"
- Identify side effects in code
- Write pure functions
- Understand the benefits of pure functions
- Identify and minimize unwanted side effects
- Compare pure vs impure function approaches
- Apply functional programming principles

---

## 1. What is a Pure Function? (60 min)

### 1.1 Definition

A **pure function** is one that:
1. **Always returns the same output for the same input** (deterministic)
2. **Has no side effects** (doesn't modify external state)
3. **Doesn't depend on mutable external state**

**Example: Pure Function**
```python
# Pure - same input always gives same output
def add(a, b):
    return a + b

print(add(2, 3))  # Output: 5
print(add(2, 3))  # Output: 5 (same result always)
```

**Example: Impure Function**
```python
counter = 0  # External state

# Impure - result depends on external variable
def increment():
    global counter
    counter += 1  # Modifies external state
    return counter

print(increment())  # Output: 1
print(increment())  # Output: 2 (different result!)
```

### 1.2 Pure vs Impure

```python
# PURE FUNCTIONS
def square(x):
    """Pure - no side effects, deterministic"""
    return x * x

def rectangle_area(width, length):
    """Pure - depends only on parameters"""
    return width * length

# IMPURE FUNCTIONS
logged_calls = []

def calculate_tax(price):
    """Impure - has side effect (logs data)"""
    logged_calls.append(price)  # Side effect!
    return price * 0.1

total_output = []

def format_result(value):
    """Impure - modifies external state"""
    total_output.append(value)  # Side effect!
    return f"Result: {value}"
```

---

## 2. Understanding Side Effects (75 min)

### 2.1 Types of Side Effects

```python
# 1. MODIFYING GLOBAL STATE
global_counter = 0

def bad_increment():
    global global_counter
    global_counter += 1  # Side effect: modifies global

# 2. MODIFYING MUTABLE ARGUMENTS
def add_to_list(lst, value):
    lst.append(value)  # Side effect: modifies input list
    # Caller's list is modified!

numbers = [1, 2, 3]
add_to_list(numbers, 4)
print(numbers)  # [1, 2, 3, 4] - modified!

# 3. I/O OPERATIONS
import os

def write_to_file():
    with open("data.txt", "w") as f:
        f.write("data")  # Side effect: I/O
    return "written"

# 4. DATABASE OPERATIONS
def update_database(user_id):
    # db.update(user_id)  # Side effect: database modified
    pass

# 5. PRINTING (visible output)
def print_result(value):
    print(value)  # Side effect: produces visible output
    return value
```

### 2.2 Direct vs Indirect Side Effects

```python
# DIRECT SIDE EFFECT
def direct_side_effect(lst):
    lst.append(10)  # Directly modifies list

# INDIRECT SIDE EFFECT (harder to spot)
def create_default():
    return []

def add_item(lst=None):
    if lst is None:
        lst = create_default()
    
    lst.append(1)
    return lst

# PROBLEM: Default list is created once, reused!
result1 = add_item()      # [1]
result2 = add_item()      # [1, 1] - NOT [1]!
print(result1 is result2) # True - same object!
```

---

## 3. Writing Pure Functions (75 min)

### 3.1 Avoiding State Modification

```python
# IMPURE - modifies list
def bad_double(numbers):
    for i in range(len(numbers)):
        numbers[i] *= 2  # Modifies input!
    return numbers

# PURE - returns new list
def good_double(numbers):
    return [n * 2 for n in numbers]  # Creates new list

numbers = [1, 2, 3]
result1 = good_double(numbers)
print(numbers)  # [1, 2, 3] - unchanged
print(result1)  # [2, 4, 6]
```

### 3.2 Pure String Operations

```python
# IMPURE - relies on external state
user_data = {}

def process_user_bad(name, age):
    user_data[name] = age  # Side effect!
    return f"{name}: {age}"

# PURE - self-contained, no side effects
def process_user_pure(name, age):
    if not name or age < 0:
        raise ValueError("Invalid input")
    return {"name": name, "age": age}

result = process_user_pure("Alice", 30)
print(result)  # {'name': 'Alice', 'age': 30}
```

### 3.3 Pure Dictionary Operations

```python
# IMPURE - modifies dictionary
def add_prefix_bad(config):
    for key in config:
        config[key] = f"PREFIX_{config[key]}"  # Modifies input
    return config

# PURE - returns new dictionary
def add_prefix_good(config):
    return {key: f"PREFIX_{value}" for key, value in config.items()}

original = {"name": "Bob", "role": "admin"}
result = add_prefix_good(original)
print(original)  # {'name': 'Bob', 'role': 'admin'} - unchanged
print(result)    # {'name': 'PREFIX_Bob', 'role': 'PREFIX_admin'}
```

---

## 4. Benefits of Pure Functions (60 min)

### 4.1 Testability

```python
# PURE FUNCTION - easy to test
def calculate_shipping(weight, distance):
    base_rate = 5.0
    per_kg = 0.5
    per_km = 0.1
    return base_rate + (weight * per_kg) + (distance * per_km)

# Test is simple - no setup needed
assert calculate_shipping(10, 100) == 20.0
assert calculate_shipping(0, 0) == 5.0

# IMPURE FUNCTION - hard to test
db_calls = []

def calculate_shipping_bad(user_id, weight):
    db_calls.append(("query", user_id))  # Side effect!
    # query database...
    db_calls.append(("log", "calculating shipping"))
    return weight * 2.5

# Test requires complex setup and teardown
```

### 4.2 Reasoning About Code

```python
# Pure functions are predictable
def pure_total(items):
    """Always same output for same input"""
    return sum(item["price"] for item in items)

# Impure functions are unpredictable
tax_rate = 0.1  # Could change anytime

def impure_total(items):
    """Result depends on global variable"""
    subtotal = sum(item["price"] for item in items)
    return subtotal * (1 + tax_rate)  # tax_rate could be different

items = [{"price": 100}]
print(pure_total(items))    # Always 100
print(impure_total(items))  # Depends on tax_rate
```

### 4.3 Parallelization and Caching

```python
# Pure functions can be cached/memoized safely
from functools import lru_cache

@lru_cache(maxsize=128)
def pure_fibonacci(n):
    if n <= 1:
        return n
    return pure_fibonacci(n-1) + pure_fibonacci(n-2)

# Safe to cache because always returns same result
print(pure_fibonacci(30))  # Fast!

# Impure functions can't be safely cached
cache = {}

def impure_expensive(n):
    if n in cache:
        return cache[n]
    
    # Imagine this makes network call or reads file
    result = n * random_value  # random_value could change!
    cache[n] = result
    return result

# Caching could return stale/wrong data
```

---

## 5. Functional Programming Patterns (75 min)

### 5.1 Map, Filter, Reduce

```python
# Functional approach - using pure functions
numbers = [1, 2, 3, 4, 5]

# MAP - transform each element
doubled = list(map(lambda x: x * 2, numbers))
# or: doubled = [x * 2 for x in numbers]
print(doubled)  # [2, 4, 6, 8, 10]

# FILTER - keep matching elements
evens = list(filter(lambda x: x % 2 == 0, numbers))
# or: evens = [x for x in numbers if x % 2 == 0]
print(evens)    # [2, 4]

# REDUCE - combine to single value
from functools import reduce

product = reduce(lambda x, y: x * y, numbers)
# or: product = 1; for n in numbers: product *= n
print(product)  # 120

# CHAIN operations
result = list(map(lambda x: x * 2, filter(lambda x: x % 2 == 0, numbers)))
print(result)   # [4, 8]
```

### 5.2 Composing Functions

```python
# Compose simple pure functions
def add_ten(x):
    return x + 10

def multiply_by_two(x):
    return x * 2

def subtract_five(x):
    return x - 5

# Chain operations
value = 5
result = subtract_five(multiply_by_two(add_ten(value)))
print(result)  # ((5 + 10) * 2) - 5 = 25

# Create function composition
def compose(f, g):
    """Compose two functions: (f ∘ g)(x) = f(g(x))"""
    return lambda x: f(g(x))

# Build complex operation from simple pieces
add_ten_then_double = compose(multiply_by_two, add_ten)
print(add_ten_then_double(5))  # 30
```

### 5.3 Pipeline Pattern

```python
# Process data through pipeline of pure functions
def pipeline(*functions):
    """Apply functions in sequence"""
    def apply(value):
        for func in functions:
            value = func(value)
        return value
    return apply

# Define pure functions
def strip_whitespace(text):
    return text.strip()

def convert_to_lowercase(text):
    return text.lower()

def remove_punctuation(text):
    return text.replace(".", "").replace("!", "")

# Create pipeline
process_text = pipeline(
    strip_whitespace,
    convert_to_lowercase,
    remove_punctuation
)

result = process_text("  HELLO WORLD!  ")
print(result)  # "hello world"
```

---

## 6. When to Use Impure Functions (45 min)

### 6.1 Necessary I/O Operations

```python
# I/O is inherently impure - use it when needed
def read_config(filename):
    """Must have side effect (I/O)"""
    with open(filename) as f:
        return json.load(f)

def save_results(data, filename):
    """Must have side effect (I/O)"""
    with open(filename, "w") as f:
        json.dump(data, f)

# But separate I/O from logic:
def process_data(raw_data):  # Pure
    """Does actual work, no I/O"""
    return [x * 2 for x in raw_data]

# Use together:
raw = read_config("input.json")      # Impure
processed = process_data(raw)         # Pure
save_results(processed, "output.json") # Impure
```

### 6.2 Structured Side Effects

```python
# Use context managers for safe I/O
import contextlib

@contextlib.contextmanager
def managed_resource():
    """Setup and teardown side effect safely"""
    resource = allocate_resource()
    try:
        yield resource
    finally:
        release_resource(resource)

# Usage
with managed_resource() as res:
    process(res)  # Safe cleanup guaranteed
```

---

## 7. Mini-Project: Data Processing Pipeline

```python
from functools import reduce

# Pure functions
def filter_valid_records(records):
    """Only keep records with valid data"""
    return [r for r in records if r.get("age") and r.get("name")]

def add_age_group(record):
    """Add computed field"""
    age = record["age"]
    group = "adult" if age >= 18 else "minor"
    return {**record, "age_group": group}

def calculate_summary(records):
    """Compute statistics"""
    if not records:
        return None
    
    avg_age = sum(r["age"] for r in records) / len(records)
    return {
        "count": len(records),
        "avg_age": avg_age,
        "groups": list(set(r["age_group"] for r in records))
    }

# Unpure I/O functions
def load_data(filename):
    """Load from file"""
    import json
    with open(filename) as f:
        return json.load(f)

def save_results(results, filename):
    """Save to file"""
    import json
    with open(filename, "w") as f:
        json.dump(results, f, indent=2)

# Pipeline
def process_user_data(input_file, output_file):
    # Load (impure)
    raw_data = load_data(input_file)
    
    # Process (pure)
    valid = filter_valid_records(raw_data)
    enriched = [add_age_group(r) for r in valid]
    summary = calculate_summary(enriched)
    
    # Save (impure)
    save_results({
        "processed": enriched,
        "summary": summary
    }, output_file)

# Usage
process_user_data("users.json", "results.json")
```

---

## 8. Graded Exercises

### Starter Exercises (40 minutes)

**Starter 1: Identify Pure**
```python
# TODO: Which are pure? Why or why not?

def add(a, b):
    return a + b

def add_with_logging(a, b):
    print(f"Adding {a} + {b}")
    return a + b

def get_random_number():
    import random
    return random.randint(1, 100)
```

**Starter 2: Make Pure**
```python
# TODO: Rewrite to be pure (no side effects)

user_list = []

def add_user(name, age):
    user_list.append({"name": name, "age": age})
    return user_list
```

### Intermediate Exercises (60 minutes)

**Intermediate 1: Pure Function Composition**
```python
# TODO: Create pure functions and compose them
# add(x) -> multiply(x) -> subtract(x)
```

**Intermediate 2: Data Pipeline**
```python
# TODO: Build pipeline for:
# 1. Filter invalid records
# 2. Transform data
# 3. Calculate results
```

### Advanced Exercises (90 minutes)

**Advanced 1: Monadic Operations**
```python
# TODO: Implement safe operations with Maybe/Option pattern
# Handle None values without side effects
```

---

## 9. Self-Assessment Checklist

- [ ] I understand what makes a function pure
- [ ] I can identify side effects in code
- [ ] I can write pure functions
- [ ] I understand benefits of pure functions
- [ ] I can use map, filter, reduce
- [ ] I can compose functions together

---

## 10. Assessment Questions

**True/False:**
1. A pure function can't use any external variables
2. Printing to console is a side effect
3. Pure functions are always faster than impure ones

**Coding:**
1. Write a pure version of a given impure function
2. Identify all side effects in provided code
3. Create function composition

---

## 11. Additional Resources

- Functional programming concepts
- Immutability benefits
- Higher-order functions
- Next Lesson: Lesson 1.1.36 - Debugging Functions

---

**Next Lesson:** Lesson 1.1.36 - Debugging Functions
