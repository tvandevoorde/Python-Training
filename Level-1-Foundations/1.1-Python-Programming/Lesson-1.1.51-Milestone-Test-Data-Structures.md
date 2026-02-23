# Lesson 1.1.50: MILESTONE TEST - Data Structures

**Estimated Time**: 8 hours | **Difficulty**: Advanced  
**Prerequisites**: Lessons 1.1.39-1.1.49 (All Data Structures content)

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Demonstrate mastery of all collection types
- Solve complex data structure problems
- Choose optimal structures for problems
- Optimize code performance
- Debug data structure issues
- Pass comprehensive assessment

---

## 1. Assessment Overview

This is a **comprehensive milestone test** covering:
- **Lists**: Creation, manipulation, comprehensions, slicing
- **Tuples**: Immutability, unpacking, namedtuples
- **Dictionaries**: CRUD operations, nested structures, comprehensions
- **Sets**: Operations, deduplication, membership testing
- **Complex Data**: Combining structures, optimization, real-world problems
- **Sorting**: Algorithms, custom keys, performance
- **Performance**: Big O analysis, optimization

---

## 2. Part 1: Multiple Choice Questions (60 min)

### Lists (5 questions)

**Question 1.1**: What is the time complexity of list.append()?
- A) O(1)
- B) O(n)
- C) O(log n)
- D) O(n log n)

**Answer**: A) O(1) - append adds to end

**Question 1.2**: What does this return?
```python
x = [1, 2, 3, 4, 5]
print(x[1:4])
```
- A) [1, 2, 3]
- B) [2, 3, 4]
- C) [2, 3]
- D) [1, 2, 3, 4]

**Answer**: B) [2, 3, 4] - slicing is exclusive of end

**Question 1.3**: List comprehension: `[x**2 for x in range(5) if x % 2 == 0]`
- A) [0, 2, 4]
- B) [0, 4, 16]
- C) [1, 9, 25]
- D) [0, 1, 4, 9, 16]

**Answer**: B) [0, 4, 16] - squared evens

**Question 1.4**: Which method REMOVES and returns an item by index?
- A) list.pop(index)
- B) list.delete(index)
- C) list.remove(index)
- D) list.discard(index)

**Answer**: A) list.pop(index)

**Question 1.5**: What happens with mutable list default?
```python
def f(x=[]):
    x.append(1)
    return x
print(f(), f())
```
- A) [1] [1]
- B) [1] [1, 1]
- C) TypeError
- D) [1, 1] [1, 1]

**Answer**: B) [1] [1, 1] - default shared across calls

### Tuples (5 questions)

**Question 2.1**: Which is valid tuple syntax?
- A) (1, 2, 3,)
- B) (42,)
- C) ()
- D) All valid

**Answer**: D) All valid

**Question 2.2**: Can you use tuple as dictionary key?
- A) Yes, always
- B) No
- C) Only if empty
- D) Only if immutable

**Answer**: A) Yes, always - tuples are hashable

**Question 2.3**: What is the result?
```python
a, b, *c, d = [1, 2, 3, 4, 5]
```
- A) a=1, b=2, c=[3,4], d=5
- B) a=1, b=[2,3,4], c=[], d=5
- C) TypeError
- D) a=1, b=2, c=[3], d=4

**Answer**: A) a=1, b=2, c=[3,4], d=5

**Question 2.4**: Tuple performance vs list in creation:
- A) List faster
- B) Tuple faster
- C) Same speed
- D) Depends on size

**Answer**: B) Tuple faster

**Question 2.5**: Named tuples benefit:
- A) Faster creation
- B) Better indexing
- C) Smaller memory
- D) All of above

**Answer**: B) Better indexing - access by name

### Dictionaries (5 questions)

**Question 3.1**: Dictionary lookup time complexity:
- A) O(1)
- B) O(log n)
- C) O(n)
- D) O(n log n)

**Answer**: A) O(1) - hash table lookup

**Question 3.2**: What does `.get()` return if key missing?
- A) KeyError
- B) None
- C) Empty dict
- D) False

**Answer**: B) None (or default if provided)

**Question 3.3**: Dictionary comprehension:
```python
{k: v for k, v in [('a', 1), ('b', 2)]}
```
- A) {'a': 1, 'b': 2}
- B) [('a', 1), ('b', 2)]
- C) {'a', 'b'}
- D) {1, 2}

**Answer**: A) {'a': 1, 'b': 2}

**Question 3.4**: Merge two dictionaries:
```python
d1 = {'a': 1}
d2 = {'b': 2}
result = {**d1, **d2}
```
- A) {'a': 1, 'b': 2}
- B) [{'a': 1}, {'b': 2}]
- C) {'a': 1}
- D) TypeError

