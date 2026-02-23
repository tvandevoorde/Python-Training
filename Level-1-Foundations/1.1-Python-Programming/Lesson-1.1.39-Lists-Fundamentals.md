# Lesson 1.1.39: Lists Fundamentals

**Estimated Time**: 8 hours | **Difficulty**: Beginner-Intermediate  
**Prerequisites**: Lessons 1.1.1-1.1.6 (variables, operators, basic types)

---

## Learning Objectives

By the end of this lesson, you will:

1. **Create and initialize** lists using literals and constructors
2. **Access and modify** list elements using indexing and slicing
3. **Apply** list methods (`append`, `extend`, `insert`, `remove`, `pop`, `clear`)
4. **Iterate** through lists using `for` loops and comprehensions
5. **Understand** how lists are mutable and reference-based
6. **Solve** real-world problems using lists for data collection and manipulation
7. **Debug** common list-related errors and edge cases

---

## 1. What Are Lists and Why They Matter (60 min)

### 1.1 Introduction to Lists

A **list** is an ordered, mutable collection of items in Python. Unlike variables that hold a single value, lists can store multiple values together.

**Key Characteristics:**
- **Ordered**: Items have a specific position (index)
- **Mutable**: Items can be modified, added, or removed after creation
- **Mixed types**: Can contain different data types in the same list
- **Indexed**: Access items using integer positions (starting at 0)

**Why Lists Matter:**
- Process collections of data efficiently
- Store multiple related values together
- Prepare data for loops and analysis
- Build more complex data structures

### 1.2 Real-World List Scenarios

```python
# E-commerce store: multiple product prices
product_prices = [29.99, 15.50, 89.00, 5.99]

# Student grades management
grades = [92, 88, 95, 77, 85]

# Mixed data: user profile
user_profile = ["Alice Johnson", 28, "alice@email.com", True]

# Empty list for later use
shopping_cart = []

# Temperature readings (in Celsius)
daily_temps = [18, 20, 19, 21, 22, 20, 18]
```

---

## 2. Creating and Initializing Lists (75 min)

### 2.1 List Creation Methods

```python
# Method 1: List literal (most common)
fruits = ["apple", "banana", "orange"]
print(fruits)  # Output: ['apple', 'banana', 'orange']

# Method 2: Using list() constructor
numbers = list()  # Empty list
print(numbers)  # Output: []

numbers = list([1, 2, 3, 4])  # Convert tuple to list
print(numbers)  # Output: [1, 2, 3, 4]

# Method 3: Convert string to list
word = "hello"
letters = list(word)
print(letters)  # Output: ['h', 'e', 'l', 'l', 'o']

# Method 4: List with range
counts = list(range(1, 6))
print(counts)  # Output: [1, 2, 3, 4, 5]

# Method 5: List with mixed types
mixed_list = [42, "Python", 3.14, True, None]
print(mixed_list)  # Output: [42, 'Python', 3.14, True, None]
```

### 2.2 Determining List Length

```python
# Using len() function
grades = [95, 87, 92, 88, 90]
print(len(grades))  # Output: 5

# Empty list has length 0
empty = []
print(len(empty))  # Output: 0

# Mixed list
data = [1, "two", 3.0, None]
print(len(data))  # Output: 4

# Length changes dynamically
scores = []
print(len(scores))  # Output: 0
# (We'll add items next)
```

---

## 3. Accessing List Elements with Indexing (90 min)

### 3.1 Positive Indexing

```python
# List indexing starts at 0
days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]

print(days[0])  # Output: Monday (first element)
print(days[1])  # Output: Tuesday (second element)
print(days[4])  # Output: Friday (last element)

# Accessing from variables
index = 2
print(days[index])  # Output: Wednesday

# Index out of range error
try:
    print(days[10])  # Error: list index out of range
except IndexError as e:
    print(f"Error: {e}")
```

### 3.2 Negative Indexing

