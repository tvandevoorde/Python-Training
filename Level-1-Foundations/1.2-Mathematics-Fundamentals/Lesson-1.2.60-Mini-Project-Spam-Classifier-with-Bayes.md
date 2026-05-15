# Lesson 1.2.60: Mini-Project - Spam Classifier with Bayes

> Previous Lesson: [Lesson 1.2.59: t-tests and A/B Testing](Lesson-1.2.59-t-tests-and-AB-Testing.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.2.45 - 1.2.59 | **Topic**: Probability and Statistics Integration

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Explain naive Bayes intuition
- Build a simple spam classifier
- Compute class probabilities
- Evaluate basic accuracy

---

## Introduction: Why This Matters

Mini-Project - Spam Classifier with Bayes matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Project Overview

Build a tiny spam classifier using word counts and Bayes' theorem.

---

## Best Practices (Step-by-Step)

1. State the mathematical assumption behind Mini-Project - Spam Classifier with Bayes.
2. Verify with a tiny numeric example first.
3. Compare analytical and computed results.
4. Flag where rounding or scale can break intuition.

```python
from math import isclose

LESSON_ID = "1.2.60"
LESSON_TOPIC = "Mini-Project - Spam Classifier with Bayes"

def finite_difference_square(x: float, h: float = 1e-5) -> float:
    return ((x + h) ** 2 - x ** 2) / h

approx = finite_difference_square(3.0)
exact = 2 * 3.0
assert isclose(approx, exact, rel_tol=1e-3)
```

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.60.1: Define naive Bayes in one sentence.
- Exercise 1.2.60.2: Explain independence assumption.
- Exercise 1.2.60.3: Compute simple word likelihoods.

### Difficulty 2: Intermediate
- Exercise 1.2.60.4: Implement priors for spam/ham.
- Exercise 1.2.60.5: Compute posterior for a message.
- Exercise 1.2.60.6: Add Laplace smoothing.

### Difficulty 3: Advanced
- Exercise 1.2.60.7: Evaluate precision and recall.
- Exercise 1.2.60.8: Discuss limitations of naive Bayes.
- Exercise 1.2.60.9: Improve features with bigrams.

---

## Mini-Project: Naive Bayes Classifier

Implement a small classifier on a toy dataset and report accuracy.

---

## Quiz & Assessment

### Quick Check (True/False)
1. Naive Bayes assumes feature independence. (True)
2. Priors reflect class frequency. (True)
3. Laplace smoothing prevents zero probabilities. (True)
4. Naive Bayes cannot be used for text. (False)

### Conceptual Questions
5. Why is naive Bayes fast?
6. What breaks the independence assumption?
7. How do you evaluate a classifier?

### Coding Challenge
8. Compute posterior for a message with two words.

---

## Key Takeaways

- Naive Bayes is simple and effective
- Priors and likelihoods drive classification
- Smoothing improves robustness
- Evaluation metrics matter

---

## Additional Resources

- https://www.youtube.com/@statquest
- https://www.khanacademy.org/math/statistics-probability
- https://www.deeplearning.ai

---

## Next Lesson Preview

**Lesson 1.2.61**: Case Study - Statistical Significance
- Full test workflow

---

## Homework

- [ ] Complete exercises 1.2.60.1 - 1.2.60.9
- [ ] Run classifier on a small dataset
- [ ] Review Bayes' theorem

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.61** when ready.




---

## Core Teaching Content

Focus on one clear concept and connect it to a real workflow scenario.

```python
def run_example(value: int) -> int:
    return value * 2

print(run_example(3))
```

