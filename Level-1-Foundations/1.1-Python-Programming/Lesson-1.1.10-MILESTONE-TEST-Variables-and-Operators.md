# Lesson 1.1.10: MILESTONE TEST - Variables & Operators

**Estimated Time**: 8 hours | **Difficulty**: Beginner-Intermediate  
**Prerequisites**: Lessons 1.1.1 - 1.1.9 | **Topic**: Assessment & Consolidation

---

## Overview

This comprehensive milestone test verifies mastery of **Variables, Types, and Operators** (Topic 1). 

**Passing Grade**: 80% (32/40 points)
**Time Limit**: 90 minutes
**Format**: 40 questions total

---

## Part A: Multiple Choice (10 questions, 2 points each = 20 points)

### Questions 1-10

**1. What is the output of `type(5.0)`?**
- A) `<class 'float'>`
- B) `<class 'int'>`
- C) `<class 'str'>`
- D) `float`

**Answer: A** (5.0 is a float)

---

**2. Which of these is a valid variable name in Python?**
- A) `2fast`
- B) `first-name`
- C) `_user_name`
- D) `class`

**Answer: C** (Starts with _, not number; no hyphens; not keyword)

---

**3. What does `10 // 3` return?**
- A) `3.333`
- B) `3`
- C) `4`
- D) `3.0`

**Answer: B** (Floor division returns 3)

---

**4. What is `"5" + 2` in Python?**
- A) `7`
- B) `"7"`
- C) `"52"`
- D) `Error`

**Answer: D** (Can't add string and int)

---

**5. What does `bool("")` return?**
- A) `True`
- B) `False`
- C) `Error`
- D) `""`

**Answer: B** (Empty string is falsy)

---

**6. What is the result of `5 ** 2`?**
- A) `10`
- B) `25`
- C) `7`
- D) `52`

**Answer: B** (Exponentiation: 5 to power 2)

---

**7. What does `"hello".upper()` return?**
- A) `Hello`
- B) `HELLO`
- C) `hello`
- D) Error

**Answer: B** (Converts to uppercase)

---

**8. Which comparison is True?**
- A) `5 == "5"`
- B) `5 != 5`
- C) `5 < 10`
- D) `10 > 20`

**Answer: C** (5 is less than 10)

---

**9. What does `input()` always return?**
- A) `int`
- B) `float`
- C) `str`
- D) `bool`

**Answer: C** (Always string)

---

**10. What is `3 * "ab"`?**
- A) `"3ab"`
- B) `"ababab"`
- C) Error
- D) `"ab3"`

**Answer: B** (String repetition)

---

## Part B: True/False (10 questions, 1 point each = 10 points)

1. **Variables in Python must start with a letter.** FALSE
2. **`0.1 + 0.2 == 0.3` is always True.** FALSE (floating point precision)
3. **`len("hello")` returns 5.** TRUE
4. **Strings are immutable in Python.** TRUE
5. **`not True` evaluates to False.** FALSE (evaluates to True)
6. **`"abc" in "abcdef"` returns True.** TRUE
7. **`int(-3.9)` returns -4.** FALSE (returns -3, truncates)
8. **`"5" > "3"` is True.** FALSE (alphabetical comparison)
9. **`5 > 3 and 2 < 1` returns True.** FALSE (second condition false)
10. **`max(5, 2, 8, 1)` returns 8.** TRUE

---

## Part C: Short Answer (8 questions, 2.5 points each = 20 points)

**1. Write code that converts the string "42" to an integer and adds 8 to it.**
```python
num = int("42") + 8
# or
num = int("42")
result = num + 8
```

**2. What will this print?**
```python
x = 10
y = "10"
print(x == y)
```
Answer: `False` (different types)

**3. Write an f-string that displays a price with 2 decimal places:**
```python
price = 19.5
# Answer:
print(f"${price:.2f}")
```

**4. What is the output of this code?**
```python
text = "hello"
print(text[1:4])
```
Answer: `ell`

**5. Write a line that gets user input, converts it to a float, and stores it in `amount`:**
```python
amount = float(input("Enter amount: "))
```

**6. What is the result of `"hello"[-1]`?**
Answer: `"o"` (last character)

**7. What error would this cause?**
```python
result = int("3.5")
```
Answer: `ValueError` (can't convert decimal string directly to int)

**8. Write code to check if a number is between 1 and 100 (inclusive):**
```python
if num >= 1 and num <= 100:
    print("Valid")
# or
if 1 <= num <= 100:
    print("Valid")
```

---

## Part D: Coding Problems (2 questions, 10 points total)

### Problem 1: Temperature Converter (5 points)

**Task**: Write a program that:
1. Asks user for temperature in Celsius
2. Converts to Fahrenheit: `F = (C * 9/5) + 32`
3. Displays result with 2 decimal places

**Solution**:
```python
celsius = float(input("Temperature in Celsius: "))
fahrenheit = (celsius * 9/5) + 32
print(f"{celsius}°C = {fahrenheit:.2f}°F")
```

**Grading Rubric**:
- Input conversion: 2 points
- Formula: 2 points
- Output formatting: 1 point

---

### Problem 2: Personal Info Display (5 points)

**Task**: Write a program that:
1. Asks for name, age, email
2. Validates inputs (non-empty strings, age is number)
3. Displays formatted output

**Solution**:
```python
name = input("Name: ")
try:
    age = int(input("Age: "))
    email = input("Email: ")
    
    if name and email:
        print("\n--- Profile ---")
        print(f"Name: {name}")
        print(f"Age: {age}")
        print(f"Email: {email}")
    else:
        print("Error: All fields required")
except ValueError:
    print("Error: Age must be a number")
```

**Grading Rubric**:
- Input: 1 point
- Validation: 2 points
- Error handling: 1 point
- Output formatting: 1 point

---

## Answer Key & Scoring

### Total Points: 40

| Section | Questions | Points | Your Score |
|---------|-----------|--------|-----------|
| A: Multiple Choice | 10 | 20 | ___ |
| B: True/False | 10 | 10 | ___ |
| C: Short Answer | 8 | 20 | ___ |
| D: Coding Problems | 2 | 10 | ___ |
| **TOTAL** | **30** | **40** | **___** |

**Passing Score**: 32/40 (80%)

---

## Performance Feedback

### If you scored 38-40 (95-100%)
🏆 **Excellent!** You have mastered Topic 1. Ready to advance.

### If you scored 32-37 (80-92%)
✅ **Good!** Solid understanding. Review weak areas before moving forward.

### If you scored 24-31 (60-77%)
⚠️ **Review needed** in these areas:
- Re-read lessons on weak topics
- Redo relevant exercises
- Retake milestone test

### If you scored below 24 (60%)
❌ **Restart Topic 1**: Review concept explanations, redo all exercises, retake this test.

---

## Review Checklist

Before retaking the test if needed:

- [ ] I understand variable assignment and types
- [ ] I can convert between data types
- [ ] I know when to use arithmetic vs comparison vs logical operators
- [ ] I can use f-strings for formatting
- [ ] I can get user input and handle it correctly
- [ ] I understand string slicing and methods
- [ ] I can build simple programs combining these concepts

---

## Next Steps

✅ **If you passed**: Proceed to Topic 2: Control Flow  
⚠️ **If you didn't pass**: Review weak areas and retake

**Estimated review time**: 4-6 hours

---

**Milestone Assessment Complete!**

Your path forward:
- **Pass**: → Lesson 1.1.11 (Control Flow)
- **Review needed**: Return to relevant lessons, then retake this test

Good luck! 🎉




