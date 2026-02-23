# Lesson 1.1.33: Recursion Basics

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.1.24-1.1.32 (Functions fundamentals)

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Understand recursive function concepts and structure
- Identify base case and recursive case
- Write simple recursive functions
- Trace recursive execution and call stacks
- Understand the risks of infinite recursion
- Apply recursion to common programming problems
- Compare recursion vs iteration

---

## 1. What is Recursion? (60 min)

### 1.1 Definition and Concept

**Recursion** is when a function calls itself to solve a problem by breaking it into smaller, identical subproblems.

**Key Components:**
1. **Base case**: When the function stops calling itself
2. **Recursive case**: When the function calls itself
3. **Progress**: Each call must move toward the base case

**Example:**
```python
# Factorial: 5! = 5 × 4 × 3 × 2 × 1
def factorial(n):
    # Base case - when to stop recursing
    if n == 0 or n == 1:
        return 1
    
    # Recursive case - function calls itself
    else:
        return n * factorial(n - 1)

print(factorial(5))  # Output: 120
```

**How it works:**
```
factorial(5)
├─ 5 * factorial(4)
   ├─ 4 * factorial(3)
      ├─ 3 * factorial(2)
         ├─ 2 * factorial(1)
            └─ return 1  <- BASE CASE
         └─ return 2 * 1 = 2
      └─ return 3 * 2 = 6
   └─ return 4 * 6 = 24
└─ return 5 * 24 = 120
```

### 1.2 Real-World Analogy

Think of looking up a word in a dictionary:
- If you understand the word = **base case**
- If you don't = look up the unknown word = **recursive call**
- Eventually you'll understand some word = **base case reached**

---

## 2. Understanding the Call Stack (75 min)

### 2.1 How Recursion Uses Memory

```python
def countdown(n):
    print(f"Countdown: {n}")
    
    # Base case
    if n == 0:
        print("Blastoff!")
        return
    
    # Recursive case
    countdown(n - 1)

countdown(3)
# Output:
# Countdown: 3
# Countdown: 2
# Countdown: 1
# Countdown: 0
# Blastoff!
```

**Call Stack Visualization:**
```
countdown(3)
├─ print "Countdown: 3"
├─ call countdown(2)
   ├─ print "Countdown: 2"
   ├─ call countdown(1)
      ├─ print "Countdown: 1"
      ├─ call countdown(0)
         ├─ print "Countdown: 0"
         ├─ BASE CASE REACHED
         └─ return
      └─ return
   └─ return
└─ return
```

### 2.2 Call Stack Depth

```python
import sys

# Check maximum recursion depth
print(sys.getrecursionlimit())  # Usually 1000

# Simple depth tracking
def show_stack(n, indent=0):
    print("  " * indent + f"Level {n}")
    
    if n == 0:
        return
    
    show_stack(n - 1, indent + 1)

show_stack(5)
# Output:
# Level 5
#   Level 4
#     Level 3
#       Level 2
#         Level 1
#           Level 0
```

---

## 3. Common Recursive Patterns (75 min)

### 3.1 Simple Numerical Recursion

```python
# Sum of integers
def sum_to_n(n):
    if n == 0:
        return 0
    else:
        return n + sum_to_n(n - 1)

print(sum_to_n(5))  # Output: 15 (5+4+3+2+1)

# Power function
def power(base, exponent):
    if exponent == 0:
        return 1
    else:
        return base * power(base, exponent - 1)

print(power(2, 4))  # Output: 16 (2^4)

# Fibonacci sequence
def fibonacci(n):
    if n <= 1:
        return n
    else:
        return fibonacci(n - 1) + fibonacci(n - 2)

print(fibonacci(6))  # Output: 8 (0,1,1,2,3,5,8)
```

### 3.2 String Recursion

```python
# Reverse a string
def reverse_string(s):
    if len(s) == 0:
        return ""
    else:
        return reverse_string(s[1:] + s[0])

print(reverse_string("hello"))  # Output: olleh

# Count character occurrences
def count_char(s, char):
    if len(s) == 0:
        return 0
    else:
        match = 1 if s[0] == char else 0
        return match + count_char(s[1:], char)

print(count_char("mississippi", "s"))  # Output: 4
```

### 3.3 List Recursion

