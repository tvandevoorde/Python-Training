# Lesson 1.2.1: Linear Algebra for ML - Big Picture

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: LEVEL 1.1 | **Topic**: Linear Algebra Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Explain why vectors and matrices are core to ML
- Represent data as vectors and matrices
- Interpret linear transformations visually
- Use basic NumPy structures for linear algebra

---

## 1. Data as Vectors (75 min)

### 1.1 Introduction/Theory
In ML, each data point is a vector. A row of a dataset is a feature vector, and a dataset is a matrix.

### 1.2 Worked Examples
```python
# Represent a data point as a vector
x = [1.0, 2.5, -0.3]

# A dataset with 3 samples, 3 features each
X = [
    [1.0, 2.5, -0.3],
    [0.5, 1.2,  0.0],
    [2.0, 0.1, -1.0],
]
```

### 1.3 Common Pitfalls
- Mixing row and column orientation
- Forgetting that order of features matters

---

## 2. Linear Transformations (75 min)

### 2.1 Introduction/Theory
Matrices encode linear transformations: scaling, rotation, and shearing.

### 2.2 Worked Examples
```python
# 2D scaling by 2 in x and 0.5 in y
A = [[2.0, 0.0], [0.0, 0.5]]

# Transform a vector
v = [3.0, 4.0]
# Result: [6.0, 2.0] (manual multiplication)
```

### 2.3 Real-World Use
- Feature scaling
- Principal component projections

---

## 3. NumPy as the Math Workbench (45 min)

### 3.1 Introduction
NumPy is the standard tool for vectors and matrices in Python.

### 3.2 Examples
```python
import numpy as np

v = np.array([3.0, 4.0])
A = np.array([[2.0, 0.0], [0.0, 0.5]])
print(A @ v)  # [6. 2.]
```

---

## 4. Practical Application (60 min)

Load a small dataset and interpret rows as vectors.

```python
import numpy as np

X = np.array([
    [1.0, 2.5, -0.3],
    [0.5, 1.2,  0.0],
    [2.0, 0.1, -1.0],
])

# Compute mean feature vector
mean_vec = X.mean(axis=0)
print(mean_vec)
```

---

## Exercises

### Difficulty 1: Starter

**Exercise 1.2.1.1**: Create a vector with 4 features and print it.
```python
v = [2, -1, 0, 5]
print(v)
```

**Exercise 1.2.1.2**: Create a 2x3 matrix as a list of lists.
**Exercise 1.2.1.3**: Explain in one sentence what a dataset matrix represents.

---

### Difficulty 2: Intermediate

**Exercise 1.2.1.4**: Write code that computes the mean of each column in a 3x3 matrix.
**Exercise 1.2.1.5**: Build a function that checks if two vectors have the same length.
**Exercise 1.2.1.6**: Convert a list of vectors into a NumPy array.

---

### Difficulty 3: Advanced

**Exercise 1.2.1.7**: Given a dataset matrix, compute min and max per feature.
**Exercise 1.2.1.8**: Write a function that standardizes each column to zero mean.
**Exercise 1.2.1.9**: Explain how a matrix can represent a linear model.

---

## Mini-Project: Dataset Summary

Write a script that loads a small matrix and prints basic statistics.

```python
import numpy as np

X = np.array([
    [1.0, 2.0, 3.0],
    [2.0, 3.0, 4.0],
    [3.0, 4.0, 5.0],
])

print("Shape:", X.shape)
print("Column means:", X.mean(axis=0))
print("Column std:", X.std(axis=0))
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. A dataset can be represented as a matrix. (True)
2. A vector must always be 2D. (False)
3. Matrices can encode transformations. (True)
4. NumPy arrays are slower than Python lists for math. (False)

### Conceptual Questions
5. Why is feature order important in a vector?
6. What is a linear transformation in simple terms?
7. How does a matrix relate to a dataset?

### Coding Challenge
8. Write code that takes a 2D NumPy array and returns column means.

Solution:
```python
import numpy as np

def column_means(X):
    return X.mean(axis=0)
```

---

## Key Takeaways

- Vectors represent data points; matrices represent datasets
- Linear transformations are encoded by matrices
- NumPy is the default tool for linear algebra in Python
- Understanding shape and orientation prevents many errors

---

## Additional Resources

- https://numpy.org/doc/stable/user/absolute_beginners.html
- https://www.khanacademy.org/math/linear-algebra
- https://www.3blue1brown.com/lessons/essence-of-linear-algebra

---

## Next Lesson Preview

**Lesson 1.2.2**: Vector Basics and Notation
- Learn vector notation, indexing, and shapes

---

## Homework

- [ ] Complete exercises 1.2.1.1 - 1.2.1.9
- [ ] Extend the mini-project with min/max per column
- [ ] Review vector and matrix definitions

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.2** when ready.




