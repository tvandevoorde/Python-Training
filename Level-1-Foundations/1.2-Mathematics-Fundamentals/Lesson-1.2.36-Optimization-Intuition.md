# Lesson 1.2.36: Optimization Intuition

> Previous Lesson: [Lesson 1.2.35: Jacobian and Hessian](Lesson-1.2.35-Jacobian-and-Hessian.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.35 | **Topic**: Calculus for ML

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Describe minima, maxima, and saddle points
- Explain local vs global optima
- Relate gradients to optimization
- Interpret optimization landscapes

---

## Introduction: Why This Matters

Optimization Intuition matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Core Ideas

- Optima occur where gradient is zero
- Curvature determines type of critical point

---

## Best Practices (Step-by-Step)

1. State the mathematical assumption behind Optimization Intuition.
2. Verify with a tiny numeric example first.
3. Compare analytical and computed results.
4. Flag where rounding or scale can break intuition.

```python
from math import isclose

LESSON_ID = "1.2.36"
LESSON_TOPIC = "Optimization Intuition"

def finite_difference_square(x: float, h: float = 1e-5) -> float:
    return ((x + h) ** 2 - x ** 2) / h

approx = finite_difference_square(3.0)
exact = 2 * 3.0
assert isclose(approx, exact, rel_tol=1e-3)
```

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.36.1: Define local minimum.
- Exercise 1.2.36.2: Explain saddle point in words.
- Exercise 1.2.36.3: Describe global minimum.

### Difficulty 2: Intermediate
- Exercise 1.2.36.4: Classify critical points using second derivative.
- Exercise 1.2.36.5: Sketch a simple non-convex function.
- Exercise 1.2.36.6: Explain why optimization can get stuck.

### Difficulty 3: Advanced
- Exercise 1.2.36.7: Discuss convex vs non-convex loss.
- Exercise 1.2.36.8: Explain how initialization affects optimization.
- Exercise 1.2.36.9: Connect Hessian signs to saddle points.

---

## Mini-Project: Landscape Notes

Write a short report comparing convex and non-convex landscapes.

---

## Quiz & Assessment

### Quick Check (True/False)
1. Gradients are zero at critical points. (True)
2. Saddle points are always maxima. (False)
3. Convex functions have one global minimum. (True)
4. Non-convex landscapes can have many minima. (True)

### Conceptual Questions
5. Why are saddle points a problem in ML?
6. How does curvature influence optimization?
7. What makes a function convex?

### Coding Challenge
8. Give an example of a convex and a non-convex function.

---

## Key Takeaways

- Optimization seeks minima of loss
- Gradients and curvature classify points
- Convexity simplifies learning
- Non-convexity adds complexity

---

## Additional Resources

- https://www.khanacademy.org/math/multivariable-calculus
- https://www.deeplearning.ai
- https://www.statquest.org

---

## Next Lesson Preview

**Lesson 1.2.37**: Gradient Descent Basics
- Implement the core algorithm

---

## Homework

- [ ] Complete exercises 1.2.36.1 - 1.2.36.9
- [ ] Sketch three loss landscapes
- [ ] Review convexity concepts

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.37** when ready.




---

## Core Teaching Content

Focus on one clear concept and connect it to a real workflow scenario.

```python
def run_example(value: int) -> int:
    return value * 2

print(run_example(3))
```

