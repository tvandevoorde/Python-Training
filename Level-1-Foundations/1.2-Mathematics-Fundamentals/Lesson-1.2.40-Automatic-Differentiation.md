# Lesson 1.2.40: Automatic Differentiation

> Previous Lesson: [Lesson 1.2.39: Numerical Differentiation](Lesson-1.2.39-Numerical-Differentiation.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.39 | **Topic**: Calculus for ML

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Explain automatic differentiation (autodiff)
- Describe computation graphs
- Compare autodiff to numerical differentiation
- Connect autodiff to backprop

---

## Introduction: Why This Matters

Automatic Differentiation matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Core Ideas

- Autodiff computes exact derivatives efficiently
- Computation graphs store operations

---

## Best Practices (Step-by-Step)

1. State the mathematical assumption behind Automatic Differentiation.
2. Verify with a tiny numeric example first.
3. Compare analytical and computed results.
4. Flag where rounding or scale can break intuition.

```python
from math import isclose

LESSON_ID = "1.2.40"
LESSON_TOPIC = "Automatic Differentiation"

def finite_difference_square(x: float, h: float = 1e-5) -> float:
    return ((x + h) ** 2 - x ** 2) / h

approx = finite_difference_square(3.0)
exact = 2 * 3.0
assert isclose(approx, exact, rel_tol=1e-3)
```

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.40.1: Define autodiff in one sentence.
- Exercise 1.2.40.2: Explain computation graph nodes.
- Exercise 1.2.40.3: Compare autodiff vs numeric gradients.

### Difficulty 2: Intermediate
- Exercise 1.2.40.4: Describe forward vs reverse mode.
- Exercise 1.2.40.5: Explain why reverse mode suits ML.
- Exercise 1.2.40.6: Describe how backprop uses autodiff.

### Difficulty 3: Advanced
- Exercise 1.2.40.7: Discuss memory tradeoffs in autodiff.
- Exercise 1.2.40.8: Explain why autodiff is exact for smooth ops.
- Exercise 1.2.40.9: Connect autodiff to chain rule.

---

## Mini-Project: Graph Sketch

Draw a computation graph for f(x,y)=x^2y+sin(x).

---

## Quiz & Assessment

### Quick Check (True/False)
1. Autodiff uses chain rule. (True)
2. Autodiff is the same as numeric differentiation. (False)
3. Reverse mode is efficient for scalar outputs. (True)
4. Backprop is reverse-mode autodiff. (True)

### Conceptual Questions
5. Why is autodiff important for ML?
6. What is stored in a computation graph?
7. How does reverse mode scale with parameters?

### Coding Challenge
8. Explain autodiff on a small function in words.

---

## Key Takeaways

- Autodiff computes exact gradients
- Reverse mode powers backprop
- Computation graphs organize derivatives
- Autodiff beats numeric gradients for ML

---

## Additional Resources

- https://www.deeplearning.ai
- https://www.khanacademy.org/math/multivariable-calculus
- https://pytorch.org/tutorials

---

## Next Lesson Preview

**Lesson 1.2.41**: Mini-Project - Gradient Descent from Scratch
- Build a complete optimizer

---

## Homework

- [ ] Complete exercises 1.2.40.1 - 1.2.40.9
- [ ] Draw a computation graph for another function
- [ ] Review chain rule connections

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.41** when ready.




---

## Core Teaching Content

Focus on one clear concept and connect it to a real workflow scenario.

```python
def run_example(value: int) -> int:
    return value * 2

print(run_example(3))
```

