# Lesson 1.2.8: Matrix Operations

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.2.7 | **Topic**: Linear Algebra Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Add and subtract matrices
- Scale and transpose matrices
- Perform element-wise operations
- Use NumPy for matrix ops

---

## 1. Matrix Addition and Subtraction (75 min)

### 1.1 Introduction/Theory
Matrices must have the same shape for addition/subtraction.

### 1.2 Worked Examples
```python
import numpy as np

A = np.array([[1, 2], [3, 4]])
B = np.array([[4, 3], [2, 1]])
print(A + B)
print(A - B)
```

### 1.3 Common Pitfalls
- Mismatched shapes
- Confusing element-wise with matrix multiplication

---

## 2. Scaling and Transpose (60 min)

### 2.1 Introduction/Theory
Scaling multiplies each element. Transpose swaps rows and columns.

### 2.2 Worked Examples
```python
import numpy as np

A = np.array([[1, 2], [3, 4]])
print(2 * A)
print(A.T)
```

### 2.3 Real-World Use
- Feature scaling
- Switching between row and column views

---

## 3. Element-wise Operations (45 min)

### 3.1 Introduction
Element-wise multiplication is not matrix multiplication.

### 3.2 Examples
```python
import numpy as np

A = np.array([[1, 2], [3, 4]])
B = np.array([[2, 2], [2, 2]])
print(A * B)
```

---

## 4. Practical Application (60 min)

Normalize a matrix by subtracting column means.

```python
import numpy as np

X = np.array([[1, 2], [3, 4], [5, 6]], dtype=float)
means = X.mean(axis=0)
X_centered = X - means
print(X_centered)
```

---

## Exercises

### Difficulty 1: Starter

**Exercise 1.2.8.1**: Add two 2x2 matrices.
```python
import numpy as np

A = np.array([[1, 1], [1, 1]])
B = np.array([[2, 2], [2, 2]])
print(A + B)
```

**Exercise 1.2.8.2**: Transpose a 2x3 matrix.
**Exercise 1.2.8.3**: Scale a matrix by 0.5.

---

### Difficulty 2: Intermediate

**Exercise 1.2.8.4**: Write a function to check equal shapes before adding.
**Exercise 1.2.8.5**: Compute column means and subtract them.
**Exercise 1.2.8.6**: Explain element-wise vs matrix multiplication.

---

### Difficulty 3: Advanced

**Exercise 1.2.8.7**: Implement transpose without NumPy.
**Exercise 1.2.8.8**: Write a function that scales each column by a vector.
**Exercise 1.2.8.9**: Use matrix ops to normalize features to mean zero.

---

## Mini-Project: Matrix Normalizer

Build a script that centers and scales columns.

```python
import numpy as np

X = np.array([[1, 2], [3, 4], [5, 6]], dtype=float)
means = X.mean(axis=0)
stds = X.std(axis=0)
X_norm = (X - means) / stds
print(X_norm)
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. Matrices must match shape to add. (True)
2. Transpose swaps rows and columns. (True)
3. Element-wise multiplication is matrix multiplication. (False)
4. Scaling changes each entry. (True)

### Conceptual Questions
5. Why is transpose useful?
6. When would you use element-wise ops?
7. How does centering help ML?

### Coding Challenge
8. Write a function that returns A - A.T for a square matrix.

Solution:
```python
import numpy as np

def skew_part(A):
    return A - A.T
```

---

## Key Takeaways

- Matrix addition and subtraction are element-wise
- Transpose switches rows and columns
- Element-wise ops differ from matrix multiplication
- Centering is a common preprocessing step

---

## Additional Resources

- https://numpy.org/doc/stable/reference/routines.linalg.html
- https://www.khanacademy.org/math/linear-algebra/matrix-transformations
- https://www.3blue1brown.com/lessons/matrix-multiplication

---

## Next Lesson Preview

**Lesson 1.2.9**: Matrix Multiplication
- Learn rules and intuition

---

## Homework

- [ ] Complete exercises 1.2.8.1 - 1.2.8.9
- [ ] Extend the mini-project with min-max scaling
- [ ] Review transpose properties

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.9** when ready.