```python
# Negative indices count from the end
movies = ["Inception", "Matrix", "Avatar", "Interstellar"]

print(movies[-1])  # Output: Interstellar (last)
print(movies[-2])  # Output: Avatar (second to last)
print(movies[-4])  # Output: Inception (first)

# Practical use case
last_grade = grades[-1]  # Get most recent grade
first_grade = grades[0]  # Get earliest grade

# Convert negative to positive
scores = [88, 92, 85, 95]
print(scores[-2])  # Same as scores[2]
print(scores[len(scores) - 2])  # Equivalent: scores[2]
```

### 3.3 Slicing Lists

```python
# Syntax: list[start:stop:step]
# - start: inclusive (default 0)
# - stop: exclusive (default end)
# - step: increment (default 1)

numbers = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# Basic slicing
print(numbers[2:5])      # Output: [2, 3, 4] (positions 2,3,4)
print(numbers[0:3])      # Output: [0, 1, 2] (first 3 elements)
print(numbers[5:])       # Output: [5, 6, 7, 8, 9] (from 5 to end)
print(numbers[:4])       # Output: [0, 1, 2, 3] (up to position 4)
print(numbers[:])        # Output: [0, 1, 2, ..., 9] (copy of full list)

# Slicing with step
print(numbers[::2])      # Output: [0, 2, 4, 6, 8] (every 2nd element)
print(numbers[1::2])     # Output: [1, 3, 5, 7, 9] (odd positions)
print(numbers[::-1])     # Output: [9, 8, 7, ..., 0] (reversed)

# Negative indices in slicing
months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
print(months[-3:])       # Output: ['Oct', 'Nov', 'Dec'] (last 3 months)
print(months[:-3])       # Output: ['Jan', ... 'Sep'] (all but last 3)
print(months[-6:-3])     # Output: ['Jul', 'Aug', 'Sep'] (last 6 excluding last 3)
```

### 3.4 Slicing Patterns for Common Tasks

```python
# Get first half
data = list(range(1, 11))
first_half = data[:len(data)//2]
print(first_half)  # Output: [1, 2, 3, 4, 5]

# Get last half
second_half = data[len(data)//2:]
print(second_half)  # Output: [6, 7, 8, 9, 10]

# Skip first and last
middle = data[1:-1]
print(middle)  # Output: [2, 3, 4, 5, 6, 7, 8, 9]

# Get every nth element (useful for sampling)
every_third = data[::3]
print(every_third)  # Output: [1, 4, 7, 10]
```

---

## 4. Modifying Lists - Core Methods (90 min)

### 4.1 Adding Elements

```python
# Method 1: append() - add single element to end
shopping = ["milk", "bread"]
shopping.append("eggs")
print(shopping)  # Output: ['milk', 'bread', 'eggs']

# Append any type
items = [1, 2, 3]
items.append([4, 5])  # Add a list as single element
print(items)  # Output: [1, 2, 3, [4, 5]]

# Method 2: extend() - add multiple elements from iterable
fruits = ["apple"]
more_fruits = ["banana", "orange"]
fruits.extend(more_fruits)
print(fruits)  # Output: ['apple', 'banana', 'orange']

# extend() vs append()
list1 = [1, 2]
list2 = [1, 2]

list1.append([3, 4])  # Adds list as single element
list2.extend([3, 4])  # Adds individual elements

print(list1)  # Output: [1, 2, [3, 4]]
print(list2)  # Output: [1, 2, 3, 4]

# Method 3: insert() - add element at specific index
names = ["Alice", "Charlie"]
names.insert(1, "Bob")  # Insert at index 1
print(names)  # Output: ['Alice', 'Bob', 'Charlie']

# Insert at different positions
tasks = ["Task 1", "Task 2", "Task 3"]
tasks.insert(0, "Task 0")  # Insert at beginning
tasks.insert(len(tasks), "Task 4")  # Insert at end (equivalent to append)
print(tasks)  # Output: ['Task 0', 'Task 1', 'Task 2', 'Task 3', 'Task 4']
```

