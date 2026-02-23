# Lesson 1.2.17: Column Space and Null Space

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.16 | **Topic**: Linear Algebra Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Define column space and null space
- Interpret solutions to Ax = b
- Connect null space to free variables
- Use NumPy to explore subspaces

---

## 1. Column Space (60-75 min)

Column space is the set of all linear combinations of columns of A.

---

## 2. Null Space (60-75 min)

Null space is the set of vectors x such that Ax = 0.

---

## 3. Rank-Nullity (45-60 min)

Rank + nullity = number of columns.

---

## 4. Practical Application (60 min)

Use rank and null space intuition to reason about solutions.

---

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.17.1: Explain column space in one sentence.
- Exercise 1.2.17.2: Describe null space in your own words.
- Exercise 1.2.17.3: State rank-nullity for a 3x5 matrix.

### Difficulty 2: Intermediate
- Exercise 1.2.17.4: Give a matrix with non-trivial null space.
- Exercise 1.2.17.5: Explain when Ax=b has no solution.
- Exercise 1.2.17.6: Identify columns that span the column space.

### Difficulty 3: Advanced
- Exercise 1.2.17.7: Connect null space to model non-identifiability.
- Exercise 1.2.17.8: Explain rank-nullity proof idea.
- Exercise 1.2.17.9: Describe geometric meaning in R3.

---

## Mini-Project: Subspace Explorer

Build a short script that prints rank and interprets solution types.

```python
import numpy as np

A = np.array([[1, 2], [2, 4]], float)
print(np.linalg.matrix_rank(A))
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. Column space is spanned by columns. (True)
2. Null space solves Ax=b. (False)
3. Rank-nullity relates columns to null space. (True)
4. Null space can be non-zero. (True)

### Conceptual Questions
5. What does null space mean for solutions?
6. Why does rank relate to column space?
7. How does this matter in ML?

### Coding Challenge
8. Write a function that returns rank using NumPy.

---

## Key Takeaways

- Column space is all outputs of A
- Null space is all inputs mapped to zero
- Rank-nullity explains solution freedom
- Subspaces explain system behavior

---

## Additional Resources

- https://www.khanacademy.org/math/linear-algebra
- https://www.3blue1brown.com/lessons/subspaces
- https://numpy.org/doc/stable/reference/routines.linalg.html

---

## Next Lesson Preview

**Lesson 1.2.18**: Orthogonal Bases and Gram-Schmidt
- Build orthonormal bases

---

## Homework

- [ ] Complete exercises 1.2.17.1 - 1.2.17.9
- [ ] Summarize rank-nullity in a paragraph
- [ ] Review linear systems

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.18** when ready.
