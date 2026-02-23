# Lesson 1.1.28: Recursion Fundamentals

**Estimated Time**: 8 hours | **Difficulty**: Intermediate-Advanced  
**Prerequisites**: Lesson 1.1.27 (Pure Functions) | **Topic**: Functions - Recursive Calls

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Understand recursion and how functions call themselves
- Define base cases and recursive cases
- Trace recursive function calls
- Avoid infinite recursion and stack overflow
- Solve problems using recursive thinking
- Understand recursion performance implications

---

## 1. Recursion Fundamentals (90 min)

### 1.1 What is Recursion?

```python
# Recursion: Function calls itself

# Simple countdown example
def countdown(n):
    """Recursively count down from n to 1"""
    if n <= 0:
        print("Blastoff!")
        return
    
    print(n)
    countdown(n - 1)  # Function calls itself!

print("=== COUNTDOWN ===")
countdown(5)
# Output:
# 5
# 4
# 3
# 2
# 1
# Blastoff!
```

### 1.2 Base Case and Recursive Case

```python
print("\n=== BASE CASE VS RECURSIVE CASE ===\n")

# Every recursive function needs:
# 1. Base case: Stops recursion
# 2. Recursive case: Calls itself with simpler input

def factorial(n):
    """Calculate n! using recursion
    
    5! = 5 * 4!
    4! = 4 * 3!
    3! = 3 * 2!
    2! = 2 * 1!
    1! = 1 (BASE CASE)
    """
    
    # BASE CASE: When to stop
    if n <= 1:
        return 1
    
    # RECURSIVE CASE: Call with simpler input
    return n * factorial(n - 1)

print(f"5! = {factorial(5)}")    # 120
print(f"6! = {factorial(6)}")    # 720
print(f"1! = {factorial(1)}")    # 1

# Another example
def sum_to_n(n):
    """Sum numbers from 1 to n
    
    sum_to_5 = 5 + sum_to_4
    sum_to_4 = 4 + sum_to_3
    sum_to_3 = 3 + sum_to_2
    sum_to_2 = 2 + sum_to_1
    sum_to_1 = 1 (BASE CASE)
    """
    
    if n <= 1:
        return 1
    
    return n + sum_to_n(n - 1)

print(f"sum_to_5 = {sum_to_n(5)}")    # 15
print(f"sum_to_10 = {sum_to_n(10)}")  # 55
```

### 1.3 Tracing Recursive Calls

```python
print("\n=== TRACING RECURSION ===\n")

# Trace what happens with simple recursion
def trace_recursion(n, indent=0):
    """Show recursion steps"""
    prefix = "  " * indent
    
    print(f"{prefix}trace_recursion({n}) called")
    
    # BASE CASE
    if n <= 0:
        print(f"{prefix}  -> BASE CASE: returning 0")
        return 0
    
    # RECURSIVE CASE
    print(f"{prefix}  -> Need to calculate recursion({n-1})")
    result = n + trace_recursion(n - 1, indent + 1)
    print(f"{prefix}  -> Returning {n} + {result - n} = {result}")
    return result

print("Tracing: trace_recursion(3)")
result = trace_recursion(3)
print(f"Final result: {result}\n")

# Call stack visualization:
# trace_recursion(3)
#   trace_recursion(2)
#     trace_recursion(1)
#       trace_recursion(0)  -- BASE CASE, returns 0
#       returns 1 + 0 = 1
#     returns 2 + 1 = 3
#   returns 3 + 3 = 6
```

---

## 2. Recursive Patterns (90 min)

### 2.1 Linear Recursion

```python
print("=== LINEAR RECURSION ===\n")

# Linear: Each call makes at most 1 recursive call

def power(base, exponent):
    """Calculate base^exponent recursively
    
    2^4 = 2 * 2^3
    2^3 = 2 * 2^2
    2^2 = 2 * 2^1
    2^1 = 2 * 2^0
    2^0 = 1 (BASE CASE)
    """
    
    if exponent == 0:
        return 1
    
    return base * power(base, exponent - 1)

print(f"2^5 = {power(2, 5)}")
print(f"3^4 = {power(3, 4)}")

# Find an element in list
def find_in_list(items, target, index=0):
    """Find target in list"""
    
    # BASE CASES
    if index >= len(items):
        return -1  # Not found
    
    if items[index] == target:
        return index  # Found!
    
    # RECURSIVE CASE
    return find_in_list(items, target, index + 1)

numbers = [10, 20, 30, 40, 50]
print(f"Index of 30: {find_in_list(numbers, 30)}")
print(f"Index of 99: {find_in_list(numbers, 99)}")
```

