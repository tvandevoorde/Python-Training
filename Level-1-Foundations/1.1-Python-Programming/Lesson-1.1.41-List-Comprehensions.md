# Lesson 1.1.40: List Comprehensions and Elegant Data Transformation

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.1.1-1.1.6, 1.1.39 (Lists Fundamentals)

---

## Learning Objectives

By the end of this lesson, you will:

1. **Understand** list comprehension syntax and how it replaces for loops
2. **Write** simple, filtered, and conditional list comprehensions
3. **Recognize** when comprehensions improve vs. harm readability
4. **Create** nested comprehensions for complex transformations
5. **Contrast** comprehensions with traditional loops for performance and clarity
6. **Apply** comprehensions to real-world data processing tasks
7. **Troubleshoot** common comprehension errors

---

## 1. What Are List Comprehensions? (60 min)

### 1.1 Introduction to List Comprehensions

A **list comprehension** is a concise way to create a new list by transforming items from an existing list or iterable. It's a alternative to traditional `for` loops that is often more readable and performant.

**Basic Formula:**
```
[expression for item in iterable]
```

**With Filter:**
```
[expression for item in iterable if condition]
```

**Why Use Comprehensions:**
- More concise and readable (once you get used to the syntax)
- Often faster than equivalent for loops
- Less code to maintain
- Supported by many Python tools for optimization

### 1.2 Comprehension vs. Traditional Loop

```python
# Traditional approach (imperative)
squares = []
for num in range(1, 6):
    squares.append(num ** 2)
print(squares)  # [1, 4, 9, 16, 25]

# List comprehension (declarative)
squares = [num ** 2 for num in range(1, 6)]
print(squares)  # [1, 4, 9, 16, 25]

# Both produce identical results, but comprehension is more concise
```

---

## 2. Basic List Comprehensions (75 min)

### 2.1 Simple Transformations

```python
# Transform each element
numbers = [1, 2, 3, 4, 5]
doubled = [n * 2 for n in numbers]
print(doubled)  # [2, 4, 6, 8, 10]

# String conversion
values = [10, 20, 30, 40]
strings = [str(v) for v in values]
print(strings)  # ['10', '20', '30', '40']

# Type conversion
word = "hello"
ascii_codes = [ord(char) for char in word]
print(ascii_codes)  # [104, 101, 108, 108, 111]

# Mathematical operations
temps_celsius = [0, 10, 20, 30]
temps_fahrenheit = [c * 9/5 + 32 for c in temps_celsius]
print(temps_fahrenheit)  # [32.0, 50.0, 68.0, 86.0]

# Creating range-based lists
first_10_squares = [i**2 for i in range(1, 11)]
print(first_10_squares)  # [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
```

### 2.2 Creating Lists from Strings

```python
# Convert string to list of characters
word = "python"
chars = [c for c in word]
print(chars)  # ['p', 'y', 't', 'h', 'o', 'n']

# Convert string to uppercase characters
uppercase = [c.upper() for c in "hello world"]
print(uppercase)  # ['H', 'E', 'L', 'L', 'O', ' ', 'W', 'O', 'R', 'L', 'D']

# Extract only alphabetic characters
text = "Hello123World456"
letters_only = [c for c in text if c.isalpha()]
print(letters_only)  # ['H', 'e', 'l', 'l', 'o', 'W', 'o', 'r', 'l', 'd']
```

### 2.3 Comprehensions with Function Calls

```python
# Apply function to each element
def square(x):
    return x ** 2

numbers = [1, 2, 3, 4, 5]
squared = [square(n) for n in numbers]
print(squared)  # [1, 4, 9, 16, 25]

# Chain multiple function calls
names = ["alice", "bob", "charlie"]
formatted = [name.upper().replace("A", "@") for name in names]
print(formatted)  # ['@LICE', 'BOB', 'CH@RLIE']

# String methods
emails = ["john@example.com", "jane@example.com"]
usernames = [email.split("@")[0] for email in emails]
print(usernames)  # ['john', 'jane']
```

---