**Answer**: A) {'a': 1, 'b': 2}

**Question 3.5**: .items() returns:
- A) List of values
- B) List of keys
- C) List of (key, value) tuples
- D) Dictionary view

**Answer**: C) List of (key, value) tuples

### Sets (4 questions)

**Question 4.1**: Set membership test complexity:
- A) O(n)
- B) O(log n)
- C) O(1)
- D) O(n log n)

**Answer**: C) O(1)

**Question 4.2**: Result of set operations:
```python
{1, 2, 3} & {2, 3, 4}
```
- A) {2, 3}
- B) {1, 2, 3, 4}
- C) {1, 4}
- D) TypeError

**Answer**: A) {2, 3} - intersection

**Question 4.3**: Remove item from set:
- A) set.pop()
- B) set.remove()
- C) del set[item]
- D) All valid

**Answer**: B) set.remove() or set.discard()

**Question 4.4**: Sets are useful for:
- A) Fast membership testing
- B) Removing duplicates
- C) Set mathematics (union, intersection)
- D) All above

**Answer**: D) All above

### Sorting (3 questions)

**Question 5.1**: Sort list in-place:
- A) sorted(list)
- B) list.sort()
- C) list.order()
- D) sort(list)

**Answer**: B) list.sort()

**Question 5.2**: Sort by multiple criteria:
```python
sorted(students, key=lambda s: (s['grade'], s['name']))
```
- A) By grade, then name
- B) By name, then grade
- C) Only by grade
- D) Only by name

**Answer**: A) By grade (primary), then name (secondary)

**Question 5.3**: Reverse sort:
- A) sorted(list, reverse=True)
- B) sorted(list, -key)
- C) sorted(-list)
- D) reversed(sorted(list))

**Answer**: A) sorted(list, reverse=True)

---

## 3. Part 2: Coding Problems (180 min)

### Problem 1: List Manipulation (30 min)

```python
def duplicate_and_reverse(numbers: list) -> list:
    """
    Given a list of numbers, create new list where each number appears twice,
    then reverse the result.
    
    Example:
    >>> duplicate_and_reverse([1, 2, 3])
    [3, 3, 2, 2, 1, 1]
    """
    # TODO: Implement
    pass

# Test cases
assert duplicate_and_reverse([1, 2, 3]) == [3, 3, 2, 2, 1, 1]
assert duplicate_and_reverse([]) == []
assert duplicate_and_reverse([5]) == [5, 5]
```

### Problem 2: Dictionary Operations (30 min)

```python
def merge_dicts(*dicts: dict) -> dict:
    """
    Merge multiple dictionaries. Later dictionaries override earlier ones.
    
    Example:
    >>> merge_dicts({'a': 1}, {'b': 2}, {'a': 3})
    {'a': 3, 'b': 2}
    """
    # TODO: Implement
    pass

# Test cases
assert merge_dicts({'a': 1}, {'b': 2}) == {'a': 1, 'b': 2}
assert merge_dicts({'a': 1}, {'a': 2}) == {'a': 2}
assert merge_dicts() == {}
```

### Problem 3: Set Operations (30 min)

```python
def find_common_elements(list1: list, list2: list) -> list:
    """
    Find common elements between two lists, removing duplicates.
    
    Example:
    >>> find_common_elements([1, 2, 2, 3], [2, 3, 3, 4])
    [2, 3]
    """
    # TODO: Implement
    pass

# Test cases
assert set(find_common_elements([1, 2, 3], [2, 3, 4])) == {2, 3}
assert find_common_elements([1, 2], [3, 4]) == []
```

### Problem 4: Complex Data Structure (45 min)

```python
def analyze_data(data: list[dict]) -> dict:
    """
    Given list of records, return analysis:
    - total: count of records
    - by_category: dict of {category: count}
    - average_score: average of 'score' field
    - highest_scorer: name of person with highest score
    
    Example:
    >>> data = [
    ...     {'name': 'Alice', 'category': 'A', 'score': 85},
    ...     {'name': 'Bob', 'category': 'B', 'score': 90}
    ... ]
    >>> analyze_data(data)
    {
        'total': 2,
        'by_category': {'A': 1, 'B': 1},
        'average_score': 87.5,
        'highest_scorer': 'Bob'
    }
    """
    # TODO: Implement
    pass

# Test cases
data = [
    {'name': 'Alice', 'category': 'A', 'score': 85},
    {'name': 'Bob', 'category': 'B', 'score': 90},
    {'name': 'Carol', 'category': 'A', 'score': 88}
]
result = analyze_data(data)
assert result['total'] == 3
assert result['by_category']['A'] == 2
assert result['average_score'] == 87.67
assert result['highest_scorer'] == 'Bob'
```

