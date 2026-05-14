# Lesson 5.2.2: Tool Calling - Part 2

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 5.2.1 | **Topic**: 5.2 Agents and Agentic AI (Tool Calling)

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Explain the core principles of Tool Calling - Part 2
- Implement a practical agentic AI workflow step
- Evaluate quality and identify common failure modes
- Document and communicate implementation decisions

---

## 1. Concept Foundations (75 min)

### 1.1 Introduction/Theory
This lesson develops practical concepts for Tool Calling - Part 2 in real project workflows.

### 1.2 Worked Example
```python
from dataclasses import dataclass

@dataclass
class EvalResult:
    score: float
    note: str

result = EvalResult(score=0.87, note="baseline")
print(result)
```

### 1.3 Common Pitfalls
- Missing explicit acceptance criteria for quality and safety
- Incomplete observability around model behavior in production

---

## 2. Workflow Pattern (75 min)

### 2.1 Design Pattern
Use reproducible setup, explicit checkpoints, and clear evaluation criteria.

### 2.2 Worked Example
```python
from typing import Dict


def summarize_metrics(metrics: Dict[str, float]) -> str:
    return ", ".join(f"{k}={v:.3f}" for k, v in metrics.items())


print(summarize_metrics({"quality": 0.91, "latency": 0.24}))
```

### 2.3 Real-World Use
This pattern supports robust experimentation and production-ready handoff.

---

## 3. Validation and Debugging (45 min)

### 3.1 Checklist
Validate data quality, evaluation assumptions, runtime stability, and rollback strategy.

### 3.2 Example
```python
def assert_threshold(name: str, value: float, minimum: float) -> None:
    if value < minimum:
        raise ValueError(f"{name} below minimum: {value} < {minimum}")
```

---

## 4. Practical Application (60 min)

Implement a small evaluate/report script and compare at least two metrics.

```python
quality = 0.89
hallucination_rate = 0.06

print("quality", quality)
print("hallucination_rate", hallucination_rate)
```

---

## Exercises

### Difficulty 1: Starter

**Exercise 5.2.2.1**: Build a minimal reproducible setup.
```python
import random

random.seed(42)
```

**Exercise 5.2.2.2**: Implement one baseline workflow step.
**Exercise 5.2.2.3**: Report one evaluation metric.

---

### Difficulty 2: Intermediate

**Exercise 5.2.2.4**: Refactor one step into a reusable function.
**Exercise 5.2.2.5**: Compare two model or configuration options.
**Exercise 5.2.2.6**: Explain one quality tradeoff in 3-5 sentences.

---

### Difficulty 3: Advanced

**Exercise 5.2.2.7**: Add repeated-evaluation logic.
**Exercise 5.2.2.8**: Diagnose one failure case and propose a fix.
**Exercise 5.2.2.9**: Add one robustness check for edge cases.

---

## Mini-Project: Applied Workflow Task

Build a compact script that runs a core workflow step, evaluates outcomes, and saves an artifact.

```python
from pathlib import Path
import json

report = {
    "status": "ok",
    "notes": "Baseline workflow completed."
}

out = Path("outputs")
out.mkdir(exist_ok=True)
(out / "report.json").write_text(json.dumps(report, indent=2), encoding="utf-8")
print("saved", out / "report.json")
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. Reproducibility settings should be explicit. (True)
2. One metric is always enough. (False)
3. Validation checks reduce downstream failures. (True)
4. Documentation is optional in team projects. (False)

### Conceptual Questions
5. Why can a strong metric still hide model issues?
6. What is the purpose of independent validation?
7. When should you expand beyond baseline approaches?

### Coding Challenge
8. Write a function that returns two quality indicators.

Solution:
```python
def evaluate_scores(quality: float, stability: float) -> dict[str, float]:
    return {
        "quality": quality,
        "stability": stability,
    }
```

---

## Key Takeaways

- Match methods to objective and constraints
- Keep workflows reproducible and testable
- Validate assumptions early and often
- Document enough context for repeatability

---

## Additional Resources

- https://pytorch.org/tutorials/
- https://huggingface.co/docs/transformers/index
- https://mlflow.org/docs/latest/index.html

---

## Next Lesson Preview

**Lesson 5.2.3: Prompting Strategies - Part 3**
- Continue the agentic AI progression.

---

## Homework

- [ ] Complete exercises 5.2.2.1 - 5.2.2.9
- [ ] Extend the mini-project with one additional quality check
- [ ] Add a short markdown summary of findings

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 5.2.3: Prompting Strategies - Part 3** when ready.
