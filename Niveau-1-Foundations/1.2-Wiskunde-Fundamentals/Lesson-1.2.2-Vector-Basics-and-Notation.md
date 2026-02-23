# Lesson 1.2.2: Vector Basics and Notation

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.2.1 | **Topic**: Linear Algebra Foundations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Define vectors and scalars with correct notation
- Interpret vector shape and dimension
- Access vector components correctly
- Use NumPy arrays to represent vectors

---

## 1. Vector Definitions and Notation (75 min)

### 1.1 Introduction/Theory
A vector is an ordered list of numbers. The order matters because each position represents a feature.

### 1.2 Worked Examples
```python
# Column-style vector as a list
v = [3, -2, 5]

# Dimension (length)
print(len(v))  # 3
```

### 1.3 Common Pitfalls
- Confusing vector length with magnitude
- Dropping the order of features

---

## 2. Shapes and Indexing (75 min)

### 2.1 Introduction/Theory
Vectors can be viewed as 1D arrays or as row/column vectors with shapes (n,) or (n,1).

### 2.2 Worked Examples
```python
import numpy as np

v = np.array([3, -2, 5])
print(v.shape)  # (3,)

v_col = v.reshape(-1, 1)
print(v_col.shape)  # (3, 1)
```

### 2.3 Real-World Use
- Feature vectors in ML pipelines
- Column vectors in matrix multiplication

---

## 3. Basic Vector Checks (45 min)

### 3.1 Introduction
Basic validation prevents mistakes when combining vectors.

### 3.2 Examples
```python
def same_length(a, b):
    return len(a) == len(b)

print(same_length([1, 2], [3, 4]))  # True
```

---

## 4. Practical Application (60 min)

Convert raw inputs to vectors and validate lengths.

```python
import numpy as np

raw = ["1", "2", "3"]
vec = np.array([float(x) for x in raw])

if vec.shape[0] == 3:
    print("Vector is 3D")
```

---

## Exercises

### Difficulty 1: Starter

**Exercise 1.2.2.1**: Create a 5D vector and print its length.
```python
v = [1, 2, 3, 4, 5]
print(len(v))
```

**Exercise 1.2.2.2**: Explain the difference between scalar and vector.
**Exercise 1.2.2.3**: Convert a list of strings to a float vector.

---

### Difficulty 2: Intermediate

**Exercise 1.2.2.4**: Write a function to check if a vector is 1D.
**Exercise 1.2.2.5**: Reshape a NumPy vector into a column vector.
**Exercise 1.2.2.6**: Build a validator for vector length = 4.

---

### Difficulty 3: Advanced

**Exercise 1.2.2.7**: Write a function that normalizes input length by padding zeros.
**Exercise 1.2.2.8**: Write a function that trims a vector to the first n features.
**Exercise 1.2.2.9**: Explain when a row vector vs column vector matters.

---

## Mini-Project: Vector Inspector

Build a small script that prints vector length, shape, and basic stats.

```python
import numpy as np

v = np.array([3, -2, 5, 0])
print("Length:", v.shape[0])
print("Min:", v.min())
print("Max:", v.max())
print("Mean:", v.mean())
```

---

## Quiz & Assessment

### Quick Check (True/False)
1. A vector is an ordered list of numbers. (True)
2. The length of a vector equals its magnitude. (False)
3. NumPy vectors have a shape. (True)
4. Scalars have more than one component. (False)

### Conceptual Questions
5. Why is order important in a vector?
6. What does shape (n,1) mean?
7. How can you validate vector compatibility before operations?

### Coding Challenge
8. Write a function that converts a list of strings to a float vector.

Solution:
```python
import numpy as np

def to_vector(items):
    return np.array([float(x) for x in items])
```

---

## Key Takeaways

- Vectors are ordered lists with dimension
- Shape matters for matrix operations
- NumPy makes vector handling consistent
- Validation prevents mismatch errors

---

## Additional Resources

- https://numpy.org/doc/stable/reference/generated/numpy.array.html
- https://www.khanacademy.org/math/linear-algebra/vectors-and-spaces
- https://www.3blue1brown.com/lessons/vectors

---

## Next Lesson Preview

**Lesson 1.2.3**: Vector Operations
- Learn addition, subtraction, and scaling

---

## Homework

- [ ] Complete exercises 1.2.2.1 - 1.2.2.9
- [ ] Extend the mini-project with median and std dev
- [ ] Review vector notation and shapes

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.3** when ready.
