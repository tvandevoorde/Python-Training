# Lesson 1.2.22: Power Iteration

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.21 | **Topic**: Linear Algebra Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Explain power iteration intuition
- Implement a simple power iteration loop
- Estimate the dominant eigenvector
- Discuss convergence conditions

---

## 1. Power Iteration Idea (60-75 min)

Repeatedly apply A to a vector and normalize.

---

## 2. Convergence (60-75 min)

Convergence depends on eigenvalue gaps and initialization.

---

## 3. Implementation Steps (45-60 min)

Initialize, iterate, normalize, check change.

---

## 4. Practical Application (60 min)

Approximate the dominant eigenvector.

```python
import numpy as np

A = np.array([[2, 1], [1, 3]], float)
v = np.array([1.0, 1.0])
for _ in range(10):
    v = A @ v
    v = v / np.linalg.norm(v)
print(v)
```

---

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.22.1: Describe power iteration in one sentence.
- Exercise 1.2.22.2: Implement 5 iterations on a 2x2 matrix.
- Exercise 1.2.22.3: Explain normalization step.

### Difficulty 2: Intermediate
- Exercise 1.2.22.4: Add a convergence check.
- Exercise 1.2.22.5: Compare with NumPy eigenvectors.
- Exercise 1.2.22.6: Explain when convergence fails.

### Difficulty 3: Advanced
- Exercise 1.2.22.7: Test power iteration on a 3x3 matrix.
- Exercise 1.2.22.8: Explain eigenvalue gap influence.
- Exercise 1.2.22.9: Extend to compute dominant eigenvalue.

---

## Mini-Project: Dominant Eigenvector Finder

Write a function that returns dominant eigenvector and eigenvalue.

---

## Quiz & Assessment

### Quick Check (True/False)
1. Power iteration estimates the dominant eigenvector. (True)
2. Normalization is optional for stability. (False)
3. Convergence depends on eigenvalue gap. (True)
4. Power iteration finds all eigenvectors. (False)

### Conceptual Questions
5. Why normalize each iteration?
6. When does power iteration converge slowly?
7. How is this used in large-scale ML?

### Coding Challenge
8. Write a function that performs power iteration for k steps.

---

## Key Takeaways

- Power iteration is simple and scalable
- Normalization prevents overflow
- Dominant eigenpairs are approximated
- Convergence depends on eigenvalue gaps

---

## Additional Resources

- https://www.khanacademy.org/math/linear-algebra
- https://numpy.org/doc/stable/reference/routines.linalg.html
- https://www.3blue1brown.com/lessons/eigenvalues

---

## Next Lesson Preview

**Lesson 1.2.23**: SVD Intuition
- Understand singular values

---

## Homework

- [ ] Complete exercises 1.2.22.1 - 1.2.22.9
- [ ] Compare your result to NumPy eigenvectors
- [ ] Review convergence criteria

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.23** when ready.




