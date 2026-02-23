# Lesson 1.1.45: Sets & Set Operations

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.1.39-1.1.44 (Collections fundamentals)

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Create and use sets
- Understand set properties (unordered, unique)
- Perform set operations (union, intersection, difference)
- Mutate sets efficiently
- Convert between collections
- Solve problems using set properties
- Understand set performance characteristics

---

## 1. Introduction to Sets (75 min)

### 1.1 What are Sets?

```python
# Set: unordered collection of unique elements
numbers = {1, 2, 3, 4, 5}
print(type(numbers))  # <class 'set'>

# Create empty set (NOT {} which is empty dict!)
empty_set = set()

# Duplicate elements are automatically removed
duplicates = {1, 1, 2, 2, 3}
print(duplicates)  # {1, 2, 3}

# Sets from other types
from_list = set([1, 2, 3, 2, 1])
print(from_list)  # {1, 2, 3}

from_string = set("hello")
print(from_string)  # {'h', 'e', 'l', 'o'}
```

### 1.2 Set Properties

```python
# Unordered
set1 = {1, 2, 3}
set2 = {3, 1, 2}
print(set1 == set2)  # True (same elements, order doesn't matter)

# Unique elements only
numbers = {1, 2, 2, 3, 3, 3}
print(numbers)       # {1, 2, 3}
print(len(numbers))  # 3

# No indexing
my_set = {1, 2, 3}
# value = my_set[0]  # TypeError - Sets are not indexed

# Mutable but elements must be hashable
my_set = {1, 2, 3}
my_set.add(4)        # OK
my_set.remove(1)     # OK
# my_set.add([1, 2]) # TypeError - lists not hashable
```

---

## 2. Basic Set Operations (75 min)

### 2.1 Adding and Removing Elements

```python
colors = {"red", "green"}

# Add single element
colors.add("blue")
print(colors)  # {'red', 'green', 'blue'}

# Add duplicate (no effect)
colors.add("red")
print(colors)  # {'red', 'green', 'blue'} (unchanged)

# Remove element (raises KeyError if not found)
colors.remove("green")
print(colors)  # {'red', 'blue'}

# Discard element (no error if not found)
colors.discard("green")  # No error
colors.discard("red")
print(colors)  # {'blue'}

# Pop random element
random_elem = colors.pop()
# Clear all elements
colors.clear()
print(colors)  # set()
```

### 2.2 Membership Testing

```python
fruits = {"apple", "banana", "cherry"}

# Check membership
print("apple" in fruits)    # True
print("grape" in fruits)    # False
print("orange" not in fruits)  # True

# Much faster than list membership!
# For large collections, sets are much more efficient
large_set = set(range(1000000))
print(999999 in large_set)   # Instant!

large_list = list(range(1000000))
print(999999 in large_list)  # Much slower!
```

### 2.3 Set Comprehensions

```python
# Create sets efficiently
numbers = [1, 2, 2, 3, 3, 3]
unique = {n for n in numbers}
print(unique)  # {1, 2, 3}

# Filter while creating
evens = {n for n in range(10) if n % 2 == 0}
print(evens)  # {0, 2, 4, 6, 8}

# Transform
lengths = {len(word) for word in ["apple", "cat", "elephant", "dog"]}
print(lengths)  # {3, 5, 8}
```

---

## 3. Set Mathematical Operations (75 min)

### 3.1 Union

```python
set_a = {1, 2, 3}
set_b = {3, 4, 5}

# Union: all elements from both sets
union1 = set_a | set_b
union2 = set_a.union(set_b)
print(union1)  # {1, 2, 3, 4, 5}
print(union2)  # {1, 2, 3, 4, 5}

# Union with multiple sets
set_c = {5, 6, 7}
all_elements = set_a | set_b | set_c
print(all_elements)  # {1, 2, 3, 4, 5, 6, 7}
```

### 3.2 Intersection

```python
set_a = {1, 2, 3, 4}
set_b = {3, 4, 5, 6}

# Intersection: common elements
intersection1 = set_a & set_b
intersection2 = set_a.intersection(set_b)
print(intersection1)  # {3, 4}
print(intersection2)  # {3, 4}

# Intersection with multiple sets
set_c = {4, 5, 6, 7}
common = set_a & set_b & set_c
print(common)  # {4}
```

### 3.3 Difference

```python
set_a = {1, 2, 3, 4}
set_b = {3, 4, 5, 6}

# Difference: elements in set_a but not in set_b
difference1 = set_a - set_b
difference2 = set_a.difference(set_b)
print(difference1)  # {1, 2}
print(difference2)  # {1, 2}

# Symmetric difference: elements in either but not both
sym_diff1 = set_a ^ set_b
sym_diff2 = set_a.symmetric_difference(set_b)
print(sym_diff1)  # {1, 2, 5, 6}
print(sym_diff2)  # {1, 2, 5, 6}
```

### 3.4 Subset and Superset

```python
set_a = {1, 2, 3}
set_b = {1, 2}
set_c = {1, 2, 3, 4}

# Subset: all elements of set_b in set_a
print(set_b.issubset(set_a))    # True
print(set_b <= set_a)           # True

# Proper subset: subset but not equal
print(set_b < set_a)            # True
print(set_a < set_a)            # False

# Superset: set_a contains all of set_b
print(set_a.issuperset(set_b))  # True
print(set_a >= set_b)           # True
```

---

## 4. Modifying Sets (60 min)

