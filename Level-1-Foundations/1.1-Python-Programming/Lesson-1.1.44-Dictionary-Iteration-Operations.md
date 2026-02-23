# Lesson 1.1.43: Dictionary Iteration & Operations

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.41 (Dictionaries Fundamentals)

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Iterate through dictionaries in multiple ways
- Modify dictionary contents efficiently
- Use dictionary methods effectively
- Merge and combine dictionaries
- Process dictionary key-value pairs
- Sort dictionaries
- Understand dictionary views

---

## 1. Iterating Through Dictionaries (75 min)

### 1.1 Basic Iteration

```python
user = {"name": "Alice", "age": 30, "city": "NYC"}

# Iterate through keys (default)
for key in user:
    print(key)  # name, age, city

# Iterate through values
for value in user.values():
    print(value)  # Alice, 30, NYC

# Iterate through key-value pairs
for key, value in user.items():
    print(f"{key}: {value}")
    # name: Alice
    # age: 30
    # city: NYC
```

### 1.2 Using keys(), values(), items()

```python
config = {"host": "localhost", "port": 8080}

# Get all keys
keys_list = list(config.keys())
print(keys_list)  # ['host', 'port']

# Get all values
values_list = list(config.values())
print(values_list)  # ['localhost', 8080]

# Get key-value pairs
items_list = list(config.items())
print(items_list)  # [('host', 'localhost'), ('port', 8080)]

# Check membership
print("host" in config.keys())      # True
print("localhost" in config.values())  # True
```

### 1.3 Conditional Iteration

```python
student = {"math": 90, "english": 85, "science": 92}

# Get keys above threshold
good_grades = [subject for subject, grade in student.items() if grade >= 90]
print(good_grades)  # ['math', 'science']

# Sum all values
total_score = sum(student.values())
print(total_score)  # 267

# Filter and transform
letter_grades = {subj: 'A' if grade >= 90 else 'B' 
                 for subj, grade in student.items()}
```

---

## 2. Modifying Dictionaries (75 min)

### 2.1 Basic Modifications

```python
person = {"name": "Bob", "age": 25}

# Add key-value pair
person["email"] = "bob@example.com"

# Update existing value
person["age"] = 26

# Update multiple values
person.update({"city": "Boston", "age": 27})

# Remove key-value pair
del person["email"]
removed_value = person.pop("city")

# Clear all items
# person.clear()

print(person)  # {'name': 'Bob', 'age': 27}
```

### 2.2 Safe Updates with setdefault()

```python
# Get value or set default if not exists
config = {}

# Check and set
host = config.setdefault("host", "localhost")
print(host)      # localhost
print(config)    # {'host': 'localhost'}

# Already exists - returns existing value
port = config.setdefault("host", "127.0.0.1")
print(port)      # localhost (not changed)

# Useful for accumulating values
word_count = {}
for word in ["apple", "banana", "apple", "cherry"]:
    word_count.setdefault(word, 0)
    word_count[word] += 1

print(word_count)  # {'apple': 2, 'banana': 1, 'cherry': 1}
```

### 2.3 Using update() with Different Sources

```python
dict1 = {"a": 1, "b": 2}

# Update with another dict
dict2 = {"c": 3, "b": 20}
dict1.update(dict2)
print(dict1)  # {'a': 1, 'b': 20, 'c': 3}

# Update with list of tuples
dict3 = {}
dict3.update([("x", 10), ("y", 20)])
print(dict3)  # {'x': 10, 'y': 20}

# Update with keyword arguments
dict4 = {}
dict4.update(host="localhost", port=8080)
print(dict4)  # {'host': 'localhost', 'port': 8080}
```

---

## 3. Dictionary Methods (75 min)

### 3.1 Key Methods

```python
data = {"a": 1, "b": 2, "c": 3}

# get() - safe access
value = data.get("a")      # 1
value = data.get("z")      # None (no KeyError)
value = data.get("z", 0)   # 0 (default value)

# pop() - remove and return
removed = data.pop("b")     # 2
# value = data.pop("z")    # KeyError!
value = data.pop("z", None)  # None (safe)

# popitem() - remove last (arbitrary) item
key, value = data.popitem()
# Removes one key-value pair
```

### 3.2 Existence Checks

```python
person = {"name": "Alice", "age": 30}

# Check if key exists
if "name" in person:
    print(person["name"])

# Check if value exists
if 30 in person.values():
    print("Age 30 found")

# Get with default instead of checking
email = person.get("email", "no-email@example.com")
```

### 3.3 Copy Operations

```python
original = {"a": 1, "b": 2}

# Shallow copy
copy1 = original.copy()

# Update original
original["a"] = 99

print(original)  # {'a': 99, 'b': 2}
print(copy1)     # {'a': 1, 'b': 2} - unchanged

# Deep copy for nested dicts
import copy
nested = {"data": {"x": 1}}
shallow = nested.copy()
deep = copy.deepcopy(nested)

nested["data"]["x"] = 99
print(shallow)  # {'data': {'x': 99}} - affected!
print(deep)     # {'data': {'x': 1}} - not affected
```

---

## 4. Dictionary Comprehensions (60 min)

### 4.1 Creating Dictionaries

```python
# Create from list
numbers = [1, 2, 3, 4, 5]
squares = {n: n**2 for n in numbers}
print(squares)  # {1: 1, 2: 4, 3: 9, 4: 16, 5: 25}

# Create with enumerate
words = ["apple", "banana", "cherry"]
indexed = {i: word for i, word in enumerate(words)}
print(indexed)  # {0: 'apple', 1: 'banana', 2: 'cherry'}

# Conditional creation
filtered = {n: n**2 for n in range(10) if n % 2 == 0}
print(filtered)  # {0: 0, 2: 4, 4: 16, 6: 36, 8: 64}
```