## 3. Filtered List Comprehensions (75 min)

### 3.1 Adding Conditions

```python
# Basic filtering with if
numbers = range(1, 11)
evens = [n for n in numbers if n % 2 == 0]
print(evens)  # [2, 4, 6, 8, 10]

# Filter and transform
prices = [9.99, 15.50, 5.00, 89.99, 20.00]
discounted = [price * 0.9 for price in prices if price > 10]
print(discounted)  # [13.95, 80.991, 18.0]

# Complex conditions
ages = [15, 25, 17, 30, 16, 28]
adults = [age for age in ages if age >= 18]
print(adults)  # [25, 30, 28]

# Multiple conditions (all must be true)
scores = [88, 45, 92, 58, 95, 32, 87]
good_scores = [s for s in scores if s >= 80 and s <= 99]
print(good_scores)  # [88, 92, 95, 87]
```

### 3.2 if-else in Comprehensions

```python
# Replace elements based on condition
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# Mark even/odd
labels = ["even" if n % 2 == 0 else "odd" for n in numbers]
print(labels)  # ['odd', 'even', 'odd', 'even', ...]

# Transform differently based on condition
adjusted = [n * 2 if n % 2 == 0 else n for n in numbers]
print(adjusted)  # [1, 4, 3, 8, 5, 12, 7, 16, 9, 20]

# Assign grades
scores = [92, 78, 85, 55, 88, 91]
grades = ["A" if s >= 90 else "B" if s >= 80 else "C" if s >= 70 else "F" 
          for s in scores]
print(grades)  # ['A', 'C', 'B', 'F', 'B', 'A']

# Convert and validate
values = ["10", "hello", "20", "30"]
numbers = [int(v) for v in values if v.isdigit()]
print(numbers)  # [10, 20, 30]
```

---

## 4. Nested List Comprehensions (75 min)

### 4.1 Two-Dimensional Lists

```python
# Create a multiplication table
multiplication_table = [[i * j for j in range(1, 6)] for i in range(1, 6)]
# Produces:
# [[1, 2, 3, 4, 5],
#  [2, 4, 6, 8, 10],
#  [3, 6, 9, 12, 15],
#  [4, 8, 12, 16, 20],
#  [5, 10, 15, 20, 25]]

# Print nicely
for row in multiplication_table:
    print(row)

# Create a grid
grid = [[(row, col) for col in range(3)] for row in range(3)]
print(grid)
# [[(0, 0), (0, 1), (0, 2)],
#  [(1, 0), (1, 1), (1, 2)],
#  [(2, 0), (2, 1), (2, 2)]]
```

### 4.2 Flattening Nested Lists

```python
# Flatten a 2D list to 1D
matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

flattened = [num for row in matrix for num in row]
print(flattened)  # [1, 2, 3, 4, 5, 6, 7, 8, 9]

# Flatten with filtering
filtered = [num for row in matrix for num in row if num % 2 == 1]
print(filtered)  # [1, 3, 5, 7, 9] (odds only)

# Flatten and transform
doubled = [num * 2 for row in matrix for num in row]
print(doubled)  # [2, 4, 6, 8, 10, 12, 14, 16, 18]
```

### 4.3 Building 2D Structures

```python
# Create checkerboard pattern (0s and 1s)
checkerboard = [[(i + j) % 2 for j in range(8)] for i in range(8)]
print(checkerboard)  # First row: [0, 1, 0, 1, 0, 1, 0, 1]

# Create matrix of coordinates
coordinates = [[(x, y) for x in range(3)] for y in range(3)]
print(coordinates)
# [[(0, 0), (1, 0), (2, 0)],
#  [(0, 1), (1, 1), (2, 1)],
#  [(0, 2), (1, 2), (2, 2)]]

# Transpose a matrix
original = [[1, 2, 3], [4, 5, 6]]
transposed = [[original[j][i] for j in range(len(original))] 
              for i in range(3)]
print(transposed)
# [[1, 4], [2, 5], [3, 6]]
```

---

## 5. Comprehensions with Complex Data (60 min)

