# Lesson 1.2.11: Linear Systems

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.10 | **Topic**: Linear Algebra Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Represent a linear system as Ax = b
- Identify solution types (unique, infinite, none)
- Solve small systems by hand
- Use NumPy to solve systems

---

## 1. Systems and Augmented Matrices (75 min)

### 1.1 Introduction/Theory
A linear system is a set of linear equations. It can be written as Ax = b.

### 1.2 Worked Examples
```python
import numpy as np

A = np.array([[2, 1], [1, -1]], dtype=float)
b = np.array([5, 1], dtype=float)
print(np.linalg.solve(A, b))
```

### 1.3 Common Pitfalls
- Mixing coefficients order
- Solving singular systems with solve

---

## 2. Solution Types (60 min)

### 2.1 Introduction/Theory
Systems can have one solution, infinitely many, or none.

### 2.2 Worked Examples
```python
# Example of dependent equations
A = np.array([[1, 2], [2, 4]], dtype=float)
```

### 2.3 Real-World Use
- Linear regression normal equations
- Balancing constraints

---

## 3. Row Reduction Intuition (45 min)

### 3.1 Introduction
Row operations transform a system without changing solutions.

### 3.2 Examples
Simple elimination by hand on 2x2 systems.

---

## 4. Practical Application (60 min)

Solve multiple systems with NumPy.

```python
import numpy as np

systems = [
    (np.array([[1, 1], [1, -1]], float), np.array([4, 2], float)),
    (np.array([[3, 2], [1, 2]], float), np.array([5, 5], float)),
]

for A, b in systems:
    print(np.linalg.solve(A, b))
```

---

## Exercises

### Difficulty 1: Starter

**Exercise 1.2.11.1**: Write Ax = b for two equations.
```python
# Example: 2x + y = 5, x - y = 1
# A = [[2,1],[1,-1]], b = [5,1]
```

**Exercise 1.2.11.2**: Solve a 2x2 system by substitution.
**Exercise 1.2.11.3**: Use NumPy to solve a 2x2 system.

---

### Difficulty 2: Intermediate

**Exercise 1.2.11.4**: Identify solution type for a given system.
**Exercise 1.2.11.5**: Explain when np.linalg.solve fails.
**Exercise 1.2.11.6**: Solve three small systems and verify.

---

### Difficulty 3: Advanced

**Exercise 1.2.11.7**: Create a system with no solution.
**Exercise 1.2.11.8**: Explain geometric meaning of solutions.
**Exercise 1.2.11.9**: Solve a 3x3 system by elimination.

---

## Mini-Project: System Solver

Build a small script that solves a list of systems and checks residuals.

```python
import numpy as np

A = np.array([[2, 1], [1, 3]], float)
b = np.array([1, 2], float)

x = np.linalg.solve(A, b)
residual = A @ x - b
print(x, residual)
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. Ax = b represents a linear system. (True)
2. All systems have a unique solution. (False)
3. Singular A cannot be solved by np.linalg.solve. (True)
4. Row operations preserve solutions. (True)

### Conceptual Questions
5. What does it mean if two equations are dependent?
6. Why can a system have no solution?
7. How do you check a solution numerically?

### Coding Challenge
8. Write a function that solves A x = b and returns x.

Solution:
```python
import numpy as np

def solve_system(A, b):
    return np.linalg.solve(A, b)
```

---

## Key Takeaways

- Linear systems map to Ax = b
- Solutions can be unique, infinite, or none
- NumPy solves invertible systems quickly
- Residuals verify correctness

---

## Additional Resources

- https://numpy.org/doc/stable/reference/generated/numpy.linalg.solve.html
- https://www.khanacademy.org/math/linear-algebra
- https://www.3blue1brown.com/lessons/linear-systems

---

## Next Lesson Preview

**Lesson 1.2.12**: Mini-Project - Vector Library
- Build reusable vector tools

---

## Homework

- [ ] Complete exercises 1.2.11.1 - 1.2.11.9
- [ ] Extend the mini-project with 3x3 systems
- [ ] Review solution types

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.12** when ready.
