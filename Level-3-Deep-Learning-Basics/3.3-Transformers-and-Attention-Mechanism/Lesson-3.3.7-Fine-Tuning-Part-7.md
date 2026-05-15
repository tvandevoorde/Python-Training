# Lesson 3.3.7: Fine-Tuning - Part 7

> Previous Lesson: [Lesson 3.3.6: Pretrained Models - Part 6](Lesson-3.3.6-Pretrained-Models-Part-6.md)

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 3.3.6 | **Topic**: 3.3 Transformers and Attention Mechanism (Fine-Tuning)

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Explain the core principles of Fine-Tuning - Part 7
- Implement a practical transformer and NLP workflow step
- Evaluate quality and identify common failure modes
- Document and communicate implementation decisions

---

## Introduction: Why This Matters

Fine-Tuning - Part 7 matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## 1. Concept Foundations (75 min)

### 1.1 Introduction/Theory
This lesson develops practical concepts for Fine-Tuning - Part 7 in real project workflows.

### 1.2 Worked Example
```python
import numpy as np

values = np.array([1.0, 2.0, 3.0, 4.0])
print(values.mean())
```

### 1.3 Common Pitfalls
- Inconsistent evaluation strategy across experiments
- Missing reproducibility settings in training workflows

---

## 2. Workflow Pattern (75 min)

### 2.1 Design Pattern
Use reproducible setup, explicit checkpoints, and clear evaluation criteria.

### 2.2 Worked Example
```python
import torch

x = torch.tensor([[1.0, 2.0], [3.0, 4.0]])
w = torch.tensor([[0.5], [1.5]])
y = x @ w
print(y)
```

### 2.3 Real-World Use
This pattern supports robust experimentation and production-ready handoff.

---

## 3. Validation and Debugging (45 min)

### 3.1 Checklist
Validate data quality, split integrity, metric assumptions, and runtime stability.

### 3.2 Example
```python
def assert_non_empty(name: str, values: list) -> None:
    if len(values) == 0:
        raise ValueError(f"{name} is empty")
```

---

## 4. Practical Application (60 min)

Implement a small train/evaluate script and compare at least two metrics.

```python
from sklearn.metrics import precision_score, recall_score

y_true = [0, 1, 1, 0, 1]
y_pred = [0, 1, 0, 0, 1]

print("precision", precision_score(y_true, y_pred))
print("recall", recall_score(y_true, y_pred))
```

---

## Best Practices (Step-by-Step)

1. Pick one baseline model and one fine-tuning method for Fine-Tuning - Part 7.
2. Freeze all non-essential parts first (PEFT mindset).
3. Track train/validation loss each epoch with fixed seeds.
4. Compare quality gain against compute cost before scaling.

```python
LESSON_ID = "3.3.7"
LESSON_TOPIC = "3.3 Transformers and Attention Mechanism (Fine-Tuning)"

def choose_trainable_layers(method: str) -> list[str]:
    if method.lower() == "lora":
        return ["q_proj", "v_proj"]
    return ["all"]

print(choose_trainable_layers("lora"))
```

## Exercises

### Difficulty 1: Starter

**Exercise 3.3.7.1**: Build a minimal reproducible setup.
```python
import random
import numpy as np

random.seed(42)
np.random.seed(42)
```

**Exercise 3.3.7.2**: Implement one baseline workflow step.
**Exercise 3.3.7.3**: Report one evaluation metric.

---

### Difficulty 2: Intermediate

**Exercise 3.3.7.4**: Refactor one step into a reusable function.
**Exercise 3.3.7.5**: Compare two model or configuration options.
**Exercise 3.3.7.6**: Explain one quality tradeoff in 3-5 sentences.

---

### Difficulty 3: Advanced

**Exercise 3.3.7.7**: Add cross-validation or repeated-eval logic.
**Exercise 3.3.7.8**: Diagnose one failure case and propose a fix.
**Exercise 3.3.7.9**: Add one robustness check for edge cases.

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
7. When should you expand beyond baseline models?

### Coding Challenge
8. Write a function that returns accuracy and F1.

Solution:
```python
from sklearn.metrics import accuracy_score, f1_score

def evaluate_binary(y_true, y_pred):
    return {
        "accuracy": accuracy_score(y_true, y_pred),
        "f1": f1_score(y_true, y_pred)
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
- https://scikit-learn.org/stable/user_guide.html

---

## Next Lesson Preview

**Lesson 3.3.8: NLP Evaluation - Part 8**
- Continue the transformer and NLP progression.

---

## Homework

- [ ] Complete exercises 3.3.7.1 - 3.3.7.9
- [ ] Extend the mini-project with one additional metric
- [ ] Add a short markdown summary of findings

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 3.3.8: NLP Evaluation - Part 8** when ready.

---