```python
# Sum list elements
def sum_list(numbers):
    if len(numbers) == 0:
        return 0
    else:
        return numbers[0] + sum_list(numbers[1:])

print(sum_list([1, 2, 3, 4, 5]))  # Output: 15

# Find maximum
def find_max(numbers):
    if len(numbers) == 1:
        return numbers[0]
    else:
        max_of_rest = find_max(numbers[1:])
        return numbers[0] if numbers[0] > max_of_rest else max_of_rest

print(find_max([3, 7, 2, 9, 1]))  # Output: 9
```

---

## 4. Writing Recursive Functions (75 min)

### 4.1 Step-by-Step Approach

**Steps to create a recursive function:**
1. Identify the base case (when to stop)
2. Identify the recursive case (how to make progress)
3. Make sure each step moves toward base case
4. Test with small inputs first

**Template:**
```python
def recursive_function(parameters):
    # Step 1: Base case definition
    if base_case_condition:
        return base_case_value
    
    # Step 2: Recursive case
    else:
        return process(recursive_function(modified_parameters))
```

### 4.2 Example: Binary Search

```python
def binary_search(arr, target, left, right):
    # Base case 1: target not found
    if left > right:
        return -1
    
    mid = (left + right) // 2
    
    # Base case 2: target found
    if arr[mid] == target:
        return mid
    
    # Recursive case 1: search left half
    elif arr[mid] > target:
        return binary_search(arr, target, left, mid - 1)
    
    # Recursive case 2: search right half
    else:
        return binary_search(arr, target, mid + 1, right)

numbers = [1, 3, 5, 7, 9, 11, 13]
print(binary_search(numbers, 7, 0, len(numbers) - 1))  # Output: 3
```

### 4.3 Example: Tree Traversal

```python
# Simple tree represented as nested lists
tree = [1, [2, [4], [5]], [3, [6], [7]]]

def traverse_tree(tree):
    result = []
    
    # Base case: not a list (leaf node)
    if not isinstance(tree, list):
        return [tree]
    
    # Recursive case: traverse each element
    for element in tree:
        result.extend(traverse_tree(element))
    
    return result

print(traverse_tree(tree))  # Output: [1, 2, 4, 5, 3, 6, 7]
```

---

## 5. Dangers of Recursion (60 min)

### 5.1 Infinite Recursion

```python
# WRONG - no base case, infinite recursion
def infinite_loop(n):
    print(n)
    return infinite_loop(n + 1)  # Always calls itself!

# This will eventually crash with:
# RecursionError: maximum recursion depth exceeded

# CORRECT - has base case
def count_down(n):
    if n < 0:  # Base case
        return
    print(n)
    count_down(n - 1)

count_down(5)
```

### 5.2 Stack Overflow

```python
import sys

# Know your recursion limit
print(f"Recursion limit: {sys.getrecursionlimit()}")  # Usually 1000

# This could exceed stack (but Python prevents it)
def deep_recursion(n):
    if n == 0:
        return 1
    return deep_recursion(n - 1)

# Safe: within limit
print(deep_recursion(100))

# Unsafe: would hit limit (Python raises RecursionError)
# print(deep_recursion(5000))
```

### 5.3 Performance Issues

```python
# INEFFICIENT - calculates same values multiple times
def slow_fibonacci(n):
    if n <= 1:
        return n
    return slow_fibonacci(n - 1) + slow_fibonacci(n - 2)

# This is SLOW for large n because it recalculates
# fibonacci(5) calculates fibonacci(4) twice, etc.

# EFFICIENT - uses memoization (caching)
def fast_fibonacci(n, memo={}):
    if n in memo:
        return memo[n]
    
    if n <= 1:
        result = n
    else:
        result = fast_fibonacci(n - 1, memo) + fast_fibonacci(n - 2, memo)
    
    memo[n] = result
    return result

print(slow_fibonacci(30))  # Slow!
print(fast_fibonacci(30))  # Fast!
```

---

## 6. Recursion vs Iteration (60 min)

### 6.1 Comparing Approaches

```python
# ITERATION - usually simpler and faster
def factorial_iterative(n):
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

# RECURSION - more elegant but slower
def factorial_recursive(n):
    if n <= 1:
        return 1
    return n * factorial_recursive(n - 1)

print(factorial_iterative(5))   # Output: 120
print(factorial_recursive(5))   # Output: 120
```

### 6.2 When to Use Each

