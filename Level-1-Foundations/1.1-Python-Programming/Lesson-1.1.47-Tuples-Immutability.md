# Lesson 1.1.46: Tuples & Immutability

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.1.39-1.1.45 (Collections fundamentals)

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Understand tuple immutability
- Create and use tuples
- Compare tuples with mutable alternatives
- Use tuples effectively in code
- Understand when to use tuples
- Unpack tuple values
- Use tuples as dictionary keys
- Recognize tuple performance benefits

---

## 1. What are Tuples? (75 min)

### 1.1 Immutable Sequences

```python
# Tuple: ordered collection that cannot be modified
coordinates = (10, 20)
print(type(coordinates))  # <class 'tuple'>

# Create tuples (parentheses optional for 2+ elements)
tuple1 = (1, 2, 3)
tuple2 = (1, 2)
single_element = (42,)  # Comma required for single element!
empty = ()

# Access like lists
print(tuple1[0])    # 1
print(tuple1[-1])   # 3
print(tuple1[1:])   # (2, 3)

# But cannot modify
# tuple1[0] = 100   # TypeError: 'tuple' object does not support item assignment
```

### 1.2 Creating Tuples

```python
# Explicit tuple creation
explicit = (1, 2, 3, 4, 5)

# Convert from list
from_list = tuple([1, 2, 3])

# Convert from string
from_string = tuple("hello")  # ('h', 'e', 'l', 'l', 'o')

# From range
from_range = tuple(range(5))  # (0, 1, 2, 3, 4)

# Empty tuple
empty = tuple()

# with unpacking
a, b, c = 1, 2, 3  # Tuple unpacking creates tuple
data = 1, 2, 3      # Implicit tuple
print(type(data))   # <class 'tuple'>
```

---

## 2. Tuple Operations (75 min)

### 2.1 Reading and Iteration

```python
person = ("Alice", 30, "NYC")

# Access by index
name = person[0]        # "Alice"
age = person[1]         # 30
city = person[2]        # "NYC"

# Negative indexing
last = person[-1]       # "NYC"

# Slicing
first_two = person[:2]  # ("Alice", 30)

# Length and membership
print(len(person))       # 3
print("Alice" in person) # True

# Iteration
for item in person:
    print(item)

# Enumeration
for i, item in enumerate(person):
    print(f"{i}: {item}")
```

### 2.2 Tuple Methods

```python
numbers = (1, 2, 3, 2, 4, 2)

# Count occurrences
count_2s = numbers.count(2)  # 3

# Find index of first occurrence
index = numbers.index(2)     # 1

# Length
length = len(numbers)        # 6

# Min/max
minimum = min(numbers)       # 1
maximum = max(numbers)       # 4

# Sum
total = sum(numbers)         # 14
```

### 2.3 Unpacking

```python
# Simple unpacking
point = (10, 20)
x, y = point
print(x, y)  # 10 20

# With function returns
def get_coordinates():
    return (100, 200)

a, b = get_coordinates()
print(a, b)  # 100 200

# Unpacking with * (rest of values)
data = (1, 2, 3, 4, 5)
first, *middle, last = data
print(first, middle, last)  # 1 [2, 3, 4] 5

# Ignore values with _
person = ("Alice", 30, "NYC", "Engineer")
name, _, city, _ = person
print(name, city)  # Alice NYC
```

---

## 3. Immutability Advantages (75 min)

### 3.1 Tuples as Dictionary Keys

```python
# Can't use lists as keys
# coords_dict = {[1, 2]: "origin"}  # TypeError

# But can use tuples
coords_dict = {
    (0, 0): "Origin",
    (1, 0): "East",
    (0, 1): "North",
    (-1, 0): "West",
    (0, -1): "South"
}

print(coords_dict[(1, 0)])  # "East"

# Practical use: caching
cache = {}

def expensive_calculation(x, y):
    key = (x, y)  # Tuple as cache key
    if key in cache:
        return cache[key]
    
    result = x ** 2 + y ** 2
    cache[key] = result
    return result

print(expensive_calculation(3, 4))  # 25
print(expensive_calculation(3, 4))  # From cache
```

### 3.2 Set Membership with Tuples

```python
# Can't use lists in sets
# unique = {[1, 2], [3, 4]}  # TypeError

# But can use tuples
unique = {(1, 2), (3, 4), (5, 6)}
print((3, 4) in unique)  # True

# Useful for storing coordinates, RGB colors, etc.
colors = {
    (255, 0, 0),    # Red
    (0, 255, 0),    # Green
    (0, 0, 255)     # Blue
}

print((0, 255, 0) in colors)  # True
```

### 3.3 Using Tuples for Safety

```python
# Function expects immutable data
def process_data(data):
    """Function that shouldn't modify input"""
    # If data is tuple, I know it won't be changed
    total = sum(data)
    return total / len(data)

numbers = (10, 20, 30)
result = process_data(numbers)
print(result)  # 20.0

# If someone passes list, they might worry about modification
numbers_list = [10, 20, 30]
result = process_data(numbers_list)
# Even though we don't modify it, immutability is clearer with tuple
```

---

## 4. Tuples vs Lists: Comparison (60 min)

### 4.1 When to Use Each

