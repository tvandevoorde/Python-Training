# Lesson 1.1.17: Nested Loops & Loop Patterns

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.16 (`for` Loops & `range()`) | **Topic**: Loops - Advanced Structures

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Write and understand nested `for` and `while` loops
- Apply common loop patterns (accumulation, search, filtering)
- Work with 2D data structures (lists of lists)
- Optimize loops for performance
- Debug complex nested loop logic

---

## 1. Understanding Nested Loops (60 min)

### 1.1 What Are Nested Loops?

```python
# Nested loop: loop inside another loop
# Outer loop runs fully; inner loop runs fully for each outer

print("=== NESTED LOOP EXECUTION ===")

for outer in range(1, 3):  # Runs 2 times
    print(f"Outer loop iteration: {outer}")
    
    for inner in range(1, 3):  # Runs 2 times each outer
        print(f"  Inner loop iteration: {inner}")

# Output:
# Outer loop iteration: 1
#   Inner loop iteration: 1
#   Inner loop iteration: 2
# Outer loop iteration: 2
#   Inner loop iteration: 1
#   Inner loop iteration: 2
```

### 1.2 Counting Nested Loop Iterations

```python
# Total iterations = outer × inner

# 3 × 4 = 12 iterations
total_iterations = 0
for i in range(3):
    for j in range(4):
        total_iterations += 1

print(f"Total iterations: {total_iterations}")  # 12

# Visual representation:
# Row 1: (0,0) (0,1) (0,2) (0,3)
# Row 2: (1,0) (1,1) (1,2) (1,3)
# Row 3: (2,0) (2,1) (2,2) (2,3)
```

### 1.3 Different Loop Types Combined

```python
# while + for
print("=== WHILE + FOR ===")

attempts = 0
while attempts < 2:
    print(f"Attempt {attempts + 1}:")
    for i in range(3):
        print(f"  Step {i + 1}")
    attempts += 1

# for + while
print("\n=== FOR + WHILE ===")

for row in range(2):
    print(f"Row {row}:")
    col = 0
    while col < 3:
        print(f"  Col {col}")
        col += 1
```

---

## 2. Working with 2D Data (90 min)

### 2.1 Lists of Lists

```python
# 2D data structure - list containing lists
matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

# Access element: matrix[row][col]
print(matrix[0][0])  # 1
print(matrix[1][2])  # 6
print(matrix[2][1])  # 8

# Print entire matrix row by row
for row in matrix:
    print(row)

# Output:
# [1, 2, 3]
# [4, 5, 6]
# [7, 8, 9]
```

### 2.2 Iterating Over 2D Data

```python
# Method 1: Iterate rows, then elements
matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

print("Method 1: Iterate rows")
for row in matrix:
    for element in row:
        print(element, end=" ")
print()

# Method 2: Use indices
print("\nMethod 2: Use indices")
for i in range(len(matrix)):
    for j in range(len(matrix[i])):
        print(matrix[i][j], end=" ")
print()

# Output (both):
# 1 2 3 4 5 6 7 8 9
```

### 2.3 Processing 2D Data

```python
# Sum all elements
matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

total = 0
for row in matrix:
    for element in row:
        total += element

print(f"Sum: {total}")  # 45

# Find maximum
maximum = float('-inf')
for row in matrix:
    for element in row:
        if element > maximum:
            maximum = element

print(f"Max: {maximum}")  # 9

# Count occurrences
count = 0
target = 5
for row in matrix:
    for element in row:
        if element == target:
            count += 1

print(f"{target} appears {count} time(s)")  # 1
```

---

## 3. Common Loop Patterns (90 min)

### 3.1 Accumulation Pattern

```python
# Keep running total of values
total = 0
numbers = [10, 20, 30, 40, 50]

for num in numbers:
    total += num

print(f"Total: {total}")  # 150

# Product (multiply)
product = 1
for num in numbers:
    product *= num

print(f"Product: {product}")  # 12000000

# String accumulation
result = ""
for letter in "hello":
    result += letter.upper()

print(f"Result: {result}")  # HELLO
```

### 3.2 Search/Find Pattern

```python
# Find first item matching condition
target = 25
numbers = [10, 15, 25, 30, 35]
found = False

for num in numbers:
    if num == target:
        print(f"Found: {num}")
        found = True
        break

if not found:
    print("Not found")

# Find all matches
matches = []
numbers = [1, 5, 2, 5, 3, 5]
target = 5

for num in numbers:
    if num == target:
        matches.append(num)

print(f"Matches: {matches}")  # [5, 5, 5]
```

### 3.3 Filter/Selection Pattern

```python
# Select items matching criteria
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
evens = []

for num in numbers:
    if num % 2 == 0:
        evens.append(num)

print(f"Even numbers: {evens}")  # [2, 4, 6, 8, 10]

# Multiple criteria
high_scores = [95, 42, 88, 75, 62, 91]
passed = []

for score in high_scores:
    if score >= 70:
        passed.append(score)

print(f"Passed (70+): {passed}")  # [95, 88, 75, 91]
```

