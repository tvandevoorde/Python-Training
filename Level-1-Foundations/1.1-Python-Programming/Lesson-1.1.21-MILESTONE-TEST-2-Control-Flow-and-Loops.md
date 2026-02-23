# Lesson 1.1.21: MILESTONE TEST 2 - Control Flow & Loops

**Estimated Time**: 2-3 hours | **Difficulty**: Comprehensive Assessment  
**Prerequisites**: Lessons 1.1.11-1.1.20 | **Topic**: Assessment - Topic 2

---

## Test Overview

This comprehensive assessment evaluates your mastery of **Topic 2: Control Flow & Loops**.

**Format:**
- 40 total points
- 4 True/False (1 point each) = 4 points
- 6 Concept questions (2 points each) = 12 points
- 4 Code challenges (6 points each) = 24 points

**Passing Score:** 28/40 (70%)

**Time Limit:** 120 minutes recommended

---

## Section 1: True/False (4 points)

**1.1** - `if` statements execute code only if condition is True.
- **Answer:** _______________

**1.2** - A `while` loop must have a break statement or it will run forever.
- **Answer:** _______________

**1.3** - In a `for` loop, `continue` skips the rest of that iteration.
- **Answer:** _______________

**1.4** - `range(5)` generates the numbers [1, 2, 3, 4, 5].
- **Answer:** _______________

---

## Section 2: Conceptual Questions (12 points)

**2.1** - What's the difference between a `while` loop and a `for` loop? (2 pts)

Answer:
```
While loops: ___________________
For loops: ___________________
```

**2.2** - Explain what `break` and `continue` do. (2 pts)

Answer:
```
break: ___________________
continue: ___________________
```

**2.3** - What does `range(1, 10, 2)` produce? (2 pts)

Answer: ___________________

**2.4** - Describe how nested loops work with an example. (2 pts)

Answer: ___________________

**2.5** - When would you use an `if-elif-else` chain instead of multiple `if` statements? (2 pts)

Answer: ___________________

**2.6** - What is a common cause of infinite loops? (2 pts)

Answer: ___________________

---

## Section 3: Code Challenges (24 points)

### Challenge 3.1: Count to N (6 points)

Write a program that:
- Asks user for a number N
- Counts from 1 to N using a `while` loop
- Stops if user enters 0

**Your code:**
```python
# Challenge 3.1: Count to N


```

**Test cases:**
- Input 3 → Should print 1, 2, 3
- Input 0 → Should stop immediately

---

### Challenge 3.2: Check Even/Odd (6 points)

Write a function that:
- Takes a list of numbers as parameter
- Returns count of even numbers
- Uses a `for` loop and `continue`

**Your code:**
```python
def count_evens(numbers):
    """Count even numbers in list"""
    # Your code here


```

**Test:**
```python
result = count_evens([1, 2, 3, 4, 5, 6])
print(result)  # Should print: 3
```

---

### Challenge 3.3: Validate Input (6 points)

Write a program that:
- Repeatedly asks user for age (0-120)
- Validates input (show error if invalid)
- Exits when valid age entered
- Uses `while` loop with proper error handling

**Your code:**
```python
# Challenge 3.3: Validate Input


```

**Test:**
- Invalid: "abc" → Show error, ask again
- Out of range: 150 → Show error, ask again
- Valid: 25 → Accept and exit

---

### Challenge 3.4: Grid of Stars (6 points)

Write a program that:
- Asks user for grid size (e.g., 5)
- Prints 5×5 grid of stars using nested loops
- Uses `*` for each cell

**Your code:**
```python
# Challenge 3.4: Grid of Stars


```

**Expected output for size 3:**
```
* * *
* * *
* * *
```

---

## Section 4: Advanced Challenge (Bonus - Optional)

### Bonus: Sum Squares Until Zero (Bonus 6 points)

Write a program that:
- Repeatedly asks user for numbers
- Calculates running sum of squares (n²)
- Shows running total after each entry
- Stops when user enters 0
- Cannot use 0 in the sum

**Your code:**
```python
# Bonus: Sum Squares


```

**Example run:**
```
Enter number (0 to stop): 3
  Added 9. Running sum: 9
Enter number (0 to stop): 2
  Added 4. Running sum: 13
Enter number (0 to stop): 0
Final sum of squares: 13
```

---

## Answer Key & Rubric

### Section 1: True/False (1 pt each)

1.1: **True** - If statements are conditional execution  
1.2: **False** - Must have a way to stop (break or condition becomes false)  
1.3: **True** - Continue skips remaining code in iteration  
1.4: **False** - `range(5)` is [0, 1, 2, 3, 4]  

---

### Section 2: Concept Questions (2 pts each)

Full credit requires:
- **2.1** Distinguishes known iterations (for) vs unknown/conditional (while)
- **2.2** Correctly explains break (exit) and continue (skip iteration)
- **2.3** Identifies sequence: [1, 3, 5, 7, 9]
- **2.4** Explains nested loop structure with concrete example
- **2.5** Explains `elif` short-circuits further checks; efficiency/clarity
- **2.6** Identifies: loop variable never updates, condition always true

---

### Section 3: Code Challenges (6 pts each)

Partial credit rubric:

| Points | Criteria |
|--------|----------|
| 6 | Complete, correct, handles edge cases |
| 5 | Works correctly, minor issues |
| 4 | Mostly works, some logic errors |
| 3 | Major components present, significant errors |
| 2 | Partial attempt, missing key elements |
| 1 | Minimal attempt |
| 0 | Missing or incorrect |

