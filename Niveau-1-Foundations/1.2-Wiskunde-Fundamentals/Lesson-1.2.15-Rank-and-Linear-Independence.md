# Lesson 1.2.15: Rank and Linear Independence

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.14 | **Topic**: Linear Algebra Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Define rank of a matrix
- Explain linear independence
- Connect rank to solutions
- Use NumPy to estimate rank

---

## 1. Linear Independence (75 min)

### 1.1 Introduction/Theory
Vectors are independent if none can be written as a combination of others.

### 1.2 Worked Examples
```python
import numpy as np

u = np.array([1, 0])
v = np.array([0, 1])
# Independent in R2
```

### 1.3 Common Pitfalls
- Confusing orthogonal with independent
- Assuming three vectors in R2 can be independent

---

## 2. Rank Intuition (60 min)

### 2.1 Introduction/Theory
Rank is the number of independent rows or columns.

### 2.2 Worked Examples
```python
import numpy as np

A = np.array([[1, 2], [2, 4]], float)
print(np.linalg.matrix_rank(A))  # 1
```

### 2.3 Real-World Use
- Feature redundancy
- Model identifiability

---

## 3. Rank and Solutions (45 min)

### 3.1 Introduction
Rank helps determine solution counts in Ax = b.

### 3.2 Examples
Discuss rank(A) vs rank([A|b]).

---

## 4. Practical Application (60 min)

Check for redundant features in a dataset.

```python
import numpy as np

X = np.array([[1, 2], [2, 4], [3, 6]], float)
print(np.linalg.matrix_rank(X))
```

---

## Exercises

### Difficulty 1: Starter

**Exercise 1.2.15.1**: Determine if two vectors are independent.
```python
import numpy as np

u = np.array([1, 2])
v = np.array([2, 4])
# Dependent
```

**Exercise 1.2.15.2**: Compute rank of a 2x2 matrix.
**Exercise 1.2.15.3**: Explain why rank cannot exceed min(m, n).

---

### Difficulty 2: Intermediate

**Exercise 1.2.15.4**: Identify redundant columns in a matrix.
**Exercise 1.2.15.5**: Use NumPy to compute rank of a 3x3 matrix.
**Exercise 1.2.15.6**: Explain how rank affects solutions.

---

### Difficulty 3: Advanced

**Exercise 1.2.15.7**: Provide a matrix with rank 1 and explain why.
**Exercise 1.2.15.8**: Show a dataset with collinearity.
**Exercise 1.2.15.9**: Explain rank in terms of span.

---

## Mini-Project: Rank Report

Scan multiple matrices and report rank.

```python
import numpy as np

mats = [np.eye(3), np.array([[1, 2], [2, 4]], float)]
for A in mats:
    print(np.linalg.matrix_rank(A))
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. Rank equals number of independent columns. (True)
2. Rank can exceed number of rows. (False)
3. Dependent vectors reduce rank. (True)
4. Rank helps determine solutions. (True)

### Conceptual Questions
5. What does rank measure?
6. How does rank relate to redundancy?
7. Why is rank important for ML features?

### Coding Challenge
8. Write a function that returns rank using NumPy.

Solution:
```python
import numpy as np

def rank(A):
    return np.linalg.matrix_rank(A)
```

---

## Key Takeaways

- Independence means no vector is redundant
- Rank counts independent directions
- Rank relates to solvability
- NumPy provides rank estimation

---

## Additional Resources

- https://numpy.org/doc/stable/reference/generated/numpy.linalg.matrix_rank.html
- https://www.khanacademy.org/math/linear-algebra
- https://www.3blue1brown.com/lessons/linear-combinations

---

## Next Lesson Preview

**Lesson 1.2.16**: Basis and Coordinate Systems
- Represent vectors in a basis

---

## Homework

- [ ] Complete exercises 1.2.15.1 - 1.2.15.9
- [ ] Extend the mini-project with random matrices
- [ ] Review independence and rank

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.16** when ready.
