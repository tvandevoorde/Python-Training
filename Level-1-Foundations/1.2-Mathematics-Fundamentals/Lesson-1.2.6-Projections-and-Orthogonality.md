# Lesson 1.2.6: Projections and Orthogonality

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.5 | **Topic**: Linear Algebra Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Define orthogonality using dot product
- Compute vector projections
- Interpret projections geometrically
- Use projection concepts in ML

---

## 1. Orthogonality (75 min)

### 1.1 Introduction/Theory
Two vectors are orthogonal if their dot product is zero.

### 1.2 Worked Examples
```python
import numpy as np

u = np.array([1, 0])
v = np.array([0, 3])
print(u @ v)  # 0
```

### 1.3 Common Pitfalls
- Assuming orthogonal means same length
- Floating point near-zero confusion

---

## 2. Vector Projection (60 min)

### 2.1 Introduction/Theory
Projection of u onto v captures the component of u in v direction.

### 2.2 Worked Examples
```python
import numpy as np

u = np.array([3.0, 4.0])
v = np.array([1.0, 0.0])
proj = (u @ v) / (v @ v) * v
print(proj)  # [3. 0.]
```

### 2.3 Real-World Use
- Removing components (orthogonalization)
- Feature projection

---

## 3. Decomposition (45 min)

### 3.1 Introduction
A vector can be split into parallel and orthogonal components.

### 3.2 Examples
```python
import numpy as np

u = np.array([3.0, 4.0])
v = np.array([1.0, 0.0])
proj = (u @ v) / (v @ v) * v
orth = u - proj
print(proj, orth)
```

---

## 4. Practical Application (60 min)

Project data onto a direction vector.

```python
import numpy as np

X = np.array([[1, 2], [2, 3], [3, 4]], dtype=float)
d = np.array([1.0, 1.0])

projections = (X @ d) / (d @ d)
print(projections)
```

---

## Exercises

### Difficulty 1: Starter

**Exercise 1.2.6.1**: Check if [1,2] and [2,-1] are orthogonal.
```python
import numpy as np

u = np.array([1, 2])
v = np.array([2, -1])
print(u @ v)
```

**Exercise 1.2.6.2**: Compute projection of [2,2] onto [1,0].
**Exercise 1.2.6.3**: Explain what orthogonal means in one sentence.

---

### Difficulty 2: Intermediate

**Exercise 1.2.6.4**: Write a function that checks orthogonality with tolerance.
**Exercise 1.2.6.5**: Compute projection of u onto v using NumPy.
**Exercise 1.2.6.6**: Decompose a vector into parallel and orthogonal parts.

---

### Difficulty 3: Advanced

**Exercise 1.2.6.7**: Show projection formula derivation in words.
**Exercise 1.2.6.8**: Use projection to remove a component from a vector.
**Exercise 1.2.6.9**: Explain how projections relate to least squares.

---

## Mini-Project: Projection Helper

Build a helper that projects any vector onto a direction.

```python
import numpy as np

def project(u, v):
    return (u @ v) / (v @ v) * v

u = np.array([3.0, 4.0])
v = np.array([1.0, 1.0])
print(project(u, v))
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. Orthogonal vectors have dot product 0. (True)
2. Projection changes vector length only. (False)
3. Projection depends on direction of v. (True)
4. Projection formula uses dot products. (True)

### Conceptual Questions
5. What does projection measure about u and v?
6. Why is orthogonality useful in ML?
7. How does projection connect to least squares?

### Coding Challenge
8. Write a function that returns the orthogonal component of u to v.

Solution:
```python
import numpy as np

def orth_component(u, v):
    proj = (u @ v) / (v @ v) * v
    return u - proj
```

---

## Key Takeaways

- Orthogonality means dot product is zero
- Projection extracts component along a direction
- Decomposition splits into parallel and orthogonal parts
- Projections appear in regression and PCA

---

## Additional Resources

- https://www.khanacademy.org/math/linear-algebra
- https://www.3blue1brown.com/lessons/linear-transformations
- https://numpy.org/doc/stable/reference/routines.linalg.html

---

## Next Lesson Preview

**Lesson 1.2.7**: Matrices - Structure and Notation
- Define matrices and types

---

## Homework

- [ ] Complete exercises 1.2.6.1 - 1.2.6.9
- [ ] Extend the mini-project with orthogonal component output
- [ ] Review projection formula

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.7** when ready.




