# Lesson 1.1.42: Nested Lists & Multi-dimensional Arrays

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.1.39-1.1.40 (Lists and comprehensions)

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Create and access nested lists
- Understand multi-dimensional data structures
- Iterate through nested collections
- Manipulate nested list elements
- Use nested comprehensions
- Work with matrices and grids
- Transform between nested structures

---

## 1. Introduction to Nested Lists (60 min)

### 1.1 What are Nested Lists?

```python
# Simple list
simple = [1, 2, 3]

# Nested list (list containing lists)
nested = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

# Accessing nested elements
print(nested[0])        # [1, 2, 3]
print(nested[0][1])     # 2 (second element of first list)
print(nested[2][2])     # 9 (third element of third list)
```

### 1.2 Creating Nested Lists

```python
# Method 1: Direct creation
matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

# Method 2: List comprehension
size = 3
zero_matrix = [[0 for _ in range(size)] for _ in range(size)]

# Method 3: Append lists
lists = []
for i in range(3):
    lists.append([i, i+1, i+2])

print(lists)  # [[0, 1, 2], [1, 2, 3], [2, 3, 4]]
```

---

## 2. Accessing Nested Elements (75 min)

### 2.1 Indexing

```python
data = [
    [10, 20, 30],
    [40, 50, 60],
    [70, 80, 90]
]

# Access row (first index)
row_0 = data[0]  # [10, 20, 30]

# Access specific element (row, column)
element = data[1][2]  # 60

# Negative indexing
last_row = data[-1]        # [70, 80, 90]
last_element = data[-1][-1]  # 90
```

### 2.2 Slicing Nested Lists

```python
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

# Slice rows
first_two_rows = matrix[:2]  # [[1,2,3], [4,5,6]]

# Slice columns (more complex)
first_two_cols = [row[:2] for row in matrix]  # [[1,2], [4,5], [7,8]]

# Get specific elements
middle_elements = [row[1] for row in matrix]  # [2, 5, 8]
```

---

## 3. Iterating Through Nested Lists (75 min)

### 3.1 Nested Loops

```python
# Simple nested loop
matrix = [[1, 2], [3, 4], [5, 6]]

for row in matrix:
    for element in row:
        print(element, end=" ")
# Output: 1 2 3 4 5 6

# With index
for i in range(len(matrix)):
    for j in range(len(matrix[i])):
        print(f"({i},{j}): {matrix[i][j]}")
```

### 3.2 Iterating with enumerate()

```python
matrix = [[1, 2, 3], [4, 5, 6]]

for row_idx, row in enumerate(matrix):
    for col_idx, element in enumerate(row):
        print(f"[{row_idx}][{col_idx}] = {element}")
```

### 3.3 Flattening Nested Lists

```python
nested = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

# Method 1: Nested loop
flat1 = []
for row in nested:
    for item in row:
        flat1.append(item)

# Method 2: List comprehension
flat2 = [item for row in nested for item in row]

# Method 3: itertools
from itertools import chain
flat3 = list(chain.from_iterable(nested))

print(flat1)  # [1, 2, 3, 4, 5, 6, 7, 8, 9]
```

---

## 4. Modifying Nested Lists (75 min)

### 4.1 Updating Elements

```python
matrix = [[1, 2], [3, 4]]

# Update single element
matrix[0][1] = 20
print(matrix)  # [[1, 20], [3, 4]]

# Update entire row
matrix[1] = [30, 40]
print(matrix)  # [[1, 20], [30, 40]]

# Update using loop
for i in range(len(matrix)):
    for j in range(len(matrix[i])):
        matrix[i][j] *= 2

print(matrix)  # [[2, 40], [60, 80]]
```

### 4.2 Adding and Removing

```python
matrix = [[1, 2], [3, 4]]

# Add new row
matrix.append([5, 6])
print(matrix)  # [[1, 2], [3, 4], [5, 6]]

# Remove row
matrix.pop(1)
print(matrix)  # [[1, 2], [5, 6]]

# Extend row
matrix[0].extend([10, 20])
print(matrix)  # [[1, 2, 10, 20], [5, 6]]
```

---

## 5. Nested Comprehensions (75 min)

### 5.1 Creating Nested Structures