### 4.2 Transforming Dictionaries

```python
original = {"a": 1, "b": 2, "c": 3}

# Transform values
doubled_values = {k: v * 2 for k, v in original.items()}
print(doubled_values)  # {'a': 2, 'b': 4, 'c': 6}

# Transform keys
upper_keys = {k.upper(): v for k, v in original.items()}
print(upper_keys)  # {'A': 1, 'B': 2, 'C': 3}

# Swap keys and values
swapped = {v: k for k, v in original.items()}
print(swapped)  # {1: 'a', 2: 'b', 3: 'c'}
```

---

## 5. Sorting Dictionaries (60 min)

### 5.1 Sort by Keys and Values

```python
person = {"alice": 30, "bob": 25, "charlie": 35}

# Sort by keys
sorted_by_keys = dict(sorted(person.items()))
print(sorted_by_keys)  # {'alice': 30, 'bob': 25, 'charlie': 35}

# Sort by values
sorted_by_values = dict(sorted(person.items(), key=lambda x: x[1]))
print(sorted_by_values)  # {'bob': 25, 'alice': 30, 'charlie': 35}

# Reverse sort
sorted_desc = dict(sorted(person.items(), key=lambda x: x[1], reverse=True))
print(sorted_desc)  # {'charlie': 35, 'alice': 30, 'bob': 25}
```

### 5.2 Custom Sorting

```python
data = {"john": 85, "alice": 92, "bob": 78, "carol": 88}

# Sort by value, then by name for ties
def sort_key(item):
    name, score = item
    return (-score, name)  # Negative for reverse score, alpha name

sorted_data = dict(sorted(data.items(), key=sort_key))
print(sorted_data)  # Sort by score desc, then name asc
```

---

## 6. Merging and Combining (60 min)

### 6.1 Merging Dictionaries

```python
dict1 = {"a": 1, "b": 2}
dict2 = {"c": 3, "d": 4}

# Method 1: update()
merged1 = dict1.copy()
merged1.update(dict2)
print(merged1)  # {'a': 1, 'b': 2, 'c': 3, 'd': 4}

# Method 2: ** unpacking (Python 3.5+)
merged2 = {**dict1, **dict2}
print(merged2)  # {'a': 1, 'b': 2, 'c': 3, 'd': 4}

# Method 3: | operator (Python 3.9+)
merged3 = dict1 | dict2
print(merged3)  # {'a': 1, 'b': 2, 'c': 3, 'd': 4}
```

### 6.2 Merging with Conflict Resolution

```python
dict1 = {"a": 1, "b": 2}
dict2 = {"b": 20, "c": 3}

# Keep first dict values for conflicts
result = {**dict1, **dict2}  # dict2 overwrites dict1
print(result)  # {'a': 1, 'b': 20, 'c': 3}

# Custom merge function
def merge_dicts(d1, d2, conflict_fn=None):
    result = d1.copy()
    for key, value in d2.items():
        if key in result and conflict_fn:
            result[key] = conflict_fn(result[key], value)
        else:
            result[key] = value
    return result

# Keep maximum value for conflicts
merged = merge_dicts(dict1, dict2, max)
print(merged)  # {'a': 1, 'b': 20, 'c': 3}

# Sum values for conflicts
merged2 = merge_dicts(
    {"a": 1, "b": 2},
    {"b": 3, "c": 4},
    lambda x, y: x + y
)
print(merged2)  # {'a': 1, 'b': 5, 'c': 4}
```

---

## 7. Mini-Project: Word Frequency Counter

```python
def count_words(text):
    """Count frequency of each word"""
    words = text.lower().split()
    word_count = {}
    
    for word in words:
        word_count[word] = word_count.get(word, 0) + 1
    
    return word_count

def get_top_words(word_count, n=5):
    """Get top n most frequent words"""
    sorted_words = sorted(
        word_count.items(),
        key=lambda x: x[1],
        reverse=True
    )
    return sorted_words[:n]

# Usage
text = "python python is powerful python is elegant python"
counts = count_words(text)
print(counts)  # {'python': 4, 'is': 2, 'powerful': 1, 'elegant': 1}

top = get_top_words(counts, 2)
print(top)  # [('python', 4), ('is', 2)]
```

---

## 8. Graded Exercises

### Starter Exercises (40 minutes)

**Starter 1: Iterate Dictionary**
```python
# TODO: Iterate and print key-value pairs
data = {"name": "Alice", "age": 30}
```

**Starter 2: Update Dictionary**
```python
# TODO: Add new key-value and update existing
```

### Intermediate Exercises (60 minutes)

**Intermediate 1: Merge Dictionaries**
```python
# TODO: Merge two dictionaries with conflict handling
```

**Intermediate 2: Sort Dictionary**
```python
# TODO: Sort by values, display top 3
```

### Advanced Exercises (90 minutes)

**Advanced 1: Build Frequency Counter**
```python
# TODO: Count word frequencies from text
```

---

## 9. Self-Assessment Checklist

- [ ] I can iterate through dictionaries
- [ ] I understand keys(), values(), items()
- [ ] I can modify dictionaries safely
- [ ] I can use dictionary comprehensions
- [ ] I can merge dictionaries

---

## 10. Additional Resources

- Dictionary methods
- Sorting techniques
- Next Lesson: Lesson 1.1.44 - Dictionary Comprehensions

---

**Next Lesson:** Lesson 1.1.44 - Dictionary Comprehensions




