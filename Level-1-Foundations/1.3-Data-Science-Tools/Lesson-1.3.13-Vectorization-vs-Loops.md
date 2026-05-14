# Lesson 1.3.13: Vectorization vs Loops

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.3.12 | **Topic**: NumPy Mastery

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Explain the core idea behind "Vectorization vs Loops"
- Apply this concept to realistic data tasks
- Debug common mistakes and edge cases
- Build a small reusable workflow in Python

---

## 1. Core Concept (75 min)

### 1.1 Introduction/Theory
This lesson introduces practical patterns that appear frequently in data analysis workflows.

### 1.2 Worked Examples
```python
import numpy as np
import pandas as pd

values = np.array([1, 2, 3, 4, 5])
series = pd.Series(values)
print(series.mean())
```

### 1.3 Common Pitfalls
- Mixing index-based and label-based logic
- Forgetting to validate assumptions before analysis

---

## 2. Tooling Workflow (75 min)

### 2.1 Introduction/Theory
Use small, validated steps and check outputs at each stage.

### 2.2 Worked Examples
```python
import pandas as pd

frame = pd.DataFrame({"x": [1, 2, 3], "y": [10, 20, 30]})
summary = frame.describe()
print(summary)
```

### 2.3 Real-World Use
This workflow supports EDA tasks, dashboards, and model-ready data preparation.

---

## 3. Validation and Debugging (45 min)

### 3.1 Introduction
Always verify shape, nulls, and expected ranges before interpreting results.

### 3.2 Examples
```python
import pandas as pd

df = pd.DataFrame({"value": [1.0, None, 3.5]})
print(df.shape)
print(df.isna().sum())
```

---

## 4. Practical Application (60 min)

Combine the lesson concepts to produce a short, repeatable analysis snippet.

```python
import pandas as pd

sales = pd.DataFrame(
    {
        "region": ["north", "south", "north", "west"],
        "amount": [120, 95, 180, 140],
    }
)

result = sales.groupby("region", as_index=False)["amount"].mean()
print(result)
```

---

## Exercises

### Difficulty 1: Starter

**Exercise 1.3.13.1**: Create a small DataFrame and print its shape.
```python
import pandas as pd

df = pd.DataFrame({"a": [1, 2], "b": [3, 4]})
print(df.shape)
```

**Exercise 1.3.13.2**: Compute the mean of one numeric column.
**Exercise 1.3.13.3**: Filter rows using a simple condition.

---

### Difficulty 2: Intermediate

**Exercise 1.3.13.4**: Write a function that returns missing-value counts.
**Exercise 1.3.13.5**: Group by one column and compute an aggregate metric.
**Exercise 1.3.13.6**: Plot one chart that supports a data insight.

---

### Difficulty 3: Advanced

**Exercise 1.3.13.7**: Build a reusable function with input validation.
**Exercise 1.3.13.8**: Compare two preprocessing strategies and summarize tradeoffs.
**Exercise 1.3.13.9**: Add logging and sanity checks to your workflow.

---

## Mini-Project:Applied Data Task

Implement a compact, end-to-end script that reads data, validates quality, computes insights, and outputs a clean summary.

```python
import pandas as pd

raw = pd.DataFrame(
    {
        "category": ["A", "A", "B", "B"],
        "score": [72, 88, 91, 85],
    }
)

clean = raw.dropna()
summary = clean.groupby("category", as_index=False)["score"].agg(["mean", "count"])
print(summary)
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. Validation should happen before interpretation. (True)
2. A single chart can answer every question. (False)
3. Reproducible code improves collaboration. (True)
4. Debugging is only needed after deployment. (False)

### Conceptual Questions
5. Why should you check missing values before aggregation?
6. When should you prefer a grouped summary over raw rows?
7. What makes a workflow reproducible?

### Coding Challenge
8. Write a function that returns grouped mean and count for a chosen column.

Solution:
```python
import pandas as pd

def grouped_stats(df: pd.DataFrame, by_col: str, value_col: str) -> pd.DataFrame:
    result = df.groupby(by_col)[value_col].agg(["mean", "count"]).reset_index()
    return result
```

---

## Key Takeaways

- Build workflows in small, testable steps
- Validate data assumptions before drawing conclusions
- Use reusable functions for repeated tasks
- Keep outputs readable and reproducible

---

## Additional Resources

- https://numpy.org/doc/stable/user/absolute_beginners.html
- https://pandas.pydata.org/docs/user_guide/index.html
- https://matplotlib.org/stable/users/explain/quick_start.html

---

## Next Lesson Preview

**Lesson 1.3.14: Performance Profiling with NumPy**
- Continue building practical data-science workflow skills.

---

## Homework

- [ ] Complete exercises 1.3.13.1 - 1.3.13.9
- [ ] Extend the mini-project with one extra validation rule
- [ ] Add at least one visualization and interpretation note

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.3.14: Performance Profiling with NumPy** when ready.
```
