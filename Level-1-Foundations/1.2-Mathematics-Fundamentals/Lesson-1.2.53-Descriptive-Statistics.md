# Lesson 1.2.53: Descriptive Statistics

> Previous Lesson: [Lesson 1.2.52: Normal Distribution and Z-scores](Lesson-1.2.52-Normal-Distribution-and-Z-scores.md)

**Estimated Time**: 8 hours | **Difficulty**: Beginner-Intermediate  
**Prerequisites**: Lesson 1.2.52 | **Topic**: Probability and Statistics

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Compute mean, median, mode
- Compute variance and standard deviation
- Interpret spread and center
- Summarize datasets

---

## Introduction: Why This Matters

Descriptive Statistics matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Core Ideas

- Central tendency measures typical values
- Dispersion measures spread

---

## Best Practices (Step-by-Step)

1. State the mathematical assumption behind Descriptive Statistics.
2. Verify with a tiny numeric example first.
3. Compare analytical and computed results.
4. Flag where rounding or scale can break intuition.

```python
from math import isclose

LESSON_ID = "1.2.53"
LESSON_TOPIC = "Descriptive Statistics"

def finite_difference_square(x: float, h: float = 1e-5) -> float:
    return ((x + h) ** 2 - x ** 2) / h

approx = finite_difference_square(3.0)
exact = 2 * 3.0
assert isclose(approx, exact, rel_tol=1e-3)
```

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.53.1: Compute mean of a list.
- Exercise 1.2.53.2: Compute median of a list.
- Exercise 1.2.53.3: Explain standard deviation.

### Difficulty 2: Intermediate
- Exercise 1.2.53.4: Compare mean vs median for skewed data.
- Exercise 1.2.53.5: Compute variance by hand.
- Exercise 1.2.53.6: Explain when mode is useful.

### Difficulty 3: Advanced
- Exercise 1.2.53.7: Compute statistics for grouped data.
- Exercise 1.2.53.8: Explain impact of outliers.
- Exercise 1.2.53.9: Compare two datasets with summary stats.

---

## Mini-Project: Summary Report

Create a report with mean, median, std for a dataset.

---

## Quiz & Assessment

### Quick Check (True/False)
1. Mean can be affected by outliers. (True)
2. Median is robust to outliers. (True)
3. Variance is the square root of std. (False)
4. Mode is always unique. (False)

### Conceptual Questions
5. When is median preferred over mean?
6. Why use standard deviation?
7. What does variance measure?

### Coding Challenge
8. Compute mean and std for a list of numbers.

---

## Key Takeaways

- Descriptive stats summarize data
- Mean, median, mode describe center
- Variance and std describe spread
- Outliers affect metrics differently

---

## Additional Resources

- https://www.khanacademy.org/math/statistics-probability
- https://www.youtube.com/@statquest
- https://www.deeplearning.ai

---

## Next Lesson Preview

**Lesson 1.2.54**: Covariance and Correlation
- Measure relationships

---

## Homework

- [ ] Complete exercises 1.2.53.1 - 1.2.53.9
- [ ] Summarize a real dataset
- [ ] Review variance vs std

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.54** when ready.




---

## Core Teaching Content

Focus on one clear concept and connect it to a real workflow scenario.

```python
def run_example(value: int) -> int:
    return value * 2

print(run_example(3))
```

