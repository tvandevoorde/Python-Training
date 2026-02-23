# Lesson 1.1.44: Dictionary Comprehensions

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.1.41 and 1.1.43 (Dictionaries)

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Create dictionaries efficiently using comprehensions
- Transform existing dictionaries
- Filter dictionary data
- Invert and swap dictionary keys/values
- Combine multiple data sources into dictionaries
- Use conditional comprehensions
- Create nested dictionary structures

---

## 1. Dictionary Comprehension Basics (75 min)

### 1.1 Simple Comprehensions

```python
# Basic syntax: {key_expr: value_expr for item in iterable}

# Create from list
numbers = [1, 2, 3, 4, 5]
squares = {n: n**2 for n in numbers}
print(squares)  # {1: 1, 2: 4, 3: 9, 4: 16, 5: 25}

# Create from range
powers_of_2 = {n: 2**n for n in range(5)}
print(powers_of_2)  # {0: 1, 1: 2, 2: 4, 3: 8, 4: 16}

# Create from string
letters = "abc"
index_map = {char: i for i, char in enumerate(letters)}
print(index_map)  # {'a': 0, 'b': 1, 'c': 2}
```

### 1.2 Comprehensions vs Loops

```python
# Traditional approach
result_dict = {}
for num in range(1, 6):
    result_dict[num] = num ** 2

# Comprehension - cleaner and faster
result_comp = {num: num**2 for num in range(1, 6)}

print(result_dict == result_comp)  # True

# Performance: Comprehensions are typically faster
import timeit

# Measure loop version
loop_time = timeit.timeit('''
result = {}
for num in range(1000):
    result[num] = num ** 2
''', number=10000)

# Measure comprehension
comp_time = timeit.timeit('''
result = {num: num**2 for num in range(1000)}
''', number=10000)

print(f"Loop: {loop_time:.4f}s, Comprehension: {comp_time:.4f}s")
# Comprehension is typically faster
```

---

## 2. Transformation Comprehensions (75 min)

### 2.1 Transforming Values

```python
# Multiply all values
prices = {"apple": 1.5, "banana": 0.75, "cherry": 2.0}
sales = {item: price * 0.8 for item, price in prices.items()}
print(sales)  # {'apple': 1.2, 'banana': 0.6, 'cherry': 1.6}

# Convert string values to numbers
data = {"age": "25", "height": "180", "weight": "75"}
converted = {key: int(value) for key, value in data.items()}
print(converted)  # {'age': 25, 'height': 180, 'weight': 75}

# Apply function to values
values = {"a": 1, "b": 2, "c": 3}
squared = {k: v**2 for k, v in values.items()}
print(squared)  # {'a': 1, 'b': 4, 'c': 9}
```

### 2.2 Transforming Keys

```python
# Make keys uppercase
config = {"host": "localhost", "port": 8080}
upper_config = {k.upper(): v for k, v in config.items()}
print(upper_config)  # {'HOST': 'localhost', 'PORT': 8080}

# Add prefix to keys
add_prefix = {"api_" + k: v for k, v in config.items()}
print(add_prefix)  # {'api_host': 'localhost', 'api_port': 8080}

# Remove prefix from keys
prefixed = {"user_name": "Alice", "user_age": 30}
unprefixed = {k.replace("user_", ""): v for k, v in prefixed.items()}
print(unprefixed)  # {'name': 'Alice', 'age': 30}
```

### 2.3 Transform Both Keys and Values

```python
# Create reverse mapping while applying transformations
person = {"name": "ALICE", "age": 30}
transformed = {k.upper(): str(v).lower() for k, v in person.items()}
print(transformed)

# Combine key-value into new structure
items = {"shirt": 20, "pants": 50}
inventory = {f"item_{k}": v * 100 for k, v in items.items()}
print(inventory)  # {'item_shirt': 2000, 'item_pants': 5000}
```

---

## 3. Filtering Comprehensions (75 min)

### 3.1 Simple Filtering

```python
# Keep items meeting condition
numbers = {n: n**2 for n in range(10)}
evens = {k: v for k, v in numbers.items() if k % 2 == 0}
print(evens)  # {0: 0, 2: 4, 4: 16, 6: 36, 8: 64}

# Filter by value
scores = {"Alice": 90, "Bob": 75, "Carol": 88}
passing = {name: score for name, score in scores.items() if score >= 80}
print(passing)  # {'Alice': 90, 'Carol': 88}

# Filter with multiple conditions
data = {i: i**2 for i in range(20) 
        if i > 2 and i < 10 and i % 2 == 0}
print(data)  # {4: 16, 6: 36, 8: 64}
```

### 3.2 Conditional Values

```python
# Use ternary operator in value expression
ages = {"Alice": 25, "Bob": 17, "Carol": 30}
status = {name: "Adult" if age >= 18 else "Minor" 
          for name, age in ages.items()}
print(status)  # {'Alice': 'Adult', 'Bob': 'Minor', 'Carol': 'Adult'}

# Multi-level conditional
scores = {"A": 95, "B": 78, "C": 85}
grades = {name: "Excellent" if s >= 90 else "Good" if s >= 80 else "Pass"
          for name, s in scores.items()}
print(grades)  # {'A': 'Excellent', 'B': 'Pass', 'C': 'Good'}
```

### 3.3 Filter and Transform

```python
# Keep selected items and transform
users = {"alice": 30, "bob": 25, "charlie": 35}
adult_names = {k.upper(): f"{v} years old" 
               for k, v in users.items() if v >= 30}
print(adult_names)  # {'ALICE': '30 years old', 'CHARLIE': '35 years old'}
```

