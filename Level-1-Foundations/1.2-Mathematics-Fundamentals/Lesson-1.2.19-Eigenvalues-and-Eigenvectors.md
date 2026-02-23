# Lesson 1.2.19: Eigenvalues and Eigenvectors

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.18 | **Topic**: Linear Algebra Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Define eigenvalues and eigenvectors
- Interpret eigen directions geometrically
- Compute eigenpairs with NumPy
- Explain why eigenpairs matter in ML

---

## 1. Eigenpair Definition (60-75 min)

A v = lambda v defines an eigenpair.

---

## 2. Geometry Intuition (60-75 min)

Eigenvectors keep direction under transformation.

---

## 3. Computing Eigenpairs (45-60 min)

Use NumPy for eigen decomposition.

---

## 4. Practical Application (60 min)

Inspect eigenpairs of a 2x2 matrix.

```python
import numpy as np

A = np.array([[2, 0], [0, 1]], float)
vals, vecs = np.linalg.eig(A)
print(vals, vecs)
```

---

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.19.1: Define eigenvector in one sentence.
- Exercise 1.2.19.2: Compute eigenvalues with NumPy.
- Exercise 1.2.19.3: Explain eigen direction.

### Difficulty 2: Intermediate
- Exercise 1.2.19.4: Verify Av = lambda v for a vector.
- Exercise 1.2.19.5: Interpret eigenvalues as scaling.
- Exercise 1.2.19.6: Explain why eigenvectors are not unique.

### Difficulty 3: Advanced
- Exercise 1.2.19.7: Provide a matrix with complex eigenvalues.
- Exercise 1.2.19.8: Connect eigenpairs to PCA.
- Exercise 1.2.19.9: Explain algebraic vs geometric multiplicity.

---

## Mini-Project: Eigen Explorer

Compute eigenpairs and verify for a matrix.

```python
import numpy as np

A = np.array([[3, 1], [0, 2]], float)
vals, vecs = np.linalg.eig(A)
print(vals)
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. Eigenvectors keep direction under A. (True)
2. All matrices have real eigenvalues. (False)
3. A v = lambda v defines eigenpairs. (True)
4. Eigenvalues can be negative. (True)

### Conceptual Questions
5. What does an eigenvalue represent?
6. Why are eigenvectors useful in ML?
7. How do eigenpairs relate to stability?

### Coding Challenge
8. Write a function that returns eigenvalues using NumPy.

---

## Key Takeaways

- Eigenvectors are invariant directions
- Eigenvalues are scaling factors
- Eigenpairs reveal structure of A
- Eigenpairs are used in PCA and dynamics

---

## Additional Resources

- https://numpy.org/doc/stable/reference/generated/numpy.linalg.eig.html
- https://www.khanacademy.org/math/linear-algebra
- https://www.3blue1brown.com/lessons/eigenvalues

---

## Next Lesson Preview

**Lesson 1.2.20**: Eigen Decomposition
- Diagonalize matrices

---

## Homework

- [ ] Complete exercises 1.2.19.1 - 1.2.19.9
- [ ] Verify Av = lambda v for a random matrix
- [ ] Review eigenpair definition

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.20** when ready.




