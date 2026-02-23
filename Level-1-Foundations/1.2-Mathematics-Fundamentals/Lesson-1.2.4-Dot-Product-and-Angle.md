# Lesson 1.2.4: Dot Product and Angle

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.2.3 | **Topic**: Linear Algebra Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Compute dot products by hand and in NumPy
- Interpret the dot product geometrically
- Use dot product to measure similarity
- Relate dot product to angle between vectors

---

## 1. Dot Product Definition (75 min)

### 1.1 Introduction/Theory
The dot product multiplies and sums corresponding components.

### 1.2 Worked Examples
```python
import numpy as np

u = np.array([1, 2, 3])
v = np.array([4, 0, -1])
print(u @ v)  # 1*4 + 2*0 + 3*(-1) = 1
```

### 1.3 Common Pitfalls
- Mixing element-wise multiply with dot product
- Forgetting vectors must have same length

---

## 2. Geometry and Angle (60 min)

### 2.1 Introduction/Theory
Dot product connects to angle via cosine similarity.

### 2.2 Worked Examples
```python
import numpy as np

u = np.array([1.0, 0.0])
v = np.array([0.0, 1.0])
print(u @ v)  # 0 (orthogonal)
```

### 2.3 Real-World Use
- Text similarity
- Nearest neighbor search

---

## 3. Cosine Similarity (45 min)

### 3.1 Introduction
Cosine similarity is the normalized dot product.

### 3.2 Examples
```python
import numpy as np

def cosine_similarity(u, v):
    return (u @ v) / (np.linalg.norm(u) * np.linalg.norm(v))
```

---

## 4. Practical Application (60 min)

Compare two vectors for similarity.

```python
import numpy as np

u = np.array([2.0, 1.0])
v = np.array([4.0, 2.0])
cos_sim = (u @ v) / (np.linalg.norm(u) * np.linalg.norm(v))
print(cos_sim)  # 1.0
```

---

## Exercises

### Difficulty 1: Starter

**Exercise 1.2.4.1**: Compute dot product of [1,2] and [3,4].
```python
import numpy as np

u = np.array([1, 2])
v = np.array([3, 4])
print(u @ v)
```

**Exercise 1.2.4.2**: Show dot product of orthogonal vectors.
**Exercise 1.2.4.3**: Compute dot product with NumPy.

---

### Difficulty 2: Intermediate

**Exercise 1.2.4.4**: Write a function to compute dot product without NumPy.
**Exercise 1.2.4.5**: Compare similarity of two pairs of vectors.
**Exercise 1.2.4.6**: Build a function for cosine similarity.

---

### Difficulty 3: Advanced

**Exercise 1.2.4.7**: Prove dot product is distributive with numbers.
**Exercise 1.2.4.8**: Explain why cosine similarity ignores magnitude.
**Exercise 1.2.4.9**: Use dot product to rank most similar vectors.

---

## Mini-Project: Simple Similarity Search

Given a list of vectors, find the most similar to a query.

```python
import numpy as np

vectors = [np.array([1, 0]), np.array([1, 1]), np.array([0, 1])]
q = np.array([0.9, 0.2])

scores = [(v, (v @ q) / (np.linalg.norm(v) * np.linalg.norm(q))) for v in vectors]
best = max(scores, key=lambda x: x[1])
print(best[0], best[1])
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. Dot product requires same length vectors. (True)
2. Dot product equals element-wise multiplication. (False)
3. Orthogonal vectors have dot product 0. (True)
4. Cosine similarity can be greater than 1. (False)

### Conceptual Questions
5. What does a dot product of zero mean?
6. Why does cosine similarity ignore magnitude?
7. Where is cosine similarity used in ML?

### Coding Challenge
8. Write a function that returns the cosine similarity of two vectors.

Solution:
```python
import numpy as np

def cosine_similarity(u, v):
    return (u @ v) / (np.linalg.norm(u) * np.linalg.norm(v))
```

---

## Key Takeaways

- Dot product measures alignment
- Orthogonal vectors have dot product 0
- Cosine similarity normalizes dot product
- Similarity is core to ML search

---

## Additional Resources

- https://numpy.org/doc/stable/reference/generated/numpy.dot.html
- https://www.khanacademy.org/math/linear-algebra/vectors-and-spaces
- https://www.3blue1brown.com/lessons/dot-products

---

## Next Lesson Preview

**Lesson 1.2.5**: Vector Norms and Distance
- Measure length and distance between vectors

---

## Homework

- [ ] Complete exercises 1.2.4.1 - 1.2.4.9
- [ ] Extend the mini-project with a larger list
- [ ] Review dot product properties

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.5** when ready.




