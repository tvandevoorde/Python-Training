# Lesson 1.1.38: MILESTONE TEST – Functions & Scope

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.1.24–1.1.37 (Complete Functions & Scope topic)  
**Assessment Type**: Comprehensive Exam + Project Review

---

## Learning Objectives

By the end of this assessment, you will have demonstrated:

1. **Function Design**: Create well-documented functions with clear intent
2. **Parameter Mastery**: Use positional, keyword, default, *args, and **kwargs correctly
3. **Scope Understanding**: Apply LEGB rule to manage variable scope properly
4. **Return Patterns**: Implement appropriate return strategies including multiple returns
5. **Advanced Patterns**: Use lambda, recursion, and composition effectively
6. **Code Quality**: Write pure functions that are testable and maintainable
7. **Error Handling**: Validate inputs and provide meaningful feedback
8. **Integration**: Combine concepts into cohesive projects

---

## Overview

This milestone assessment has **three components**:

1. **Written Exam** (2 hours): Short-answer and coding questions
2. **Coding Challenge** (4 hours): Build a complete function-based system
3. **Project Review** (2 hours): Present and defend your solution

**Passing Score**: 80+ points out of 100

---

## Component 1: Written Exam (2 hours / 30 points)

### Part A: Multiple Choice (10 points)

**Question 1**: What is the output of this code?

```python
def modify_list(lst, value):
    lst.append(value)
    return lst

original = [1, 2, 3]
result = modify_list(original, 4)
print(original)
```

A) `[1, 2, 3]`  
B) `[1, 2, 3, 4]`  
C) `[4]`  
D) Error

**Answer**: B (Lists are passed by reference, modification affects original)

---

**Question 2**: Which statement about `*args` is TRUE?

A) It must be named `*args`  
B) It collects positional arguments into a tuple  
C) It can only be used once per function  
D) It must come before keyword parameters  

**Answer**: B (It's a convention to name it args, creates tuple from remaining positional args)

---

**Question 3**: What is the scope hierarchy in Python?

A) Local → Global → Built-in  
B) Local → Enclosing → Global → Built-in  
C) Global → Local → Built-in  
D) Built-in → Global → Local → Enclosing  

**Answer**: B (LEGB rule: Local, Enclosing, Global, Built-in)

---

**Question 4**: What is the output?

```python
def outer():
    x = 10
    def inner():
        x = 20
        return x
    inner()
    return x

print(outer())
```

A) `10`  
B) `20`  
C) `30`  
D) Error  

**Answer**: A (Inner function's x is local to inner, doesn't affect outer's x)

---

**Question 5**: Which function signature is valid?

A) `def func(a, b=5, c):`  
B) `def func(a, b=5, *args, c):`  
C) `def func(*args, a, b=5):`  
D) Both B and C  

**Answer**: D (Parameters with defaults must come after those without, *args comes before keyword-only args)

---

### Part B: Short Answer (10 points)

**Question 6**: Explain the difference between `return None` and not having a return statement.

**Expected Answer**:
- Both have the same effect: function returns `None`
- Explicitly writing `return None` is clearer for readability
- Functions without explicit return still return `None` implicitly
- Good practice: Be explicit when returning None intentionally

---

**Question 7**: What is a pure function? Give one example.