```python
# Use TUPLES for:

# 1. Fixed data that shouldn't change
RGB = (255, 128, 0)  # Orange color - fixed

# 2. Dictionary keys or set elements
cache = {(1, 2): "value"}
coords_set = {(0, 0), (1, 1)}

# 3. Returning multiple values
def get_user():
    return ("Alice", 30, "NYC")  # Clear it's fixed

# 4. Protecting from accidental modification
VALID_STATUS = ("pending", "approved", "rejected")
if status in VALID_STATUS:
    process(status)

# Use LISTS for:

# 1. Data that changes
shopping_list = ["milk", "bread", "eggs"]
shopping_list.append("cheese")

# 2. When you need index modifications
numbers = [1, 2, 3, 4, 5]
numbers[2] = 30  # Can change individual elements

# 3. When you need list methods (sort, reverse, etc.)
data = [3, 1, 4, 1, 5, 9]
data.sort()  # Can sort in place
```

### 4.2 Performance Comparison

```python
import timeit

# Tuple creation is faster
tuple_create = timeit.timeit('t = (1, 2, 3)', number=1000000)
list_create = timeit.timeit('l = [1, 2, 3]', number=1000000)

print(f"Tuple: {tuple_create:.4f}s, List: {list_create:.4f}s")
# Tuples are typically 10-20% faster to create

# Tuple unpacking is faster
tuple_unpack = timeit.timeit('x, y, z = (1, 2, 3)', number=1000000)
list_unpack = timeit.timeit('x, y, z = [1, 2, 3]', number=1000000)

# Tuples don't support operations like append
# So they're more memory efficient (immutable)
```

---

## 5. Named Tuples (60 min)

### 5.1 Introduction to namedtuple

```python
from collections import namedtuple

# Define a named tuple
Point = namedtuple('Point', ['x', 'y'])

# Create instances
point1 = Point(10, 20)
point2 = Point(x=30, y=40)

# Access by index
print(point1[0], point1[1])  # 10 20

# Access by name (more readable!)
print(point1.x, point1.y)    # 10 20

# Useful attributes
print(point1._fields)        # ('x', 'y')
print(point1._asdict())      # OrderedDict([('x', 10), ('y', 20)])
```

### 5.2 Real-World namedtuple Usage

```python
from collections import namedtuple

# Define structured data
Student = namedtuple('Student', ['name', 'id', 'gpa'])

students = [
    Student("Alice", 101, 3.8),
    Student("Bob", 102, 3.5),
    Student("Carol", 103, 3.9)
]

# Access by name (clearer than tuple indexing)
for student in students:
    print(f"{student.name}: {student.gpa}")

# Sort by specific field
high_achievers = sorted(students, key=lambda s: s.gpa, reverse=True)
for student in high_achievers[:2]:
    print(f"{student.name}: {student.gpa}")
```

---

## 6. Mini-Project: Game Inventory

```python
from collections import namedtuple

Item = namedtuple('Item', ['name', 'quantity', 'weight'])

class Inventory:
    def __init__(self, max_weight=100):
        self.max_weight = max_weight
        self.items = []
    
    def add_item(self, name, quantity, weight):
        """Add item to inventory"""
        item = Item(name, quantity, weight)
        self.items.append(item)
    
    def total_weight(self):
        """Calculate total weight"""
        return sum(item.weight * item.quantity for item in self.items)
    
    def find_item(self, name):
        """Find item by name"""
        for item in self.items:
            if item.name == name:
                return item
        return None
    
    def can_carry(self):
        """Check if under weight limit"""
        return self.total_weight() <= self.max_weight
    
    def list_items(self):
        """Display inventory"""
        for item in self.items:
            print(f"{item.name}: {item.quantity} x {item.weight}kg")

# Usage
inv = Inventory(50)
inv.add_item("sword", 1, 5)
inv.add_item("potion", 5, 0.5)
inv.add_item("gold_coin", 100, 0.1)

inv.list_items()
print(f"Total weight: {inv.total_weight()}kg")
print(f"Can carry: {inv.can_carry()}")
```

---

## 7. Graded Exercises

### Starter Exercises (40 minutes)

**Starter 1: Create Tuple**
```python
# TODO: Create tuple and access elements
```

**Starter 2: Unpacking**
```python
# TODO: Unpack tuple values
```

### Intermediate Exercises (60 minutes)

**Intermediate 1: Tuple as Key**
```python
# TODO: Use tuple as dictionary key
```

**Intermediate 2: Named Tuple**
```python
# TODO: Create and use namedtuple
```

### Advanced Exercises (90 minutes)

**Advanced 1: Complex Data Structure**
```python
# TODO: Combine tuples, lists, dicts
```

---

## 8. Self-Assessment Checklist

- [ ] I understand tuple immutability
- [ ] I can create and use tuples
- [ ] I know why tuples are hashable
- [ ] I can use tuples as dict keys
- [ ] I understand when to use tuples vs lists
- [ ] I can work with namedtuples

---

## 9. Additional Resources

- Immutability benefits
- Collections module
- Next Lesson: Lesson 1.1.47 - Choosing the Right Data Structure

---

**Next Lesson:** Lesson 1.1.47 - Choosing the Right Data Structure