### 5.1 Working with Dictionaries

```python
# Extract keys from list of dictionaries
people = [
    {"name": "Alice", "age": 25},
    {"name": "Bob", "age": 30},
    {"name": "Charlie", "age": 28}
]

names = [person["name"] for person in people]
print(names)  # ['Alice', 'Bob', 'Charlie']

# Filter dictionaries by criteria
young_people = [p for p in people if p["age"] < 29]
print(young_people)  # [{'name': 'Alice', 'age': 25}, {'name': 'Charlie', 'age': 28}]

# Extract values and calculate
salaries = [
    {"name": "Alice", "salary": 50000},
    {"name": "Bob", "salary": 60000},
    {"name": "Charlie", "salary": 55000}
]

high_earners = [person["name"] for person in salaries if person["salary"] > 52000]
print(high_earners)  # ['Bob', 'Charlie']
```

### 5.2 Comprehensions with zip()

```python
# Combine two lists
names = ["Alice", "Bob", "Charlie"]
scores = [92, 88, 95]

# Create tuples
pairs = [(name, score) for name, score in zip(names, scores)]
print(pairs)  # [('Alice', 92), ('Bob', 88), ('Charlie', 95)]

# Filter based on combined data
high_scorers = [name for name, score in zip(names, scores) if score >= 90]
print(high_scorers)  # ['Alice', 'Charlie']

# Create dictionaries from paired lists
people_dict = {name: score for name, score in zip(names, scores)}
print(people_dict)  # {'Alice': 92, 'Bob': 88, 'Charlie': 95}
```

### 5.3 Comprehensions with enumerate()

```python
# Add indices to elements
items = ["apple", "banana", "cherry"]

with_index = [(i, item) for i, item in enumerate(items)]
print(with_index)  # [(0, 'apple'), (1, 'banana'), (2, 'cherry')]

# Create indexed dictionary
indexed_dict = {i: item for i, item in enumerate(items)}
print(indexed_dict)  # {0: 'apple', 1: 'banana', 2: 'cherry'}

# Filter elements at specific indices
every_other = [item for i, item in enumerate(items) if i % 2 == 0]
print(every_other)  # ['apple', 'cherry']
```

---

## 6. Performance and Best Practices (60 min)

### 6.1 When Comprehensions Excel

```python
import time

# Test: Create list of 1 million squared numbers

# Method 1: Traditional loop
start = time.time()
squares_loop = []
for i in range(1000000):
    squares_loop.append(i ** 2)
loop_time = time.time() - start

# Method 2: List comprehension
start = time.time()
squares_comp = [i ** 2 for i in range(1000000)]
comp_time = time.time() - start

print(f"Loop time: {loop_time:.4f}s")
print(f"Comprehension time: {comp_time:.4f}s")
print(f"Comprehension is ~{loop_time/comp_time:.1f}x faster")
# Comprehension is typically 1.5-2x faster
```

### 6.2 Readability Considerations

```python
# GOOD: Simple, clear comprehension
evens = [n for n in range(10) if n % 2 == 0]

# OKAY: Slightly complex but still readable
grades = ["A" if s >= 90 else "B" if s >= 80 else "C" 
          for s in [92, 78, 85]]

# HARD TO READ: Too nested
# Don't do this:
# result = [[[[nested for nested in levels] for levels in structure] for structure in data] for data in dataset]

# Instead, use a loop for complex nesting:
result = []
for data in dataset:
    for structure in data:
        for levels in structure:
            for nested in levels:
                result.append(nested)
```

### 6.3 Memory Considerations

```python
# List comprehension creates entire list in memory
all_numbers = [i for i in range(1000000)]  # Uses ~40MB

# For large sequences, use generator expressions (memory efficient)
number_gen = (i for i in range(1000000))  # Uses minimal memory

# Convert generator to list if needed
some_numbers = list(number_gen)

# Generator expression syntax is same as comprehension but with ()
doubled_gen = (x * 2 for x in range(1000000))
for value in doubled_gen:
    print(value)  # Process one at a time
```

---

