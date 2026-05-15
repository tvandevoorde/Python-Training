# Lesson 1.4.7: Transformation Layer with Pandas

> Previous Lesson: [Lesson 1.4.6: Ingestion Layer Design](Lesson-1.4.6-Ingestion-Layer-Design.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.4.6 | **Topic**: Project Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Explain key principles of Transformation Layer with Pandas
- Implement a practical component for an end-to-end project
- Validate outputs and handle common failure modes
- Document implementation choices clearly

---

## Introduction: Why This Matters

Transformation Layer with Pandas matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## 1. Core Concepts (75 min)

### 1.1 Introduction/Theory
This lesson focuses on one core integration concept used in real data project delivery.

### 1.2 Worked Example
`python
from pathlib import Path
import pandas as pd

sample = pd.DataFrame({"id": [1, 2, 3], "value": [10, 20, 30]})
out = Path("outputs")
out.mkdir(exist_ok=True)
sample.to_csv(out / "sample.csv", index=False)
print(sample.head())
`

### 1.3 Common Pitfalls
- Skipping validation at boundaries between components
- Hardcoding file paths and environment assumptions

---

## 2. Integration Pattern (75 min)

### 2.1 Design Pattern
Use small, testable modules connected by clear interfaces.

### 2.2 Worked Example
`python
import pandas as pd

raw = pd.DataFrame({"region": ["N", "S", "N"], "sales": [100, 80, 120]})
summary = raw.groupby("region", as_index=False)["sales"].sum()
print(summary)
`

### 2.3 Real-World Use
This pattern improves maintainability and supports iterative delivery.

---

## 3. Validation and Quality (45 min)

### 3.1 Checklist
Validate schema, null handling, ranges, and key assumptions.

### 3.2 Example
`python
import pandas as pd

def validate_frame(df: pd.DataFrame) -> None:
    if df.empty:
        raise ValueError("DataFrame is empty")
    if df.isna().any().any():
        raise ValueError("DataFrame contains missing values")
`

---

## 4. Practical Application (60 min)

Implement a short pipeline step and verify output with assertions.

`python
import pandas as pd

source = pd.DataFrame({"x": [1, 2, 3], "y": [4, 5, 6]})
source["total"] = source["x"] + source["y"]
assert source["total"].tolist() == [5, 7, 9]
print(source)
`

---

## Best Practices (Step-by-Step)

1. Start from a tiny sample that reflects Project Foundations.
2. Make transformations explicit (no hidden in-place side effects).
3. Validate schema assumptions after each step.
4. Save intermediate outputs for debugging reproducibility.

```python
import pandas as pd

LESSON_ID = "1.4.7"
LESSON_TOPIC = "Project Foundations"
frame = pd.DataFrame({"value": [10, None, 30]})
clean = frame.copy()
clean["value"] = clean["value"].fillna(clean["value"].median())

assert "value" in clean.columns
assert clean["value"].isna().sum() == 0
```

## Exercises

### Difficulty 1: Starter

**Exercise 1.4.7.1**: Create a small input dataset and save it to CSV.
`python
import pandas as pd

df = pd.DataFrame({"name": ["a", "b"], "score": [90, 80]})
df.to_csv("scores.csv", index=False)
`

**Exercise 1.4.7.2**: Add one validation check for missing values.
**Exercise 1.4.7.3**: Compute one grouped summary table.

---

### Difficulty 2: Intermediate

**Exercise 1.4.7.4**: Refactor one step into a reusable function.
**Exercise 1.4.7.5**: Write a failing test for bad input.
**Exercise 1.4.7.6**: Add structured logging for a pipeline stage.

---

### Difficulty 3: Advanced

**Exercise 1.4.7.7**: Add retry logic to a file read operation.
**Exercise 1.4.7.8**: Benchmark two implementation options.
**Exercise 1.4.7.9**: Document tradeoffs in a short design note.

---

## Mini-Project: Integration Task

Build a compact end-to-end step that ingests data, transforms it, validates outputs, and writes a result file.

`python
from pathlib import Path
import pandas as pd

raw = pd.DataFrame({"city": ["A", "B", "A"], "value": [3, 4, 5]})
result = raw.groupby("city", as_index=False)["value"].mean()
out = Path("outputs")
out.mkdir(exist_ok=True)
result.to_csv(out / "city_summary.csv", index=False)
print(result)
`

---

## Quiz & Assessment

### Quick Check (True/False)
1. Integration work should include validation at boundaries. (True)
2. Logging is optional in production workflows. (False)
3. Tests should include failure paths. (True)
4. Reusable functions improve maintainability. (True)

### Conceptual Questions
5. Why should pipeline steps be modular?
6. What are the minimum checks before writing outputs?
7. How does documentation reduce team risk?

### Coding Challenge
8. Write a function that validates and summarizes a DataFrame by one key.

Solution:
`python
import pandas as pd

def summarize_by_key(df: pd.DataFrame, key: str, value: str) -> pd.DataFrame:
    if df.empty:
        raise ValueError("empty input")
    if df[[key, value]].isna().any().any():
        raise ValueError("null values found")
    return df.groupby(key, as_index=False)[value].sum()
`

---

## Key Takeaways

- Integration quality depends on clear interfaces
- Validation and testing prevent downstream failures
- Logging and docs are first-class project outputs
- Small reusable components scale better than scripts

---

## Additional Resources

- https://pandas.pydata.org/docs/user_guide/index.html
- https://docs.python.org/3/library/sqlite3.html
- https://matplotlib.org/stable/users/explain/quick_start.html

---

## Next Lesson Preview

**Lesson 1.4.8: Storage Layer with SQLite**
- Continue toward project-ready implementation.

---

## Homework

- [ ] Complete exercises 1.4.7.1 - 1.4.7.9
- [ ] Extend the mini-project with one additional validation rule
- [ ] Add a short README describing your approach

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.4.8: Storage Layer with SQLite** when ready.

---