### 4.2 Removing Elements

```python
# Method 1: remove() - remove first occurrence of value
colors = ["red", "blue", "green", "blue"]
colors.remove("blue")  # Removes first "blue"
print(colors)  # Output: ['red', 'green', 'blue']

# Error if value not found
try:
    colors.remove("yellow")  # ValueError!
except ValueError:
    print("Color not in list")

# Method 2: pop() - remove by index and return value
stack = [10, 20, 30, 40]
last = stack.pop()  # Remove and return last element
print(last)  # Output: 40
print(stack)  # Output: [10, 20, 30]

# Pop with specific index
popped = stack.pop(1)  # Remove element at index 1
print(popped)  # Output: 20
print(stack)  # Output: [10, 30]

# Method 3: del statement - delete by index
nums = [1, 2, 3, 4, 5]
del nums[2]  # Delete element at index 2
print(nums)  # Output: [1, 2, 4, 5]

del nums[1:3]  # Delete slice
print(nums)  # Output: [1, 5]

# Method 4: clear() - remove all elements
data = [1, 2, 3, 4, 5]
data.clear()
print(data)  # Output: []
print(len(data))  # Output: 0
```

### 4.3 Modifying Elements in Place

```python
# Direct assignment
grades = [88, 92, 85, 90]
grades[1] = 95  # Update single element
print(grades)  # Output: [88, 95, 85, 90]

# Modify multiple elements
grades[0:2] = [89, 93]  # Replace slice
print(grades)  # Output: [89, 93, 85, 90]

# Use negative indexing
grades[-1] = 91  # Update last element
print(grades)  # Output: [89, 93, 85, 91]

# Multiply list to repeat
pattern = [1, 2, 3]
pattern_repeated = pattern * 3
print(pattern_repeated)  # Output: [1, 2, 3, 1, 2, 3, 1, 2, 3]

# Modify entire list
items = [1, 2, 3]
items[:] = [10, 20, 30]  # Replace all elements
print(items)  # Output: [10, 20, 30]
```

---

## 5. Key List Methods (60 min)

### 5.1 Information and Searching

```python
# count() - count occurrences of value
scores = [85, 90, 85, 95, 85, 80]
print(scores.count(85))  # Output: 3

# index() - find position of first occurrence
position = scores.index(95)
print(position)  # Output: 3

# Find next occurrence using start parameter
first_pos = scores.index(85)  # Output: 0
second_pos = scores.index(85, first_pos + 1)  # Output: 2

# Check if value in list using 'in' operator
if 90 in scores:
    print("90 is in the list")  # This prints

if 100 in scores:
    print("100 is in the list")  # This doesn't print
```

### 5.2 Sorting

```python
# sort() - sorts list in place
numbers = [3, 1, 4, 1, 5, 9, 2, 6]
numbers.sort()
print(numbers)  # Output: [1, 1, 2, 3, 4, 5, 6, 9]

# Sort strings
cities = ["Tokyo", "Paris", "Berlin", "London"]
cities.sort()
print(cities)  # Output: ['Berlin', 'London', 'Paris', 'Tokyo']

# Reverse sort
descending = [5, 2, 8, 1, 9]
descending.sort(reverse=True)
print(descending)  # Output: [9, 8, 5, 2, 1]

# Sort by length (using key parameter - advanced)
words = ["python", "code", "algorithm"]
words.sort(key=len)  # Sort by length
print(words)  # Output: ['code', 'python', 'algorithm']

# reverse() - reverse order in place
items = [1, 2, 3, 4, 5]
items.reverse()
print(items)  # Output: [5, 4, 3, 2, 1]
```

### 5.3 Creating Copies

