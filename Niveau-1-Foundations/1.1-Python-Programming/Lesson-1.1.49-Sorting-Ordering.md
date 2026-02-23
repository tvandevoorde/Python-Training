# Lesson 1.1.48: Sorting & Ordering

**Estimated Time**: 8 hours | **Difficulty**: Advanced  
**Prerequisites**: Lessons 1.1.39-1.1.47 (Collections and data structures)

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Sort lists using sorted() and .sort()
- Sort complex data structures
- Create custom sort keys
- Sort dictionaries and other iterables
- Understand sorting algorithms
- Optimize sorting performance
- Handle edge cases in sorting

---

## 1. Basic Sorting (75 min)

### 1.1 Sorted() Function

```python
# Return new sorted list
numbers = [3, 1, 4, 1, 5, 9, 2, 6]
sorted_nums = sorted(numbers)
print(sorted_nums)    # [1, 1, 2, 3, 4, 5, 6, 9]
print(numbers)        # [3, 1, 4, 1, 5, 9, 2, 6] - unchanged

# Sort strings
words = ["zebra", "apple", "mango", "banana"]
sorted_words = sorted(words)
print(sorted_words)   # ['apple', 'banana', 'mango', 'zebra']

# Reverse sort
reverse = sorted(numbers, reverse=True)
print(reverse)        # [9, 6, 5, 4, 3, 2, 1, 1]

# Case-insensitive string sort
names = ["Alice", "bob", "CHARLIE"]
sorted_names = sorted(names, key=str.lower)
print(sorted_names)   # ['Alice', 'bob', 'CHARLIE']
```

### 1.2 List.sort() Method

```python
# Modifies list in place
numbers = [3, 1, 4, 1, 5, 9]
numbers.sort()
print(numbers)        # [1, 1, 3, 4, 5, 9]

# Reverse sort
numbers.sort(reverse=True)
print(numbers)        # [9, 5, 4, 3, 1, 1]

# Performance: .sort() is faster than sorted() for in-place operations
import timeit

list1 = list(range(1000, 0, -1))
list2 = list(range(1000, 0, -1))

sort_method = timeit.timeit(lambda: (l := list1.copy(), l.sort())[0], number=1000)
sorted_func = timeit.timeit(lambda: sorted(list2), number=1000)

print(f"list.sort(): {sort_method:.4f}s")
print(f"sorted(): {sorted_func:.4f}s")
# list.sort() is typically faster
```

### 1.3 Sorting with Key Functions

```python
# Sort by length
words = ["apple", "cat", "elephant", "dog"]
by_length = sorted(words, key=len)
print(by_length)  # ['cat', 'dog', 'apple', 'elephant']

# Sort by absolute value
numbers = [-5, 3, -1, -8, 2]
by_abs_value = sorted(numbers, key=abs)
print(by_abs_value)  # [-1, 2, 3, -5, -8]

# Sort by custom attribute
class Student:
    def __init__(self, name, grade):
        self.name = name
        self.grade = grade

students = [
    Student("Alice", 85),
    Student("Bob", 92),
    Student("Carol", 78)
]

by_grade = sorted(students, key=lambda s: s.grade)
for s in by_grade:
    print(f"{s.name}: {s.grade}")
```

---

## 2. Sorting Complex Data (75 min)

### 2.1 Sorting Lists of Tuples

```python
# Sort by first element (default)
data = [(3, "apple"), (1, "zebra"), (2, "mango")]
sorted_data = sorted(data)
print(sorted_data)  # [(1, 'zebra'), (2, 'mango'), (3, 'apple')]

# Sort by second element
sorted_by_word = sorted(data, key=lambda x: x[1])
print(sorted_by_word)  # [(3, 'apple'), (2, 'mango'), (1, 'zebra')]

# Sort by multiple criteria (primary then secondary)
scores = [
    (85, "Alice"),
    (90, "Bob"),
    (85, "Carol")
]

# Sort by score (desc), then by name (asc)
sorted_scores = sorted(scores, key=lambda x: (-x[0], x[1]))
for score, name in sorted_scores:
    print(f"{name}: {score}")
```

### 2.2 Sorting Lists of Dictionaries

