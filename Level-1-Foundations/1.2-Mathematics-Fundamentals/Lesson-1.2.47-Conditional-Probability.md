# Lesson 1.2.47: Conditional Probability

> Previous Lesson: [Lesson 1.2.46: Sample Spaces and Events](Lesson-1.2.46-Sample-Spaces-and-Events.md)

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.2.46 | **Topic**: Probability and Statistics

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Define conditional probability
- Explain independence
- Compute simple conditional probabilities
- Interpret dependence in data

---

## Introduction: Why This Matters

Conditional Probability matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Core Ideas

- P(A|B) = P(A and B) / P(B)
- Independence means P(A|B) = P(A)

---

## Best Practices (Step-by-Step)

1. State the mathematical assumption behind Conditional Probability.
2. Verify with a tiny numeric example first.
3. Compare analytical and computed results.
4. Flag where rounding or scale can break intuition.

```python
from math import isclose

LESSON_ID = "1.2.47"
LESSON_TOPIC = "Conditional Probability"

def finite_difference_square(x: float, h: float = 1e-5) -> float:
    return ((x + h) ** 2 - x ** 2) / h

approx = finite_difference_square(3.0)
exact = 2 * 3.0
assert isclose(approx, exact, rel_tol=1e-3)
```

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.47.1: Define conditional probability.
- Exercise 1.2.47.2: Give an example of dependent events.
- Exercise 1.2.47.3: Explain independence in words.

### Difficulty 2: Intermediate
- Exercise 1.2.47.4: Compute P(A|B) from a table.
- Exercise 1.2.47.5: Identify independence in a dataset.
- Exercise 1.2.47.6: Explain why conditioning changes probabilities.

### Difficulty 3: Advanced
- Exercise 1.2.47.7: Use conditional probability to compute P(A and B).
- Exercise 1.2.47.8: Explain Simpson's paradox in one sentence.
- Exercise 1.2.47.9: Describe conditional probability in ML features.

---

## Mini-Project: Conditional Probability Table

Create a small contingency table and compute conditional probabilities.

---

## Quiz & Assessment

### Quick Check (True/False)
1. Conditional probability uses P(B) in denominator. (True)
2. Independent events change conditional probability. (False)
3. Conditioning can increase or decrease probability. (True)
4. P(A|B) equals P(B|A). (False)

### Conceptual Questions
5. Why is conditional probability important in ML?
6. How do you test independence?
7. How does dependence affect modeling?

### Coding Challenge
8. Compute conditional probabilities from a frequency table.

---

## Key Takeaways

- Conditional probability models dependence
- Independence simplifies computation
- Conditioning changes probabilities
- ML often relies on conditional reasoning

---

## Additional Resources

- https://www.khanacademy.org/math/statistics-probability
- https://www.youtube.com/@statquest
- https://www.deeplearning.ai

---

## Next Lesson Preview

**Lesson 1.2.48**: Bayes' Theorem
- Reverse conditional probabilities

---

## Homework

- [ ] Complete exercises 1.2.47.1 - 1.2.47.9
- [ ] Build a conditional probability example
- [ ] Review independence definition

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.48** when ready.




---

## Core Teaching Content

Focus on one clear concept and connect it to a real workflow scenario.

```python
def run_example(value: int) -> int:
    return value * 2

print(run_example(3))
```