### 2.2 Binary Recursion

```python
print("\n=== BINARY RECURSION ===\n")

# Binary: Each call makes up to 2 recursive calls

def fibonacci(n):
    """Calculate nth Fibonacci number
    
    fib(5) = fib(4) + fib(3)
    fib(4) = fib(3) + fib(2)
    fib(3) = fib(2) + fib(1)
    fib(2) = fib(1) + fib(0)
    fib(1) = 1 (BASE CASE)
    fib(0) = 0 (BASE CASE)
    """
    
    if n <= 1:
        return n
    
    return fibonacci(n - 1) + fibonacci(n - 2)

print("Fibonacci sequence:")
for i in range(10):
    print(f"fib({i}) = {fibonacci(i)}")

# ⚠️ WARNING: This is SLOW for large n!
# try fibonacci(35) - takes seconds!

# Better: Memoization (cache results)
def fibonacci_memo(n, memo=None):
    """Fibonacci with memoization"""
    if memo is None:
        memo = {}
    
    if n in memo:
        return memo[n]
    
    if n <= 1:
        return n
    
    result = fibonacci_memo(n - 1, memo) + fibonacci_memo(n - 2, memo)
    memo[n] = result
    return result

print(f"\nfib(35) with memoization = {fibonacci_memo(35)}")
```

### 2.3 Tree Recursion

```python
print("\n=== TREE RECURSION ===\n")

# Process nested structures

def sum_nested_list(items):
    """Sum all numbers in nested lists
    
    Example: [[1, 2], [3, [4, 5]]] = 1+2+3+4+5 = 15
    """
    
    total = 0
    
    for item in items:
        if isinstance(item, list):
            # Recursive case: Item is nested list
            total += sum_nested_list(item)
        else:
            # Base case: Item is number
            total += item
    
    return total

nested = [[1, 2], [3, [4, 5]], 6]
print(f"Sum of {nested} = {sum_nested_list(nested)}")

# Count nested items
def count_items(items):
    """Count all items including nested"""
    
    count = 0
    
    for item in items:
        count += 1  # Count this item
        
        if isinstance(item, list):
            # Recursive case: Count nested items
            count += count_items(item)
    
    return count

nested = [[1, 2], [3, [4, 5]], 6]
print(f"Count items: {count_items(nested)}")
```

---

## 3. Common Recursive Problems (90 min)

### 3.1 String and List Problems

```python
print("=== STRING/LIST RECURSION ===\n")

def reverse_string(s):
    """Reverse string recursively"""
    
    # BASE CASE
    if len(s) <= 1:
        return s
    
    # RECURSIVE CASE: Last char + reversed rest
    return s[-1] + reverse_string(s[:-1])

print(f"reverse_string('hello') = '{reverse_string('hello')}'")

def palindrome_check(s):
    """Check if string is palindrome"""
    s = s.lower().replace(' ', '')
    
    if len(s) <= 1:
        return True
    
    if s[0] != s[-1]:
        return False
    
    return palindrome_check(s[1:-1])

print(f"'racecar' palindrome? {palindrome_check('racecar')}")
print(f"'hello' palindrome? {palindrome_check('hello')}")

def count_character(s, char):
    """Count occurrences of character"""
    
    if len(s) == 0:
        return 0
    
    if s[0] == char:
        return 1 + count_character(s[1:], char)
    else:
        return count_character(s[1:], char)

print(f"Count 'l' in 'hello': {count_character('hello', 'l')}")
```

### 3.2 Mathematical Problems

```python
print("\n=== MATHEMATICAL RECURSION ===\n")

def gcd(a, b):
    """Greatest Common Divisor (Euclidean algorithm)
    
    gcd(48, 18):
    48 = 2 * 18 + 12
    gcd(18, 12)
    18 = 1 * 12 + 6
    gcd(12, 6)
    12 = 2 * 6 + 0
    gcd(6, 0) -> BASE CASE: return 6
    """
    
    if b == 0:
        return a
    
    return gcd(b, a % b)

print(f"GCD(48, 18) = {gcd(48, 18)}")
print(f"GCD(100, 50) = {gcd(100, 50)}")

def digit_sum(n):
    """Sum of digits in number"""
    
    if n < 10:
        return n
    
    return (n % 10) + digit_sum(n // 10)

print(f"Digit sum of 12345 = {digit_sum(12345)}")

def is_prime(n, divisor=2):
    """Check if number is prime"""
    
    if n < 2:
        return False
    
    if divisor * divisor > n:
        return True
    
    if n % divisor == 0:
        return False
    
    return is_prime(n, divisor + 1)

print(f"Is 17 prime? {is_prime(17)}")
print(f"Is 20 prime? {is_prime(20)}")
```