```python
# Sort by dictionary value
users = [
    {"name": "Alice", "age": 30},
    {"name": "Bob", "age": 25},
    {"name": "Carol", "age": 28}
]

by_age = sorted(users, key=lambda u: u["age"])
for user in by_age:
    print(f"{user['name']}: {user['age']}")

# Sort by nested value
data = [
    {"id": 1, "stats": {"score": 85}},
    {"id": 2, "stats": {"score": 92}},
    {"id": 3, "stats": {"score": 78}}
]

by_score = sorted(data, key=lambda x: x["stats"]["score"])
```

### 2.3 Sorting Dictionaries

```python
person = {"name": "Alice", "age": 30, "email": "alice@example.com"}

# Sort by keys
sorted_dict = dict(sorted(person.items()))
print(sorted_dict)

# Sort by values
by_value = dict(sorted(person.items(), key=lambda x: x[1], reverse=True))
print(by_value)

# Sort dictionary items (get list of tuples)
items = sorted(person.items())
print(items)  # [('age', 30), ('email', '...'), ('name', 'Alice')]
```

---

## 3. Custom Sort Keys (75 min)

### 3.1 Lambda vs Named Functions

```python
# Lambda - for simple sorts
numbers = [3, 1, 4, 1, 5]
sorted_nums = sorted(numbers, key=lambda x: x**2)

# Named function - for complex logic
def sort_by_complexity(x):
    # Example: sort strings by length, then alphabetically
    return (len(x), x)

words = ["apple", "cat", "dog", "banana"]
result = sorted(words, key=sort_by_complexity)
print(result)  # ['cat', 'dog', 'apple', 'banana']

# Functions better for complex logic
def name_sort_key(user):
    first, last = user["name"].split()
    return (last, first)  # Sort by last name, then first

users = [
    {"name": "Alice Smith"},
    {"name": "Bob Jones"},
    {"name": "Carol Smith"}
]

by_name = sorted(users, key=name_sort_key)
```

### 3.2 Using operator.itemgetter()

```python
import operator

# Sort by dictionary key (faster than lambda for simple lookups)
users = [
    {"name": "Alice", "age": 30},
    {"name": "Bob", "age": 25},
    {"name": "Carol", "age": 28}
]

# These are equivalent
by_age_lambda = sorted(users, key=lambda u: u["age"])
by_age_itemgetter = sorted(users, key=operator.itemgetter("age"))

# itemgetter can handle multiple keys
by_multiple = sorted(users, key=operator.itemgetter("age", "name"))

# Also works with index (tuples/lists)
data = [(3, "apple"), (1, "zebra"), (2, "mango")]
by_second = sorted(data, key=operator.itemgetter(1))
```

### 3.3 Multi-level Sorting

```python
# Sort by multiple criteria with priorities
students = [
    {"name": "Alice", "grade": 10, "score": 85},
    {"name": "Bob", "grade": 10, "score": 92},
    {"name": "Carol", "grade": 9, "score": 88}
]

# Sort by grade (asc), then score (desc)
sorted_students = sorted(
    students,
    key=lambda s: (s["grade"], -s["score"])
)

for s in sorted_students:
    print(f"{s['name']}: Grade {s['grade']}, Score {s['score']}")
```

---

## 4. Sorting Algorithms and Performance (60 min)

### 4.1 Understanding Timsort (Python's Algorithm)

```python
# Python uses Timsort internally
# Efficient for real-world data:
# - Fast for sorted/partially sorted data
# - Good worst-case performance O(n log n)
# - Stable (preserves relative order of equal elements)

numbers = [1, 2, 3, 4, 2, 5, 3, 6]

# Stable sort: equal elements keep their relative order
sorted_numbers = sorted(numbers)
print(sorted_numbers)  # [1, 2, 2, 3, 3, 4, 5, 6]

# Example with records
records = [
    (1, "Apple"),
    (2, "Banana"),
    (1, "Apricot"),
    (2, "Blueberry")
]

sorted_by_first = sorted(records, key=lambda x: x[0])
# (1, "Apple") comes before (1, "Apricot") - stable!
```

### 4.2 Time Complexity