```python
# Create 3x3 matrix
matrix = [[i + j for j in range(3)] for i in range(3)]
# [[0, 1, 2], [1, 2, 3], [2, 3, 4]]

# Create with condition
grid = [[x for x in range(5) if x % 2 == 0] for _ in range(3)]
# [[0, 2, 4], [0, 2, 4], [0, 2, 4]]

# Multiply nested comprehension
result = [[x * y for x in range(1, 4)] for y in range(1, 4)]
# [[1, 2, 3], [2, 4, 6], [3, 6, 9]]
```

### 5.2 Filtering Nested Lists

```python
data = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

# Filter: keep only even numbers
filtered = [[x for x in row if x % 2 == 0] for row in data]
# [[2], [4, 6], [8]]

# Filter: keep only rows with sum > 10
filtered2 = [row for row in data if sum(row) > 10]
# [[4, 5, 6], [7, 8, 9]]

# Transform and filter combined
result = [[x * 2 for x in row if x > 3] for row in data]
# [[], [8, 10, 12], [14, 16, 18]]
```

---

## 6. Common Nested List Operations (60 min)

### 6.1 Matrix Operations

```python
# Transpose matrix
matrix = [[1, 2, 3], [4, 5, 6]]
transposed = [[row[i] for row in matrix] for i in range(3)]
# [[1, 4], [2, 5], [3, 6]]

# Sum of elements
matrix = [[1, 2], [3, 4]]
total = sum(sum(row) for row in matrix)  # 10

# Find max element
max_val = max(max(row) for row in matrix)  # 4

# Rotate 90 degrees
matrix = [[1, 2], [3, 4]]
rotated = [[matrix[m-1-j][i] for j in range(len(matrix))] 
           for i in range(len(matrix[0]))]
# [[3, 1], [4, 2]]
```

### 6.2 Searching Nested Lists

```python
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]

# Find position of element
target = 5
position = None
for i, row in enumerate(matrix):
    if target in row:
        position = (i, row.index(target))
        break

print(position)  # (1, 1)

# Count occurrences
count = sum(row.count(2) for row in matrix)
```

---

## 7. Mini-Project: Game Board

```python
def create_board(size):
    """Create empty game board"""
    return [[" " for _ in range(size)] for _ in range(size)]

def display_board(board):
    """Display board with grid"""
    for row in board:
        print("|" + "|".join(row) + "|")

def place_piece(board, row, col, piece):
    """Place piece on board"""
    if 0 <= row < len(board) and 0 <= col < len(board[0]):
        board[row][col] = piece

def check_winner(board):
    """Check for winner (tic-tac-toe style)"""
    # Check rows
    for row in board:
        if all(cell == row[0] and cell != " " for cell in row):
            return row[0]
    
    # Check columns
    for col in range(len(board[0])):
        if all(board[row][col] == board[0][col] and board[0][col] != " " 
               for row in range(len(board))):
            return board[0][col]
    
    return None

# Usage
board = create_board(3)
place_piece(board, 0, 0, "X")
place_piece(board, 1, 1, "O")
display_board(board)
```

---

## 8. Graded Exercises

### Starter Exercises (40 minutes)

**Starter 1: Access Nested Elements**
```python
# TODO: Access specific elements
matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
# Get element at position [1][2]
```

**Starter 2: Create Nested List**
```python
# TODO: Create 4x4 matrix of zeros
```

### Intermediate Exercises (60 minutes)

**Intermediate 1: Transpose**
```python
# TODO: Transpose given matrix
```

**Intermediate 2: Filter Nested**
```python
# TODO: Filter using nested comprehension
```

### Advanced Exercises (90 minutes)

**Advanced 1: Matrix Multiplication**
```python
# TODO: Implement matrix multiplication
```

---

## 9. Self-Assessment Checklist

- [ ] I can create nested lists
- [ ] I can access nested elements
- [ ] I can iterate through nested structures
- [ ] I can use nested comprehensions
- [ ] I can manipulate nested lists

---

## 10. Assessment Questions

**True/False:**
1. `matrix[1][2]` accesses column 1, row 2
2. Nested comprehensions always produce nested lists

**Coding:**
1. Create 3x3 identity matrix
2. Flatten nested list
3. Find element in matrix

---

## 11. Additional Resources

- Matrix operations
- 2D array manipulation
- Next Lesson: Lesson 1.1.43 - Dictionary Iteration & Operations

---

**Next Lesson:** Lesson 1.1.43 - Dictionaries Fundamentals