```python
# Use RECURSION for:
# 1. Tree/graph traversal
def traverse_folder(path):
    for item in os.listdir(path):
        if os.path.isdir(item):
            traverse_folder(item)  # Natural recursion
        else:
            process_file(item)

# 2. Divide-and-conquer
def quicksort(arr):
    if len(arr) <= 1:
        return arr
    pivot = arr[0]
    less = [x for x in arr[1:] if x <= pivot]
    greater = [x for x in arr[1:] if x > pivot]
    return quicksort(less) + [pivot] + quicksort(greater)

# Use ITERATION for:
# 1. Simple counting/summing
def sum_range(n):
    total = 0
    for i in range(1, n + 1):
        total += i
    return total

# 2. When you need to avoid stack overflow
def long_loop():
    for i in range(100000):  # Safe
        process(i)

# But NOT:
# def recursive_loop(n):
#     if n == 0:
#         return
#     process(n)
#     recursive_loop(n - 1)  # Risky for large n
```

---

## 7. Debugging Recursive Functions (45 min)

### 7.1 Adding Debug Output

```python
def factorial_debug(n, depth=0):
    indent = "  " * depth
    print(f"{indent}→ factorial({n})")
    
    if n <= 1:
        print(f"{indent}← returning 1 (base case)")
        return 1
    
    result = n * factorial_debug(n - 1, depth + 1)
    print(f"{indent}← returning {result}")
    return result

factorial_debug(4)
# Output shows call stack clearly
```

### 7.2 Testing with Small Cases

```python
# Always test with n=0 and n=1 first
print(fibonacci(0))  # Should be 0
print(fibonacci(1))  # Should be 1
print(fibonacci(2))  # Should be 1
print(fibonacci(3))  # Should be 2

# Then test larger cases
print(fibonacci(5))  # Should be 5
```

---

## 8. Mini-Project: Recursive Functions

```python
def binary_tree_search(tree, target):
    """Search for target in binary tree (list representation)"""
    
    if tree is None or not isinstance(tree, list) or len(tree) == 0:
        return False
    
    # Check current node
    if tree[0] == target:
        return True
    
    # Search left subtree
    if len(tree) > 1 and binary_tree_search(tree[1], target):
        return True
    
    # Search right subtree
    if len(tree) > 2 and binary_tree_search(tree[2], target):
        return True
    
    return False

# Tree: [4, [2, [1], [3]], [6, [5], [7]]]
tree = [4, [2, [1], [3]], [6, [5], [7]]]

print(binary_tree_search(tree, 3))  # True
print(binary_tree_search(tree, 10)) # False
```

---

## 9. Graded Exercises

### Starter Exercises (40 minutes)

**Starter 1: Simple Recursion**
```python
# TODO: Write factorial(n) recursively
# Base case: if n is 0 or 1, return 1
# Recursive case: return n * factorial(n-1)
```

**Starter 2: Countdown**
```python
# TODO: Write countdown(n) that prints from n to 0
# Base case: if n < 0, stop
# Recursive case: print n, then call countdown(n-1)
```

### Intermediate Exercises (60 minutes)

**Intermediate 1: List Sum**
```python
# TODO: Sum all numbers in list using recursion
# Base case: empty list returns 0
# Recursive: first element + sum of rest
```

**Intermediate 2: String Length**
```python
# TODO: Find length of string using recursion
# Base case: empty string has length 0
# Recursive: 1 + length of string without first char
```

### Advanced Exercises (90 minutes)

**Advanced 1: Nested List Sum**
```python
# TODO: Sum all numbers in nested list
# [[1, 2], [3, [4, 5]], 6]
# Should sum to 21
```

**Advanced 2: Flatten List**
```python
# TODO: Flatten nested list to single level
# Input: [[1, 2], [3, [4, 5]], 6]
# Output: [1, 2, 3, 4, 5, 6]
```

---

## 10. Self-Assessment Checklist

- [ ] I understand base case and recursive case
- [ ] I can write simple recursive functions
- [ ] I understand call stack visualization
- [ ] I know when recursion causes problems
- [ ] I can debug recursive functions
- [ ] I know when to use recursion vs iteration

---

## 11. Assessment Questions

**True/False:**
1. Every recursive function must have a base case
2. Recursion is always faster than iteration
3. Python has a default recursion limit of 1000

**Coding:**
1. Write factorial recursively
2. Write sum list recursively
3. What's wrong with this? `def f(n): return f(n+1)`

---

## 12. Additional Resources

- Call stack visualization
- Recursion in algorithm design
- Memoization techniques
- Next Lesson: Lesson 1.1.34 - Recursion: Common Patterns

---

**Next Lesson:** Lesson 1.1.34 - Recursion: Common Patterns