```python
"""
Algorithm | Best Case | Average Case | Worst Case | Memory | Stable
──────────┼───────────┼──────────────┼────────────┼────────┼────────
Timsort   | O(n)      | O(n log n)   | O(n log n) | O(n)   | Yes
Quicksort | O(n log n)| O(n log n)   | O(n²)      | O(1)   | No
Mergesort | O(n log n)| O(n log n)   | O(n log n) | O(n)   | Yes
Heapsort  | O(n log n)| O(n log n)   | O(n log n) | O(1)   | No
"""

# For lists, use Python's built-in sorted() or list.sort()
# They're optimized and hard to beat

import timeit

data = list(range(1000, 0, -1))

# Using .sort()
time1 = timeit.timeit(
    lambda: (l := data.copy(), l.sort())[0],
    number=1000
)

# Using sorted()
time2 = timeit.timeit(
    lambda: sorted(data),
    number=1000
)

print(f"list.sort(): {time1:.4f}s")
print(f"sorted(): {time2:.4f}s")
# Both are fast for typical sizes
```

---

## 5. Special Cases (45 min)

### 5.1 Sorting with None Values

```python
# Problem: None values cause errors
data = [3, None, 1, 2, None]

# Wrong:
# sorted(data)  # TypeError

# Solution: Use key with conditional
sorted_data = sorted(data, key=lambda x: (x is None, x))
print(sorted_data)  # [1, 2, 3, None, None]

# Or use object-specific sorting
sorted_data2 = sorted(
    [x for x in data if x is not None]
) + [x for x in data if x is None]
```

### 5.2 Case-Insensitive String Sorting

```python
words = ["Apple", "banana", "CHERRY", "date"]

# Lowercase during sort
sorted_case_insensitive = sorted(words, key=str.lower)
print(sorted_case_insensitive)  # ['Apple', 'banana', 'CHERRY', 'date']

# But keep original casing
```

### 5.3 Natural Sorting (Alphanumeric)

```python
# Normal sort: "file10" comes before "file2"
file_names = ["file2", "file10", "file1", "file20"]
print(sorted(file_names))  # ['file1', 'file10', 'file2', 'file20']

# Natural sort: "file2" comes before "file10"
import re

def natural_sort_key(text):
    return [int(c) if c.isdigit() else c.lower() for c in re.split('(\d+)', text)]

natural_sorted = sorted(file_names, key=natural_sort_key)
print(natural_sorted)  # ['file1', 'file2', 'file10', 'file20']
```

---

## 6. Mini-Project: Data Sorter

```python
class DataSorter:
    def __init__(self, data):
        self.data = data
    
    def sort_by_field(self, field, reverse=False):
        """Sort by specific field"""
        return sorted(self.data, key=lambda x: x[field], reverse=reverse)
    
    def sort_by_multiple(self, fields):
        """Sort by multiple fields"""
        def multi_key(item):
            return tuple(item.get(f, "") for f in fields)
        return sorted(self.data, key=multi_key)
    
    def sort_by_custom(self, key_func, reverse=False):
        """Sort with custom function"""
        return sorted(self.data, key=key_func, reverse=reverse)

# Usage
employees = [
    {"name": "Alice", "dept": "HR", "salary": 60000},
    {"name": "Bob", "dept": "IT", "salary": 75000},
    {"name": "Carol", "dept": "HR", "salary": 65000}
]

sorter = DataSorter(employees)

# Sort by department, then by salary (descending)
result = sorter.sort_by_multiple(["dept"])
print(result)

# Sort by custom logic
by_salary = sorter.sort_by_custom(
    lambda x: x["salary"],
    reverse=True
)
```

---

## 7. Graded Exercises

### Starter Exercises (40 minutes)

**Starter 1: Basic Sorting**
```python
# TODO: Sort list of numbers
```

**Starter 2: Sort by Key**
```python
# TODO: Sort strings by length
```

### Intermediate Exercises (60 minutes)

**Intermediate 1: Sort Dictionaries**
```python
# TODO: Sort list of dicts by field
```

**Intermediate 2: Multi-level Sort**
```python
# TODO: Sort by multiple criteria
```

### Advanced Exercises (90 minutes)

**Advanced 1: Custom Sort*
```python
# TODO: Implement natural sort
```

---

## 8. Self-Assessment Checklist

- [ ] I can use sorted() and .sort()
- [ ] I understand sort keys
- [ ] I can sort complex structures
- [ ] I understand stable sorting
- [ ] I know performance characteristics

---

## 9. Additional Resources

- Sorting algorithms
- Big O analysis
- Next Lesson: Lesson 1.1.49 - Mini-Project: Data Organizer

---

**Next Lesson:** Lesson 1.1.49 - Mini-Project: Data Organizer
