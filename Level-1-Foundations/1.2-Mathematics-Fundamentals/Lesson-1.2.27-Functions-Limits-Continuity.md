# Lesson 1.2.27: Functions, Limits, Continuity

> Previous Lesson: [Lesson 1.2.26: Calculus for ML - Big Picture](Lesson-1.2.26-Calculus-for-ML-Big-Picture.md)

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.2.26 | **Topic**: Calculus for ML

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Define functions and inputs/outputs
- Explain limits with intuition
- Describe continuity and discontinuity
- Use limits in derivative concepts

---

## Introduction: Why This Matters

Functions, Limits, Continuity matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Core Ideas

- Functions map inputs to outputs
- Limits describe behavior near a point
- Continuity means no jumps

---

## Best Practices (Step-by-Step)

1. State the mathematical assumption behind Functions, Limits, Continuity.
2. Verify with a tiny numeric example first.
3. Compare analytical and computed results.
4. Flag where rounding or scale can break intuition.

```python
from math import isclose

LESSON_ID = "1.2.27"
LESSON_TOPIC = "Functions, Limits, Continuity"

def finite_difference_square(x: float, h: float = 1e-5) -> float:
    return ((x + h) ** 2 - x ** 2) / h

approx = finite_difference_square(3.0)
exact = 2 * 3.0
assert isclose(approx, exact, rel_tol=1e-3)
```

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.27.1: Define a function in words.
- Exercise 1.2.27.2: Give an example of a discontinuity.
- Exercise 1.2.27.3: Explain a limit with a picture.

### Difficulty 2: Intermediate
- Exercise 1.2.27.4: Describe left vs right limits.
- Exercise 1.2.27.5: Identify continuous intervals of a function.
- Exercise 1.2.27.6: Explain why limits matter for derivatives.

### Difficulty 3: Advanced
- Exercise 1.2.27.7: Provide a piecewise function with a removable discontinuity.
- Exercise 1.2.27.8: Explain epsilon-delta in words.
- Exercise 1.2.27.9: Discuss limits at infinity.

---

## Mini-Project: Continuity Checker

Create a short report on continuity of a simple piecewise function.

---

## Quiz & Assessment

### Quick Check (True/False)
1. A function maps inputs to outputs. (True)
2. Limits describe exact values only at a point. (False)
3. Continuity means no breaks. (True)
4. Discontinuity can be removable. (True)

### Conceptual Questions
5. Why are limits useful?
6. How does continuity affect optimization?
7. What is a piecewise function?

### Coding Challenge
8. Write a function f(x) = 2x + 1 and compute f(4).

---

## Key Takeaways

- Functions define relationships
- Limits capture local behavior
- Continuity avoids jumps
- Limits enable derivatives

---

## Additional Resources

- https://www.khanacademy.org/math/calculus-1
- https://tutorial.math.lamar.edu
- https://www.deeplearning.ai

---

## Next Lesson Preview

**Lesson 1.2.28**: Derivative Basics
- Define slope and tangent

---

## Homework

- [ ] Complete exercises 1.2.27.1 - 1.2.27.9
- [ ] Draw a continuous vs discontinuous function
- [ ] Review limit intuition

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.28** when ready.




---

## Core Teaching Content

Focus on one clear concept and connect it to a real workflow scenario.

```python
def run_example(value: int) -> int:
    return value * 2

print(run_example(3))
```

