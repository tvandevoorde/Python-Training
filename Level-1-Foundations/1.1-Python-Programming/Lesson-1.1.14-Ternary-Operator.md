# Lesson 1.1.14: Ternary Operator

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lessons 1.1.11-1.1.13 (if statements)

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Understand ternary operator syntax and purpose
- Write one-line conditional assignments
- Use ternary operators in various contexts
- Understand when ternary operators improve vs. harm readability
- Nest ternary operators (carefully!)
- Apply ternary operators to real-world problems
- Know the trade-offs between `if/else` and ternary operators

---

## 1. What is the Ternary Operator? (60 min)

### 1.1 Basic Concept

The **ternary operator** is a compact way to assign a value based on a condition. It's a one-line replacement for simple `if/else` statements.

**Syntax:**
```python
value = expression_if_true if condition else expression_if_false
```

**Comparison:**
```python
# Traditional if/else
age = 25
if age >= 18:
    status = "adult"
else:
    status = "minor"

# Ternary operator (same result, one line)
age = 25
status = "adult" if age >= 18 else "minor"
print(status)  # Output: adult
```

### 1.2 Real-World Examples

```python
# Example 1: Simple assignment
score = 85
result = "Pass" if score >= 60 else "Fail"
print(result)  # Output: Pass

# Example 2: Computing values
x = 10
y = 20
max_value = x if x > y else y
print(max_value)  # Output: 20

# Example 3: String formatting
is_plural = True
count = 5
message = f"{count} item{'s' if is_plural else ''}"
print(message)  # Output: 5 items

# Example 4: Default values
user_name = None
display_name = user_name if user_name else "Guest"
print(display_name)  # Output: Guest
```

---

## 2. Basic Ternary Operator Usage (75 min)

### 2.1 Simple Assignments

```python
# Assigning numbers
temperature = 15
feeling = "cold" if temperature < 10 else "cool" if temperature < 20 else "warm"
print(feeling)  # Output: cool

# Assigning boolean values
age = 25
can_vote = True if age >= 18 else False
print(can_vote)  # Output: True

# Assigning with function calls
number = 7
category = "even" if number % 2 == 0 else "odd"
print(category)  # Output: odd
```

### 2.2 Using Ternary in Function Calls

```python
# In print statements
score = 92
print("Pass" if score >= 60 else "Fail")  # Output: Pass

# In list creation
numbers = [1, 2, 3, 4, 5]
categories = ["even" if n % 2 == 0 else "odd" for n in numbers]
print(categories)  # Output: ['odd', 'even', 'odd', 'even', 'odd']

# In function arguments
result = max(10, 20 if True else 5)
print(result)  # Output: 20
```

### 2.3 Ternary with Complex Expressions

```python
# Computing values
price = 100
discount_rate = 0.1 if price > 50 else 0.05
final_price = price * (1 - discount_rate)
print(final_price)  # Output: 90.0

# String operations
name = "Alice"
greeting = f"Hello, {name.upper() if len(name) > 5 else name}"
print(greeting)  # Output: Hello, Alice

# With method calls
text = "HELLO"
result = text.lower() if text.isupper() else text.upper()
print(result)  # Output: hello
```

---

## 3. Nested Ternary Operators (75 min)

### 3.1 Understanding Nested Ternary (Use Carefully!)

```python
# Grade assignment
score = 85

# Nested ternary (readable with good spacing)
grade = "A" if score >= 90 else "B" if score >= 80 else "C" if score >= 70 else "D"
print(grade)  # Output: B

# Breaking it down for clarity:
grade = (
    "A" if score >= 90 else
    "B" if score >= 80 else
    "C" if score >= 70 else
    "D"
)
print(grade)  # Output: B

# Equivalent if/elif/else (often CLEARER):
if score >= 90:
    grade = "A"
elif score >= 80:
    grade = "B"
elif score >= 70:
    grade = "C"
else:
    grade = "D"
```

### 3.2 Multiple Nested Levels

```python
# Age categorization
age = 35

category = (
    "child" if age < 13 else
    "teen" if age < 18 else
    "young_adult" if age < 30 else
    "adult" if age < 65 else
    "senior"
)
print(category)  # Output: young_adult

# With function calls
def get_ticket_price(age, is_student=False):
    return (
        5 if age < 5 else
        8 if is_student else
        12 if age < 18 else
        15
    )

print(get_ticket_price(10))        # Output: 8
print(get_ticket_price(25, True))  # Output: 8
print(get_ticket_price(25))        # Output: 15
```

### 3.3 When NOT to Nest