```python
# IMPORTANT: List assignment creates reference, not copy
original = [1, 2, 3]
copy_ref = original  # Both point to same list!

copy_ref.append(4)
print(original)  # Output: [1, 2, 3, 4] - changed!
print(copy_ref)  # Output: [1, 2, 3, 4]

# Method 1: Shallow copy with slice
original = [1, 2, 3, 4, 5]
copy1 = original[:]  # Copy
copy1.append(6)
print(original)  # Output: [1, 2, 3, 4, 5] - unchanged
print(copy1)  # Output: [1, 2, 3, 4, 5, 6]

# Method 2: Using copy() method
import copy
copy2 = copy.copy(original)  # Shallow copy
copy2.pop()
print(original)  # Unchanged

# Method 3: Using list() constructor
copy3 = list(original)
print(copy3)  # [1, 2, 3, 4, 5]
```

---

## 6. Iterating Through Lists (60 min)

### 6.1 For Loop Iteration

```python
# Basic iteration (most common)
fruits = ["apple", "banana", "cherry"]
for fruit in fruits:
    print(fruit)
# Output:
# apple
# banana
# cherry

# Iterate with index using enumerate()
products = ["Laptop", "Mouse", "Keyboard"]
for index, product in enumerate(products):
    print(f"{index}: {product}")
# Output:
# 0: Laptop
# 1: Mouse
# 2: Keyboard

# Traditional index-based loop
temps = [20, 22, 19, 23, 21]
for i in range(len(temps)):
    print(f"Day {i+1}: {temps[i]}°C")
# Output:
# Day 1: 20°C
# Day 2: 22°C
# ...
```

### 6.2 Looping with Multiple Lists

```python
# Multiple lists together using zip()
names = ["Alice", "Bob", "Charlie"]
ages = [25, 30, 28]

for name, age in zip(names, ages):
    print(f"{name} is {age} years old")
# Output:
# Alice is 25 years old
# Bob is 30 years old
# Charlie is 28 years old

# zip() works with different lengths
colors = ["red", "blue"]
sizes = ["S", "M", "L", "XL"]

for color, size in zip(colors, sizes):
    print(f"{color}-{size}")
# Output:
# red-S
# blue-M
```

### 6.3 Conditional Iteration

```python
# Filter while iterating
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

for num in numbers:
    if num % 2 == 0:  # Only even numbers
        print(num, end=" ")
# Output: 2 4 6 8 10

# Break and continue
data = [10, 20, 0, 30, 40]
for value in data:
    if value == 0:
        continue  # Skip zero
    print(100 / value)
# Output:
# 10.0
# 5.0
# 3.333...
# 2.5
```

---

## 7. Common List Patterns and Best Practices (60 min)

### 7.1 Building Lists Incrementally

```python
# Pattern 1: Start empty and append
result = []
for i in range(1, 6):
    result.append(i * 2)
print(result)  # Output: [2, 4, 6, 8, 10]

# Pattern 2: Filter existing list
original = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
filtered = []
for num in original:
    if num > 5:
        filtered.append(num)
print(filtered)  # Output: [6, 7, 8, 9, 10]

# Pattern 3: Transform list
values = ["10", "20", "30"]
numbers = []
for value in values:
    numbers.append(int(value))
print(numbers)  # Output: [10, 20, 30]
```

### 7.2 Mutable Reference Gotcha

```python
# WRONG: Creating list of references
matrix_wrong = [[0] * 3] * 2  # Creates one list repeated twice
matrix_wrong[0][1] = 5        # Modifies both rows!
print(matrix_wrong)  # Output: [[0, 5, 0], [0, 5, 0]]

# CORRECT: Creating independent lists
matrix_right = [[0] * 3 for _ in range(2)]  # Each row is unique
matrix_right[0][1] = 5
print(matrix_right)  # Output: [[0, 5, 0], [0, 0, 0]]

# Modifying mutable objects in lists
accounts = [
    {"name": "Alice", "balance": 100},
    {"name": "Bob", "balance": 200}
]
accounts[0]["balance"] += 50  # Modifies dictionary in list
print(accounts[0])  # Output: {'name': 'Alice', 'balance': 150}
```

### 7.3 Performance Considerations

