# Lesson 1.1.34: Recursion: Common Patterns

**Estimated Time**: 8 hours | **Difficulty**: Intermediate-Advanced  
**Prerequisites**: Lesson 1.1.33 (Recursion Basics)

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Implement head recursion patterns
- Implement tail recursion patterns
- Understand mutual recursion
- Apply recursion to sorting algorithms
- Implement accumulator patterns
- Optimize recursive functions
- Solve complex problems recursively

---

## 1. Head Recursion vs Tail Recursion (75 min)

### 1.1 Head Recursion (Recursive First)

```python
# Head recursion: recursive call happens FIRST
def head_factorial(n):
    if n <= 1:
        return 1
    # Recursive call is first
    return n * head_factorial(n - 1)

# Call stack grows first, then shrinks
# factorial(3)
# ├─ 3 * factorial(2)
#    ├─ 2 * factorial(1)
#       ├─ 1 * factorial(0)  <- reaches base
#       └─ return 1
#    └─ return 1
# └─ return 6
```

### 1.2 Tail Recursion (Recursive Last)

```python
# Tail recursion: recursive call happens LAST
def tail_factorial(n, accumulator=1):
    if n <= 1:
        return accumulator  # Return immediately
    # Work is done BEFORE recursive call
    return tail_factorial(n - 1, n * accumulator)

# More efficient - Python can optimize this
print(tail_factorial(5))  # Output: 120
```

### 1.3 Comparing Stack Usage

```python
# HEAD RECURSION - builds stack
def head_sum(n):
    if n == 0:
        return 0
    return n + head_sum(n - 1)  # Compute AFTER recursion

# TAIL RECURSION - can optimize
def tail_sum(n, total=0):
    if n == 0:
        return total
    return tail_sum(n - 1, total + n)  # Compute BEFORE recursion

# Both give same result, tail_sum is more efficient
print(head_sum(5))    # 15, uses more stack
print(tail_sum(5))    # 15, uses less stack
```

---

## 2. Accumulator Pattern (75 min)

### 2.1 Basic Accumulator Approach

```python
# Track result in parameter
def list_sum_accumulator(numbers, index=0, total=0):
    # Base case: processed all elements
    if index == len(numbers):
        return total
    
    # Recursive case: add current + recurse
    return list_sum_accumulator(
        numbers, 
        index + 1, 
        total + numbers[index]
    )

result = list_sum_accumulator([1, 2, 3, 4, 5])
print(result)  # Output: 15
```

### 2.2 Accumulator for String Processing

```python
# Build string recursively
def build_string(items, index=0, result=""):
    if index == len(items):
        return result
    
    separator = ", " if result else ""
    return build_string(
        items,
        index + 1,
        result + separator + str(items[index])
    )

words = ["apple", "banana", "cherry"]
print(build_string(words))  # Output: apple, banana, cherry
```

### 2.3 Accumulator for List Processing

```python
# Reverse list using accumulator
def reverse_list_acc(items, index=0, result=None):
    if result is None:
        result = []
    
    if index == len(items):
        return result
    
    # Build reversed list
    result.insert(0, items[index])
    return reverse_list_acc(items, index + 1, result)

print(reverse_list_acc([1, 2, 3, 4, 5]))  # Output: [5, 4, 3, 2, 1]

# Or simpler:
def reverse_list_simple(items):
    if len(items) == 0:
        return []
    return items[1:] + [items[0]][::-1]  # Less efficient

# Better accumulator approach:
def reverse_list_better(items, acc=None):
    if acc is None:
        acc = []
    if not items:
        return acc
    return reverse_list_better(items[1:], [items[0]] + acc)

print(reverse_list_better([1, 2, 3]))  # Output: [3, 2, 1]
```

---

## 3. Divde-and-Conquer Recursion (75 min)

### 3.1 Quicksort

```python
def quicksort(arr):
    """Sort array using divide-and-conquer"""
    
    # Base case: arrays with 0 or 1 element are sorted
    if len(arr) <= 1:
        return arr
    
    # Divide: pick pivot and partition
    pivot = arr[len(arr) // 2]
    left = [x for x in arr if x < pivot]
    middle = [x for x in arr if x == pivot]
    right = [x for x in arr if x > pivot]
    
    # Conquer: recursively sort left and right
    # Combine: merge results
    return quicksort(left) + middle + quicksort(right)

unsorted = [38, 27, 43, 3, 9, 82, 10]
print(quicksort(unsorted))  # Output: [3, 9, 10, 27, 38, 43, 82]
```

