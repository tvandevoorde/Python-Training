# Lesson 1.2.12: Mini-Project - Vector Library

> Previous Lesson: [Lesson 1.2.11: Linear Systems](Lesson-1.2.11-Linear-Systems.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.2.1 - 1.2.11 | **Topic**: Linear Algebra Integration

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Build reusable vector utilities
- Implement core vector operations
- Validate vector shapes and inputs
- Test your vector functions

---

## Introduction: Why This Matters

Mini-Project - Vector Library matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## 1. Project Overview (60 min)

### 1.1 Scope
Build a small vector library with add, subtract, scale, dot, norm.

### 1.2 Example API
```python
add(u, v)
sub(u, v)
scale(k, v)
dot(u, v)
norm(v)
```

---

## 2. Core Implementation (120 min)

### 2.1 Data Validation
Check vector length and numeric values.

### 2.2 Operations
Implement operations using lists and NumPy.

---

## 3. Tests and Usage (45 min)

Write small tests and try example inputs.

---

## 4. Practical Application (60 min)

Use the library to compute cosine similarity.

---

## Best Practices (Step-by-Step)

1. Define the retrieval objective for Mini-Project - Vector Library (precision vs recall).
2. Start with a small curated document set and deterministic chunking.
3. Retrieve top-k candidates, then rerank before generation.
4. Log source chunks with the final answer for traceability.

```python
LESSON_ID = "1.2.12"
LESSON_TOPIC = "Linear Algebra Integration"

def retrieve_top_k(query: str, docs: list[str], k: int = 2) -> list[str]:
    ranked = sorted(docs, key=lambda d: query.lower() in d.lower(), reverse=True)
    return ranked[:k]

chunks = ["LLM inference uses KV cache.", "Pandas handles tabular data."]
print(retrieve_top_k("inference", chunks, k=1))
```

## Exercises

### Difficulty 1: Starter

**Exercise 1.2.12.1**: Write a function that adds two vectors.
```python
def add(u, v):
    return [a + b for a, b in zip(u, v)]
```

**Exercise 1.2.12.2**: Write a scale function.
**Exercise 1.2.12.3**: Implement dot product without NumPy.

---

### Difficulty 2: Intermediate

**Exercise 1.2.12.4**: Add input validation for equal length.
**Exercise 1.2.12.5**: Implement L2 norm.
**Exercise 1.2.12.6**: Add a cosine similarity function.

---

### Difficulty 3: Advanced

**Exercise 1.2.12.7**: Add optional NumPy backend.
**Exercise 1.2.12.8**: Write simple tests for each function.
**Exercise 1.2.12.9**: Document each function with a docstring.

---

## Mini-Project: Vector Library

Build the full library and include a small demo.

```python
import math

def add(u, v):
    return [a + b for a, b in zip(u, v)]

def scale(k, v):
    return [k * x for x in v]

def dot(u, v):
    return sum(a * b for a, b in zip(u, v))

def norm(v):
    return math.sqrt(dot(v, v))

u = [1, 2, 3]
v = [3, 0, -1]
print(add(u, v))
print(norm(u))
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. Vector functions should validate length. (True)
2. Dot product equals sum of component sums. (False)
3. Norm can be computed from dot product. (True)
4. Tests help catch edge cases. (True)

### Conceptual Questions
5. Why is validation important in vector utilities?
6. How would you handle mismatched lengths?
7. What makes a library reusable?

### Coding Challenge
8. Add a function that computes cosine similarity using your library.

Solution:
```python
def cosine_similarity(u, v):
    return dot(u, v) / (norm(u) * norm(v))
```

---

## Key Takeaways

- A small library improves reuse
- Validation prevents silent errors
- Core ops enable many ML tasks
- Tests increase confidence

---

## Additional Resources

- https://docs.python.org/3/library/math.html
- https://numpy.org/doc/stable/reference/routines.linalg.html
- https://www.khanacademy.org/math/linear-algebra

---

## Next Lesson Preview

**Lesson 1.2.13**: Determinants
- Learn area scaling and invertibility

---

## Homework

- [ ] Complete exercises 1.2.12.1 - 1.2.12.9
- [ ] Add docstrings and tests to your library
- [ ] Try your library on 3D vectors

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.13** when ready.




---
