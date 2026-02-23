# Lesson 1.2.9: Matrix Multiplication

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.8 | **Topic**: Linear Algebra Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Apply matrix multiplication rules
- Compute matrix products by hand
- Use NumPy for matrix multiplication
- Interpret matrix multiplication as composition

---

## 1. Multiplication Rules (75 min)

### 1.1 Introduction/Theory
Matrix multiplication requires inner dimensions to match.

### 1.2 Worked Examples
```python
import numpy as np

A = np.array([[1, 2], [3, 4]])
B = np.array([[2, 0], [1, 2]])
print(A @ B)
```

### 1.3 Common Pitfalls
- Assuming commutativity
- Confusing element-wise multiply with @

---

## 2. Row-by-Column Intuition (60 min)

### 2.1 Introduction/Theory
Each entry is a dot product of a row and a column.

### 2.2 Worked Examples
```python
A = [[1, 2], [3, 4]]
B = [[2, 0], [1, 2]]
# Entry (0,0) = 1*2 + 2*1 = 4
```

### 2.3 Real-World Use
- Linear transformations
- Combining layers in neural nets

---

## 3. Associativity (45 min)

### 3.1 Introduction
(A @ B) @ C equals A @ (B @ C) if dimensions match.

### 3.2 Examples
```python
import numpy as np

A = np.eye(2)
B = np.array([[1, 2], [3, 4]])
C = np.array([[0], [1]])
print((A @ B) @ C)
```

---

## 4. Practical Application (60 min)

Chain two transformations.

```python
import numpy as np

rotate = np.array([[0, -1], [1, 0]])
scale = np.array([[2, 0], [0, 0.5]])
T = rotate @ scale
v = np.array([1.0, 0.0])
print(T @ v)
```

---

## Exercises

### Difficulty 1: Starter

**Exercise 1.2.9.1**: Multiply two 2x2 matrices with NumPy.
```python
import numpy as np

A = np.array([[1, 2], [3, 4]])
B = np.array([[1, 0], [0, 1]])
print(A @ B)
```

**Exercise 1.2.9.2**: State the rule for dimensions.
**Exercise 1.2.9.3**: Multiply a 2x3 by a 3x1 matrix.

---

### Difficulty 2: Intermediate

**Exercise 1.2.9.4**: Show matrix multiplication is not commutative.
**Exercise 1.2.9.5**: Implement matrix multiplication without NumPy.
**Exercise 1.2.9.6**: Explain row-by-column in your own words.

---

### Difficulty 3: Advanced

**Exercise 1.2.9.7**: Multiply three matrices in two valid orders.
**Exercise 1.2.9.8**: Use matrix multiplication to apply two transforms.
**Exercise 1.2.9.9**: Explain how matrix multiplication composes functions.

---

## Mini-Project: Transform Chain

Build a script that applies two transformations to a set of points.

```python
import numpy as np

points = np.array([[1, 0], [0, 1], [-1, 0]])
rotate = np.array([[0, -1], [1, 0]])
scale = np.array([[2, 0], [0, 0.5]])
T = rotate @ scale

for p in points:
    print(T @ p)
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. Matrix multiplication is commutative. (False)
2. Inner dimensions must match. (True)
3. (A @ B) @ C can equal A @ (B @ C). (True)
4. A row by a column gives a scalar. (True)

### Conceptual Questions
5. Why is order important in matrix multiplication?
6. How does multiplication encode composition?
7. What is the dot-product view of multiplication?

### Coding Challenge
8. Write a function that multiplies A and B with NumPy and checks shape.

Solution:
```python
import numpy as np

def matmul(A, B):
    return A @ B
```

---

## Key Takeaways

- Matrix multiplication follows strict shape rules
- Order matters in multiplication
- Each entry is a dot product
- Composition of transforms uses multiplication

---

## Additional Resources

- https://numpy.org/doc/stable/reference/generated/numpy.matmul.html
- https://www.khanacademy.org/math/linear-algebra/matrix-transformations
- https://www.3blue1brown.com/lessons/matrix-multiplication

---

## Next Lesson Preview

**Lesson 1.2.10**: Matrix-Vector Products
- Interpret multiplication as transformation

---

## Homework

- [ ] Complete exercises 1.2.9.1 - 1.2.9.9
- [ ] Extend the mini-project with a new transform
- [ ] Review multiplication rules

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.10** when ready.




