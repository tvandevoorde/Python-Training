# Lesson 1.1.47: Choosing the Right Data Structure

**Estimated Time**: 8 hours | **Difficulty**: Advanced  
**Prerequisites**: Lessons 1.1.39-1.1.46 (All collections)

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Compare data structures (list, tuple, dict, set)
- Make appropriate data structure choices
- Understand performance characteristics
- Analyze space and time complexity
- Optimize data structure selection
- Combine data structures effectively
- Recognize anti-patterns

---

## 1. Data Structure Overview (75 min)

### 1.1 Comparison Table

```python
# Performance and characteristics comparison

"""
Data Structure | Ordered | Mutable | Unique | Hashable | Indexed | Best For
─────────────────────────────────────────────────────────────────────────────
List           | Yes     | Yes     | No     | No       | Yes      | Sequences
Tuple          | Yes     | No      | No     | Yes      | Yes      | Fixed data
Dictionary     | Yes*    | Yes     | Keys   | No       | Keys     | Key-value
Set            | No      | Yes     | Yes    | No       | No       | Unique/Ops
                                          *Python 3.7+
"""

# 1. List: Best for sequences with frequent changes
numbers = [1, 2, 3, 4, 5]
numbers.append(6)        # Fast O(1) amortized
numbers[2] = 30          # Fast O(1)

# 2. Tuple: Best for fixed data and hashable keys
RGB = (255, 0, 0)
cache = {RGB: "red"}     # Can use as key

# 3. Dict: Best for key-value associations
student_grades = {"Alice": 90, "Bob": 85}
grade = student_grades["Alice"]  # Fast O(1)

# 4. Set: Best for membership testing and math operations
unique_tags = {"python", "tutorial", "beginner"}
has_tag = "python" in unique_tags  # Very fast O(1)
```

### 1.2 When to Use What

```python
# Problem: Store student names
# Best: List (ordered, can modify)
names = ["Alice", "Bob", "Carol"]

# Problem: Store RGB color (fixed 3 values)
# Best: Tuple (immutable, fixed structure)
color = (255, 0, 0)

# Problem: Store grades for each student
# Best: Dictionary (key-value lookup)
grades = {"Alice": 90, "Bob": 85}

# Problem: Find duplicates in list
# Best: Combined List + Set
data = [1, 2, 2, 3, 3, 3]
unique = set(data)  # Fast removal of duplicates

# Problem: Coordinate system
# Best: Tuple or namedtuple
point = (10, 20)
# Or: Point = namedtuple('Point', ['x', 'y'])
```

---

## 2. Performance Analysis (75 min)

### 2.1 Time Complexity

```python
import timeit

# List operations
list_data = list(range(100000))

# Access by index: O(1)
access_time = timeit.timeit(lambda: list_data[50000], number=100000)

# Append: O(1) amortized
append_time = timeit.timeit(
    lambda: (test_list := list(range(1000)), test_list.append(999))[0],
    number=1000
)

# Insert at beginning: O(n)
insert_time = timeit.timeit(
    lambda: (test_list := list(range(1000)), test_list.insert(0, -1))[0],
    number=1000
)

# Search (in): O(n)
search_time = timeit.timeit(
    lambda: 99999 in list_data,
    number=1000
)

print(f"List access: {access_time:.6f}s (O(1))")
print(f"List append: {append_time:.6f}s (O(1) amortized)")
print(f"List insert: {insert_time:.6f}s (O(n))")
print(f"List search: {search_time:.6f}s (O(n))")

# Set operations
set_data = set(range(100000))

# Search (in): O(1)
set_search = timeit.timeit(
    lambda: 99999 in set_data,
    number=1000000
)

print(f"Set search: {set_search:.6f}s (O(1)) - Much faster!")
```

### 2.2 Common Time Complexities

```python
"""
Operation        | List | Tuple | Dict | Set
─────────────────┼──────┼───────┼──────┼─────
Access by index  | O(1) | O(1)  | -    | -
Add/Remove end   | O(1) | -     | -    | O(1)
Add/Remove start | O(n) | -     | -    | O(1)
Search           | O(n) | O(n)  | O(1) | O(1)
Insert sorted    | O(n) | -     | -    | O(1)
Get by key       | -    | -     | O(1) | -
"""

# Examples
list_data = [1, 2, 3, 4, 5]
list_data.append(6)        # O(1) - add to end
# list_data.insert(0, 0)   # O(n) - add to start (slower!)

set_data = {1, 2, 3, 4, 5}
set_data.add(6)            # O(1) - always fast

dict_data = {1: "a", 2: "b"}
value = dict_data[1]       # O(1) - fast lookup
```

