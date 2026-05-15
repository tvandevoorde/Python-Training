# Lesson 1.4.24: PROJECT 2 - Personal Data Analysis Portfolio

> Previous Lesson: [Lesson 1.4.23: Mini-Project - Portfolio Artifact Sprint](Lesson-1.4.23-Mini-Project-Portfolio-Artifact-Sprint.md)

**Estimated Time**: 8 hours | **Difficulty**: Advanced  
**Prerequisites**: Lessons 1.4.14 - 1.4.23 | **Topic**: Project 2

---

## Project Build Overview

This lesson is a major build checkpoint with production-style deliverables.

### Required Deliverables
- Project plan and assumptions
- Data ingestion and validation workflow
- Transformation and storage components
- Visual outputs and summary insights
- Tests, logging, and error handling
- Documentation (README + architecture notes)

---

## Implementation Phases

1. Planning and Scope
- Define goals, constraints, and success criteria.

2. Build and Integrate
- Implement each module and verify interfaces.

3. Validate and Harden
- Add tests, logging, and failure handling.

4. Report and Present
- Document insights, tradeoffs, and next steps.

---

## Assessment Rubric

- Correctness and completeness (35%)
- Data quality and validation (20%)
- Engineering quality (20%)
- Communication and documentation (15%)
- Reflection and improvement plan (10%)

---

## Submission Checklist

- [ ] All core requirements implemented
- [ ] Reproducible execution steps documented
- [ ] At least 10 unit/integration checks included
- [ ] Visual outputs are clear and labeled
- [ ] Final write-up includes limitations and future work

---

## Best Practices (Step-by-Step)

1. Clarify one concrete goal for: PROJECT 2 - Personal Data Analysis Portfolio.
2. Implement the smallest working version for: Project 2.
3. Handle one invalid-input case explicitly.
4. Refactor repeated logic into a named function.

```python
LESSON_ID = "1.4.24"
LESSON_TOPIC = "PROJECT 2 - Personal Data Analysis Portfolio"

def normalize_name(value: str) -> str:
    text = value.strip()
    if not text:
        raise ValueError("name must not be empty")
    return text.title()

print(normalize_name("  python learner "))
```

## Quick Practice

- Exercise: Modify the example to handle one edge case.
- Quiz: What would break if input validation was removed?

---

**Next Lesson**: [Lesson 1.4.25: FINAL EXERCISE PROJECT - Level 1 Integrated Foundations Challenge](Lesson-1.4.25-FINAL-EXERCISE-PROJECT-Level-1-Integrated-Foundations-Challenge.md)

## Next Lesson Preview

**Lesson 1.4.25: FINAL EXERCISE PROJECT - Level 1 Integrated Foundations Challenge**
- Continue integration and delivery skills.

---

**Lesson Complete.**

Proceed to **Lesson 1.4.25: FINAL EXERCISE PROJECT - Level 1 Integrated Foundations Challenge** when ready.

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Explain the key idea behind PROJECT 2 - Personal Data Analysis Portfolio
- Implement a small practical example
- Identify one common failure mode and fix

---

## Introduction: Why This Matters

PROJECT 2 - Personal Data Analysis Portfolio matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Core Teaching Content

Focus on one clear concept and connect it to a real workflow scenario.

```python
def run_example(value: int) -> int:
    return value * 2

print(run_example(3))
```