### 3.3 String Generation

```python
print("\n=== STRING GENERATION ===\n")

def generate_binary(n, prefix=''):
    """Generate all binary numbers with n bits"""
    
    # BASE CASE
    if n == 0:
        print(prefix)
        return
    
    # RECURSIVE CASE
    generate_binary(n - 1, prefix + '0')
    generate_binary(n - 1, prefix + '1')

print("2-bit binary numbers:")
generate_binary(2)

# Permutations
def permutations(s):
    """Generate all permutations of string"""
    
    if len(s) <= 1:
        return [s]
    
    result = []
    for i, char in enumerate(s):
        remaining = s[:i] + s[i+1:]
        for perm in permutations(remaining):
            result.append(char + perm)
    
    return result

perms = permutations('ABC')
print(f"\nPermutations of 'ABC':")
for p in perms:
    print(f"  {p}")
```

---

## 4. Recursion Pitfalls & Optimization (60 min)

### 4.1 Stack Overflow

```python
print("=== STACK OVERFLOW ===\n")

import sys

# Get recursion limit
print(f"Recursion limit: {sys.getrecursionlimit()}")

# ❌ INFINITE RECURSION (causes error)
def infinite_recursion(n):
    print(n)
    return infinite_recursion(n + 1)  # Never reaches base case!

# Don't run: infinite_recursion(0)

# ✅ Proper base case
def safe_recursion(n, limit=5):
    if n > limit:  # BASE CASE
        return
    print(n)
    safe_recursion(n + 1)

safe_recursion(0)

# ❌ TOO DEEP RECURSION
def very_deep_recursion(n):
    if n <= 0:
        return 0
    return very_deep_recursion(n - 1)  # Will overflow for large n

try:
    result = very_deep_recursion(5000)
except RecursionError:
    print("RecursionError: maximum recursion depth exceeded")
```

### 4.2 Optimization: Tail Recursion

```python
print("\n=== TAIL RECURSION ===\n")

# Tail recursion: Recursive call is the last operation

# ❌ NOT tail recursive
def sum_not_tail(numbers, index=0):
    if index >= len(numbers):
        return 0
    return numbers[index] + sum_not_tail(numbers, index + 1)
    # Computation after recursion!

# ✅ TAIL recursive (accumulator pattern)
def sum_tail(numbers, index=0, accumulator=0):
    if index >= len(numbers):
        return accumulator
    return sum_tail(numbers, index + 1, accumulator + numbers[index])
    # Recursion is last operation!

nums = [1, 2, 3, 4, 5]
print(f"Sum (not tail): {sum_not_tail(nums)}")
print(f"Sum (tail): {sum_tail(nums)}")

# Python doesn't optimize tail recursion, but pattern is good practice
```

### 4.3 Converting Recursion to Iteration

```python
print("\n=== RECURSION TO ITERATION ===\n")

# Sometimes iterative is better!

# ❌ RECURSIVE (slow for large n)
def fib_recursive(n):
    if n <= 1:
        return n
    return fib_recursive(n - 1) + fib_recursive(n - 2)

# ✅ ITERATIVE (much faster)
def fib_iterative(n):
    if n <= 1:
        return n
    
    prev, curr = 0, 1
    for _ in range(2, n + 1):
        prev, curr = curr, prev + curr
    
    return curr

import time

# Compare speeds
n = 30

start = time.time()
result_rec = fib_recursive(n)
time_rec = time.time() - start

start = time.time()
result_iter = fib_iterative(n)
time_iter = time.time() - start

print(f"Recursive: {result_rec} in {time_rec:.4f}s")
print(f"Iterative: {result_iter} in {time_iter:.6f}s")
print(f"Iterative is {time_rec/time_iter:.0f}x faster!")
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.28.1**: Simple Recursion
```python
def countdown(n):
    # Print n down to 0, recursively
    pass

countdown(3)  # Output: 3, 2, 1, 0
```

**Exercise 1.1.28.2**: Sum to N
```python
def sum_to_n(n):
    # Return sum of 1 to n recursively
    pass

print(sum_to_n(5))  # 15
```

**Exercise 1.1.28.3**: Base Case
```python
def is_power_of_2(n):
    # Check if n is power of 2 recursively
    # Hint: 16 = 2^4, 8 = 2^3, etc.
    pass
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.28.4**: List Sum
```python
def sum_list(items):
    # Sum all numbers in list recursively
    pass

print(sum_list([1, 2, 3, 4, 5]))  # 15
```