## 7. Advanced Patterns (60 min)

### 7.1 Comprehensions with Map and Filter

```python
# Comprehensions are often preferred over map() and filter()

# Using map()
numbers = [1, 2, 3, 4, 5]
squared_map = list(map(lambda x: x**2, numbers))

# Using comprehension (more readable)
squared_comp = [x**2 for x in numbers]

# Using filter()
evens_filter = list(filter(lambda x: x % 2 == 0, numbers))

# Using comprehension (more readable)
evens_comp = [x for x in numbers if x % 2 == 0]
```

### 7.2 Set and Dictionary Comprehensions

```python
# Set comprehension (removes duplicates)
numbers = [1, 2, 2, 3, 3, 3, 4]
unique = {n for n in numbers}  # Uses {}
print(unique)  # {1, 2, 3, 4}

# Dict comprehension
grades = ["A", "B", "A", "C", "B"]
grade_counts = {grade: grades.count(grade) for grade in set(grades)}
print(grade_counts)  # {'A': 2, 'B': 2, 'C': 1}

# Dict comprehension with conditional
students = ["Alice", "Bob", "Charlie", "Diana"]
student_dict = {name: len(name) for name in students if len(name) > 4}
print(student_dict)  # {'Alice': 5, 'Charlie': 7, 'Diana': 5}
```

### 7.3 Comprehensions with Side Effects (Antipattern)

```python
# DON'T DO THIS: Comprehensions with side effects
results = []
doubles = [results.append(n * 2) for n in range(5)]
# Returns [None, None, None, None, None] - confusing!

# Instead, use a traditional loop:
results = []
for n in range(5):
    results.append(n * 2)
print(results)  # [0, 2, 4, 6, 8]

# Or if you must use a comprehension for the transformation:
doubles = [n * 2 for n in range(5)]
print(doubles)  # [0, 2, 4, 6, 8]
```

---

## 8. Common Errors and Debugging (45 min)

### 8.1 Syntax and Scope Errors

```python
# ERROR: Missing 'for' keyword
try:
    bad = [x * 2 x in range(5)]  # SyntaxError
except SyntaxError as e:
    print("Forgot 'for'?")

# ERROR: Variable not defined in outer scope
outer = 5
result = [outer * x for x in range(3)]  # Okay - outer is accessible
print(result)  # [0, 5, 10]

# Variables created in comprehension don't leak (in Python 3)
[y for y in range(5)]
try:
    print(y)  # Will print 4 in Python 3 - loop variable exists
except NameError:
    print("y not defined")
```

### 8.2 Logic Errors

```python
# ERROR: Condition in wrong place
numbers = [1, 2, 3, 4, 5]

# WRONG: Condition filters but doesn't transform
evens_wrong = [n if n % 2 == 0 for n in numbers]
# Returns [None, 2, None, 4, None] - not intended!

# CORRECT: Filter first, then apply
evens_correct = [n for n in numbers if n % 2 == 0]
print(evens_correct)  # [2, 4]

# ERROR: Nested loop order confusion
matrix = [[1, 2], [3, 4], [5, 6]]

# Outer loop iterates rows, inner loop iterates columns
flattened = [num for row in matrix for num in row]
print(flattened)  # [1, 2, 3, 4, 5, 6]

# If reversed, it's wrong
wrong = [num for num in row for row in matrix]  # NameError! row not defined
```

### 8.3 Type Errors

```python
# ERROR: Iterating over non-iterable
try:
    result = [x for x in 5]  # TypeError - can't iterate int
except TypeError:
    print("Can only iterate over iterables")

# ERROR: Operations on mismatched types
values = ["10", "20", "30"]
total = sum([int(v) for v in values])  # Convert strings first
print(total)  # 60

# ERROR: Indexing inside comprehension
data = [1, 2, 3]
result = [data[i] for i in range(10)]  # IndexError if i >= 3
# Safe version:
safe_result = [data[i] if i < len(data) else None for i in range(10)]
```

---

## 9. Mini-Project: Data Processing Pipeline

**Objective:** Process student data using comprehensions