```python
# TOO COMPLEX - don't do this
result = (
    a if x > 0 else
    b if y > 0 else
    c if z > 0 else
    d if p > 0 else
    e
)

# Better - use if/elif/else for clarity
if x > 0:
    result = a
elif y > 0:
    result = b
elif z > 0:
    result = c
elif p > 0:
    result = d
else:
    result = e
```

---

## 4. Common Use Cases (75 min)

### 4.1 Default Value Assignment

```python
# Provide default if None
name = None
display_name = name or "Anonymous"  # Using 'or' operator
print(display_name)  # Output: Anonymous

# Using ternary (more explicit)
display_name = name if name else "Anonymous"
print(display_name)  # Output: Anonymous

# With functions
def greet(name=None):
    actual_name = name if name else "Friend"
    return f"Hello, {actual_name}!"

print(greet())        # Output: Hello, Friend!
print(greet("Alice")) # Output: Hello, Alice!
```

### 4.2 String Formatting

```python
# Pluralization
count = 5
message = f"You have {count} item{'s' if count != 1 else ''}"
print(message)  # Output: You have 5 items

# Conditional text
score = 75
feedback = f"You scored {score}. {'Great job!' if score >= 80 else 'Try again!'}"
print(feedback)  # Output: You scored 75. Try again!

# Formatting based on condition
value = 3
formatted = f"{value:0>3}" if value < 100 else f"{value}"
print(formatted)  # Output: 003
```

### 4.3 Mathematical Operations

```python
# Absolute value (without using abs())
x = -5
absolute = x if x >= 0 else -x
print(absolute)  # Output: 5

# Min/Max (without using min/max)
a, b = 10, 20
minimum = a if a < b else b
maximum = a if a > b else b
print(f"Min: {minimum}, Max: {maximum}")  # Output: Min: 10, Max: 20

# Rounding based on condition
value = 2.6
rounded = int(value) if value - int(value) < 0.5 else int(value) + 1
print(rounded)  # Output: 3
```

### 4.4 User Input Validation

```python
# Validate and assign
user_input = input("Enter a number (1-100): ")
number = int(user_input) if user_input.isdigit() and 1 <= int(user_input) <= 100 else 50
print(f"Number: {number}")

# List filtering
numbers = [1, 5, 10, 15, 20]
filtered = [n if n > 5 else 0 for n in numbers]
print(filtered)  # Output: [0, 0, 10, 15, 20]
```

---

## 5. Ternary vs if/else: When to Use What (60 min)

### 5.1 When Ternary is Better

```python
# Simple one-line assignments
status = "pass" if grade >= 60 else "fail"

# Inline assignments
result = max(x, y) if x > 0 else 0

# In comprehensions
squares = [x**2 if x % 2 == 0 else x for x in range(10)]

# Default values
value = user_input or default_value
```

### 5.2 When if/else is Better

```python
# Multiple statements needed
if age >= 18:
    send_email("Welcome!")
    update_database()
    print("Registered")
else:
    print("Too young")

# Complex conditions
if (has_license and 
    not is_suspended and
    valid_insurance and
    passed_inspection):
    can_drive = True
else:
    can_drive = False

# Many branches
if score >= 90:
    grade = "A"
elif score >= 80:
    grade = "B"
elif score >= 70:
    grade = "C"
else:
    grade = "F"
```

### 5.3 Mixed Approach

```python
# Use both where appropriate
def calculate_price(price, is_customer, is_weekend):
    # Simple ternary for single value
    base_price = price * (0.9 if is_customer else 1.0)
    
    # if/else for complex logic
    if is_weekend:
        if base_price > 100:
            final_price = base_price * 0.95
        else:
            final_price = base_price * 0.85
    else:
        final_price = base_price
    
    return final_price

print(calculate_price(150, True, True))   # Discounted weekend price
print(calculate_price(50, False, False))  # Regular price
```

---

## 6. Advanced Patterns (60 min)

### 6.1 Chaining with Logical Operators

```python
# Combine ternary with 'or'/'and'
name = user_input or "Guest"
is_valid = name and name.isalpha()
status = "valid" if is_valid else "invalid"

# One-liner
status = "valid" if (name and name.isalpha()) else "invalid"
```

### 6.2 Ternary in List/Dict Comprehensions

```python
# List comprehension with ternary
numbers = [1, 2, 3, 4, 5, 6]
categorized = ["even" if n % 2 == 0 else "odd" for n in numbers]
print(categorized)  # Output: ['odd', 'even', 'odd', 'even', 'odd', 'even']

# Dictionary comprehension with ternary
dict_result = {n: "big" if n > 50 else "small" for n in [30, 60, 40]}
print(dict_result)  # Output: {30: 'small', 60: 'big', 40: 'small'}

# Filtering with ternary
results = [n if n > 0 else None for n in [-5, 3, -2, 8]]
print(results)  # Output: [None, 3, None, 8]
```