---

## 3. Optimization Patterns (75 min)

### 3.1 Choose Set for Membership Testing

```python
# SLOW: Linear search in list
valid_tags = ["python", "tutorial", "beginner", "advanced"]
if "python" in valid_tags:  # O(n) search
    process_tag("python")

# FAST: Constant time lookup in set
valid_tags_set = {"python", "tutorial", "beginner", "advanced"}
if "python" in valid_tags_set:  # O(1) lookup
    process_tag("python")

# For large collections, sets are dramatically faster
import timeit

big_list = list(range(1000000))
big_set = set(range(1000000))

list_time = timeit.timeit(lambda: 999999 in big_list, number=1000)
set_time = timeit.timeit(lambda: 999999 in big_set, number=1000000)

print(f"List: {list_time:.4f}s, Set: {set_time:.4f}s")
# Set is 1000+ times faster!
```

### 3.2 Use Dictionary for Lookup Tables

```python
# INEFFICIENT: Nested if statements
def get_status_code(status):
    if status == "success":
        return 200
    elif status == "created":
        return 201
    elif status == "bad_request":
        return 400
    elif status == "not_found":
        return 404
    # ... many more

# EFFICIENT: Dictionary lookup
status_codes = {
    "success": 200,
    "created": 201,
    "bad_request": 400,
    "not_found": 404,
    "unauthorized": 401,
    "forbidden": 403,
    "server_error": 500
}

def get_status_code(status):
    return status_codes.get(status, 500)  # O(1) lookup
```

### 3.3 Combine Data Structures

```python
# Problem: Count word frequencies AND preserve order

# Option 1: List + Dictionary (ordered, searchable)
class FrequencyTracker:
    def __init__(self):
        self.words = {}  # word -> count
        self.order = []  # preserve insertion order
    
    def add_word(self, word):
        if word not in self.words:
            self.order.append(word)
            self.words[word] = 0
        self.words[word] += 1
    
    def get_frequencies(self):
        return [(w, self.words[w]) for w in self.order]

# Option 2: defaultdict + Python 3.7+ (dict preserves insertion order)
from collections import defaultdict

frequencies = defaultdict(int)
for word in words:
    frequencies[word] += 1

# Option 3: Counter (specialized for this)
from collections import Counter
frequencies = Counter(words)
```

---

## 4. Anti-Patterns to Avoid (60 min)

### 4.1 Using List When Set Would Be Better

```python
# ANTI-PATTERN: List for membership testing
valid_colors = ["red", "green", "blue", "yellow"]
if user_color in valid_colors:  # O(n) - slow for large lists
    display(user_color)

# BETTER: Use set
valid_colors = {"red", "green", "blue", "yellow"}
if user_color in valid_colors:  # O(1) - fast
    display(user_color)
```

### 4.2 Modifying Mutable List Default

```python
# ANTI-PATTERN: Mutable default argument
def add_user(name, users=[]):  # Shared list!
    users.append(name)
    return users

a = add_user("Alice")
b = add_user("Bob")
print(b)  # ['Alice', 'Bob'] - Alice repeated!

# BETTER: Use None default
def add_user(name, users=None):
    if users is None:
        users = []
    users.append(name)
    return users

a = add_user("Alice")
b = add_user("Bob")
print(b)  # ['Bob'] ✓
```

### 4.3 Wrong Data Structure for Problem

```python
# ANTI-PATTERN: Using list for coordinate lookup
coords = [
    (0, 0),
    (1, 1),
    (2, 2),
    # ... many coordinates
]
# Check if (1, 1) exists: O(n) search
if (1, 1) in coords:  # Slow!
    process((1, 1))

# BETTER: Use set for coordinates
coords = {
    (0, 0),
    (1, 1),
    (2, 2),
    # ... many coordinates
}
# Check if (1, 1) exists: O(1) lookup
if (1, 1) in coords:  # Fast!
    process((1, 1))
```

---