```python
# Student records: [name, grade1, grade2, grade3]
students = [
    ["Alice", 92, 88, 95],
    ["Bob", 78, 82, 75],
    ["Charlie", 88, 91, 85],
    ["Diana", 95, 93, 97],
    ["Eve", 65, 70, 68]
]

# Task 1: Extract names
names = [student[0] for student in students]
print("Names:", names)

# Task 2: Calculate average for each student
averages = [sum(student[1:]) / 3 for student in students]
print("Averages:", averages)

# Task 3: Create name-average pairs
name_avg = [(student[0], round(sum(student[1:]) / 3, 1)) 
            for student in students]
print("Name-Average pairs:", name_avg)

# Task 4: Find high performers (average >= 85)
high_performers = [student[0] for student in students 
                   if sum(student[1:]) / 3 >= 85]
print("High performers:", high_performers)

# Task 5: Get all grades > 85
high_grades = [grade for student in students for grade in student[1:] 
               if grade > 85]
print("Grades > 85:", high_grades)

# Task 6: Create detailed report
report = {student[0]: {
    "avg": round(sum(student[1:]) / 3, 1),
    "passed": sum(student[1:]) / 3 >= 70
} for student in students}
print("Report:", report)

# Task 7: Find students with inconsistent grades
inconsistent = [student[0] for student in students 
                if max(student[1:]) - min(student[1:]) > 15]
print("Inconsistent grades:", inconsistent)
```

**Expected Output:**
```
Names: ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve']
Averages: [91.67, 78.33, 88.0, 95.0, 67.67]
Name-Average pairs: [('Alice', 91.7), ('Bob', 78.3), ('Charlie', 88.0), ('Diana', 95.0), ('Eve', 67.7)]
High performers: ['Alice', 'Charlie', 'Diana']
Grades > 85: [92, 88, 95, 88, 91, 85, 95, 93, 97]
Report: {'Alice': {'avg': 91.7, 'passed': True}, ...}
Inconsistent grades: ['Bob']
```

---

## 10. Graded Exercises

### Starter Exercises (40 minutes)

**Starter Exercise 1: Basic Comprehensions**
```python
# TODO: Use list comprehensions to:
# 1. Square all numbers from 1-10
# 2. Convert strings to uppercase
# 3. Extract first letters of names

numbers = range(1, 11)
names = ["alice", "bob", "charlie"]

# Your code here
```

**Starter Exercise 2: Filtered Comprehensions**
```python
# TODO: Filter using comprehensions:
# 1. Keep only even numbers from 1-20
# 2. Keep only strings with length > 3
# 3. Keep only positive numbers from mixed list

mixed = [5, -3, 10, -1, 0, 8, -2, 15]
words = ["a", "hello", "ok", "world", "I"]

# Your code here
```

**Starter Exercise 3: Transform and Filter**
```python
# TODO: Apply transformation with condition:
# 1. Double all numbers greater than 5
# 2. Convert to uppercase only words starting with 'a'

data = [1, 6, 3, 8, 2, 9]
words = ["apple", "banana", "apricot", "cherry"]

# Your code here
```

### Intermediate Exercises (60 minutes)

**Intermediate Exercise 1: Conditional Comprehensions**
```python
# TODO: Grade students based on average
# Create a dict with name and grade using comprehension
# A: 90+, B: 80-89, C: 70-79, F: <70

scores = [
    ["Alice", 92, 88, 95],
    ["Bob", 78, 82, 75],
    ["Charlie", 88, 91, 85]
]

def grade_students(student_data):
    """Return dict with name: letter_grade"""
    # Your code here
    pass

result = grade_students(scores)
# Expected: {'Alice': 'A', 'Bob': 'C', 'Charlie': 'B'}
```

**Intermediate Exercise 2: Nested Comprehension**
```python
# TODO: Work with 2D data
# 1. Flatten a 2D list into 1D
# 2. Extract only numbers divisible by 3
# 3. Create a transposed matrix

matrix_2d = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

# Your code here
```