#### Challenge 3.1 Evaluation

✓ Uses `while` loop  
✓ Gets user input properly  
✓ Counts correctly 1 to N  
✓ Handles 0 input  
✓ Exit condition works  
✓ Clean, readable code  

#### Challenge 3.2 Evaluation

✓ Function defined correctly  
✓ Parameter accepts list  
✓ Uses `for` loop  
✓ Uses `continue` statement  
✓ Correct even detection (n % 2 == 0)  
✓ Returns correct count  

#### Challenge 3.3 Evaluation

✓ `while` loop for validation  
✓ Gets input correctly  
✓ Checks range (0-120)  
✓ Handles non-numeric input  
✓ Shows error message  
✓ Exits on valid input  

#### Challenge 3.4 Evaluation

✓ Gets size from user  
✓ Nested loops for rows/cols  
✓ Prints correct number of stars  
✓ Proper formatting  
✓ Clean output  

---

## Self-Assessment Guide

Use this to evaluate your own work:

### Loop Knowledge

- [ ] Can explain difference between `while` and `for`
- [ ] Understand `range()` with start, stop, step
- [ ] Know when to use `break` vs. `continue`
- [ ] Can write nested loops correctly
- [ ] Understand time complexity basics

### Conditionals

- [ ] Understand `if`, `elif`, `else` flow
- [ ] Can write complex conditions with `and`/`or`
- [ ] Know comparison operators
- [ ] Can handle input validation

### Integration

- [ ] Can combine loops with conditionals
- [ ] Can debug infinite loops
- [ ] Can optimize basic loops
- [ ] Can handle edge cases

---

## Performance Expectations by Score

| Score | Level | Implication |
|-------|-------|-------------|
| 36-40 | Excellent | Ready for Functions & Scope |
| 32-35 | Proficient | Ready with review notes |
| 28-31 | Adequate | Review weak areas first |
| Below 28 | Needs Work | Revisit Topic 2 lessons |

---

## Review Guidelines

**If you scored below 28, focus on:**

- [ ] Lesson 1.1.11: Basic `if` statements
- [ ] Lesson 1.1.14: `while` loop fundamentals
- [ ] Lesson 1.1.16: `for` and `range()`
- [ ] Lesson 1.1.15: Understand `break`/`continue`

**If you scored 28-31, strengthen:**

- [ ] Lesson 1.1.17: Nested loop patterns
- [ ] Lesson 1.1.18: Advanced patterns
- [ ] Lesson 1.1.19: Debug techniques

**If you scored 32+, proceed to:**

- [ ] Functions & Scope (Topic 3)
- [ ] Advanced loop patterns in later topics

---

## Common Mistakes to Avoid

Based on typical errors:

❌ **Off-by-one in loops:** `range(1, len(list))` skips first element  
✓ Use `range(len(list))` for all elements (0 to len-1)

❌ **Infinite loops:** Loop variable never updates  
✓ Always update: `count += 1` or condition eventually false

❌ **Wrong condition:** `==` vs `=` in if statements  
✓ Use `==` for comparison, `=` for assignment only

❌ **Not initializing:** Using variable before creating it  
✓ Initialize: `total = 0`, `result = ""`, etc.

❌ **Range confusion:** Thinking `range(5)` is [1,2,3,4,5]  
✓ Remember: `range(5)` is [0,1,2,3,4]

---

## Next Steps

**If you passed (28+):**
→ Proceed to **Lesson 2.1: Functions & Scope**

**If you need review (below 28):**
→ Review Topic 2 lessons 1.1.11-1.1.20, then retake test

**How to improve:**
1. Review weak concept areas
2. Re-do exercises from recommended lessons
3. Debug code line-by-line
4. Write extra practice problems
5. Explain concepts aloud to another person

---

## Practice Problems (Optional)

If you want extra practice before moving on:

**Problem 1:** Sum all numbers 1-100 using a loop

**Problem 2:** Print first 10 multiples of 5

**Problem 3:** Ask user for 5 numbers, print average

**Problem 4:** Find largest number in list using loop

**Problem 5:** Print "Fizz" for multiples of 3, "Buzz" for 5, "FizzBuzz" for both

---

## Reflection Questions

Answer these to consolidate learning:

1. What loop concept did you find most challenging?
2. What real-world situation could use a `while` loop?
3. Why are nested loops both useful and potentially slow?
4. How would you debug an infinite loop?
5. When would you choose `for` over `while`?

---

**Test Complete!** 🎉

**Score Calculation:**
- Section 1: _____ / 4
- Section 2: _____ / 12
- Section 3: _____ / 24
- Bonus: _____ / 6 (if attempted)

**Total: _____ / 40**

**Status:**
- [ ] Passed (28+) - Ready for Topic 3
- [ ] Review needed (below 28) - Practice more

---

## Certificate of Completion

If you scored 28 or higher:

```
=====================================
  CERTIFICATE OF COMPLETION
  
Topic 2: Control Flow & Loops
=====================================

Name: _________________
Date: _________________
Score: _____ / 40

Topics Mastered:
✓ if/elif/else Statements
✓ while Loops
✓ for Loops & range()
✓ Loop Control (break/continue)
✓ Nested Loops & Patterns
✓ Loop Debugging & Optimization

Ready for: Functions & Scope (Topic 3)

=====================================
```

---

**Congratulations on completing Topic 2!** 🎓

Next: Lesson 2.1 - Functions & Scope




