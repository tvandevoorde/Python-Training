# Lesson 1.1.16: `for` Loops & `range()`

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.1.15 (Loop Control) | **Topic**: Loops - Alternative Loop Type

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Understand the purpose of `for` loops
- Use `for` loops to iterate over sequences
- Generate sequences with `range()`
- Choose between `while` and `for` loops
- Apply `for` loops to practical problems

---

## 1. Introduction to `for` Loops (60 min)

### 1.1 `while` vs `for` Loops

```python
# WHILE LOOP: Check condition, manually update
count = 1
while count <= 5:
    print(count)
    count += 1

# FOR LOOP: Iterate through items automatically
for count in range(1, 6):
    print(count)

# Both produce same output:
# 1
# 2
# 3
# 4
# 5
```

### 1.2 Purpose of `for` Loops

```python
# Use FOR when you know what you're iterating over
# Cleaner, simpler, less error-prone

# ✓ FOR: Iterate exact 5 times
for i in range(5):
    print(f"Iteration {i}")

# ✓ FOR: Process each item in list
fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print(fruit)

# ✓ WHILE: Unknown number of iterations
password = ""
while password != "correct":
    password = input("Password: ")

# ✓ WHILE: Complex exit conditions
while still_playing and time_remaining > 0:
    # Play game
    pass
```

### 1.3 Basic `for` Loop Structure

```python
# for variable in sequence:
#     code block (runs for each item)

# Example: Print each letter
word = "Python"
for letter in word:
    print(letter)

# Output:
# P
# y
# t
# h
# o
# n
```

---

## 2. The `range()` Function (90 min)

### 2.1 What is `range()`?

```python
# range() generates a sequence of numbers

# range(stop) - from 0 to stop-1
list(range(5))
# Output: [0, 1, 2, 3, 4]

# range(start, stop) - from start to stop-1
list(range(2, 7))
# Output: [2, 3, 4, 5, 6]

# range(start, stop, step) - from start to stop-1, increment by step
list(range(0, 10, 2))
# Output: [0, 2, 4, 6, 8]

# Negative step - count backwards
list(range(5, 0, -1))
# Output: [5, 4, 3, 2, 1]
```

### 2.2 Common `range()` Patterns

```python
print("=== RANGE PATTERNS ===\n")

# Pattern 1: Count 0 to n-1 (most common)
print("Count 0-4:")
for i in range(5):
    print(i)

# Pattern 2: Count 1 to n (for humans who count from 1)
print("\nCount 1-5:")
for i in range(1, 6):
    print(i)

# Pattern 3: Count by 2s
print("\nCount 0-8 by 2s:")
for i in range(0, 10, 2):
    print(i)

# Pattern 4: Countdown
print("\nCountdown 5-1:")
for i in range(5, 0, -1):
    print(i)

# Pattern 5: Large steps
print("\nCount 0-100 by 25s:")
for i in range(0, 101, 25):
    print(i)
```

### 2.3 Why Use `range()`?

```python
# Efficient: doesn't create full list in memory
# (until converted to list)
for i in range(1000000):
    if i == 500000:
        print(f"Found middle: {i}")
        break

# Readable: clearly shows iteration limits
for i in range(5):
    print(f"Iteration {i}")
# Clear: exactly 5 iterations

# Flexible: start, stop, step all customizable
start = 10
stop = 100
step = 10
for i in range(start, stop, step):
    print(i)  # 10, 20, 30, ..., 90
```

---

## 3. Iterating Over Sequences (90 min)

### 3.1 Iterating Over Strings

```python
# Each iteration: variable = next character
word = "Python"

for char in word:
    print(char)

# Output:
# P
# y
# t
# h
# o
# n

# String analysis
word = "hello"
vowel_count = 0

for char in word:
    if char in "aeiou":
        vowel_count += 1

print(f"Vowels: {vowel_count}")  # Output: 2
```

### 3.2 Iterating Over Lists

```python
# Each iteration: variable = next list item
fruits = ["apple", "banana", "cherry"]

for fruit in fruits:
    print(f"I like {fruit}")

# Output:
# I like apple
# I like banana
# I like cherry

# Sum numbers in list
numbers = [10, 20, 30, 40]
total = 0

for num in numbers:
    total += num

print(f"Total: {total}")  # Output: 70
```

### 3.3 Index-Based Iteration

```python
# Sometimes you need the index/position
fruits = ["apple", "banana", "cherry"]

# Option 1: Use range() with len()
for i in range(len(fruits)):
    print(f"{i}: {fruits[i]}")

# Output:
# 0: apple
# 1: banana
# 2: cherry

# Option 2: Use enumerate() (more Pythonic - introduced later)
for i, fruit in enumerate(fruits):
    print(f"{i}: {fruit}")
```

