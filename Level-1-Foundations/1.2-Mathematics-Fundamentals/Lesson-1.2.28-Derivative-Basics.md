# Lesson 1.2.28: Derivative Basics

> Previous Lesson: [Lesson 1.2.27: Functions, Limits, Continuity](Lesson-1.2.27-Functions-Limits-Continuity.md)

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.2.27 | **Topic**: Calculus for ML

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Define derivative as slope
- Interpret tangent lines
- Compute simple derivatives
- Connect derivatives to optimization

---

## Introduction: Why This Matters

Derivative Basics matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Core Ideas

- Derivative is rate of change
- Tangent line touches a curve at a point
- Steeper slopes mean faster change

---

## Best Practices (Step-by-Step)

1. State the mathematical assumption behind Derivative Basics.
2. Verify with a tiny numeric example first.
3. Compare analytical and computed results.
4. Flag where rounding or scale can break intuition.

```python
from math import isclose

LESSON_ID = "1.2.28"
LESSON_TOPIC = "Derivative Basics"

def finite_difference_square(x: float, h: float = 1e-5) -> float:
    return ((x + h) ** 2 - x ** 2) / h

approx = finite_difference_square(3.0)
exact = 2 * 3.0
assert isclose(approx, exact, rel_tol=1e-3)
```

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.28.1: Define derivative in one sentence.
- Exercise 1.2.28.2: Compute derivative of f(x)=x^2 at x=2 (conceptually).
- Exercise 1.2.28.3: Describe tangent line meaning.

### Difficulty 2: Intermediate
- Exercise 1.2.28.4: Explain derivative of a constant.
- Exercise 1.2.28.5: Sketch a function with positive derivative.
- Exercise 1.2.28.6: Explain why derivative is zero at a minimum.

### Difficulty 3: Advanced
- Exercise 1.2.28.7: Provide a function with undefined derivative at a point.
- Exercise 1.2.28.8: Connect derivative to gradient descent.
- Exercise 1.2.28.9: Describe numerical approximation of derivative.

---

## Mini-Project: Slope Reporter

Create a table of slopes for f(x)=x^2 at several points.

---

## Quiz & Assessment

### Quick Check (True/False)
1. Derivative is rate of change. (True)
2. Derivative is always positive. (False)
3. Zero derivative can indicate extrema. (True)
4. Tangent line is the best local linear approximation. (True)

### Conceptual Questions
5. Why do we care about derivatives in ML?
6. What does a negative derivative mean?
7. How does slope change along a curve?

### Coding Challenge
8. Write f(x)=x^2 and compute f(5).

---

## Key Takeaways

- Derivatives measure slope
- Tangent lines approximate curves
- Derivatives guide optimization
- Extrema often have zero derivative

---

## Additional Resources

- https://www.khanacademy.org/math/calculus-1
- https://tutorial.math.lamar.edu
- https://www.deeplearning.ai

---

## Next Lesson Preview

**Lesson 1.2.29**: Derivative Rules
- Learn product, quotient, chain rules

---

## Homework

- [ ] Complete exercises 1.2.28.1 - 1.2.28.9
- [ ] Sketch a function and its derivative
- [ ] Review tangent line intuition

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.29** when ready.




---

## Core Teaching Content

Focus on one clear concept and connect it to a real workflow scenario.

```python
def run_example(value: int) -> int:
    return value * 2

print(run_example(3))
```