### 3.2 Merge Sort

```python
def merge_sort(arr):
    """Sort using merge sort"""
    
    if len(arr) <= 1:
        return arr
    
    # Divide
    mid = len(arr) // 2
    left = arr[:mid]
    right = arr[mid:]
    
    # Conquer
    left = merge_sort(left)
    right = merge_sort(right)
    
    # Merge
    return merge(left, right)

def merge(left, right):
    """Merge two sorted arrays"""
    result = []
    i = j = 0
    
    while i < len(left) and j < len(right):
        if left[i] <= right[j]:
            result.append(left[i])
            i += 1
        else:
            result.append(right[j])
            j += 1
    
    result.extend(left[i:])
    result.extend(right[j:])
    return result

unsorted = [38, 27, 43, 3, 9, 82, 10]
print(merge_sort(unsorted))  # Output: [3, 9, 10, 27, 38, 43, 82]
```

### 3.3 Binary Search

```python
def binary_search(arr, target, left=0, right=None):
    """Find target in sorted array"""
    
    if right is None:
        right = len(arr) - 1
    
    # Base case: not found
    if left > right:
        return -1
    
    mid = (left + right) // 2
    
    # Base case: found
    if arr[mid] == target:
        return mid
    
    # Conquer: search appropriate half
    elif arr[mid] < target:
        return binary_search(arr, target, mid + 1, right)
    else:
        return binary_search(arr, target, left, mid - 1)

sorted_arr = [1, 3, 5, 7, 9, 11, 13]
print(binary_search(sorted_arr, 7))   # Output: 3
print(binary_search(sorted_arr, 6))   # Output: -1
```

---

## 4. Mutual Recursion (60 min)

### 4.1 Two Functions Calling Each Other

```python
# Two functions that call each other
def is_even(n):
    if n == 0:
        return True
    return is_odd(n - 1)

def is_odd(n):
    if n == 0:
        return False
    return is_even(n - 1)

print(is_even(4))  # True
print(is_odd(3))   # True
```

### 4.2 Parser Example

```python
# Simple expression parser
def parse_expression(tokens, index):
    """Parse arithmetic expression"""
    
    # Get first term
    value, index = parse_term(tokens, index)
    
    # Look for +/- operators
    while index < len(tokens) and tokens[index] in ['+', '-']:
        op = tokens[index]
        index += 1
        right, index = parse_term(tokens, index)
        
        if op == '+':
            value += right
        else:
            value -= right
    
    return value, index

def parse_term(tokens, index):
    """Parse multiplication/division"""
    
    value, index = parse_factor(tokens, index)
    
    while index < len(tokens) and tokens[index] in ['*', '/']:
        op = tokens[index]
        index += 1
        right, index = parse_factor(tokens, index)
        
        if op == '*':
            value *= right
        else:
            value //= right
    
    return value, index

def parse_factor(tokens, index):
    """Parse number or parenthesized expression"""
    
    if tokens[index] == '(':
        index += 1
        value, index = parse_expression(tokens, index)
        index += 1  # Skip ')'
    else:
        value = int(tokens[index])
        index += 1
    
    return value, index

# Usage
tokens = ['2', '+', '3', '*', '4']  # 2 + 3*4 = 14
result, _ = parse_expression(tokens, 0)
print(result)  # Output: 14
```

---

## 5. Tree Recursion (75 min)

### 5.1 Tree Traversal Patterns

```python
# Tree represented as nested lists
tree = [1, [2, [4], [5]], [3, [6], [7]]]

# In-order traversal (for binary trees)
def inorder(node):
    if not isinstance(node, list) or len(node) == 0:
        return []
    
    result = []
    if len(node) >= 2:
        result.extend(inorder(node[1]))  # Left subtree
    result.append(node[0])  # Root
    if len(node) >= 3:
        result.extend(inorder(node[2]))  # Right subtree
    return result

print(inorder(tree))  # Output: [4, 2, 5, 1, 6, 3, 7]

# Pre-order traversal
def preorder(node):
    if not isinstance(node, list) or len(node) == 0:
        return []
    
    result = [node[0]]  # Root first
    if len(node) >= 2:
        result.extend(preorder(node[1]))  # Left
    if len(node) >= 3:
        result.extend(preorder(node[2]))  # Right
    return result

print(preorder(tree))  # Output: [1, 2, 4, 5, 3, 6, 7]
```