```python
# List operations vary in speed:
# - append(): O(1) - very fast
# - insert() at beginning: O(n) - slower for large lists
# - pop(): O(1) if last, O(n) if middle
# - remove(): O(n) - searches for value

# BETTER: Append to end instead of insert at beginning
slow = []
for i in range(1000):
    slow.insert(0, i)  # Slow due to reordering

fast = []
for i in range(1000):
    fast.append(i)  # Much faster
fast.reverse()  # Then reverse once

# Use list instead of repeatedly concatenating
bad = ""
for i in range(100):
    bad += str(i)  # Creates new string each time

good = []
for i in range(100):
    good.append(str(i))
result = "".join(good)  # Join once at end
```

---

## 8. Debugging Common List Errors (45 min)

### 8.1 Index and Slicing Errors

```python
# IndexError: list index out of range
numbers = [10, 20, 30]
try:
    print(numbers[3])  # Error! Only indices 0-2 exist
except IndexError:
    print("Index out of range")

# Slicing gracefully handles out-of-range
print(numbers[1:10])  # Output: [20, 30] - doesn't error

# Off-by-one errors in loops
items = ["a", "b", "c"]
# WRONG
for i in range(len(items) + 1):  # Goes to index 3!
    print(items[i])  # IndexError on last iteration

# CORRECT
for i in range(len(items)):
    print(items[i])  # Indices 0, 1, 2
```

### 8.2 Reference and Modification Errors

```python
# WRONG: Modifying list while iterating
data = [1, 2, 3, 4, 5]
for item in data:
    if item % 2 == 0:
        data.remove(item)  # Unpredictable behavior!

# CORRECT: Iterate over copy
data = [1, 2, 3, 4, 5]
for item in data[:]:  # Iterate over copy
    if item % 2 == 0:
        data.remove(item)
print(data)  # Output: [1, 3, 5]

# Or better: use comprehension (upcoming lesson)
data = [1, 2, 3, 4, 5]
data = [item for item in data if item % 2 != 0]
print(data)  # Output: [1, 3, 5]
```

### 8.3 Type Errors

```python
# TypeError: can't concatenate string and int
try:
    result = [1, 2] + "3"  # Wrong type
except TypeError:
    print("Can't add string to list of integers")

# CORRECT
result = [1, 2] + [3]
print(result)  # Output: [1, 2, 3]

# append() vs extend() with strings
items = ["a", "b"]
text = "cd"
items.extend(text)  # Adds "c" and "d" separately
print(items)  # Output: ['a', 'b', 'c', 'd']

items.append("fg")  # Adds "fg" as single element
print(items)  # Output: ['a', 'b', 'c', 'd', 'fg']
```

---

## 9. Mini-Project: Grade Tracker System

**Objective:** Build a grade tracking system demonstrating list fundamentals.

```python
# Grade Tracker - Track student grades for a course
def initialize_tracker():
    """Create empty grade list"""
    return []

def add_grade(grades, new_grade):
    """Add a new grade to the list"""
    if 0 <= new_grade <= 100:
        grades.append(new_grade)
        return True
    return False

def remove_last_grade(grades):
    """Remove most recent grade"""
    if grades:
        removed = grades.pop()
        return removed
    return None

def get_statistics(grades):
    """Get basic statistics about grades"""
    if not grades:
        return None
    
    return {
        "count": len(grades),
        "highest": max(grades),
        "lowest": min(grades),
        "average": sum(grades) / len(grades)
    }

def display_grades(grades):
    """Display all grades formatted"""
    if not grades:
        print("No grades recorded yet")
        return
    
    print("Grade History:")
    for i, grade in enumerate(grades, 1):
        print(f"  {i}. {grade}")

# Usage example
grades = []
add_grade(grades, 92)
add_grade(grades, 88)
add_grade(grades, 95)
add_grade(grades, 87)

display_grades(grades)
stats = get_statistics(grades)
print(f"Average: {stats['average']:.2f}")
print(f"Range: {stats['lowest']}-{stats['highest']}")

# Modify grades
grades[1] = 90  # Correct a grade
grades.sort()
print(f"Sorted grades: {grades}")
```