### 3.4 Count/Frequency Pattern

```python
# Count items matching condition
numbers = [1, 2, 1, 3, 1, 2, 4]

count_ones = 0
for num in numbers:
    if num == 1:
        count_ones += 1

print(f"Count of 1s: {count_ones}")  # 3

# Count multiple categories
grades = ['A', 'B', 'A', 'C', 'A', 'B']
count_a = 0
count_b = 0
count_c = 0

for grade in grades:
    if grade == 'A':
        count_a += 1
    elif grade == 'B':
        count_b += 1
    elif grade == 'C':
        count_c += 1

print(f"A: {count_a}, B: {count_b}, C: {count_c}")  # A: 3, B: 2, C: 1
```

### 3.5 Transformation Pattern

```python
# Convert items using loop
numbers = [1, 2, 3, 4, 5]
squared = []

for num in numbers:
    squared.append(num ** 2)

print(f"Squared: {squared}")  # [1, 4, 9, 16, 25]

# String transformation
words = ["hello", "world"]
capitalized = []

for word in words:
    capitalized.append(word.capitalize())

print(f"Capitalized: {capitalized}")  # ['Hello', 'World']

# Filtering and transforming
prices = [10, 20, 15, 30, 25]
discounted = []

for price in prices:
    if price > 15:  # Filter
        discounted.append(price * 0.9)  # Transform

print(f"Discounted high prices: {discounted}")  # [18.0, 27.0, 22.5]
```

---

## 4. Grid and Table Patterns (60 min)

### 4.1 Printing Grids

```python
# 5×5 grid of dots
print("=== GRID ===")
for row in range(5):
    for col in range(5):
        print(".", end=" ")
    print()  # New line after each row

# Output:
# . . . . .
# . . . . .
# . . . . .
# . . . . .
# . . . . .
```

### 4.2 Multiplication Table

```python
print("=== MULTIPLICATION TABLE ===")

size = 5

# Print header
print("    ", end="")
for col in range(1, size + 1):
    print(f"{col:4}", end="")
print()

# Print divider
print("-" * (size * 4 + 4))

# Print rows
for row in range(1, size + 1):
    print(f"{row:2} |", end="")
    for col in range(1, size + 1):
        result = row * col
        print(f"{result:4}", end="")
    print()

# Output:
#       1   2   3   4   5
# ---
# 1 |   1   2   3   4   5
# 2 |   2   4   6   8  10
# ... 
```

### 4.3 Patterns and Shapes

```python
# Triangle
print("=== TRIANGLE ===")
for i in range(1, 6):
    print("*" * i)

# Output:
# *
# **
# ***
# ****
# *****

# Diamond
print("\n=== DIAMOND ===")
size = 5
for i in range(size):
    spaces = " " * (size - i - 1)
    stars = "*" * (2 * i + 1)
    print(spaces + stars)

# Output:
#     *
#    ***
#   *****
#  *******
# *********
```

---

## 5. Performance Considerations (60 min)

### 5.1 Time Complexity

```python
# O(n) - Simple loop
count = 0
for i in range(1000):
    count += 1

# O(n²) - Nested loop with all pairs
count = 0
for i in range(100):
    for j in range(100):
        count += 1
# 10,000 iterations!

# O(n³) - Triple nested
count = 0
for i in range(10):
    for j in range(10):
        for k in range(10):
            count += 1
# 1,000 iterations
```

### 5.2 Avoiding Unnecessary Work

```python
# ❌ INEFFICIENT: len() called every iteration
items = [1, 2, 3, 4, 5]
for i in range(len(items)):  # len(items) computed each time
    print(items[i])

# ✅ EFFICIENT: len() computed once
items = [1, 2, 3, 4, 5]
n = len(items)
for i in range(n):
    print(items[i])

# ❌ INEFFICIENT: Complex operation in loop
total = 0
for i in range(1000):
    value = expensive_function(i)  # Called 1000 times
    total += value

# ✅ EFFICIENT: Compute once if possible
result = []
for i in range(1000):
    result.append(i * 2)
```

### 5.3 Breaking Early

```python
# ❌ INEFFICIENT: Check all items even after finding
target = 50
found = False
for num in range(1, 1000):
    if num == target:
        found = True
    # Continues checking rest!

# ✅ EFFICIENT: Exit immediately when found
target = 50
for num in range(1, 1000):
    if num == target:
        break  # Exit immediately
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.17.1**: Simple Nested Loop
```python
for i in range(2):
    for j in range(3):
        print(f"({i},{j})", end=" ")

# What prints?
```

**Exercise 1.1.17.2**: Grid
```python
for row in range(3):
    for col in range(4):
        print("*", end="")
    print()

# What prints?
```

**Exercise 1.1.17.3**: Accumulation
```python
total = 0
for num in [1, 2, 3, 4]:
    total += num

print(total)  # What prints?
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.17.4**: Filter Pattern
```python
numbers = [1, 5, 3, 8, 2, 7, 4]
above_five = []

for num in numbers:
    if ???:
        above_five.append(num)

# Complete to keep only numbers > 5
```

