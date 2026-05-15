# Lesson 1.2.50: Bernoulli and Binomial

> Previous Lesson: [Lesson 1.2.49: Random Variables and Distributions](Lesson-1.2.49-Random-Variables-and-Distributions.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.49 | **Topic**: Probability and Statistics

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Define Bernoulli and binomial distributions
- Compute probabilities for binomial events
- Interpret parameters n and p
- Apply to classification problems

---

## Introduction: Why This Matters

Bernoulli and Binomial matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Core Ideas

- Bernoulli models one trial
- Binomial models n independent trials

---

## Best Practices (Step-by-Step)

1. State the mathematical assumption behind Bernoulli and Binomial.
2. Verify with a tiny numeric example first.
3. Compare analytical and computed results.
4. Flag where rounding or scale can break intuition.

```python
from math import isclose

LESSON_ID = "1.2.50"
LESSON_TOPIC = "Bernoulli and Binomial"

def finite_difference_square(x: float, h: float = 1e-5) -> float:
    return ((x + h) ** 2 - x ** 2) / h

approx = finite_difference_square(3.0)
exact = 2 * 3.0
assert isclose(approx, exact, rel_tol=1e-3)
```

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.50.1: Define Bernoulli distribution.
- Exercise 1.2.50.2: Define binomial distribution.
- Exercise 1.2.50.3: Explain parameters n and p.

### Difficulty 2: Intermediate
- Exercise 1.2.50.4: Compute probability of k successes.
- Exercise 1.2.50.5: Explain expectation of binomial.
- Exercise 1.2.50.6: Give a coin-flip example.

### Difficulty 3: Advanced
- Exercise 1.2.50.7: Approximate binomial with normal when n is large.
- Exercise 1.2.50.8: Explain connection to logistic regression outputs.
- Exercise 1.2.50.9: Simulate binomial samples.

---

## Mini-Project: Binomial Simulator

Simulate n coin flips and compare to theoretical probabilities.

---

## Quiz & Assessment

### Quick Check (True/False)
1. Bernoulli is a single trial. (True)
2. Binomial requires independence. (True)
3. Binomial has parameter lambda. (False)
4. p is success probability. (True)

### Conceptual Questions
5. Why is binomial useful in ML?
6. How do n and p change the distribution?
7. When is normal approximation reasonable?

### Coding Challenge
8. Simulate 1000 Bernoulli trials and compute mean.

---

## Key Takeaways

- Bernoulli models binary outcomes
- Binomial aggregates repeated trials
- Parameters control shape
- Useful for classification modeling

---

## Additional Resources

- https://www.khanacademy.org/math/statistics-probability
- https://www.youtube.com/@statquest
- https://www.deeplearning.ai

---

## Next Lesson Preview

**Lesson 1.2.51**: Poisson and Exponential
- Model event counts and waiting times

---

## Homework

- [ ] Complete exercises 1.2.50.1 - 1.2.50.9
- [ ] Run a binomial simulation
- [ ] Review discrete distributions

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.51** when ready.




---

## Core Teaching Content

Focus on one clear concept and connect it to a real workflow scenario.

```python
def run_example(value: int) -> int:
    return value * 2

print(run_example(3))
```

