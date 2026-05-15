# Lesson 1.2.35: Jacobian and Hessian

> Previous Lesson: [Lesson 1.2.34: Multivariable Chain Rule](Lesson-1.2.34-Multivariable-Chain-Rule.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.34 | **Topic**: Calculus for ML

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Define Jacobian and Hessian
- Interpret Jacobian as local linear map
- Interpret Hessian as curvature matrix
- Use Jacobian/Hessian in optimization intuition

---

## Introduction: Why This Matters

Jacobian and Hessian matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Core Ideas

- Jacobian collects first derivatives of vector functions
- Hessian collects second derivatives of scalar functions

---

## Best Practices (Step-by-Step)

1. State the mathematical assumption behind Jacobian and Hessian.
2. Verify with a tiny numeric example first.
3. Compare analytical and computed results.
4. Flag where rounding or scale can break intuition.

```python
from math import isclose

LESSON_ID = "1.2.35"
LESSON_TOPIC = "Jacobian and Hessian"

def finite_difference_square(x: float, h: float = 1e-5) -> float:
    return ((x + h) ** 2 - x ** 2) / h

approx = finite_difference_square(3.0)
exact = 2 * 3.0
assert isclose(approx, exact, rel_tol=1e-3)
```

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.35.1: Define Jacobian in one sentence.
- Exercise 1.2.35.2: Define Hessian in one sentence.
- Exercise 1.2.35.3: Explain why Hessian is symmetric for many functions.

### Difficulty 2: Intermediate
- Exercise 1.2.35.4: Compute Jacobian of a 2D vector function.
- Exercise 1.2.35.5: Compute Hessian of f(x,y)=x^2+y^2.
- Exercise 1.2.35.6: Explain how Hessian relates to curvature.

### Difficulty 3: Advanced
- Exercise 1.2.35.7: Discuss Hessian in second-order methods.
- Exercise 1.2.35.8: Explain why Jacobian matters in backprop.
- Exercise 1.2.35.9: Describe computational cost issues.

---

## Mini-Project: Jacobian and Hessian Notes

Create a short note with two worked examples.

---

## Quiz & Assessment

### Quick Check (True/False)
1. Jacobian is for vector outputs. (True)
2. Hessian is for scalar outputs. (True)
3. Hessian entries are second derivatives. (True)
4. Jacobian and Hessian are always diagonal. (False)

### Conceptual Questions
5. How does Hessian influence optimization?
6. When would you avoid Hessians?
7. What does Jacobian represent geometrically?

### Coding Challenge
8. Compute Jacobian of f(x,y)=[x+y, xy].

---

## Key Takeaways

- Jacobian measures local sensitivity
- Hessian measures curvature
- Both are central to optimization
- Computational cost matters

---

## Additional Resources

- https://www.khanacademy.org/math/multivariable-calculus
- https://tutorial.math.lamar.edu
- https://www.deeplearning.ai

---

## Next Lesson Preview

**Lesson 1.2.36**: Optimization Intuition
- Understand minima, maxima, saddles

---

## Homework

- [ ] Complete exercises 1.2.35.1 - 1.2.35.9
- [ ] Compute one Jacobian and one Hessian by hand
- [ ] Review matrix calculus basics

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.36** when ready.




---

## Core Teaching Content

Focus on one clear concept and connect it to a real workflow scenario.

```python
def run_example(value: int) -> int:
    return value * 2

print(run_example(3))
```

