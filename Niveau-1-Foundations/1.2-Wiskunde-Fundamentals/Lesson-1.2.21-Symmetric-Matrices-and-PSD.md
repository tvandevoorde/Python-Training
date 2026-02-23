# Lesson 1.2.21: Symmetric Matrices and PSD

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.20 | **Topic**: Linear Algebra Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Identify a symmetric matrix
- Explain positive semidefinite (PSD) meaning
- Use symmetry properties in computations
- Connect PSD to covariance matrices

---

## 1. Symmetry Basics (60-75 min)

A matrix is symmetric if A = A.T.

---

## 2. PSD Intuition (60-75 min)

A is PSD if x.T A x >= 0 for all x.

---

## 3. Eigenvalue Connection (45-60 min)

Symmetric matrices have real eigenvalues and orthogonal eigenvectors.

---

## 4. Practical Application (60 min)

Check symmetry and PSD in a covariance matrix.

```python
import numpy as np

C = np.array([[2, 1], [1, 3]], float)
print(np.allclose(C, C.T))
```

---

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.21.1: Check if a matrix is symmetric.
- Exercise 1.2.21.2: Explain PSD in one sentence.
- Exercise 1.2.21.3: Give an example of a symmetric matrix.

### Difficulty 2: Intermediate
- Exercise 1.2.21.4: Compute eigenvalues of a symmetric matrix.
- Exercise 1.2.21.5: Show x.T A x for a sample x.
- Exercise 1.2.21.6: Explain why covariance is PSD.

### Difficulty 3: Advanced
- Exercise 1.2.21.7: Provide a symmetric matrix that is not PSD.
- Exercise 1.2.21.8: Explain why PSD implies non-negative eigenvalues.
- Exercise 1.2.21.9: Connect PSD to optimization convexity.

---

## Mini-Project: PSD Checker

Write a script that checks symmetry and eigenvalue signs.

---

## Quiz & Assessment

### Quick Check (True/False)
1. Symmetric means A = A.T. (True)
2. PSD implies all eigenvalues are negative. (False)
3. Covariance matrices are symmetric. (True)
4. PSD means x.T A x is non-negative. (True)

### Conceptual Questions
5. Why are symmetric matrices easier to analyze?
6. How does PSD relate to variance?
7. Where does PSD appear in ML?

### Coding Challenge
8. Write a function that checks symmetry.

---

## Key Takeaways

- Symmetric matrices equal their transpose
- PSD matrices have non-negative quadratic forms
- Eigenvalues of PSD are non-negative
- Covariance matrices are PSD

---

## Additional Resources

- https://www.khanacademy.org/math/linear-algebra
- https://numpy.org/doc/stable/reference/routines.linalg.html
- https://www.3blue1brown.com/lessons/eigenvalues

---

## Next Lesson Preview

**Lesson 1.2.22**: Power Iteration
- Estimate dominant eigenvectors

---

## Homework

- [ ] Complete exercises 1.2.21.1 - 1.2.21.9
- [ ] Check PSD for a covariance matrix
- [ ] Review eigenvalue properties

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.22** when ready.
