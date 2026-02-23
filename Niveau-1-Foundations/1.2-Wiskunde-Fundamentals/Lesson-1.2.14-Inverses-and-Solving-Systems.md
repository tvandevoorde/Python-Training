# Lesson 1.2.14: Inverses and Solving Systems

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.13 | **Topic**: Linear Algebra Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Define matrix inverse
- Solve Ax = b using inverse
- Identify when inverse exists
- Use NumPy for inverse and solve

---

## 1. Inverse Definition (75 min)

### 1.1 Introduction/Theory
A is invertible if A^-1 exists and A^-1 A = I.

### 1.2 Worked Examples
```python
import numpy as np

A = np.array([[2, 1], [1, 1]], float)
A_inv = np.linalg.inv(A)
print(A_inv)
```

### 1.3 Common Pitfalls
- Inverting singular matrices
- Using inverse instead of solve for systems

---

## 2. Solving Systems (60 min)

### 2.1 Introduction/Theory
If A is invertible, x = A^-1 b.

### 2.2 Worked Examples
```python
import numpy as np

A = np.array([[2, 1], [1, 1]], float)
b = np.array([5, 3], float)
print(np.linalg.solve(A, b))
```

### 2.3 Real-World Use
- Linear regression
- Physics simulations

---

## 3. Numerical Stability (45 min)

### 3.1 Introduction
Using solve is more stable than computing inverse directly.

### 3.2 Examples
```python
# Prefer solve
x = np.linalg.solve(A, b)
```

---

## 4. Practical Application (60 min)

Solve multiple systems with solve.

```python
import numpy as np

A = np.array([[3, 1], [2, 2]], float)
bs = [np.array([4, 6], float), np.array([1, 0], float)]
for b in bs:
    print(np.linalg.solve(A, b))
```

---

## Exercises

### Difficulty 1: Starter

**Exercise 1.2.14.1**: Compute inverse of a 2x2 matrix with NumPy.
```python
import numpy as np

A = np.array([[1, 2], [3, 4]], float)
print(np.linalg.inv(A))
```

**Exercise 1.2.14.2**: Solve Ax=b with solve.
**Exercise 1.2.14.3**: Explain why inverse may not exist.

---

### Difficulty 2: Intermediate

**Exercise 1.2.14.4**: Show that A @ A_inv equals I.
**Exercise 1.2.14.5**: Compare inverse vs solve timing for a 5x5 matrix.
**Exercise 1.2.14.6**: Identify a singular matrix.

---

### Difficulty 3: Advanced

**Exercise 1.2.14.7**: Solve a 3x3 system and verify residuals.
**Exercise 1.2.14.8**: Explain why solve is preferred numerically.
**Exercise 1.2.14.9**: Derive inverse for a 2x2 matrix by hand.

---

## Mini-Project: Solver Helper

Build a helper that solves systems and checks residuals.

```python
import numpy as np

A = np.array([[2, 1], [1, 3]], float)
b = np.array([1, 2], float)

x = np.linalg.solve(A, b)
residual = np.linalg.norm(A @ x - b)
print(x, residual)
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. A is invertible if det != 0. (True)
2. Inverse always exists for square matrices. (False)
3. solve is more stable than inv for Ax=b. (True)
4. A @ A_inv = I when inverse exists. (True)

### Conceptual Questions
5. When does inverse fail to exist?
6. Why avoid explicit inverse in computation?
7. How do you verify a solution?

### Coding Challenge
8. Write a function that returns x for Ax=b using solve.

Solution:
```python
import numpy as np

def solve_system(A, b):
    return np.linalg.solve(A, b)
```

---

## Key Takeaways

- Inverse exists only for non-singular matrices
- solve is preferred for numerical stability
- Inverse connects to system solutions
- Residuals verify correctness

---

## Additional Resources

- https://numpy.org/doc/stable/reference/generated/numpy.linalg.inv.html
- https://numpy.org/doc/stable/reference/generated/numpy.linalg.solve.html
- https://www.khanacademy.org/math/linear-algebra

---

## Next Lesson Preview

**Lesson 1.2.15**: Rank and Linear Independence
- Understand rank and span

---

## Homework

- [ ] Complete exercises 1.2.14.1 - 1.2.14.9
- [ ] Extend the mini-project with 3x3 systems
- [ ] Review inverse conditions

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.15** when ready.
