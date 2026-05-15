# Lesson 1.2.33: Chain Rule (Single Variable)

> Previous Lesson: [Lesson 1.2.32: Gradients and Directional Derivatives](Lesson-1.2.32-Gradients-and-Directional-Derivatives.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.32 | **Topic**: Calculus for ML

---

## Learning Objectives

By the end of this lesson, you will be able to:
- State the chain rule
- Apply chain rule to compositions
- Recognize nested functions
- Connect chain rule to backprop intuition

---

## Introduction: Why This Matters

Chain Rule (Single Variable) matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Core Ideas

- Composition derivatives multiply
- Inner function derivative times outer derivative

---

## Best Practices (Step-by-Step)

1. State the mathematical assumption behind Chain Rule (Single Variable).
2. Verify with a tiny numeric example first.
3. Compare analytical and computed results.
4. Flag where rounding or scale can break intuition.

```python
from math import isclose

LESSON_ID = "1.2.33"
LESSON_TOPIC = "Chain Rule (Single Variable)"

def finite_difference_square(x: float, h: float = 1e-5) -> float:
    return ((x + h) ** 2 - x ** 2) / h

approx = finite_difference_square(3.0)
exact = 2 * 3.0
assert isclose(approx, exact, rel_tol=1e-3)
```

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.33.1: State the chain rule in words.
- Exercise 1.2.33.2: Differentiate f(x)=(3x+1)^2.
- Exercise 1.2.33.3: Identify inner and outer functions.

### Difficulty 2: Intermediate
- Exercise 1.2.33.4: Differentiate f(x)=sin(2x+1).
- Exercise 1.2.33.5: Differentiate f(x)=(x^2+1)^3.
- Exercise 1.2.33.6: Explain how chain rule reduces work.

### Difficulty 3: Advanced
- Exercise 1.2.33.7: Differentiate f(x)=exp(sin(x)).
- Exercise 1.2.33.8: Explain chain rule in backprop steps.
- Exercise 1.2.33.9: Write a chain-rule checklist.

---

## Mini-Project: Chain Rule Worksheet

Create a worksheet of 12 chain-rule problems with solutions.

---

## Quiz & Assessment

### Quick Check (True/False)
1. Chain rule applies to composition. (True)
2. Chain rule multiplies derivatives. (True)
3. Chain rule is only for polynomials. (False)
4. Backprop uses chain rule. (True)

### Conceptual Questions
5. Why does chain rule matter for ML?
6. What is a common chain-rule mistake?
7. How do you identify inner functions?

### Coding Challenge
8. Differentiate f(x)=(2x+3)^4.

---

## Key Takeaways

- Chain rule is essential for compositions
- Nested functions appear everywhere in ML
- Backprop relies on chain rule
- Correct identification prevents errors

---

## Additional Resources

- https://www.khanacademy.org/math/calculus-1
- https://tutorial.math.lamar.edu
- https://www.deeplearning.ai

---

## Next Lesson Preview

**Lesson 1.2.34**: Multivariable Chain Rule
- Extend to vectors

---

## Homework

- [ ] Complete exercises 1.2.33.1 - 1.2.33.9
- [ ] Solve 10 chain-rule problems
- [ ] Review composition functions

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.34** when ready.




---

## Core Teaching Content

Focus on one clear concept and connect it to a real workflow scenario.

```python
def run_example(value: int) -> int:
    return value * 2

print(run_example(3))
```

