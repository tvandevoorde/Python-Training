# Lesson 1.2.7: Matrices - Structure and Notation

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.2.6 | **Topic**: Linear Algebra Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Define a matrix and its dimensions
- Distinguish rows, columns, and entries
- Identify common matrix types
- Represent matrices with NumPy

---

## 1. Matrix Basics (75 min)

### 1.1 Introduction/Theory
A matrix is a rectangular array of numbers with shape (m, n).

### 1.2 Worked Examples
```python
import numpy as np

A = np.array([[1, 2, 3], [4, 5, 6]])
print(A.shape)  # (2, 3)
```

### 1.3 Common Pitfalls
- Mixing up rows and columns
- Treating lists of uneven length as matrices

---

## 2. Matrix Types (60 min)

### 2.1 Introduction/Theory
Common types: zero, diagonal, identity, symmetric.

### 2.2 Worked Examples
```python
import numpy as np

I = np.eye(3)
D = np.diag([1, 2, 3])
```

### 2.3 Real-World Use
- Identity in transformations
- Diagonal for scaling

---

## 3. Indexing and Access (45 min)

### 3.1 Introduction
Access entries with row and column indices.

### 3.2 Examples
```python
A = [[1, 2], [3, 4]]
print(A[1][0])  # 3
```

---

## 4. Practical Application (60 min)

Create and inspect a small dataset matrix.

```python
import numpy as np

X = np.array([[1, 2], [3, 4], [5, 6]])
print("Rows:", X.shape[0])
print("Cols:", X.shape[1])
```

---

## Exercises

### Difficulty 1: Starter

**Exercise 1.2.7.1**: Create a 2x2 matrix and print its shape.
```python
import numpy as np

A = np.array([[1, 2], [3, 4]])
print(A.shape)
```

**Exercise 1.2.7.2**: Define a 3x1 column matrix.
**Exercise 1.2.7.3**: Explain what an identity matrix is.

---

### Difficulty 2: Intermediate

**Exercise 1.2.7.4**: Create a 4x4 diagonal matrix.
**Exercise 1.2.7.5**: Check if a matrix is square.
**Exercise 1.2.7.6**: Extract a row and a column from a matrix.

---

### Difficulty 3: Advanced

**Exercise 1.2.7.7**: Write a function that checks if a matrix is symmetric.
**Exercise 1.2.7.8**: Explain how a matrix represents a dataset.
**Exercise 1.2.7.9**: Compare row-major vs column-major storage.

---

## Mini-Project: Matrix Inspector

Write a script that reports matrix shape, row sums, and column sums.

```python
import numpy as np

A = np.array([[1, 2, 3], [4, 5, 6]])
print("Shape:", A.shape)
print("Row sums:", A.sum(axis=1))
print("Col sums:", A.sum(axis=0))
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. A matrix has rows and columns. (True)
2. A diagonal matrix must be square. (True)
3. A 2x3 matrix has 3 rows. (False)
4. Identity matrices have ones on the diagonal. (True)

### Conceptual Questions
5. What does shape (m, n) represent?
6. Why is identity matrix important?
7. How do you interpret a dataset as a matrix?

### Coding Challenge
8. Write a function that returns the shape of a 2D list.

Solution:
```python
def shape(mat):
    return (len(mat), len(mat[0]))
```

---

## Key Takeaways

- Matrices are rectangular arrays
- Shape determines rows and columns
- Common types include identity and diagonal
- NumPy makes matrix handling consistent

---

## Additional Resources

- https://numpy.org/doc/stable/user/quickstart.html
- https://www.khanacademy.org/math/linear-algebra/matrix-transformations
- https://www.3blue1brown.com/lessons/matrix-multiplication

---

## Next Lesson Preview

**Lesson 1.2.8**: Matrix Operations
- Add, scale, transpose matrices

---

## Homework

- [ ] Complete exercises 1.2.7.1 - 1.2.7.9
- [ ] Extend the mini-project with matrix mean
- [ ] Review matrix types

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.8** when ready.




