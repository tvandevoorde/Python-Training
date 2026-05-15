# Lesson 1.2.51: Poisson and Exponential

> Previous Lesson: [Lesson 1.2.50: Bernoulli and Binomial](Lesson-1.2.50-Bernoulli-and-Binomial.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.50 | **Topic**: Probability and Statistics

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Describe Poisson distribution for counts
- Describe exponential distribution for waiting times
- Interpret parameter lambda
- Use Poisson for event modeling

---

## Introduction: Why This Matters

Poisson and Exponential matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Core Ideas

- Poisson models counts per interval
- Exponential models waiting time between events

---

## Best Practices (Step-by-Step)

1. State the mathematical assumption behind Poisson and Exponential.
2. Verify with a tiny numeric example first.
3. Compare analytical and computed results.
4. Flag where rounding or scale can break intuition.

```python
from math import isclose

LESSON_ID = "1.2.51"
LESSON_TOPIC = "Poisson and Exponential"

def finite_difference_square(x: float, h: float = 1e-5) -> float:
    return ((x + h) ** 2 - x ** 2) / h

approx = finite_difference_square(3.0)
exact = 2 * 3.0
assert isclose(approx, exact, rel_tol=1e-3)
```

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.51.1: Define Poisson distribution.
- Exercise 1.2.51.2: Define exponential distribution.
- Exercise 1.2.51.3: Explain parameter lambda.

### Difficulty 2: Intermediate
- Exercise 1.2.51.4: Give an example of Poisson events.
- Exercise 1.2.51.5: Explain memoryless property.
- Exercise 1.2.51.6: Connect Poisson and exponential.

### Difficulty 3: Advanced
- Exercise 1.2.51.7: Simulate Poisson counts.
- Exercise 1.2.51.8: Compare Poisson with binomial.
- Exercise 1.2.51.9: Discuss limitations in real data.

---

## Mini-Project: Event Simulator

Simulate events per hour and compute average rate.

---

## Quiz & Assessment

### Quick Check (True/False)
1. Poisson models counts. (True)
2. Exponential models waiting times. (True)
3. Exponential distribution is memoryless. (True)
4. Lambda is always less than 1. (False)

### Conceptual Questions
5. When would you use Poisson?
6. What does lambda represent?
7. How do Poisson and exponential relate?

### Coding Challenge
8. Simulate 100 Poisson samples with lambda=3.

---

## Key Takeaways

- Poisson counts events
- Exponential models waiting times
- Lambda controls rate
- Useful for time-based events

---

## Additional Resources

- https://www.khanacademy.org/math/statistics-probability
- https://www.youtube.com/@statquest
- https://www.deeplearning.ai

---

## Next Lesson Preview

**Lesson 1.2.52**: Normal Distribution and Z-scores
- Work with Gaussian data

---

## Homework

- [ ] Complete exercises 1.2.51.1 - 1.2.51.9
- [ ] Simulate Poisson and exponential samples
- [ ] Review rate parameter intuition

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.52** when ready.




---

## Core Teaching Content

Focus on one clear concept and connect it to a real workflow scenario.

```python
def run_example(value: int) -> int:
    return value * 2

print(run_example(3))
```

