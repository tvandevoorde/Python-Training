# Lesson 1.2.37: Gradient Descent Basics

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.2.36 | **Topic**: Calculus for ML

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Describe gradient descent steps
- Implement a simple loop
- Explain learning rate role
- Identify convergence signals

---

## Core Ideas

- Update rule: x = x - alpha * grad
- Repeat until convergence

---

## Exercises

### Difficulty 1: Starter
- Exercise 1.2.37.1: State the gradient descent update rule.
- Exercise 1.2.37.2: Explain why we move against the gradient.
- Exercise 1.2.37.3: Describe a stopping criterion.

### Difficulty 2: Intermediate
- Exercise 1.2.37.4: Implement gradient descent for f(x)=x^2.
- Exercise 1.2.37.5: Plot loss over iterations.
- Exercise 1.2.37.6: Explain effect of large learning rate.

### Difficulty 3: Advanced
- Exercise 1.2.37.7: Add momentum intuition.
- Exercise 1.2.37.8: Compare batch vs stochastic updates.
- Exercise 1.2.37.9: Discuss local minima vs saddle points.

---

## Mini-Project: One-Dimensional Optimizer

Implement gradient descent for f(x)=x^2 and report iterations.

---

## Quiz & Assessment

### Quick Check (True/False)
1. Gradient descent moves opposite the gradient. (True)
2. Larger learning rate always helps. (False)
3. Convergence means gradient near zero. (True)
4. Gradient descent needs derivatives. (True)

### Conceptual Questions
5. Why can gradient descent diverge?
6. How do you choose a learning rate?
7. What is a good stopping rule?

### Coding Challenge
8. Write a loop that runs 20 iterations of gradient descent.

---

## Key Takeaways

- Gradient descent is iterative optimization
- Learning rate controls step size
- Stopping criteria prevent over-iterating
- Loss curves show progress

---

## Additional Resources

- https://www.deeplearning.ai
- https://www.khanacademy.org/math/multivariable-calculus
- https://www.statquest.org

---

## Next Lesson Preview

**Lesson 1.2.38**: Learning Rate and Convergence
- Tune step sizes

---

## Homework

- [ ] Complete exercises 1.2.37.1 - 1.2.37.9
- [ ] Plot gradient descent path for f(x)=x^2
- [ ] Review optimization intuition

**Expected time**: 2-3 hours

---

**Lesson Complete.**

Proceed to **Lesson 1.2.38** when ready.
