# Lesson 1.2.49: Random Variables and Distributions

> Previous Lesson: [Lesson 1.2.48: Bayes' Theorem](Lesson-1.2.48-Bayes-Theorem.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.48 | **Topic**: Probability and Statistics

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Define random variables
- Distinguish discrete vs continuous
- Describe PMF and PDF
- Interpret distribution parameters

---

## Introduction: Why This Matters

Random Variables and Distributions matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Core Ideas

- Random variables map outcomes to numbers
- Distributions describe probabilities

---

## Best Practices (Step-by-Step)

1. State the mathematical assumption behind Random Variables and Distributions.
2. Verify with a tiny numeric example first.
3. Compare analytical and computed results.
4. Flag where rounding or scale can break intuition.

```python
from math import isclose

LESSON_ID = "1.2.49"
LESSON_TOPIC = "Random Variables and Distributions"

def finite_difference_square(x: float, h: float = 1e-5) -> float:
    return ((x + h) ** 2 - x ** 2) / h

approx = finite_difference_square(3.0)
exact = 2 * 3.0
assert isclose(approx, exact, rel_tol=1e-3)
```

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.49.1: Define random variable in one sentence.
- Exercise 1.2.49.2: Give a discrete random variable example.
- Exercise 1.2.49.3: Explain PMF vs PDF.

### Difficulty 2: Intermediate
- Exercise 1.2.49.4: Describe expectation in words.
- Exercise 1.2.49.5: Identify parameters of a normal distribution.
- Exercise 1.2.49.6: Explain CDF meaning.

### Difficulty 3: Advanced
- Exercise 1.2.49.7: Describe variance for a random variable.
- Exercise 1.2.49.8: Explain why PDFs can exceed 1.
- Exercise 1.2.49.9: Connect distributions to ML modeling.

---

## Mini-Project: Distribution Notes

Create notes comparing discrete and continuous distributions.

---

## Quiz & Assessment

### Quick Check (True/False)
1. Random variables map outcomes to numbers. (True)
2. PMF applies to continuous variables. (False)
3. PDFs integrate to 1. (True)
4. Mean and variance describe distributions. (True)

### Conceptual Questions
5. Why do we use distributions in ML?
6. What is the CDF used for?
7. How do parameters shape a distribution?

### Coding Challenge
8. Simulate a random variable and compute its mean.

---

## Key Takeaways

- Random variables model uncertainty
- PMF for discrete, PDF for continuous
- Parameters shape distribution behavior
- Distributions underpin ML models

---

## Additional Resources

- https://www.khanacademy.org/math/statistics-probability
- https://www.youtube.com/@statquest
- https://www.deeplearning.ai

---

## Next Lesson Preview

**Lesson 1.2.50**: Bernoulli and Binomial
- Model binary outcomes

---

## Homework

- [ ] Complete exercises 1.2.49.1 - 1.2.49.9
- [ ] Write examples of discrete and continuous variables
- [ ] Review PMF/PDF differences

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.50** when ready.




---

## Core Teaching Content

Focus on one clear concept and connect it to a real workflow scenario.

```python
def run_example(value: int) -> int:
    return value * 2

print(run_example(3))
```