**Output:**
```
Grade History:
  1. 92
  2. 88
  3. 95
  4. 87
Average: 90.50
Range: 87-95
Sorted grades: [87, 88, 90, 92, 95]
```

---

## 10. Graded Exercises

### Starter Exercises (40 minutes)

**Starter Exercise 1: Create and Access**
```python
# TODO: Create a list of 5 favorite books
# TODO: Print the 1st and last book
# TODO: Print the length of the list

# Expected output:
# Books: [... your books ...]
# First book: ...
# Last book: ...
# Total books: 5
```

**Starter Exercise 2: Mini Modifications**
```python
# TODO: Create a list [10, 20, 30, 40]
# TODO: Add 50 to the end
# TODO: Insert 5 at the beginning
# TODO: Change the middle two values to [25, 35]
# TODO: Print the result

# Expected output:
# [5, 10, 25, 35, 40, 50]
```

**Starter Exercise 3: Slicing Practice**
```python
# TODO: Create a list of numbers 1-10
# TODO: Extract and print:
#   a) Every other number
#   b) The first half
#   c) The last 3 numbers
#   d) Reversed

# Expected output:
# Every other: [1, 3, 5, 7, 9]
# First half: [1, 2, 3, 4, 5]
# Last 3: [8, 9, 10]
# Reversed: [10, 9, 8, 7, 6, 5, 4, 3, 2, 1]
```

### Intermediate Exercises (60 minutes)

**Intermediate Exercise 1: List Manipulation**
```python
# TODO: Create a function that:
#   1. Takes a list of temperatures
#   2. Converts any Celsius to Fahrenheit (F = C * 9/5 + 32)
#   3. Returns list of converted temperatures
#   4. Prints statistics (min, max, average)

def celsius_to_fahrenheit(celsius_list):
    """Convert list of Celsius to Fahrenheit"""
    # Your code here
    pass

# Test
temps_c = [0, 10, 20, 30, 40]
temps_f = celsius_to_fahrenheit(temps_c)
# Expected: [32.0, 50.0, 68.0, 86.0, 104.0]
```

**Intermediate Exercise 2: Searching and Counting**
```python
# TODO: Analyze a list of test scores
# TODO: Find how many scores are passing (>= 70)
# TODO: Find the highest and lowest scores
# TODO: Find all students with perfect scores (100)

scores = [85, 92, 100, 65, 100, 78, 88, 100, 55, 92]

def analyze_scores(score_list):
    """Return analysis of scores"""
    # Your code here
    pass

result = analyze_scores(scores)
# Expected structure:
# {
#   "passing": 7,
#   "highest": 100,
#   "lowest": 55,
#   "perfect_count": 3
# }
```

**Intermediate Exercise 3: Building Lists with Loops**
```python
# TODO: Create two functions:
# 1. Generate a list of multiplication table (1-10) for a given number
# 2. Filter a list to keep only even numbers

def multiplication_table(number):
    """Generate multiplication table for number 1-10"""
    table = []
    # Your code here
    return table

def filter_even(numbers):
    """Keep only even numbers from list"""
    evens = []
    # Your code here
    return evens

# Test
print(multiplication_table(5))  # [5, 10, 15, 20, ..., 50]
print(filter_even([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]))  # [2, 4, 6, 8, 10]
```

### Advanced Exercises (90 minutes)

**Advanced Exercise 1: List Manipulation Challenge**
```python
# TODO: Implement a simple list-based inventory system:
# 1. Store items with their quantities
# 2. Add new items
# 3. Remove items when qty reaches 0
# 4. Update quantities
# 5. Find items with low stock (< 5 units)

def inventory_system():
    inventory = {
        "apples": 10,
        "bananas": 15,
        "oranges": 8,
        "grapes": 3
    }
    
    def add_item(name, quantity):
        """Add or update item quantity"""
        # Your code here
        pass
    
    def remove_item(name):
        """Remove item if quantity is 0"""
        # Your code here
        pass
    
    def update_quantity(name, amount):
        """Update item quantity by amount (positive or negative)"""
        # Your code here
        pass
    
    def get_low_stock():
        """Get items with less than 5 units"""
        # Your code here
        pass
    
    # Your implementation
    return inventory

# Usage
inv = inventory_system()
# Test various operations
```

