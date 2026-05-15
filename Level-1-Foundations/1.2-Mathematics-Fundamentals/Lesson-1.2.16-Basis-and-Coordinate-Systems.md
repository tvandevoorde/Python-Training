# Lesson 1.2.16: Basis and Coordinate Systems

> Previous Lesson: [Lesson 1.2.15: Rank and Linear Independence](Lesson-1.2.15-Rank-and-Linear-Independence.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.15 | **Topic**: Linear Algebra Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Define a basis for a vector space
- Express vectors in a basis
- Interpret coordinate systems
- Use basis changes with matrices

---

## Introduction: Why This Matters

Basis and Coordinate Systems matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## 1. Basis Concept (75 min)

### 1.1 Introduction/Theory
A basis is a set of independent vectors that span a space.

### 1.2 Worked Examples
```python
import numpy as np

basis = [np.array([1, 0]), np.array([0, 1])]
```

### 1.3 Common Pitfalls
- Using dependent vectors as a basis
- Confusing basis with coordinate axes only

---

## 2. Coordinates in a Basis (60 min)

### 2.1 Introduction/Theory
Coordinates are weights that reconstruct a vector from basis vectors.

### 2.2 Worked Examples
```python
# v = 3*b1 + 2*b2 for standard basis
```

### 2.3 Real-World Use
- Feature transformations
- PCA directions

---

## 3. Change of Basis (45 min)

### 3.1 Introduction
A change of basis is a linear transformation.

### 3.2 Examples
```python
import numpy as np

B = np.array([[1, 1], [0, 1]], float)  # basis matrix
```

---

## 4. Practical Application (60 min)

Express a vector in a new basis.

```python
import numpy as np

B = np.array([[1, 1], [0, 1]], float)
v = np.array([2, 3], float)
coords = np.linalg.solve(B, v)
print(coords)
```

---

## Best Practices (Step-by-Step)

1. State the mathematical assumption behind Basis and Coordinate Systems.
2. Verify with a tiny numeric example first.
3. Compare analytical and computed results.
4. Flag where rounding or scale can break intuition.

```python
from math import isclose

LESSON_ID = "1.2.16"
LESSON_TOPIC = "Basis and Coordinate Systems"

def finite_difference_square(x: float, h: float = 1e-5) -> float:
    return ((x + h) ** 2 - x ** 2) / h

approx = finite_difference_square(3.0)
exact = 2 * 3.0
assert isclose(approx, exact, rel_tol=1e-3)
```

## Exercises

### Difficulty 1: Starter

**Exercise 1.2.16.1**: State whether two vectors form a basis for R2.
```python
# Example: [1,0] and [0,1] form a basis
```

**Exercise 1.2.16.2**: Express [3,2] in the standard basis.
**Exercise 1.2.16.3**: Explain what a basis does.

---

### Difficulty 2: Intermediate

**Exercise 1.2.16.4**: Compute coordinates of v in a given basis.
**Exercise 1.2.16.5**: Build a basis matrix from two vectors.
**Exercise 1.2.16.6**: Explain how basis relates to span.

---

### Difficulty 3: Advanced

**Exercise 1.2.16.7**: Show a non-standard basis and compute coordinates.
**Exercise 1.2.16.8**: Explain why basis vectors must be independent.
**Exercise 1.2.16.9**: Use a basis change to transform a vector.

---

## Mini-Project: Basis Converter

Convert vectors between two bases.

```python
import numpy as np

B = np.array([[1, 1], [0, 1]], float)
v = np.array([2, 3], float)
coords = np.linalg.solve(B, v)
print(coords)
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. A basis spans the space. (True)
2. A basis can have dependent vectors. (False)
3. Coordinates depend on the basis. (True)
4. Change of basis is a linear transform. (True)

### Conceptual Questions
5. What makes a set of vectors a basis?
6. Why do coordinates change with basis?
7. Where do basis changes appear in ML?

### Coding Challenge
8. Write a function that computes coordinates in a basis matrix B.

Solution:
```python
import numpy as np

def coordinates(B, v):
    return np.linalg.solve(B, v)
```

---

## Key Takeaways

- A basis is independent and spanning
- Coordinates depend on basis choice
- Change of basis is solving Bc = v
- Basis matters for transformations

---

## Additional Resources

- https://www.khanacademy.org/math/linear-algebra
- https://www.3blue1brown.com/lessons/basis
- https://numpy.org/doc/stable/reference/routines.linalg.html

---

## Next Lesson Preview

**Lesson 1.2.17**: Column Space and Null Space
- Learn core subspaces

---

## Homework

- [ ] Complete exercises 1.2.16.1 - 1.2.16.9
- [ ] Extend the mini-project with another basis
- [ ] Review span and independence

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.17** when ready.




---
