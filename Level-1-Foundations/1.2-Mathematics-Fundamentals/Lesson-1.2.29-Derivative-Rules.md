# Lesson 1.2.29: Derivative Rules

> Previous Lesson: [Lesson 1.2.28: Derivative Basics](Lesson-1.2.28-Derivative-Basics.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.28 | **Topic**: Calculus for ML

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Apply product and quotient rules
- Use the chain rule
- Differentiate polynomials quickly
- Explain rule selection

---

## Introduction: Why This Matters

Derivative Rules matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Core Ideas

- Product rule handles multiplication
- Quotient rule handles division
- Chain rule handles composition

---

## Best Practices (Step-by-Step)

1. State the mathematical assumption behind Derivative Rules.
2. Verify with a tiny numeric example first.
3. Compare analytical and computed results.
4. Flag where rounding or scale can break intuition.

```python
from math import isclose

LESSON_ID = "1.2.29"
LESSON_TOPIC = "Derivative Rules"

def finite_difference_square(x: float, h: float = 1e-5) -> float:
    return ((x + h) ** 2 - x ** 2) / h

approx = finite_difference_square(3.0)
exact = 2 * 3.0
assert isclose(approx, exact, rel_tol=1e-3)
```

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.29.1: Differentiate f(x)=x^3.
- Exercise 1.2.29.2: Explain chain rule in words.
- Exercise 1.2.29.3: Identify when to use product rule.

### Difficulty 2: Intermediate
- Exercise 1.2.29.4: Differentiate f(x)=x^2 sin(x).
- Exercise 1.2.29.5: Differentiate f(x)=(x^2+1)/(x+1).
- Exercise 1.2.29.6: Differentiate f(x)=(3x+1)^5.

### Difficulty 3: Advanced
- Exercise 1.2.29.7: Differentiate a nested composition.
- Exercise 1.2.29.8: Explain how chain rule appears in backprop.
- Exercise 1.2.29.9: Create a rule selection guide.

---

## Mini-Project: Derivative Practice Sheet

Create a worksheet with 10 functions and their derivatives.

---

## Quiz & Assessment

### Quick Check (True/False)
1. Product rule is used for multiplication. (True)
2. Chain rule applies to sums only. (False)
3. Quotient rule handles division. (True)
4. Rules reduce manual limit work. (True)

### Conceptual Questions
5. Why does chain rule matter in ML?
6. How do you pick the right rule?
7. What is a common mistake in product rule?

### Coding Challenge
8. Differentiate f(x)=(2x+1)^3 by hand and verify numerically.

---

## Key Takeaways

- Rules speed up differentiation
- Chain rule is central to ML
- Correct rule choice prevents errors
- Practice builds fluency

---

## Additional Resources

- https://www.khanacademy.org/math/calculus-1
- https://tutorial.math.lamar.edu
- https://www.deeplearning.ai

---

## Next Lesson Preview

**Lesson 1.2.30**: Higher-Order Derivatives
- Study curvature and acceleration

---

## Homework

- [ ] Complete exercises 1.2.29.1 - 1.2.29.9
- [ ] Create your own chain-rule examples
- [ ] Review product and quotient rules

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.30** when ready.




---

## Core Teaching Content

Focus on one clear concept and connect it to a real workflow scenario.

```python
def run_example(value: int) -> int:
    return value * 2

print(run_example(3))
```