**Exercise 1.1.17.5**: 2D Sum
```python
matrix = [
    [1, 2, 3],
    [4, 5, 6]
]

total = 0
for row in matrix:
    for element in row:
        total += element

print(total)  # What prints?
```

**Exercise 1.1.17.6**: Count Pattern
```python
items = ['a', 'b', 'a', 'c', 'a']
count_a = 0

for item in items:
    if item == 'a':
        count_a += 1

print(????)  # Print count
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.17.7**: Search in 2D
```python
grid = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

target = 5
found = False

for row in grid:
    for element in row:
        if element == target:
            found = True
            break
    if found:
        break

print(f"Found: {found}")
```

**Exercise 1.1.17.8**: Transform List
```python
numbers = [1, 2, 3, 4, 5]
squared = []

for num in numbers:
    squared.append(num ** 2)

print(squared)  # [1, 4, 9, 16, 25]
```

**Exercise 1.1.17.9**: Complex Pattern
```python
# Count grades above 80
grades = [
    [85, 92, 78],
    [95, 88, 76],
    [80, 91, 89]
]

high_count = 0

for row in grades:
    for grade in row:
        if grade > 80:
            high_count += 1

print(f"Grades > 80: {high_count}")
```

---

## Mini-Project: Grade Statistics Calculator

Analyze student grades using nested loops.

```python
print("="*50)
print("GRADE STATISTICS CALCULATOR")
print("="*50)

# Student grades [Math, English, Science]
students = {
    "Alice": [92, 88, 95],
    "Bob": [78, 85, 82],
    "Charlie": [95, 92, 88],
    "Diana": [88, 90, 94]
}

print("\n=== STUDENT AVERAGES ===")

class_total = 0
all_grades_count = 0

for student, grades in students.items():
    student_total = 0
    
    for grade in grades:
        student_total += grade
        all_grades_count += 1
    
    average = student_total / len(grades)
    class_total += student_total
    
    print(f"{student:10} → Average: {average:.1f}")

class_average = class_total / all_grades_count
print(f"\nClass Average: {class_average:.1f}")

# Find highest and lowest
print("\n=== SUBJECT STATISTICS ===")

subjects = ["Math", "English", "Science"]
for subject_idx, subject in enumerate(subjects):
    grades_in_subject = []
    
    for student, grades in students.items():
        grades_in_subject.append(grades[subject_idx])
    
    avg = sum(grades_in_subject) / len(grades_in_subject)
    highest = max(grades_in_subject)
    lowest = min(grades_in_subject)
    
    print(f"{subject:10} → Avg: {avg:.1f} | High: {highest} | Low: {lowest}")

print("\n✓ Analysis complete!")
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **Nested loops multiply total iterations.**
   - Answer: True (2×3 = 6 iterations)

2. **In nested loops, `break` exits both loops.**
   - Answer: False (only innermost)

3. **A 2D list is a list containing other lists.**
   - Answer: True

4. **Triple nested loops give O(n³) complexity.**
   - Answer: True

---

### Conceptual Questions

5. **What's the purpose of the accumulation pattern?**
   - Expected: Combine values (sum, product, concatenation) into single result

6. **When would you use a filter pattern?**
   - Expected: When selecting items matching specific criteria

7. **What does breaking early improve?**
   - Expected: Performance/efficiency by avoiding unnecessary iterations

---

### Coding Challenge

8. **Create a program that:**
   - Takes a list of numbers
   - Finds the sum of all even numbers
   - Counts odd numbers
   - Prints both results

   ```python
   numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
   
   even_sum = 0
   odd_count = 0
   
   for num in numbers:
       if num % 2 == 0:
           even_sum += num
       else:
           odd_count += 1
   
   print(f"Sum of evens: {even_sum}")
   print(f"Count of odds: {odd_count}")
   ```

---

## Key Takeaways

✅ **Nested loops: total iterations = outer × inner** - Understand complexity  
✅ **Accumulation: maintain running total** - Sum, product, string building  
✅ **Search/Filter: use break and conditions** - Early exit when found  
✅ **2D data: iterate rows then elements** - Proper structure for matrices  
✅ **Performance: avoid unnecessary work** - Cache values, break early

---

## Additional Resources

- [Nested Loop Best Practices](https://docs.python.org/3/tutorial/controlflow.html)
- [Time Complexity Basics](https://en.wikipedia.org/wiki/Time_complexity)
- [Loop Optimization](https://realpython.com/loops-in-python/)

---

## Next Lesson Preview

**Lesson 1.1.18**: Loop Patterns Deep Dive
- Advanced patterns: merge, zip, transpose
- Nested loop optimization
- Real-world applications

---

## Homework

- [ ] Complete Exercises 1.1.17.1 - 1.1.17.9
- [ ] Build and test the Grade Statistics Calculator
- [ ] Extend with more students
- [ ] Challenge: Add grade distribution analysis
- [ ] Quiz: Answer all assessment questions

**Expected time**: 2-3 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.18** when you're ready.
