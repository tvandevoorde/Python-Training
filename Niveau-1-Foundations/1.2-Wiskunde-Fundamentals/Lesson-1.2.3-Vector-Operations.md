# Lesson 1.2.3: Vector Operations

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.2.2 | **Topic**: Linear Algebra Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Add and subtract vectors correctly
- Scale vectors by a scalar
- Apply vector operations in NumPy
- Interpret vector operations geometrically

---

## 1. Vector Addition and Subtraction (75 min)

### 1.1 Introduction/Theory
Vector addition combines components position by position.

### 1.2 Worked Examples
```python
import numpy as np

u = np.array([1, 2, 3])
v = np.array([3, 0, -1])
print(u + v)  # [4 2 2]
print(u - v)  # [-2 2 4]
```

### 1.3 Common Pitfalls
- Adding vectors of different lengths
- Mixing lists and arrays without converting

---

## 2. Scalar Multiplication (60 min)

### 2.1 Introduction/Theory
Scaling stretches or shrinks a vector.

### 2.2 Worked Examples
```python
k = 2.5
v = np.array([2, -1, 4])
print(k * v)  # [5.0 -2.5 10.0]
```

### 2.3 Real-World Use
- Feature scaling
- Gradient step sizes

---

## 3. Linear Combinations (45 min)

### 3.1 Introduction
A linear combination is a sum of scaled vectors.

### 3.2 Examples
```python
u = np.array([1, 0])
v = np.array([0, 1])
combo = 3 * u + 2 * v
print(combo)  # [3 2]
```

---

## 4. Practical Application (60 min)

Combine feature vectors and apply scaling.

```python
import numpy as np

x1 = np.array([1.0, 2.0, 3.0])
x2 = np.array([0.5, 1.0, 1.5])
combined = x1 + 0.5 * x2
print(combined)
```

---

## Exercises

### Difficulty 1: Starter

**Exercise 1.2.3.1**: Add two 3D vectors and print the result.
```python
import numpy as np

u = np.array([1, 2, 3])
v = np.array([3, 2, 1])
print(u + v)
```

**Exercise 1.2.3.2**: Subtract one vector from another.
**Exercise 1.2.3.3**: Multiply a vector by 4.

---

### Difficulty 2: Intermediate

**Exercise 1.2.3.4**: Write a function that checks equal length before adding.
**Exercise 1.2.3.5**: Compute 2u - 3v for given vectors.
**Exercise 1.2.3.6**: Use NumPy to compute a weighted sum of three vectors.

---

### Difficulty 3: Advanced

**Exercise 1.2.3.7**: Show that vector addition is commutative with an example.
**Exercise 1.2.3.8**: Explain why vector subtraction is not commutative.
**Exercise 1.2.3.9**: Build a function that returns a linear combination of k vectors.

---

## Mini-Project: Weighted Feature Blend

Build a script that blends two feature vectors with user weights.

```python
import numpy as np

x1 = np.array([1.0, 2.0, 3.0])
x2 = np.array([4.0, 0.0, -1.0])
alpha = 0.7
beta = 0.3
blend = alpha * x1 + beta * x2
print(blend)
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. Vector addition is component-wise. (True)
2. Scalar multiplication changes vector direction only. (False)
3. You can add vectors of different length. (False)
4. Linear combinations use scaled vectors. (True)

### Conceptual Questions
5. What does scaling a vector do geometrically?
6. Why do vectors need the same length for addition?
7. Where do linear combinations appear in ML?

### Coding Challenge
8. Write a function that returns u + 2v for two vectors.

Solution:
```python
import numpy as np

def add_scaled(u, v):
    return u + 2 * v
```

---

## Key Takeaways

- Vector operations are component-wise
- Scaling changes magnitude and can flip direction
- Linear combinations build new vectors
- NumPy simplifies vector math

---

## Additional Resources

- https://numpy.org/doc/stable/reference/routines.linalg.html
- https://www.khanacademy.org/math/linear-algebra/vectors-and-spaces
- https://www.3blue1brown.com/lessons/linear-combinations

---

## Next Lesson Preview

**Lesson 1.2.4**: Dot Product and Angle
- Learn similarity and projection intuition

---

## Homework

- [ ] Complete exercises 1.2.3.1 - 1.2.3.9
- [ ] Extend the mini-project with three vectors
- [ ] Review vector addition rules

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.4** when ready.
