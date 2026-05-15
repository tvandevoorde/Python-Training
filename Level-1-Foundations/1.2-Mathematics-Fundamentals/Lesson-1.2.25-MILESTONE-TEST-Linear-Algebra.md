# Lesson 1.2.25: MILESTONE TEST - Linear Algebra

> Previous Lesson: [Lesson 1.2.24: Mini-Project - Image Compression with SVD](Lesson-1.2.24-Mini-Project-Image-Compression-with-SVD.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.2.1 - 1.2.24 | **Topic**: Assessment - Linear Algebra

---

## Overview

This milestone test checks mastery of linear algebra fundamentals.

**Passing Grade**: 80%  
**Time Limit**: 90 minutes  
**Format**: 40 questions total

---

## Part A: Multiple Choice (10 questions)

1. Which operation requires equal vector length?
2. What does det(A) = 0 imply?
3. What is the dot product of orthogonal vectors?
4. Which statement about matrix multiplication is true?
5. What does rank measure?
6. When does inverse exist?
7. What is an eigenvector?
8. What does SVD decompose?
9. What is the null space?
10. What is the column space?

---

## Part B: True/False (10 questions)

1. Matrix multiplication is commutative.
2. A symmetric matrix equals its transpose.
3. SVD exists for any matrix.
4. PSD matrices have non-negative eigenvalues.
5. A basis must be independent.
6. Rank cannot exceed number of columns.
7. The dot product can be negative.
8. A projection reduces dimension.
9. Power iteration finds all eigenvectors.
10. Inverse is always faster than solve.

---

## Part C: Short Answer (8 questions)

1. Explain linear independence.
2. Define column space.
3. State rank-nullity.
4. Describe eigenvalue meaning.
5. Explain matrix-vector product.
6. Give a 2x2 determinant formula.
7. Why prefer solve over inverse?
8. Describe SVD in words.

---

## Part D: Coding Problems (2 questions)

### Problem 1: Vector Utilities
Implement dot product and norm for two vectors.

### Problem 2: Linear System
Solve Ax=b using NumPy and verify residual.

---

## Scoring Guide

- Multiple Choice: 20 points
- True/False: 10 points
- Short Answer: 20 points
- Coding: 10 points

---

## Next Steps

Review topics with scores below 80% and retake.

---

**Milestone Complete.**

Proceed to **Lesson 1.2.26** when ready.




---

## Learning Objectives

By the end of this lesson, you will be able to:
- Explain the key idea behind MILESTONE TEST - Linear Algebra
- Implement a small practical example
- Identify one common failure mode and fix

---

## Introduction: Why This Matters

MILESTONE TEST - Linear Algebra matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Core Teaching Content

Focus on one clear concept and connect it to a real workflow scenario.

```python
def run_example(value: int) -> int:
    return value * 2

print(run_example(3))
```

---

## Best Practices (Step-by-Step)

1. State the mathematical assumption behind MILESTONE TEST - Linear Algebra.
2. Verify with a tiny numeric example first.
3. Compare analytical and computed results.
4. Flag where rounding or scale can break intuition.

```python
from math import isclose

LESSON_ID = "1.2.25"
LESSON_TOPIC = "MILESTONE TEST - Linear Algebra"

def finite_difference_square(x: float, h: float = 1e-5) -> float:
    return ((x + h) ** 2 - x ** 2) / h

approx = finite_difference_square(3.0)
exact = 2 * 3.0
assert isclose(approx, exact, rel_tol=1e-3)
```

## Quick Practice

- Exercise: Modify the example to handle one edge case.
- Quiz: What would break if input validation was removed?

---

**Next Lesson**: [Lesson 1.2.26: Calculus for ML - Big Picture](Lesson-1.2.26-Calculus-for-ML-Big-Picture.md)