### 5.2 Tree Height

```python
def tree_height(node):
    """Find height of tree"""
    
    # Base case: empty or leaf node
    if not isinstance(node, list) or len(node) == 0:
        return 0
    
    # Recursive case: max of subtrees + 1
    left_height = tree_height(node[1]) if len(node) > 1 else 0
    right_height = tree_height(node[2]) if len(node) > 2 else 0
    
    return 1 + max(left_height, right_height)

tree = [1, [2, [4], [5]], [3, [6], [7]]]
print(tree_height(tree))  # Output: 3
```

---

## 6. Optimization Techniques (60 min)

### 6.1 Memoization

```python
# Inefficient fibonacci
def fib_slow(n):
    if n <= 1:
        return n
    return fib_slow(n-1) + fib_slow(n-2)

# Optimized with memoization
memo = {}

def fib_memoized(n):
    if n in memo:
        return memo[n]
    
    if n <= 1:
        result = n
    else:
        result = fib_memoized(n-1) + fib_memoized(n-2)
    
    memo[n] = result
    return result

# Or using decorator
from functools import lru_cache

@lru_cache(maxsize=None)
def fib_cached(n):
    if n <= 1:
        return n
    return fib_cached(n-1) + fib_cached(n-2)

print(fib_memoized(35))  # Fast!
print(fib_cached(35))    # Also fast!
```

### 6.2 Tail Call Optimization Pattern

```python
# Convert head recursion to tail recursion
def count_down_head(n):
    if n == 0:
        return
    print(n)
    count_down_head(n - 1)

# Better written iteratively for Python
def count_down_iterative(n):
    while n > 0:
        print(n)
        n -= 1

# Or use accumulator for tail recursion
def count_down_tail(n, callback=None):
    if callback is None:
        callback = lambda x: None
    
    if n == 0:
        return
    
    print(n)
    # Tail call - nothing after recursion
    return count_down_tail(n - 1, callback)
```

---

## 7. Mini-Project: File System Explorer

```python
import os
from pathlib import Path

def explore_directory(path, indent=0):
    """Recursively explore directory structure"""
    
    try:
        items = os.listdir(path)
    except PermissionError:
        return
    
    for item in sorted(items):
        item_path = os.path.join(path, item)
        prefix = "  " * indent + "├─ "
        
        if os.path.isdir(item_path):
            print(f"{prefix}[DIR] {item}/")
            # Recursive call for subdirectories
            explore_directory(item_path, indent + 1)
        else:
            size = os.path.getsize(item_path)
            print(f"{prefix}{item} ({size} bytes)")

# Usage
explore_directory(".")
```

---

## 8. Graded Exercises

### Starter Exercises (40 minutes)

**Starter 1: Tail Recursion**
```python
# TODO: Convert to tail recursion with accumulator
def sum_numbers(n):
    if n == 0:
        return 0
    return n + sum_numbers(n - 1)

# Rewrite using accumulator
```

**Starter 2: Two-Function Recursion**
```python
# TODO: Implement is_even and is_odd
# using mutual recursion
```

### Intermediate Exercises (60 minutes)

**Intermediate 1: Quicksort**
```python
# TODO: Implement quicksort from scratch
```

**Intermediate 2: Tree Height**
```python
# TODO: Find depth of nested list tree
```

### Advanced Exercises (90 minutes)

**Advanced 1: Merge Sort**
```python
# TODO: Implement merge sort
```

**Advanced 2: Memoization**
```python
# TODO: Optimize slow recursive function
# with caching/memoization
```

---

## 9. Self-Assessment Checklist

- [ ] I understand head vs tail recursion
- [ ] I can use accumulator pattern
- [ ] I understand divide-and-conquer
- [ ] I can implement mutual recursion
- [ ] I can traverse trees recursively
- [ ] I know memoization techniques

---

## 10. Assessment Questions

**True/False:**
1. Tail recursion is always faster than head recursion
2. Mutual recursion always requires at least 2 functions
3. Memoization can turn O(2^n) into O(n)

---

## 11. Additional Resources

- Divide-and-conquer algorithms
- Dynamic programming via memoization
- Tree algorithms
- Next Lesson: Lesson 1.1.35 - Pure Functions & Side Effects

---

**Next Lesson:** Lesson 1.1.35 - Pure Functions & Side Effects