### Problem 5: Sorting Optimization (45 min)

```python
def sort_stable(data: list[dict], sort_by: str) -> list:
    """
    Sort data by field name. Handle missing fields gracefully.
    Sort should be stable (preserve relative order of equal items).
    
    Example:
    >>> data = [
    ...     {'name': 'Alice', 'age': 30},
    ...     {'name': 'Bob', 'age': 25}
    ... ]
    >>> sort_stable(data, 'age')
    [{'name': 'Bob', 'age': 25}, {'name': 'Alice', 'age': 30}]
    """
    # TODO: Implement
    pass

# Test cases
data = [
    {'name': 'Alice', 'score': 90},
    {'name': 'Bob', 'score': 85},
    {'name': 'Carol', 'score': 90}  # Same score as Alice
]
result = sort_stable(data, 'score')
```

---

## 4. Part 3: Real-World Problem (90 min)

### Build a Playlist Manager

```python
class PlaylistManager:
    """
    Manage music playlists with:
    - Add/remove songs
    - Organize by genre
    - Search functionality
    - Duplicate detection
    - Statistics
    """
    
    def __init__(self):
        # TODO: Initialize data structures
        pass
    
    def add_song(self, title: str, artist: str, genre: str):
        """Add song to playlist"""
        # TODO: Implement
        pass
    
    def remove_song(self, title: str):
        """Remove song by title"""
        # TODO: Implement
        pass
    
    def find_by_genre(self, genre: str) -> list:
        """Get all songs in genre"""
        # TODO: Implement
        pass
    
    def find_by_artist(self, artist: str) -> list:
        """Get all songs by artist"""
        # TODO: Implement
        pass
    
    def has_duplicates(self) -> bool:
        """Check if title duplicates exist"""
        # TODO: Implement
        pass
    
    def get_statistics(self) -> dict:
        """Return: total_songs, genres, artists, avg_songs_per_genre"""
        # TODO: Implement
        pass
    
    def sort_by_artist(self) -> list:
        """Return songs sorted by artist, then title"""
        # TODO: Implement
        pass

# Test usage
pm = PlaylistManager()
pm.add_song("Imagine", "John Lennon", "Rock")
pm.add_song("Bohemian Rhapsody", "Queen", "Rock")
pm.add_song("Midnight Blue", "Joni Mitchell", "Folk")

assert len(pm.find_by_genre("Rock")) == 2
assert pm.get_statistics()['total_songs'] == 3
```

---

## 5. Grading Rubric

| Category | Points | Criteria |
|----------|--------|----------|
| Multiple Choice | 20 | 17/20 correct to pass |
| Coding Problems | 40 | All 5 problems working |
| Real-World Project | 40 | All methods implemented, good structure |
| **TOTAL** | **100** | **70+ to pass (C grade)** |

**Grade Scale:**
- 90-100: A (Excellent)
- 80-89: B (Good)
- 70-79: C (Passing)
- Below 70: F (Needs improvement)

---

## 6. Study Guide

**Topics to Review:**
- ✅ List methods and slicing
- ✅ Tuple unpacking and namedtuples
- ✅ Dictionary operations and comprehensions
- ✅ Set operations (union, intersection, difference)
- ✅ Sorting (sorted(), .sort(), custom keys)
- ✅ Performance (Big O, time complexity)
- ✅ Data structure selection for problems
- ✅ Combining multiple structures

---

## 7. Next Steps

**If you pass (≥70%):**
- Congratulations! You're ready for Topic 5
- Proceed to Lesson 1.1.51: Topic 5 Introduction

**If you need improvement (<70%):**
- Review the lessons in Topic 4
- Re-attempt coding problems
- Focus on weak areas
- Try additional practice problems

---

## 8. Self-Assessment Checklist

- [ ] I understand all list operations
- [ ] I know when to use each data structure
- [ ] I can write efficient sorting code
- [ ] I can solve real-world problems
- [ ] I'm ready for the next topic

---

## 9. Resources for Review

- Data Structures Summary
- Performance Cheat Sheet
- Common Patterns
- Previous Lessons (1.1.39-1.1.49)

---

**After Passing:** LEVEL 1.1 Data Structures Topic is COMPLETE ✓

**Next Phase:** Topic 5 - File I/O, JSON, CSV (Starting Lesson 1.1.52)




