# Lesson 1.2.39: Numerical Differentiation

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.38 | **Topic**: Calculus for ML

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Approximate derivatives with finite differences
- Compare forward and central differences
- Understand numerical error sources
- Use numerical gradients for checks

---

## Core Ideas

- Finite differences approximate slope
- Central differences are more accurate
- Step size trades bias and noise

---

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.39.1: Define forward difference.
- Exercise 1.2.39.2: Explain why step size matters.
- Exercise 1.2.39.3: Compute a simple numeric derivative.

### Difficulty 2: Intermediate
- Exercise 1.2.39.4: Compare forward vs central difference.
- Exercise 1.2.39.5: Implement numeric gradient for f(x)=x^2.
- Exercise 1.2.39.6: Explain truncation error.

### Difficulty 3: Advanced
- Exercise 1.2.39.7: Numeric gradient for f(x,y)=x^2+y^2.
- Exercise 1.2.39.8: Use gradient check for a function.
- Exercise 1.2.39.9: Discuss floating-point limitations.

---

## Mini-Project: Gradient Checker

Write a small script comparing numeric and analytic gradients.

---

## Quiz & Assessment

### Quick Check (True/False)
1. Numerical gradients are exact. (False)
2. Central differences are more accurate than forward. (True)
3. Smaller step always improves accuracy. (False)
4. Numeric gradients help debug analytic gradients. (True)

### Conceptual Questions
5. What causes numeric gradient error?
6. When is gradient checking useful?
7. How do you choose epsilon?

### Coding Challenge
8. Implement central difference for f(x)=x^2.

---

## Key Takeaways

- Finite differences approximate derivatives
- Error depends on step size
- Numerical checks validate analytic gradients
- Use with care in ML

---

## Additional Resources

- https://www.deeplearning.ai
- https://www.khanacademy.org/math/calculus-1
- https://www.statquest.org

---

## Next Lesson Preview

**Lesson 1.2.40**: Automatic Differentiation
- From numeric to exact gradients

---

## Homework

- [ ] Complete exercises 1.2.39.1 - 1.2.39.9
- [ ] Implement a gradient checker
- [ ] Review numerical error sources

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.40** when ready.