## 5. Real-World Examples (45 min)

### 5.1 Caching Solution

```python
# Use dict + tuple for memoization
cache = {}  # {tuple_of_args: result}

def fibonacci(n):
    if (n,) in cache:
        return cache[(n,)]
    
    if n <= 1:
        result = n
    else:
        result = fibonacci(n-1) + fibonacci(n-2)
    
    cache[(n,)] = result
    return result

print(fibonacci(30))  # Fast with caching!
```

### 5.2 User Database

```python
# Combine structures for different access patterns
class UserDatabase:
    def __init__(self):
        self.users = {}           # id -> user data
        self.email_index = {}     # email -> id (for lookups)
        self.role_index = {}      # role -> set of ids
    
    def add_user(self, id, email, role, name):
        user = {"id": id, "email": email, "role": role, "name": name}
        self.users[id] = user
        self.email_index[email] = id
        
        if role not in self.role_index:
            self.role_index[role] = set()
        self.role_index[role].add(id)
    
    def find_by_id(self, id):
        return self.users.get(id)  # O(1)
    
    def find_by_email(self, email):
        id = self.email_index.get(email)  # O(1)
        return self.users.get(id) if id else None
    
    def find_by_role(self, role):
        ids = self.role_index.get(role, set())  # O(1)
        return [self.users[id] for id in ids]

# Usage
db = UserDatabase()
db.add_user(1, "alice@example.com", "admin", "Alice")
db.add_user(2, "bob@example.com", "user", "Bob")

print(db.find_by_email("alice@example.com"))  # Fast O(1) lookup
print(db.find_by_role("admin"))                # Fast set lookup
```

---

## 6. Decision Flow Chart

```python
# When choosing a data structure:

# 1. Do you need key-value associations?
#    YES -> Dictionary
#    NO -> Continue to 2

# 2. Do you need fast membership testing?
#    YES -> Set (if no duplicates) or List (if duplicates needed)
#    NO -> Continue to 3

# 3. Do you need ordered access?
#    YES -> List or Tuple
#    NO -> Set

# 4. Do you need to modify the data?
#    YES -> List or Dict
#    NO -> Tuple

# 5. Performance critical with large dataset?
#    Search operations -> Set
#    Key-value lookup -> Dict
#    Sequential -> List
```

---

## 7. Mini-Project: Web Cache

```python
class WebCache:
    def __init__(self, max_size=1000):
        self.cache = {}          # url -> content
        self.access_count = {}   # url -> count
        self.max_size = max_size
    
    def get(self, url):
        if url in self.cache:
            self.access_count[url] = self.access_count.get(url, 0) + 1
            return self.cache[url]
        return None
    
    def set(self, url, content):
        if len(self.cache) >= self.max_size:
            # Remove least accessed item
            lru = min(self.access_count.items(), key=lambda x: x[1])[0]
            del self.cache[lru]
            del self.access_count[lru]
        
        self.cache[url] = content
        self.access_count[url] = 0
    
    def clear(self):
        self.cache.clear()
        self.access_count.clear()

# Usage
cache = WebCache(100)
cache.set("news.com", "<html>...</html>")
print(cache.get("news.com"))  # Returns cached content
```

---

## 8. Graded Exercises

### Starter Exercises (40 minutes)

**Starter 1: Choose Data Structure**
```python
# TODO: For each problem, choose best structure
# 1. Store RGB values
# 2. Store shopping list
# 3. Store grades by student
```

### Intermediate Exercises (60 minutes)

**Intermediate 1: Performance Comparison**
```python
# TODO: Compare list vs set operations
```

**Intermediate 2: Combine Structures**
```python
# TODO: Use multiple structures for different queries
```

### Advanced Exercises (90 minutes)

**Advanced 1: Optimize Solution**
```python
# TODO: Refactor inefficient data structure usage
```

---

## 9. Self-Assessment Checklist

- [ ] I understand when to use each structure
- [ ] I know basic time complexities
- [ ] I can optimize structure selection
- [ ] I can combine structures effectively
- [ ] I recognize anti-patterns

---

## 10. Additional Resources

- Big O notation
- Data structure trade-offs
- Next Lesson: Lesson 1.1.48 - Sorting & Ordering

---

**Next Lesson:** Lesson 1.1.48 - Sorting & Ordering