### 3.4 Accessing List Items During Iteration

```python
# Process list items
items = [5, 10, 15, 20]

# Just the items
for item in items:
    print(f"Item: {item}")

# Items with arithmetic
for item in items:
    doubled = item * 2
    print(f"{item} × 2 = {doubled}")

# Building new list
numbers = [1, 2, 3, 4, 5]
squared = []

for num in numbers:
    squared.append(num ** 2)

print(squared)  # Output: [1, 4, 9, 16, 25]
```

---

## 4. `for` Loops with `break` and `continue` (60 min)

### 4.1 Using `break` in `for` Loops

```python
# Exit early when condition met
numbers = [1, 2, 3, 4, 5]

for num in numbers:
    if num == 3:
        print("Found 3, stopping")
        break
    print(num)

# Output:
# 1
# 2
# Found 3, stopping

# Search for item
target = "banana"
fruits = ["apple", "banana", "cherry"]

for fruit in fruits:
    if fruit == target:
        print(f"Found {target}!")
        break
else:
    print(f"{target} not found")
```

### 4.2 Using `continue` in `for` Loops

```python
# Skip to next iteration
numbers = [1, 2, 3, 4, 5]

for num in numbers:
    if num % 2 == 0:  # Skip even numbers
        continue
    print(f"Odd: {num}")

# Output:
# Odd: 1
# Odd: 3
# Odd: 5

# Filter while processing
items = [10, 0, 20, 0, 30]

for item in items:
    if item == 0:
        continue  # Skip zeros
    
    print(f"Processing {item}")
```

### 4.3 `for-else` Pattern

```python
# Else block runs if loop completes (no break)
numbers = [1, 2, 3, 4, 5]
target = 10

for num in numbers:
    if num == target:
        print(f"Found {target}")
        break
else:
    print(f"{target} not in list")

# Output: 10 not in list

# Pattern: Validate that something exists
valid_codes = ["A001", "A002", "B001"]
user_code = "C001"

for code in valid_codes:
    if code == user_code:
        print("✓ Valid code")
        break
else:
    print("✗ Invalid code")
```

---

## 5. Nested `for` Loops (60 min)

### 5.1 Basic Nested Loops

```python
# Loop within loop
print("=== NESTED FOR LOOPS ===")

for row in range(3):
    for col in range(3):
        print(f"({row},{col})", end=" ")
    print()  # New line

# Output:
# (0,0) (0,1) (0,2)
# (1,0) (1,1) (1,2)
# (2,0) (2,1) (2,2)
```

### 5.2 Multiplication Table

```python
print("=== MULTIPLICATION TABLE ===\n")

print("     ", end="")
for col in range(1, 4):
    print(f"{col:4}", end="")
print()

for row in range(1, 4):
    print(f"{row} |", end="")
    for col in range(1, 4):
        result = row * col
        print(f"{result:4}", end="")
    print()

# Output:
#       1   2   3
# 1 |   1   2   3
# 2 |   2   4   6
# 3 |   3   6   9
```

### 5.3 Iterating Over 2D Data

```python
# Matrix (list of lists)
matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

# Sum all elements
total = 0
for row in matrix:
    for element in row:
        total += element

print(f"Sum: {total}")  # Output: 45

# Find element
target = 5
found = False

for row in matrix:
    for element in row:
        if element == target:
            found = True
            break
    if found:
        break

if found:
    print(f"Found {target}")
```

---

## 6. Practical Applications (60 min)

### 6.1 Repeated Calculations

```python
# Calculate same thing multiple times
print("=== CONVERSION TABLE ===")
print("Celsius to Fahrenheit:\n")

print("°C  →  °F")
print("-" * 12)
for celsius in range(0, 101, 10):
    fahrenheit = (celsius * 9/5) + 32
    print(f"{celsius:3}°C → {fahrenheit:6.1f}°F")

# Output:
#  0°C →   32.0°F
# 10°C →   50.0°F
# 20°C →   68.0°F
# ...
```

### 6.2 Building Strings

```python
# Create patterns with loops
# Triangle
print("Triangle:")
for i in range(1, 6):
    print("*" * i)

# Output:
# *
# **
# ***
# ****
# *****

# Box
print("\nBox:")
width = 5
for i in range(3):
    print("*" * width)

# Output:
# *****
# *****
# *****
```

### 6.3 Data Processing

```python
# Process lists of data
scores = [85, 92, 78, 95, 88, 76]
total = 0
high_count = 0

for score in scores:
    total += score
    if score >= 90:
        high_count += 1

average = total / len(scores)
print(f"Average: {average:.1f}")
print(f"Scores >= 90: {high_count}")

# Output:
# Average: 85.7
# Scores >= 90: 2
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.16.1**: Simple Range
```python
for i in range(5):
    print(i)

