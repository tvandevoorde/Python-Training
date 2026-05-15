# Lesson 1.2.46: Sample Spaces and Events

> Previous Lesson: [Lesson 1.2.45: Probability for ML - Big Picture](Lesson-1.2.45-Probability-for-ML-Big-Picture.md)

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.2.45 | **Topic**: Probability and Statistics

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Define sample spaces and events
- Use unions, intersections, complements
- Compute simple probabilities
- Represent events with sets

---

## Introduction: Why This Matters

Sample Spaces and Events matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Core Ideas

- Sample space lists all outcomes
- Events are subsets of outcomes

---

## Best Practices (Step-by-Step)

1. State the mathematical assumption behind Sample Spaces and Events.
2. Verify with a tiny numeric example first.
3. Compare analytical and computed results.
4. Flag where rounding or scale can break intuition.

```python
from math import isclose

LESSON_ID = "1.2.46"
LESSON_TOPIC = "Sample Spaces and Events"

def finite_difference_square(x: float, h: float = 1e-5) -> float:
    return ((x + h) ** 2 - x ** 2) / h

approx = finite_difference_square(3.0)
exact = 2 * 3.0
assert isclose(approx, exact, rel_tol=1e-3)
```

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.46.1: Define sample space for a die.
- Exercise 1.2.46.2: Define event of rolling even.
- Exercise 1.2.46.3: Explain complement of an event.

### Difficulty 2: Intermediate
- Exercise 1.2.46.4: Compute probability of A union B.
- Exercise 1.2.46.5: Use Venn diagram to show intersection.
- Exercise 1.2.46.6: Explain mutually exclusive events.

### Difficulty 3: Advanced
- Exercise 1.2.46.7: Define sample space for two coin flips.
- Exercise 1.2.46.8: Compute probability of at least one head.
- Exercise 1.2.46.9: Express events using set notation.

---

## Mini-Project: Event Builder

List outcomes and compute event probabilities for dice.

---

## Quiz & Assessment

### Quick Check (True/False)
1. Events are subsets of sample space. (True)
2. Complement includes outcomes not in event. (True)
3. Union means outcomes in both events only. (False)
4. Sample space can be infinite. (True)

### Conceptual Questions
5. Why use set notation for events?
6. What does intersection represent?
7. How do you model complex events?

### Coding Challenge
8. Simulate two dice and count events.

---

## Key Takeaways

- Sample space defines all outcomes
- Events are subsets with probability
- Set operations combine events
- Clear definitions prevent mistakes

---

## Additional Resources

- https://www.khanacademy.org/math/statistics-probability
- https://www.youtube.com/@statquest
- https://www.deeplearning.ai

---

## Next Lesson Preview

**Lesson 1.2.47**: Conditional Probability
- Add dependencies between events

---

## Homework

- [ ] Complete exercises 1.2.46.1 - 1.2.46.9
- [ ] Build three event examples
- [ ] Review set operations

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.47** when ready.




---

## Core Teaching Content

Focus on one clear concept and connect it to a real workflow scenario.

```python
def run_example(value: int) -> int:
    return value * 2

print(run_example(3))
```