---

## 4. Inverting and Swapping (60 min)

### 4.1 Swap Keys and Values

```python
# Simple inversion
original = {"a": 1, "b": 2, "c": 3}
inverted = {v: k for k, v in original.items()}
print(inverted)  # {1: 'a', 2: 'b', 3: 'c'}

# Problem: duplicate values
student_ids = {"Alice": 101, "Bob": 102, "Carol": 101}  # Carol and Alice same ID
inverted = {v: k for k, v in student_ids.items()}
print(inverted)  # {101: 'Carol', 102: 'Bob'} - Alice lost!

# Solution: handle duplicates
def invert_safe(d):
    inverted = {}
    for k, v in d.items():
        if v not in inverted:
            inverted[v] = []
        inverted[v].append(k)
    return inverted

result = invert_safe(student_ids)
print(result)  # {101: ['Alice', 'Carol'], 102: ['Bob']}
```

### 4.2 Group By Value

```python
# Group items by category
items = {"apple": "fruit", "carrot": "vegetable", "banana": "fruit"}
grouped = {}
for item, category in items.items():
    if category not in grouped:
        grouped[category] = []
    grouped[category].append(item)

print(grouped)
# {'fruit': ['apple', 'banana'], 'vegetable': ['carrot']}

# Functional approach
from itertools import groupby
items_sorted = sorted(items.items(), key=lambda x: x[1])
grouped_func = {k: [item for item, _ in group]
                for k, group in groupby(items_sorted, key=lambda x: x[1])}
```

---

## 5. Advanced Comprehensions (75 min)

### 5.1 Nested Dictionary Comprehensions

```python
# Create nested dictionary
matrix_dict = {i: {j: i*j for j in range(1, 4)} for i in range(1, 4)}
print(matrix_dict)
# {1: {1: 1, 2: 2, 3: 3}, 2: {1: 2, 2: 4, 3: 6}, 3: {1: 3, 2: 6, 3: 9}}

# Access nested values
print(matrix_dict[2][3])  # 6
```

### 5.2 Dictionary from Multiple Iterables

```python
# Combine two lists into dictionary
names = ["Alice", "Bob", "Carol"]
ages = [30, 25, 28]
people = {name: age for name, age in zip(names, ages)}
print(people)  # {'Alice': 30, 'Bob': 25, 'Carol': 28}

# From three sources
subjects = ["Math", "Science", "English"]
scores = [90, 85, 88]
teachers = ["Smith", "Jones", "Brown"]

courses = {subject: {"scores": score, "teacher": teacher}
           for subject, score, teacher in zip(subjects, scores, teachers)}
print(courses)
# {'Math': {'scores': 90, 'teacher': 'Smith'}, ...}
```

### 5.3 Flattening and Restructuring

```python
# Flatten nested structure
nested = {"group1": [1, 2, 3], "group2": [4, 5]}
flattened = {k: v for group in nested.values() for k, v in enumerate(group, 1)}
print(flattened)  # {1: 1, 2: 2, 3: 3, 4: 4, 5: 5}

# Restructure from list of dicts
records = [
    {"id": 1, "name": "Alice"},
    {"id": 2, "name": "Bob"},
    {"id": 3, "name": "Carol"}
]
by_id = {record["id"]: record["name"] for record in records}
print(by_id)  # {1: 'Alice', 2: 'Bob', 3: 'Carol'}
```

---

## 6. Mini-Project: Data Aggregator

```python
# Aggregate sales data
sales = [
    {"region": "North", "product": "A", "amount": 100},
    {"region": "North", "product": "B", "amount": 150},
    {"region": "South", "product": "A", "amount": 200},
    {"region": "South", "product": "B", "amount": 120},
]

# Sum by region
by_region = {}
for sale in sales:
    region = sale["region"]
    by_region[region] = by_region.get(region, 0) + sale["amount"]

print(by_region)  # {'North': 250, 'South': 320}

# Using comprehension - more concise for complex structures
by_product = {product: sum(s["amount"] for s in sales 
                           if s["product"] == product)
              for product in set(s["product"] for s in sales)}
print(by_product)  # {'A': 300, 'B': 270}
```

---

## 7. Graded Exercises

### Starter Exercises (40 minutes)

**Starter 1: Basic Comprehension**
```python
# TODO: Create dict with squares
```

**Starter 2: Filter Values**
```python
# TODO: Keep only items over 100
```

### Intermediate Exercises (60 minutes)

**Intermediate 1: Transform Keys**
```python
# TODO: Make all keys uppercase
```

**Intermediate 2: Invert Dictionary**
```python
# TODO: Swap keys and values
```

### Advanced Exercises (90 minutes)

**Advanced 1: Nested Comprehension**
```python
# TODO: Create nested structure
```

---

## 8. Self-Assessment Checklist

- [ ] I can write basic dictionary comprehensions
- [ ] I can filter in comprehensions
- [ ] I can transform keys and values
- [ ] I can invert dictionaries
- [ ] I can create nested dictionaries

---

## 9. Assessment Questions

**Coding:**
1. Create dict of squares for numbers 1-10
2. Filter dict keeping only values > 50
3. Invert a dictionary

---

## 10. Additional Resources

- Dictionary comprehension patterns
- Performance comparison
- Next Lesson: Lesson 1.1.45 - Sets & Set Operations

---

**Next Lesson:** Lesson 1.1.45 - Sets & Set Operations