**Advanced Exercise 2: Data Processing**
```python
# TODO: Process student data (names and grades)
# 1. Sort students by grade (highest first)
# 2. Find top 3 performers
# 3. Find students below 70 (failing)
# 4. Calculate class average
# 5. Create letter grades (A: 90+, B: 80+, C: 70+, F: <70)

data = [
    ["Alice", 95],
    ["Bob", 78],
    ["Charlie", 88],
    ["Diana", 92],
    ["Eve", 65],
    ["Frank", 71]
]

def process_grades(student_data):
    """Return sorted and analyzed grade data"""
    # Your code here
    pass

result = process_grades(data)
# Expected output includes:
# - Sorted by grade
# - Top 3 students
# - Failing students
# - Class average
```

**Advanced Exercise 3: Nested List Challenge**
```python
# TODO: Work with a matrix (2D list):
# 1. Calculate sum of each row
# 2. Calculate sum of each column
# 3. Find the largest element and its position
# 4. Transpose the matrix (swap rows and columns)

matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

def analyze_matrix(mat):
    """Analyze a 2D list matrix"""
    row_sums = []      # Sum each row
    col_sums = []      # Sum each column
    max_value = None   # Largest element
    max_pos = None     # [row, col] of largest
    
    # Your code here
    
    return row_sums, col_sums, max_value, max_pos

row_s, col_s, max_v, pos = analyze_matrix(matrix)
# Expected:
# row_sums: [6, 15, 24]
# col_sums: [12, 15, 18]
# max_value: 9
# max_pos: [2, 2]
```

---

## 11. Self-Assessment Checklist

- [ ] I can create lists using different methods
- [ ] I understand positive and negative indexing
- [ ] I can slice lists and understand slicing syntax
- [ ] I can use `append()`, `extend()`, `insert()` correctly
- [ ] I know the difference between `append()` and `extend()`
- [ ] I can remove elements using `remove()`, `pop()`, and `del`
- [ ] I understand that lists are mutable and reference-based
- [ ] I can iterate through lists with `for` loops
- [ ] I can use `enumerate()` to get index and value
- [ ] I know how to copy lists properly
- [ ] I can use `sort()` and `reverse()`
- [ ] I understand and can avoid common list errors
- [ ] I can use the `in` operator to check membership

---

## 12. Assessment Questions

**True/False:**
1. List indices in Python start at 1 ✓/✗
2. The slice `[1:4]` includes the element at index 4 ✓/✗
3. `extend()` adds a single element to a list ✓/✗
4. Negative indices count from the beginning of the list ✓/✗

**Short Answer:**
1. What is the difference between `append()` and `extend()`?
2. How would you create a copy of a list so modifications don't affect the original?
3. Explain what `list[start:stop:step]` does with `list[1:8:2]` as an example.

**Code Reading:**
```python
nums = [10, 20, 30, 40, 50]
result = nums[1:4]  # What is result?
nums.append([60, 70, 80])  # What does nums contain now?
```

**Coding Challenge:**
1. Write a function that takes a list and returns only the elements at even indices
2. Write a function that reverses a list without using the `reverse()` method
3. Write a function that finds the median value in a list of numbers

---

## 13. Additional Resources

- **Python List Documentation**: Official Python docs on lists and list methods
- **Common Pitfalls**: Understanding mutability and references
- **Performance**: Big O complexity of list operations
- **Next Lesson Preview**: List comprehensions for more efficient list creation

---

**Next Lesson:** Lesson 1.1.40 - List Comprehensions and Functional Programming




