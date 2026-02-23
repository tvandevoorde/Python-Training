# Lesson 1.2.18: Orthogonal Bases and Gram-Schmidt

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.17 | **Topic**: Linear Algebra Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Define orthogonal and orthonormal bases
- Apply Gram-Schmidt to two vectors
- Interpret orthogonality in data
- Use orthonormal bases in practice

---

## 1. Orthogonal Bases (60-75 min)

Orthogonal bases simplify dot products and projections.

---

## 2. Gram-Schmidt Process (60-75 min)

Gram-Schmidt turns independent vectors into orthonormal vectors.

---

## 3. Orthonormalization Checks (45-60 min)

Check dot products and norms to verify orthonormality.

---

## 4. Practical Application (60 min)

Use Gram-Schmidt to create an orthonormal basis in R2.

---

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.18.1: Define orthogonal vs orthonormal.
- Exercise 1.2.18.2: Check if two vectors are orthogonal.
- Exercise 1.2.18.3: Normalize a vector.

### Difficulty 2: Intermediate
- Exercise 1.2.18.4: Apply Gram-Schmidt to two vectors.
- Exercise 1.2.18.5: Verify orthonormal basis with dot products.
- Exercise 1.2.18.6: Explain why orthonormal bases are useful.

### Difficulty 3: Advanced
- Exercise 1.2.18.7: Apply Gram-Schmidt to three vectors.
- Exercise 1.2.18.8: Explain numerical stability concerns.
- Exercise 1.2.18.9: Connect to QR decomposition.

---

## Mini-Project: Orthonormal Builder

Write a script that orthonormalizes two vectors.

```python
import numpy as np

u = np.array([1.0, 1.0])
v = np.array([1.0, 0.0])

u = u / np.linalg.norm(u)
proj = (v @ u) * u
v = v - proj
v = v / np.linalg.norm(v)
print(u, v)
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. Orthonormal means orthogonal and unit length. (True)
2. Gram-Schmidt increases vector length. (False)
3. Orthonormal bases simplify projections. (True)
4. Dot products are zero in orthogonal bases. (True)

### Conceptual Questions
5. Why normalize in Gram-Schmidt?
6. How does orthogonality help ML?
7. What is the role of projections in Gram-Schmidt?

### Coding Challenge
8. Write a function that normalizes a vector.

---

## Key Takeaways

- Orthonormal bases simplify computations
- Gram-Schmidt builds orthonormal sets
- Projections remove components
- Orthonormality is verified by dot products

---

## Additional Resources

- https://www.khanacademy.org/math/linear-algebra
- https://www.3blue1brown.com/lessons/gram-schmidt
- https://numpy.org/doc/stable/reference/routines.linalg.html

---

## Next Lesson Preview

**Lesson 1.2.19**: Eigenvalues and Eigenvectors
- Understand eigen directions

---

## Homework

- [ ] Complete exercises 1.2.18.1 - 1.2.18.9
- [ ] Summarize Gram-Schmidt steps
- [ ] Review projections

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.19** when ready.
