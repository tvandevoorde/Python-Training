# Lesson 1.2.52: Normal Distribution and Z-scores

> Previous Lesson: [Lesson 1.2.51: Poisson and Exponential](Lesson-1.2.51-Poisson-and-Exponential.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.51 | **Topic**: Probability and Statistics

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Describe the normal distribution
- Compute z-scores
- Interpret standardization
- Use normal approximation ideas

---

## Introduction: Why This Matters

Normal Distribution and Z-scores matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Core Ideas

- Normal distribution is bell-shaped
- Z-score standardizes values

---

## Best Practices (Step-by-Step)

1. State the mathematical assumption behind Normal Distribution and Z-scores.
2. Verify with a tiny numeric example first.
3. Compare analytical and computed results.
4. Flag where rounding or scale can break intuition.

```python
from math import isclose

LESSON_ID = "1.2.52"
LESSON_TOPIC = "Normal Distribution and Z-scores"

def finite_difference_square(x: float, h: float = 1e-5) -> float:
    return ((x + h) ** 2 - x ** 2) / h

approx = finite_difference_square(3.0)
exact = 2 * 3.0
assert isclose(approx, exact, rel_tol=1e-3)
```

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.52.1: Define normal distribution.
- Exercise 1.2.52.2: Explain mean and standard deviation.
- Exercise 1.2.52.3: Compute a z-score.

### Difficulty 2: Intermediate
- Exercise 1.2.52.4: Interpret z-score of 2.
- Exercise 1.2.52.5: Explain 68-95-99.7 rule.
- Exercise 1.2.52.6: Standardize a small dataset.

### Difficulty 3: Advanced
- Exercise 1.2.52.7: Explain normal approximation to binomial.
- Exercise 1.2.52.8: Discuss outliers using z-scores.
- Exercise 1.2.52.9: Compare two standardized datasets.

---

## Mini-Project: Z-score Calculator

Compute z-scores for a list and flag outliers.

---

## Quiz & Assessment

### Quick Check (True/False)
1. Normal distribution is symmetric. (True)
2. Z-scores measure standard deviations from mean. (True)
3. Standardization changes data order. (False)
4. Z-score of 0 equals the mean. (True)

### Conceptual Questions
5. Why standardize features?
6. How does sigma affect spread?
7. When is normal approximation useful?

### Coding Challenge
8. Compute z-scores for a list of numbers.

---

## Key Takeaways

- Normal distribution is central in stats
- Z-scores standardize values
- Standardization helps compare features
- Normal approximation is widely used

---

## Additional Resources

- https://www.khanacademy.org/math/statistics-probability
- https://www.youtube.com/@statquest
- https://www.deeplearning.ai

---

## Next Lesson Preview

**Lesson 1.2.53**: Descriptive Statistics
- Summarize data with metrics

---

## Homework

- [ ] Complete exercises 1.2.52.1 - 1.2.52.9
- [ ] Standardize a sample dataset
- [ ] Review z-score interpretation

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.53** when ready.




---

## Core Teaching Content

Focus on one clear concept and connect it to a real workflow scenario.

```python
def run_example(value: int) -> int:
    return value * 2

print(run_example(3))
```