**Exercise 1.1.28.5**: String Reversal
```python
def reverse(s):
    # Reverse string recursively
    pass

print(reverse("hello"))  # "olleh"
```

**Exercise 1.1.28.6**: Binary Search
```python
def binary_search(sorted_list, target):
    # Search for target in sorted list recursively
    pass
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.28.7**: Nested Sum
```python
def sum_nested(items):
    # Sum nested lists: [[1,2],[3,[4,5]]] = 15
    pass
```

**Exercise 1.1.28.8**: Tree Traversal
```python
def tree_sum(tree):
    # Sum all nodes in binary tree recursively
    # Tree = {'value': n, 'left': tree, 'right': tree}
    pass
```

**Exercise 1.1.28.9**: Combinations
```python
def combinations(n, k):
    # Calculate n choose k recursively
    # C(5, 2) = 10
    pass
```

---

## Mini-Project: File Directory Analyzer

Recursively analyze directory structure.

```python
import os
from pathlib import Path

def count_files(directory, extension=None):
    """Recursively count files, optionally by extension"""
    
    count = 0
    
    try:
        for item in os.listdir(directory):
            path = os.path.join(directory, item)
            
            if os.path.isdir(path):
                # Recursive: subdirectory
                count += count_files(path, extension)
            elif os.path.isfile(path):
                if extension is None:
                    count += 1
                elif item.endswith(extension):
                    count += 1
    except PermissionError:
        pass
    
    return count

def get_directory_size(directory):
    """Get total size of directory recursively"""
    
    total = 0
    
    try:
        for item in os.listdir(directory):
            path = os.path.join(directory, item)
            
            if os.path.isdir(path):
                # Recursive: subdirectory
                total += get_directory_size(path)
            elif os.path.isfile(path):
                total += os.path.getsize(path)
    except PermissionError:
        pass
    
    return total

def print_tree(directory, prefix="", max_depth=3, current_depth=0):
    """Print directory tree recursively"""
    
    if current_depth >= max_depth:
        return
    
    try:
        items = sorted(os.listdir(directory))
        
        for i, item in enumerate(items):
            path = os.path.join(directory, item)
            is_last = i == len(items) - 1
            
            connector = "└── " if is_last else "├── "
            print(f"{prefix}{connector}{item}")
            
            if os.path.isdir(path):
                extension = "    " if is_last else "│   "
                print_tree(path, prefix + extension, max_depth, current_depth + 1)
    except PermissionError:
        pass

# Usage (on current directory)
# current_dir = "."
# print(f"Python files: {count_files(current_dir, '.py')}")
# print(f"Total size: {get_directory_size(current_dir)} bytes")
# print("Directory tree:")
# print_tree(current_dir)
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **Every recursive function must have base case.**
   - Answer: True

2. **Recursion is always more efficient than loops.**
   - Answer: False

3. **Python has limit on recursion depth.**
   - Answer: True

4. **Tail recursion is automatically optimized in Python.**
   - Answer: False

---

### Conceptual Questions

5. **What is base case and why is it important?**
   - Expected: Stops recursion, prevents infinite loops

6. **When should you use recursion vs iteration?**
   - Expected: Natural recursive problems (trees, nested data), backtracking

7. **What causes stack overflow in recursion?**
   - Expected: Too many function calls exceed stack memory

---

### Coding Challenge

8. **Create recursive sum of digits:**
   - Input: 12345
   - Sum: 1+2+3+4+5 = 15
   - Must use recursion, not loops

---

## Key Takeaways

✅ **Recursion: Function calls itself** - Divide problem into smaller versions  
✅ **Base case essential** - Stops recursion, prevents infinite loops  
✅ **Trace carefully** - Follow call stack on paper  
✅ **Watch performance** - Can be slow, consider memoization  
✅ **Know when to use** - Good for trees, backtracking; loops often better

---

## Additional Resources

- [Recursion in Python](https://realpython.com/python-recursion/)
- [Understanding the Stack](https://en.wikipedia.org/wiki/Call_stack)
- [Backtracking Algorithms](https://www.geeksforgeeks.org/backtracking-algorithms/)

---

## Next Lesson Preview

**Lesson 1.1.29**: Generators & Yield
- Generator functions
- yield keyword
- Memory efficiency
- Lazy evaluation

---

## Homework

- [ ] Complete Exercises 1.1.28.1 - 1.1.28.9
- [ ] Build and test File Directory Analyzer
- [ ] Create 3 different recursive functions
- [ ] Compare recursive vs iterative performance
- [ ] Quiz: Answer all assessment questions

**Expected time**: 4-5 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.29** when you're ready.




