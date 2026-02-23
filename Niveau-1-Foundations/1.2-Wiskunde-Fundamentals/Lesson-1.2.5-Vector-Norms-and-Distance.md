# Lesson 1.2.5: Vector Norms and Distance

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.2.4 | **Topic**: Linear Algebra Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Compute L1 and L2 norms
- Use norms to measure vector length
- Compute distance between vectors
- Apply norms in NumPy

---

## 1. Vector Norms (75 min)

### 1.1 Introduction/Theory
A norm measures vector size. Common norms are L1 and L2.

### 1.2 Worked Examples
```python
import numpy as np

v = np.array([3, -4])
print(np.linalg.norm(v, 1))  # 7
print(np.linalg.norm(v, 2))  # 5
```

### 1.3 Common Pitfalls
- Confusing squared norm with norm
- Using wrong norm for a task

---

## 2. Distance Between Vectors (60 min)

### 2.1 Introduction/Theory
Distance is the norm of the difference: ||u - v||.

### 2.2 Worked Examples
```python
import numpy as np

u = np.array([1, 2])
v = np.array([4, 6])
print(np.linalg.norm(u - v))  # 5
```

### 2.3 Real-World Use
- KNN distances
- Clustering

---

## 3. Choosing a Norm (45 min)

### 3.1 Introduction
L1 is robust to outliers, L2 penalizes large values.

### 3.2 Examples
```python
import numpy as np

v = np.array([1, 2, 100])
print(np.linalg.norm(v, 1))
print(np.linalg.norm(v, 2))
```

---

## 4. Practical Application (60 min)

Compute distances to a reference point.

```python
import numpy as np

points = [np.array([1, 2]), np.array([4, 6]), np.array([0, 0])]
ref = np.array([2, 2])

for p in points:
    print(np.linalg.norm(p - ref))
```

---

## Exercises

### Difficulty 1: Starter

**Exercise 1.2.5.1**: Compute L2 norm of [3,4].
```python
import numpy as np

v = np.array([3, 4])
print(np.linalg.norm(v))
```

**Exercise 1.2.5.2**: Compute L1 norm of [1,-2,3].
**Exercise 1.2.5.3**: Compute distance between [1,1] and [2,3].

---

### Difficulty 2: Intermediate

**Exercise 1.2.5.4**: Write a function for L1 norm without NumPy.
**Exercise 1.2.5.5**: Compare L1 vs L2 distances for two points.
**Exercise 1.2.5.6**: Compute distances of multiple points to a center.

---

### Difficulty 3: Advanced

**Exercise 1.2.5.7**: Explain when L1 is preferred over L2.
**Exercise 1.2.5.8**: Implement a function that returns both L1 and L2 norms.
**Exercise 1.2.5.9**: Use norms to detect outliers in a vector list.

---

## Mini-Project: Distance Report

Compute distances from a reference vector and sort.

```python
import numpy as np

points = [np.array([1, 1]), np.array([5, 5]), np.array([2, 2])]
ref = np.array([0, 0])

report = sorted([(p, np.linalg.norm(p - ref)) for p in points], key=lambda x: x[1])
print(report)
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. L2 norm of [3,4] is 5. (True)
2. L1 norm uses squares. (False)
3. Distance between vectors is a norm. (True)
4. Norms can be zero for non-zero vectors. (False)

### Conceptual Questions
5. Why does L2 penalize large values more than L1?
6. How does distance relate to similarity?
7. Why use different norms in ML?

### Coding Challenge
8. Write a function that returns Euclidean distance between u and v.

Solution:
```python
import numpy as np

def euclidean(u, v):
    return np.linalg.norm(u - v)
```

---

## Key Takeaways

- Norms measure vector length
- Distances compare vectors
- L1 and L2 norms behave differently
- Distances power many ML algorithms

---

## Additional Resources

- https://numpy.org/doc/stable/reference/generated/numpy.linalg.norm.html
- https://www.khanacademy.org/math/linear-algebra/vectors-and-spaces
- https://www.statquest.org

---

## Next Lesson Preview

**Lesson 1.2.6**: Projections and Orthogonality
- Project vectors and check perpendicularity

---

## Homework

- [ ] Complete exercises 1.2.5.1 - 1.2.5.9
- [ ] Extend the mini-project with L1 distance
- [ ] Review norm definitions

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.6** when ready.