**Expected Answer**:
- A pure function always returns the same output for the same input
- Has no side effects (doesn't modify global state, external variables)
- Example: `def square(x): return x * x` (always produces same result, no side effects)

---

**Question 8**: Explain closure. Why is it useful?

**Expected Answer**:
- A closure is a function that captures variables from its enclosing scope
- Useful for data hiding, creating function factories, decorators
- Example: Function inside function that uses outer function's variables

---

**Question 9**: When would you use `**kwargs`? Give a real example.

**Expected Answer**:
- Use when function needs to accept arbitrary keyword arguments
- Common in configuration, settings, or API wrappers
- Example: `def configure(name, **options)` where options could be any key-value pairs

---

**Question 10**: What is the difference between a function with default parameters and one using `*args`?

**Expected Answer**:
- Default parameters: fixed number of parameters with optional values
- *args: variable number of positional arguments
- Example: `def func(a, b=5)` vs `def func(*args)` 

---

### Part C: Code Completion (10 points)

**Question 11**: Complete this function to calculate the sum of all arguments (including nested lists):

```python
def sum_all(*args):
    """
    Sum all arguments, handling nested lists.
    
    Example:
        sum_all(1, 2, [3, 4], 5) → 15
    """
    # Fill in the implementation
    pass
```

**Expected Solution**:
```python
def sum_all(*args):
    total = 0
    for arg in args:
        if isinstance(arg, (list, tuple)):
            total += sum_all(*arg)  # Recursive unflinching
        else:
            total += arg
    return total
```

---

**Question 12**: Complete this function with proper error handling:

```python
def safe_divide(a, b):
    """
    Divide a by b, handling division by zero.
    
    Returns:
        float: Result of division
        str: Error message if invalid
    """
    # Fill in the implementation
    pass
```

**Expected Solution**:
```python
def safe_divide(a, b):
    if not isinstance(a, (int, float)) or not isinstance(b, (int, float)):
        return "Error: Both arguments must be numbers"
    if b == 0:
        return "Error: Cannot divide by zero"
    return a / b
```

---

## Component 2: Coding Challenge (4 hours / 50 points)

### Challenge: Build a Personal Finance Calculator

**Objective**: Create a function-based system to manage personal finances.

**Requirements**:

1. **Transaction Management** (15 points)
   - `add_transaction(date, category, amount, description) → dict`
   - Validate: date format, positive amounts, valid categories
   - Return transaction record with unique ID

2. **Category Analysis** (15 points)
   - `get_transactions_by_category(transactions, category) → list`
   - `total_by_category(transactions) → dict`
   - `highest_expense_category(transactions) → tuple (category, amount)`

3. **Financial Insights** (12 points)
   - `calculate_balance(transactions) → float`
   - `get_spending_trend(transactions) → dict`
   - `monthly_summary(transactions) → dict`

4. **Code Quality** (8 points)
   - Proper docstrings for all functions
   - Type hints on parameters and returns
   - Error handling with clear messages
   - Consistent naming and formatting

### Starter Code

```python
"""
Personal Finance Calculator
Author: [Your Name]
Date: [Date]
"""

from datetime import datetime
from typing import List, Dict, Tuple

def add_transaction(date: str, category: str, amount: float, description: str) -> Dict:
    """
    Add a new financial transaction.
    
    Args:
        date: Transaction date (format: YYYY-MM-DD)
        category: Spending category (e.g., 'Food', 'Transport', 'Entertainment')
        amount: Transaction amount (positive for expenses, negative for income)
        description: Brief description of transaction
    
    Returns:
        Dictionary with transaction details including auto-generated ID
    
    Raises:
        ValueError: If date format invalid, amount <= 0, or invalid category
    """
    # TODO: Implement
    pass

def total_by_category(transactions: List[Dict]) -> Dict[str, float]:
    """
    Calculate total spending by category.
    
    Args:
        transactions: List of transaction dictionaries
    
    Returns:
        Dictionary mapping category name to total spent
    """
    # TODO: Implement
    pass

def calculate_balance(transactions: List[Dict]) -> float:
    """
    Calculate net balance from all transactions.
    
    Args:
        transactions: List of transaction dictionaries
    
    Returns:
        Net balance (positive = surplus, negative = deficit)
    """
    # TODO: Implement
    pass

def highest_expense_category(transactions: List[Dict]) -> Tuple[str, float]:
    """
    Find the category with highest spending.
    
    Args:
        transactions: List of transaction dictionaries
    
    Returns:
        Tuple of (category_name, total_amount)
    
    Raises:
        ValueError: If no transactions exist
    """
    # TODO: Implement
    pass

# TODO: Add more functions as needed

if __name__ == "__main__":
    # Test your implementation
    transactions = []
    
    # Example usage
    t1 = add_transaction("2024-02-01", "Food", 45.50, "Groceries")
    transactions.append(t1)
    
    print("Total by category:", total_by_category(transactions))
    print("Balance:", calculate_balance(transactions))
```

### Evaluation Criteria

| Criterion | Points | Details |
|-----------|--------|---------|
| Functions 1-3 implemented | 35 | Correct logic, proper returns |
| Error handling | 8 | Validates inputs, handles edge cases |
| Documentation | 4 | Docstrings, comments, clarity |
| Testing | 3 | Demonstrates functions work with examples |

---

## Component 3: Project Review & Questions (2 hours / 20 points)

### Presentation (10 points)

Present your finance calculator by:
1. **Walking through code** (5 minutes)
   - Explain your function design
   - Show how functions work together
   - Highlight any clever implementations

2. **Demonstrating functionality** (3 minutes)
   - Add sample transactions
   - Show summary reports
   - Explain the output

3. **Discussing design decisions** (2 minutes)
   - Why did you organize functions this way?
   - What scope issues did you encounter?
   - How did you handle validation?

### Interview Questions (10 points)

Be prepared to answer:

1. **"How would you extend this to handle recurring transactions?"**
   - Explanation of needed modifications
   - New function designs
   - Scope considerations

2. **"What if we added user login? How does that change your scope strategy?"**
   - Global state management
   - Function parameter changes
   - Security considerations

3. **"How would you test this code?"**
   - Test cases for each function
   - Edge cases
   - Error scenarios

4. **"Why did you choose these parameter names?"**
   - Clarity and convention
   - Type hints reasoning
   - Documentation alignment

5. **"Can you refactor any function for improvement?"**
   - Code clarity
   - Performance
   - Maintainability

---

## Study Guide

### Topics to Review

**Functions**:
- [ ] Parameter types (positional, keyword, default, *args, **kwargs)
- [ ] Return values (single, multiple, None)
- [ ] Docstring standards
- [ ] Type hints

**Scope**:
- [ ] LEGB rule (Local, Enclosing, Global, Built-in)
- [ ] Variable shadowing
- [ ] `global` and `nonlocal` keywords
- [ ] Closures

**Advanced**:
- [ ] Lambda functions
- [ ] Recursion patterns
- [ ] Function composition
- [ ] Pure functions

**Best Practices**:
- [ ] Error handling
- [ ] Input validation
- [ ] Code organization
- [ ] Naming conventions

### Practice Problems

**Problem 1**: Write a function that accepts variable number of numbers and returns statistics (mean, median, mode).

**Problem 2**: Create a function that validates email format and provides specific error messages.

**Problem 3**: Write recursive function to calculate power: `power(base, exponent)`.

**Problem 4**: Create a function factory that returns customized greeting functions.

**Problem 5**: Write a data transformation function using lambda and map/filter.

---

## Sample Test Cases

### Test Data

```python
# Sample transactions for testing
sample_transactions = [
    {"id": 1, "date": "2024-02-01", "category": "Food", "amount": 45.50, "description": "Groceries"},
    {"id": 2, "date": "2024-02-02", "category": "Transport", "amount": 25.00, "description": "Gas"},
    {"id": 3, "date": "2024-02-03", "category": "Food", "amount": 18.75, "description": "Lunch"},
    {"id": 4, "date": "2024-02-03", "category": "Entertainment", "amount": 35.00, "description": "Movie"},
]

# Expected results
expected_by_category = {
    "Food": 64.25,
    "Transport": 25.00,
    "Entertainment": 35.00
}

expected_balance = -124.25
expected_highest = ("Food", 64.25)
```

### Verification

```python
# Test your functions
assert total_by_category(sample_transactions) == expected_by_category
assert calculate_balance(sample_transactions) == expected_balance
assert highest_expense_category(sample_transactions) == expected_highest

print("✓ All tests passed!")
```

---

## Self-Assessment Before Submission

### Mastery Checklist

- [ ] I understand all function parameter types (positional, keyword, *args, **kwargs)
- [ ] I can explain scope using the LEGB rule
- [ ] I have written functions with proper docstrings and type hints
- [ ] I understand closures and when to use them
- [ ] I can write recursive functions with base cases
- [ ] I use lambda functions appropriately (not overusing them)
- [ ] I validate function inputs and handle errors gracefully
- [ ] I write pure functions where possible
- [ ] My functions are organized and reusable
- [ ] I have tested my code with multiple cases

### Submission Checklist

- [ ] Written exam completed
- [ ] Coding challenge submitted with all functions implemented
- [ ] Code is well-documented and styled per PEP 8
- [ ] Presentation is prepared with working demo
- [ ] I can answer questions about my implementation

---

## Resources for Review

- **Python Official Docs - Functions**: https://docs.python.org/3/tutorial/controlflow.html#defining-functions
- **PEP 257 - Docstrings**: https://www.python.org/dev/peps/pep-0257/
- **Real Python - Args and Kwargs**: https://realpython.com/args-and-kwargs-in-python/
- **Real Python - Closures**: https://realpython.com/inner-functions-what-are-they-good-for/
- **Python Scope & Naming Basics**: https://realpython.com/python-scope-legb-rule/

---

## Key Reminders for Success

✅ **Read questions carefully** – Make sure you understand what's being asked  
✅ **Show your work** – In coding challenges, explain your approach  
✅ **Test your code** – Run it with different inputs before submission  
✅ **Handle errors** – Use try-except and input validation  
✅ **Document clearly** – Write docstrings that would help a colleague understand your code  
✅ **Practice** – Review lessons 1.1.24-1.1.37 if you're unsure  
✅ **Be confident** – You've learned all the concepts; trust your knowledge

---

## Grading Scale

| Score Range | Grade | Status |
|-------------|-------|--------|
| 90-100 | A | Mastery |
| 80-89 | B | Proficient |
| 70-79 | C | Developing |
| 60-69 | D | Needs Improvement |
| <60 | F | Reassessment Required |

**Passing Score: 80+** (B or better)

If you score below 80, you can:
1. Review the concepts again
2. Redo the challenge with improvements
3. Retake within 2 weeks

---

## After This Milestone

Once you've passed this assessment, you're ready for:

**← [Lesson 1.1.37: Mini-Project - Function Library](Lesson-1.1.37-Mini-Project-Function-Library.md)**

**→ [Lesson 1.1.39: Lists Fundamentals](Lesson-1.1.39-Lists-Fundamentals.md) (Topic 4: Data Structures)**

---

## Still Have Questions?

- Review specific lessons (1.1.24-1.1.36)
- Check the glossary of terms
- Ask in study groups or forums
- Practice with additional problems

**You've got this!** 🚀 This milestone brings you 38% of the way through Niveau 1.1. Your hard work on functions is paying off!

---

**Go forward with confidence!** 🐍
