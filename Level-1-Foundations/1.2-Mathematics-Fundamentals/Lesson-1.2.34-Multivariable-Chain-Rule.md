# Lesson 1.2.34: Multivariable Chain Rule

> Previous Lesson: [Lesson 1.2.33: Chain Rule (Single Variable)](Lesson-1.2.33-Chain-Rule-Single-Variable.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.33 | **Topic**: Calculus for ML

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Apply chain rule to multivariable functions
- Use Jacobian intuition
- Interpret composed mappings
- Connect to computational graphs

---

## Introduction: Why This Matters

Multivariable Chain Rule matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Core Ideas

- Multivariable chain rule links gradients and Jacobians
- Composition multiplies derivatives across layers

---

## Best Practices (Step-by-Step)

1. State the mathematical assumption behind Multivariable Chain Rule.
2. Verify with a tiny numeric example first.
3. Compare analytical and computed results.
4. Flag where rounding or scale can break intuition.

```python
from math import isclose

LESSON_ID = "1.2.34"
LESSON_TOPIC = "Multivariable Chain Rule"

def finite_difference_square(x: float, h: float = 1e-5) -> float:
    return ((x + h) ** 2 - x ** 2) / h

approx = finite_difference_square(3.0)
exact = 2 * 3.0
assert isclose(approx, exact, rel_tol=1e-3)
```

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.34.1: State the multivariable chain rule in words.
- Exercise 1.2.34.2: Identify inner and outer functions for f(x,y)=g(h(x,y)).
- Exercise 1.2.34.3: Explain why Jacobians appear.

### Difficulty 2: Intermediate
- Exercise 1.2.34.4: Compute partials for a composed function.
- Exercise 1.2.34.5: Draw a simple computation graph.
- Exercise 1.2.34.6: Explain how chain rule flows through layers.

### Difficulty 3: Advanced
- Exercise 1.2.34.7: Compute gradient of f(x,y)=sin(xy).
- Exercise 1.2.34.8: Explain Jacobian of a vector function.
- Exercise 1.2.34.9: Connect chain rule to backprop steps.

---

## Mini-Project: Computation Graph Notes

Create a diagram and label derivative flow for a small model.

---

## Quiz & Assessment

### Quick Check (True/False)
1. Multivariable chain rule uses Jacobians. (True)
2. Chain rule does not apply to vectors. (False)
3. Computation graphs encode compositions. (True)
4. Backprop uses multivariable chain rule. (True)

### Conceptual Questions
5. Why is Jacobian needed?
6. How does chain rule scale with layers?
7. What is a computation graph?

### Coding Challenge
8. Compute gradient of f(x,y)=x^2y.

---

## Key Takeaways

- Multivariable chain rule generalizes single variable
- Jacobians connect vector functions
- Computation graphs visualize derivatives
- Backprop is chained derivatives

---

## Additional Resources

- https://www.khanacademy.org/math/multivariable-calculus
- https://tutorial.math.lamar.edu
- https://www.deeplearning.ai

---

## Next Lesson Preview

**Lesson 1.2.35**: Jacobian and Hessian
- Measure local sensitivity and curvature

---

## Homework

- [ ] Complete exercises 1.2.34.1 - 1.2.34.9
- [ ] Draw a computation graph for f(x,y)=x^2y+sin(x)
- [ ] Review Jacobian definition

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.35** when ready.




---

## Core Teaching Content

Focus on one clear concept and connect it to a real workflow scenario.

```python
def run_example(value: int) -> int:
    return value * 2

print(run_example(3))
```

