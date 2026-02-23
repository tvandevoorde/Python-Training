# Lesson 1.2.20: Eigen Decomposition

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.19 | **Topic**: Linear Algebra Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Describe eigen decomposition A = VDV^-1
- Check when a matrix is diagonalizable
- Use NumPy to compute eigen decomposition
- Interpret diagonalization in ML

---

## 1. Decomposition Idea (60-75 min)

Diagonalization expresses A in eigenvector coordinates.

---

## 2. Diagonalizable Matrices (60-75 min)

Not all matrices are diagonalizable.

---

## 3. Computing with NumPy (45-60 min)

Use eig to get V and D.

---

## 4. Practical Application (60 min)

Diagonalize a matrix and reconstruct it.

```python
import numpy as np

A = np.array([[2, 0], [0, 1]], float)
vals, vecs = np.linalg.eig(A)
D = np.diag(vals)
A_rec = vecs @ D @ np.linalg.inv(vecs)
print(A_rec)
```

---

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.20.1: State the eigen decomposition formula.
- Exercise 1.2.20.2: Diagonalize a diagonal matrix.
- Exercise 1.2.20.3: Explain what V contains.

### Difficulty 2: Intermediate
- Exercise 1.2.20.4: Reconstruct A from eigenpairs.
- Exercise 1.2.20.5: Explain when diagonalization fails.
- Exercise 1.2.20.6: Verify A v = lambda v for eigenpairs.

### Difficulty 3: Advanced
- Exercise 1.2.20.7: Compare eigen decomposition to SVD.
- Exercise 1.2.20.8: Explain numerical issues with inversion.
- Exercise 1.2.20.9: Use diagonalization to compute A^k.

---

## Mini-Project: Diagonalization Check

Write a script that reconstructs A from eigenpairs.

```python
import numpy as np

A = np.array([[3, 1], [0, 2]], float)
vals, vecs = np.linalg.eig(A)
D = np.diag(vals)
A_rec = vecs @ D @ np.linalg.inv(vecs)
print(np.allclose(A, A_rec))
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. Diagonalization uses eigenvectors. (True)
2. Every matrix is diagonalizable. (False)
3. D contains eigenvalues. (True)
4. V contains eigenvectors. (True)

### Conceptual Questions
5. Why is diagonalization useful?
6. What does V^-1 represent?
7. How does diagonalization relate to powers of A?

### Coding Challenge
8. Write a function that reconstructs A from eigendecomposition.

---

## Key Takeaways

- A = V D V^-1 when diagonalizable
- D stores eigenvalues
- V stores eigenvectors
- Diagonalization simplifies computations

---

## Additional Resources

- https://numpy.org/doc/stable/reference/generated/numpy.linalg.eig.html
- https://www.khanacademy.org/math/linear-algebra
- https://www.3blue1brown.com/lessons/eigenvalues

---

## Next Lesson Preview

**Lesson 1.2.21**: Symmetric Matrices and PSD
- Study symmetric properties

---

## Homework

- [ ] Complete exercises 1.2.20.1 - 1.2.20.9
- [ ] Reconstruct A for several matrices
- [ ] Review diagonalization conditions

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.21** when ready.