### 6.3 Function Return Values

```python
# Using ternary in return statements
def validate_age(age):
    return "adult" if age >= 18 else "minor"

def get_discount(membership, purchase_amount):
    return 0.2 if membership == "vip" else 0.1 if purchase_amount > 100 else 0.0

print(validate_age(25))            # Output: adult
print(get_discount("vip", 50))     # Output: 0.2
print(get_discount("regular", 150)) # Output: 0.1
```

---

## 7. Common Errors and Edge Cases (45 min)

### 7.1 Syntax Errors

```python
# WRONG - missing 'else' part
# status = "pass" if score >= 60
# SyntaxError!

# CORRECT
status = "pass" if score >= 60 else "fail"

# WRONG - wrong keyword
# status = "pass" if score >= 60 then "fail"
# SyntaxError! Use 'else', not 'then'

# CORRECT
status = "pass" if score >= 60 else "fail"
```

### 7.2 Logic Errors

```python
# WRONG - condition logic reversed
age = 25
status = "child" if age < 18 else "adult"  # Correct
status = "adult" if age < 18 else "child"  # WRONG!

# WRONG - comparing wrong types
price = "100"  # string
discount = "20%" if price > 50 else "10%"  # TypeError!

# CORRECT
discount = "20%" if int(price) > 50 else "10%"
```

### 7.3 Readability Issues

```python
# HARD TO READ - too nested
result = "a" if x > 0 else "b" if x < 0 else "c" if x == 0 else "d"

# EASIER - with formatting
result = (
    "positive" if x > 0 else
    "negative" if x < 0 else
    "zero"
)

# BEST FOR MULTIPLE OPTIONS - use if/elif
if x > 0:
    result = "positive"
elif x < 0:
    result = "negative"
else:
    result = "zero"
```

---

## 8. Mini-Project: Interactive Program

```python
def calculator():
    """Simple calculator using ternary operators"""
    
    num1 = float(input("Enter first number: "))
    operation = input("Enter operation (+, -, *, /): ")
    num2 = float(input("Enter second number: "))
    
    # Calculate using ternary
    result = (
        num1 + num2 if operation == "+" else
        num1 - num2 if operation == "-" else
        num1 * num2 if operation == "*" else
        num1 / num2 if operation == "/" and num2 != 0 else
        None
    )
    
    # Format output
    message = f"Result: {result}" if result is not None else "Invalid operation"
    print(message)

calculator()
```

---

## 9. Graded Exercises

### Starter Exercises (40 minutes)

**Starter Exercise 1:**
```python
# TODO: Use ternary to assign pass/fail
grade = 75
result = "PASS" if grade >= 60 else "FAIL"
print(result)
```

**Starter Exercise 2:**
```python
# TODO: Use ternary for even/odd
number = 7
parity = "even" if number % 2 == 0 else "odd"
print(parity)
```

### Intermediate Exercises (60 minutes)

**Intermediate Exercise 1:**
```python
# TODO: Grade assignment with ternary
score = 85
grade = ("A" if score >= 90 else "B" if score >= 80 else "C")
```

**Intermediate Exercise 2:**
```python
# TODO: Refactor from if/else to ternary
if age < 18:
    category = "minor"
else:
    category = "adult"
    
# Rewrite as ternary
```

### Advanced Exercises (90 minutes)

**Advanced Exercise 1:**
```python
# TODO: Complex nested ternary
# Determine pricing based on:
# - membership (vip/regular/none)
# - purchase_amount
# - is_weekend

# VIP: 30% off always
# Regular: 20% off on weekends, 10% on weekdays
# None: 15% off on weekdays only
```

---

## 10. Self-Assessment Checklist

- [ ] I understand ternary operator syntax
- [ ] I can write simple ternary expressions
- [ ] I know when ternary is appropriate vs if/else
- [ ] I can nest ternary operators
- [ ] I understand readability trade-offs
- [ ] I can use ternary in comprehensions

---

## 11. Assessment Questions

**True/False:**
1. Ternary operator always requires an `else` clause
2. You can nest ternary operators unlimited times
3. Ternary is always more efficient than if/else

**Coding Challenges:**
1. Write ternary for: "Pass if score >= 60"
2. Refactor nested if/else to ternary
3. Grade assignment with multiple levels

---

## 12. Additional Resources

- Code readability and conciseness
- Comprehensions with conditional logic
- Next Lesson: Lesson 1.1.15 - The while Loop

---

**Next Lesson:** Lesson 1.1.15 - The while Loop