**Intermediate Exercise 3: Dictionary Operations**
```python
# TODO: Process product data using comprehensions
# 1. Create name: price dict
# 2. Find products under $20
# 3. Calculate total value of stock

products = [
    ["Laptop", 899, 5],
    ["Mouse", 25, 30],
    ["Keyboard", 85, 10],
    ["Monitor", 300, 3]
]

# [name, price, quantity]
# Your code here
```

### Advanced Exercises (90 minutes)

**Advanced Exercise 1: Complex Data Processing**
```python
# TODO: Process transaction data
# Transaction: [id, amount, category, date]
# 1. Find all transactions > $100
# 2. Group by category (create dict)
# 3. Calculate average per category
# 4. Find high-value customers (total > $500)

transactions = [
    [1, 150, "electronics", "2024-01-15"],
    [2, 45, "clothing", "2024-01-16"],
    [3, 280, "electronics", "2024-01-17"],
    [4, 90, "food", "2024-01-18"],
    [5, 200, "electronics", "2024-01-19"],
    [6, 35, "clothing", "2024-01-20"]
]

# Your code here
```

**Advanced Exercise 2: Multi-Level Comprehensions**
```python
# TODO: Work with nested data structures
# 1. Flatten 3-level nested list
# 2. Extract specific values satisfying multiple conditions
# 3. Reorganize data structure

data = [
    [[1, 2, 3], [4, 5, 6]],
    [[7, 8, 9], [10, 11, 12]],
    [[13, 14, 15], [16, 17, 18]]
]

# Your code here
```

**Advanced Exercise 3: Data Transformation Challenge**
```python
# TODO: Transform raw survey data
# Format: [respondent_id, q1_score, q2_score, q3_score, feedback]

survey_data = [
    [1, 4, 5, 5, "Great product"],
    [2, 2, 3, 2, "Needs improvement"],
    [3, 5, 5, 4, "Excellent"],
    [4, 3, 4, 3, "Average"],
    [5, 5, 5, 5, "Outstanding"]
]

# Requirements:
# 1. Create dict: respondent_id -> average_score
# 2. Find highly satisfied (avg >= 4.5)
# 3. Create performance rating ("Poor", "Good", "Excellent")
# 4. Extract and format feedback with scores

# Your code here
```

---

## 11. Self-Assessment Checklist

- [ ] I understand basic list comprehension syntax
- [ ] I can write comprehensions with filters (if conditions)
- [ ] I can use if-else in comprehensions for transformations
- [ ] I understand the difference between filter conditions and if-else
- [ ] I can write nested comprehensions (2D lists)
- [ ] I know how to flatten nested lists
- [ ] I can use comprehensions with multiple iterators
- [ ] I understand when comprehensions are appropriate
- [ ] I know comprehensions are faster than loops for many tasks
- [ ] I can debug common comprehension errors
- [ ] I know about set and dict comprehensions

---

## 12. Assessment Questions

**True/False:**
1. List comprehensions are always faster than for loops ✓/✗
2. The syntax `[x for x in list]` creates a copy of the list ✓/✗
3. You can use `break` inside a comprehension ✓/✗
4. Comprehensions are easier to read than loops for simple transformations ✓/✗

**Short Answer:**
1. Explain the difference between `[x if x > 5 else None for x in list]` and `[x for x in list if x > 5]`
2. How would you flatten a list of lists using a comprehension?
3. What is a generator expression and how does it differ from a list comprehension?

**Coding Challenges:**
1. Write a comprehension that converts a list of temperatures (C) to Fahrenheit, keeping only those > 32°F
2. Given a list of words, create a dictionary where keys are the word and values are their lengths
3. Create a 3x3 matrix using a nested comprehension

---

## 13. Additional Resources

- **Comprehension Visualization**: Tools to visualize how comprehensions work
- **Performance Testing**: Comparing comprehensions vs. loops
- **Generator Expressions**: Memory-efficient alternative to comprehensions
- **Next Lesson Preview**: Dictionary operations and structures

---

**Next Lesson:** Lesson 1.1.41 - Dictionaries Fundamentals




