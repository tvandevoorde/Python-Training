# Lesson 1.2.13: Determinants

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.12 | **Topic**: Linear Algebra Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Define determinants for 2x2 and 3x3 matrices
- Interpret determinant as area/volume scaling
- Use determinant to test invertibility
- Compute determinants with NumPy

---

## 1. Determinant Basics (75 min)

### 1.1 Introduction/Theory
The determinant measures scaling and orientation.

### 1.2 Worked Examples
```python
import numpy as np

A = np.array([[2, 1], [3, 4]], float)
print(np.linalg.det(A))
```

### 1.3 Common Pitfalls
- Sign errors in 2x2 formula
- Assuming det(A + B) = det(A) + det(B)

---

## 2. Geometry Intuition (60 min)

### 2.1 Introduction/Theory
Absolute determinant is area/volume scaling.

### 2.2 Worked Examples
```python
A = np.array([[2, 0], [0, 0.5]], float)
# det = 1.0, area preserved
```

### 2.3 Real-World Use
- Invertibility checks
- Change of variables

---

## 3. Determinant and Inverse (45 min)

### 3.1 Introduction
A matrix is invertible if det != 0.

### 3.2 Examples
```python
import numpy as np

A = np.array([[1, 2], [2, 4]], float)
print(np.linalg.det(A))  # 0
```

---

## 4. Practical Application (60 min)

Check invertibility before solving a system.

```python
import numpy as np

A = np.array([[1, 2], [3, 4]], float)
if abs(np.linalg.det(A)) > 1e-9:
    print("Invertible")
```

---

## Exercises

### Difficulty 1: Starter

**Exercise 1.2.13.1**: Compute determinant of [[1,2],[3,4]].
```python
import numpy as np

A = np.array([[1, 2], [3, 4]], float)
print(np.linalg.det(A))
```

**Exercise 1.2.13.2**: Use the 2x2 formula by hand.
**Exercise 1.2.13.3**: Explain what det = 0 means.

---

### Difficulty 2: Intermediate

**Exercise 1.2.13.4**: Compute determinant of a 3x3 matrix with NumPy.
**Exercise 1.2.13.5**: Check invertibility of a list of matrices.
**Exercise 1.2.13.6**: Show a matrix with negative determinant.

---

### Difficulty 3: Advanced

**Exercise 1.2.13.7**: Explain orientation change with det < 0.
**Exercise 1.2.13.8**: Describe why det is multiplicative.
**Exercise 1.2.13.9**: Compute det for a matrix product and compare.

---

## Mini-Project: Determinant Scanner

Scan matrices and label as invertible or not.

```python
import numpy as np

mats = [np.array([[1, 2], [3, 4]]), np.array([[1, 2], [2, 4]])]
for A in mats:
    det = np.linalg.det(A)
    print(det, "invertible" if abs(det) > 1e-9 else "singular")
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. det = 0 means not invertible. (True)
2. det measures scaling. (True)
3. det(A + B) = det(A) + det(B). (False)
4. det < 0 flips orientation. (True)

### Conceptual Questions
5. What does det represent geometrically?
6. Why is det important for solving systems?
7. How does det relate to volume?

### Coding Challenge
8. Write a function that returns True if a matrix is invertible.

Solution:
```python
import numpy as np

def is_invertible(A):
    return abs(np.linalg.det(A)) > 1e-9
```

---

## Key Takeaways

- Determinant measures scaling and orientation
- det = 0 means singular
- Determinants test invertibility
- NumPy computes determinants quickly

---

## Additional Resources

- https://numpy.org/doc/stable/reference/generated/numpy.linalg.det.html
- https://www.khanacademy.org/math/linear-algebra
- https://www.3blue1brown.com/lessons/determinant

---

## Next Lesson Preview

**Lesson 1.2.14**: Inverses and Solving Systems
- Use inverses and alternatives

---

## Homework

- [ ] Complete exercises 1.2.13.1 - 1.2.13.9
- [ ] Extend the mini-project with 3x3 matrices
- [ ] Review determinant properties

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.14** when ready.




