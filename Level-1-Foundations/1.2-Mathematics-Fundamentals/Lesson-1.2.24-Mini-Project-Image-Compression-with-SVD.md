# Lesson 1.2.24: Mini-Project - Image Compression with SVD

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.2.23 | **Topic**: Linear Algebra Integration

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Apply SVD to image matrices
- Build low-rank approximations
- Compare compression quality
- Explain tradeoffs of rank selection

---

## 1. Project Overview (60 min)

Represent a grayscale image as a matrix and compress with SVD.

---

## 2. Implementation Steps (120 min)

Load image, compute SVD, reconstruct with top-k components.

---

## 3. Evaluation (45 min)

Compare file size and visual quality.

---

## 4. Practical Application (60 min)

Try multiple k values and compare outputs.

---

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.24.1: Explain how an image becomes a matrix.
- Exercise 1.2.24.2: State SVD formula.
- Exercise 1.2.24.3: Define rank-k approximation.

### Difficulty 2: Intermediate
- Exercise 1.2.24.4: Implement compression with k=20.
- Exercise 1.2.24.5: Compare reconstruction errors.
- Exercise 1.2.24.6: Plot singular values.

### Difficulty 3: Advanced
- Exercise 1.2.24.7: Apply SVD to each color channel.
- Exercise 1.2.24.8: Measure compression ratio.
- Exercise 1.2.24.9: Explain why higher k improves quality.

---

## Mini-Project: Image Compressor

Write a script that loads an image, applies SVD, and saves output.

---

## Quiz & Assessment

### Quick Check (True/False)
1. Images can be stored as matrices. (True)
2. SVD cannot compress images. (False)
3. Higher rank keeps more detail. (True)
4. SVD is only for square matrices. (False)

### Conceptual Questions
5. What does rank control in compression?
6. Why use grayscale first?
7. How do you measure reconstruction quality?

### Coding Challenge
8. Write code to reconstruct an image from top-k singular values.

---

## Key Takeaways

- SVD compresses images by low-rank approximation
- Rank controls detail vs size
- Singular values quantify information
- Compression is a key ML tool

---

## Additional Resources

- https://numpy.org/doc/stable/reference/generated/numpy.linalg.svd.html
- https://www.3blue1brown.com/lessons/svd
- https://matplotlib.org/stable/tutorials/images.html

---

## Next Lesson Preview

**Lesson 1.2.25**: Milestone Test - Linear Algebra
- Assess Topic 1 mastery

---

## Homework

- [ ] Complete exercises 1.2.24.1 - 1.2.24.9
- [ ] Test k values and summarize results
- [ ] Review SVD basics

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.25** when ready.




