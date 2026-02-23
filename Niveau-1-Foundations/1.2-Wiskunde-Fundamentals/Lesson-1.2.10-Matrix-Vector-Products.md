# Lesson 1.2.10: Matrix-Vector Products

**Estimated Time**: 8 hours | **Difficulty**: Beginner-Intermediate  
**Prerequisites**: Lesson 1.2.9 | **Topic**: Linear Algebra Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Multiply matrices by vectors
- Interpret matrix-vector product as transformation
- Use NumPy for products
- Connect products to linear models

---

## 1. Matrix-Vector Multiplication (75 min)

### 1.1 Introduction/Theory
A matrix maps a vector to a new vector.

### 1.2 Worked Examples
```python
import numpy as np

A = np.array([[2, 0], [0, 0.5]])
v = np.array([3, 4])
print(A @ v)  # [6 2]
```

### 1.3 Common Pitfalls
- Using wrong vector shape
- Mixing row and column conventions

---

## 2. Linear Transformation View (60 min)

### 2.1 Introduction/Theory
The product transforms the vector in space.

### 2.2 Worked Examples
```python
import numpy as np

A = np.array([[0, -1], [1, 0]])
v = np.array([1, 0])
print(A @ v)  # [0 1]
```

### 2.3 Real-World Use
- Feature weighting
- Neural network layers

---

## 3. Linear Models (45 min)

### 3.1 Introduction
A linear model is y = A x + b.

### 3.2 Examples
```python
import numpy as np

A = np.array([[1, 2], [3, 4]])
x = np.array([1, 1])
b = np.array([0.5, -0.5])
print(A @ x + b)
```

---

## 4. Practical Application (60 min)

Apply a simple linear model to data points.

```python
import numpy as np

A = np.array([[1.5, -0.5]])  # 1x2
points = np.array([[1, 2], [2, 0], [0, -1]])
for p in points:
    print(A @ p)
```

---

## Exercises

### Difficulty 1: Starter

**Exercise 1.2.10.1**: Multiply a 2x2 matrix by a 2D vector.
```python
import numpy as np

A = np.array([[1, 2], [0, 1]])
v = np.array([3, 4])
print(A @ v)
```

**Exercise 1.2.10.2**: Explain what A @ v produces.
**Exercise 1.2.10.3**: Compute a matrix-vector product using NumPy.

---

### Difficulty 2: Intermediate

**Exercise 1.2.10.4**: Write a function that checks shape before multiplication.
**Exercise 1.2.10.5**: Apply a 3x3 matrix to three vectors.
**Exercise 1.2.10.6**: Interpret A @ v as a weighted sum of columns.

---

### Difficulty 3: Advanced

**Exercise 1.2.10.7**: Explain how a linear model uses matrix-vector products.
**Exercise 1.2.10.8**: Implement A @ v without NumPy.
**Exercise 1.2.10.9**: Show how changing A changes the output space.

---

## Mini-Project: Simple Linear Predictor

Compute predictions for a linear model y = A x + b.

```python
import numpy as np

A = np.array([[2.0, -1.0]])
b = np.array([0.5])
X = np.array([[1.0, 2.0], [0.0, 1.0], [3.0, -1.0]])

for x in X:
    print(A @ x + b)
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. A matrix maps vectors to vectors. (True)
2. A @ v always increases dimension. (False)
3. Matrix-vector product is a linear transformation. (True)
4. Linear models rely on matrix-vector products. (True)

### Conceptual Questions
5. What does A @ v represent geometrically?
6. How do matrix columns influence A @ v?
7. Why is A @ v central to ML?

### Coding Challenge
8. Write a function that computes A @ v and adds bias b.

Solution:
```python
import numpy as np

def linear_predict(A, v, b):
    return A @ v + b
```

---

## Key Takeaways

- Matrix-vector products transform vectors
- Shape compatibility is essential
- Linear models use A x + b
- Columns of A define the mapping

---

## Additional Resources

- https://numpy.org/doc/stable/reference/generated/numpy.matmul.html
- https://www.khanacademy.org/math/linear-algebra/matrix-transformations
- https://www.3blue1brown.com/lessons/linear-transformations

---

## Next Lesson Preview

**Lesson 1.2.11**: Linear Systems
- Solve Ax = b and interpret solutions

---

## Homework

- [ ] Complete exercises 1.2.10.1 - 1.2.10.9
- [ ] Extend the mini-project with multiple outputs
- [ ] Review matrix-vector intuition

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.11** when ready.