# What prints?
```

**Exercise 1.1.16.2**: Count 1-10
```python
for i in range(1, 11):
    print(i)

# What prints?
```

**Exercise 1.1.16.3**: Iterate String
```python
word = "code"
for letter in word:
    print(letter)

# What prints?
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.16.4**: Print Evens
```python
# Print even numbers 0-10
for i in range(???, ???, ???):
    print(i)
```

**Exercise 1.1.16.5**: Find in List
```python
words = ["cat", "dog", "bird"]
search = "dog"

for word in words:
    if word == search:
        print(f"Found {search}")
        break
else:
    print("Not found")
```

**Exercise 1.1.16.6**: Sum List
```python
numbers = [5, 10, 15, 20]
total = 0

for num in ???:
    total += num

print(total)  # Should be 50
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.16.7**: Multiplication Table
```python
# Print 1-3 times 1-3
for row in range(1, 4):
    for col in range(1, 4):
        print(f"{row * col:3}", end=" ")
    print()
```

**Exercise 1.1.16.8**: Reverse List
```python
# Print list in reverse using range()
items = ["a", "b", "c", "d"]

for i in range(len(items) - 1, -1, -1):
    print(items[i])
```

**Exercise 1.1.16.9**: Build String
```python
# Create string "aaaabbbbcccc" using loops
result = ""

for letter in ["a", "b", "c"]:
    for count in range(??):
        result += letter

print(result)
```

---

## Mini-Project: Times Table Generator

Create a program that generates customizable multiplication tables.

```python
print("="*50)
print("MULTIPLICATION TABLE GENERATOR")
print("="*50)

# User input
try:
    size = int(input("Table size (e.g., 5 for 5×5): "))
    
    if size <= 0:
        print("Size must be positive")
    else:
        print()
        
        # Header
        print("    ", end="")
        for col in range(1, size + 1):
            print(f"{col:4}", end="")
        print()
        print("-" * (size * 4 + 4))
        
        # Rows
        for row in range(1, size + 1):
            print(f"{row:2} |", end="")
            for col in range(1, size + 1):
                result = row * col
                print(f"{result:4}", end="")
            print()
        
        print("\n✓ Table complete!")

except ValueError:
    print("Enter a valid number")
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **`for` loops require you to manually update a counter.**
   - Answer: False (automatic iteration)

2. **`range(5)` generates numbers 0, 1, 2, 3, 4.**
   - Answer: True

3. **`range(start, stop, step)` includes the stop value.**
   - Answer: False (stop is exclusive)

4. **`break` in nested `for` loops exits only the innermost loop.**
   - Answer: True

---

### Conceptual Questions

5. **When would you use `for` instead of `while`?**
   - Expected: When you know sequence/number of iterations

6. **What's the difference between `range(5)` and `range(1, 6)`?**
   - Expected: First: 0-4; Second: 1-5

7. **How do you access both index and value in a `for` loop?**
   - Expected: Use `range(len())` with index, or `enumerate()` (later)

---

### Coding Challenge

8. **Create a program that:**
   - Asks for a number
   - Prints its multiplication table (1-10)
   - Repeats until user enters 0

   ```python
   while True:
       num = int(input("Number (0 to quit): "))
       
       if num == 0:
           break
       
       print(f"\n{num} Times Table:")
       for i in range(1, 11):
           print(f"{num} × {i:2} = {num * i:3}")
       print()
   ```

---

## Key Takeaways

✅ **`for` loops iterate over sequences** - Cleaner than `while` for known iterations  
✅ **`range()` generates numeric sequences** - `range(start, stop, step)` pattern  
✅ **Strings and lists are iterable** - Can loop directly with `for item in sequence`  
✅ **Use `range(len())` when you need index** - Useful for ordered access  
✅ **`break` and `continue` work in `for` loops** - Same as with `while`

---

## Additional Resources

- [Python `for` Loop](https://docs.python.org/3/tutorial/controlflow.html#for-statements)
- [Python `range()` Function](https://docs.python.org/3/library/functions.html#func-range)
- [Iterating in Python](https://docs.python.org/3/tutorial/controlflow.html#break-and-continue)

---

## Next Lesson Preview

**Lesson 1.1.17**: Nested Loops & Loop Patterns
- Proper nesting techniques
- Common patterns (grids, tables, searches)
- Performance considerations

---

## Homework

- [ ] Complete Exercises 1.1.16.1 - 1.1.16.9
- [ ] Build and test the Times Table Generator
- [ ] Enhance with formatting options
- [ ] Challenge: Add reverse table option
- [ ] Quiz: Answer all assessment questions

**Expected time**: 2-3 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.17** when you're ready.