### 4.1 In-Place Operations

```python
set_a = {1, 2, 3}
set_b = {3, 4, 5}

# Union update
set_a |= set_b
print(set_a)  # {1, 2, 3, 4, 5}

# Reset for next example
set_a = {1, 2, 3}

# Intersection update
set_a &= set_b
print(set_a)  # {3}

# Difference update
set_a = {1, 2, 3}
set_a -= set_b
print(set_a)  # {1, 2}

# Symmetric difference update
set_a = {1, 2, 3}
set_a ^= set_b
print(set_a)  # {1, 2, 4, 5}
```

### 4.2 Update Methods

```python
original = {1, 2, 3}

# Union update
original.update({3, 4, 5})
print(original)  # {1, 2, 3, 4, 5}

# Reset
original = {1, 2, 3}

# Intersection update
original.intersection_update({2, 3, 4})
print(original)  # {2, 3}

# Reset
original = {1, 2, 3}

# Difference update
original.difference_update({3, 4})
print(original)  # {1, 2}
```

---

## 5. Common Set Use Cases (60 min)

### 5.1 Remove Duplicates

```python
# Remove duplicates from list while preserving order
numbers = [1, 2, 2, 3, 1, 4, 2, 5]

# Method 1: Set (loses order)
unique1 = list(set(numbers))
print(sorted(unique1))  # [1, 2, 3, 4, 5]

# Method 2: Preserve order
unique2 = []
seen = set()
for num in numbers:
    if num not in seen:
        unique2.append(num)
        seen.add(num)
print(unique2)  # [1, 2, 3, 4, 5]
```

### 5.2 Find Common Elements

```python
# Find common elements in lists
list1 = [1, 2, 3, 4, 5]
list2 = [4, 5, 6, 7, 8]

common = set(list1) & set(list2)
print(common)  # {4, 5}

# Find common characters
word1 = "hello"
word2 = "world"
common_chars = set(word1) & set(word2)
print(common_chars)  # {'l', 'o'}
```

### 5.3 Find Unique Elements

```python
# Elements only in first list
list1 = [1, 2, 3, 4]
list2 = [3, 4, 5, 6]

only_in_first = set(list1) - set(list2)
print(only_in_first)  # {1, 2}

# Elements in either but not both
only_once = set(list1) ^ set(list2)
print(only_once)  # {1, 2, 5, 6}
```

---

## 6. Set Performance (45 min)

### 6.1 Membership Testing Comparison

```python
import timeit

# List membership - O(n)
list_test = list(range(1000000))
list_time = timeit.timeit(
    lambda: 999999 in list_test,
    number=1000
)

# Set membership - O(1)
set_test = set(range(1000000))
set_time = timeit.timeit(
    lambda: 999999 in set_test,
    number=1000000
)

print(f"List: {list_time:.4f}s, Set: {set_time:.4f}s")
# Set is dramatically faster!
```

### 6.2 When to Use Sets

```python
# Use sets for:
# 1. Membership testing (fast)
# 2. Removing duplicates
# 3. Mathematical operations

# Use lists for:
# 1. Ordered data
# 2. Indexed access
# 3. Duplicates allowed

# Use dictionaries for:
# 1. Key-value associations
# 2. Fast lookup with data
```

---

## 7. Mini-Project: Tag System

```python
class TagManager:
    def __init__(self):
        self.tags = {}  # article_id -> set of tags
    
    def add_tag(self, article_id, tag):
        """Add tag to article"""
        if article_id not in self.tags:
            self.tags[article_id] = set()
        self.tags[article_id].add(tag)
    
    def find_articles_with_tags(self, required_tags):
        """Find articles with all required tags"""
        if not self.tags:
            return []
        
        # Start with all articles
        candidates = set(self.tags.keys())
        
        # Filter: keep only articles with all tags
        for tag in required_tags:
            articles_with_tag = {
                article_id for article_id, tags in self.tags.items()
                if tag in tags
            }
            candidates &= articles_with_tag  # Intersection
        
        return list(candidates)

# Usage
manager = TagManager()
manager.add_tag(1, "python")
manager.add_tag(1, "tutorial")
manager.add_tag(2, "python")
manager.add_tag(2, "advanced")
manager.add_tag(3, "javascript")

print(manager.find_articles_with_tags(["python", "tutorial"]))  # [1]
print(manager.find_articles_with_tags(["python"]))  # [1, 2]
```

---

## 8. Graded Exercises

### Starter Exercises (40 minutes)

**Starter 1: Create Set**
```python
# TODO: Create set from list, remove duplicates
```

**Starter 2: Membership Test**
```python
# TODO: Check if element in set
```

### Intermediate Exercises (60 minutes)

**Intermediate 1: Set Operations**
```python
# TODO: Union, intersection, difference
```

**Intermediate 2: Find Common**
```python
# TODO: Find common elements in multiple lists
```

### Advanced Exercises (90 minutes)

**Advanced 1: Set Algebra**
```python
# TODO: Complex set operations
```

---

## 9. Self-Assessment Checklist

- [ ] I understand set properties
- [ ] I can create and modify sets
- [ ] I know union, intersection, difference
- [ ] I can use sets for membership testing
- [ ] I understand set performance

---

## 10. Additional Resources

- Set theory
- Performance characteristics
- Next Lesson: Lesson 1.1.46 - Tuples & Immutability

---

**Next Lesson:** Lesson 1.1.46 - Tuples & Immutability




