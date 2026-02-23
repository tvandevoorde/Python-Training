# Lesson 1.1.13: Nested Conditionals

**Estimated Time**: 8 hours | **Difficulty**: Beginner-Intermediate  
**Prerequisites**: Lessons 1.1.11-1.1.12 (if, elif, else basics)

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Write conditional statements nested within other conditionals
- Manage complexity in deeply nested code
- Use logical operators as alternatives to nesting
- Apply nested conditionals to real-world decision-making
- Understand when to use nesting vs. logical operators
- Debug nested conditionals effectively
- Recognize and prevent common nesting errors

---

## 1. Introduction to Nested Conditionals (60 min)

### 1.1 What Are Nested Conditionals?

A **nested conditional** is an `if` statement inside another `if` statement. This allows for more complex decision-making where one condition depends on another.

**Simple Example:**
```python
age = 25
has_license = True

if age >= 18:
    if has_license:
        print("You can rent a car")  # Only prints if BOTH conditions true
    else:
        print("You need a driver's license")
else:
    print("You must be 18+ to rent a car")
```

**Pattern:**
- Outer condition checked first
- Inner condition only checked if outer is True
- Multiple levels possible (but use carefully - readability!)

### 1.2 Why Use Nesting?

**Advantages:**
- Express dependent conditions clearly
- Logical flow matches decision-making process
- Some problems naturally nest

**Disadvantages:**
- Can become hard to read quickly
- Indentation gets deep and confusing
- Logical operators often clearer for simple cases

---

## 2. Basic Nested Conditionals (75 min)

### 2.1 Two Levels of Nesting

```python
# Example 1: Grade validation system
score = 85
is_complete = True

if score >= 60:  # Outer condition: did student pass?
    if is_complete:  # Inner condition: work complete?
        grade = "PASS"
    else:
        grade = "INCOMPLETE"
else:
    grade = "FAIL"

print(f"Grade: {grade}")

# Example 2: Bank account access
balance = 5000
is_account_locked = False

if balance > 0:  # Account has money
    if not is_account_locked:  # Account not locked
        print("Funds available for withdrawal")
    else:
        print("Account locked - contact support")
else:
    print("No funds available")
```

### 2.2 Using elif with Nesting

```python
# Nested with elif
temperature = 22

if temperature < 0:
    print("Freezing")
else:  # temperature >= 0
    if temperature < 10:
        print("Cold")
    elif temperature < 20:
        print("Cool")
    else:
        print("Warm")

# Better written with nested structure:
if temperature < 0:
    print("Freezing")
elif temperature < 10:
    print("Cold")
elif temperature < 20:
    print("Cool")
else:
    print("Warm")
```

### 2.3 Nested else-if Chains

```python
# Security access level
user_role = "admin"
is_verified = True
ip_whitelisted = False

if user_role == "admin":
    if is_verified:
        if ip_whitelisted:
            access = "FULL_ACCESS"
        else:
            access = "LIMITED_ACCESS"
    else:
        access = "DENIED"
else:
    access = "USER_ACCESS_ONLY"

print(f"Access level: {access}")
```

---

## 3. Multi-Level Nesting (75 min)

### 3.1 Three or More Levels

```python
# Example: Online store checkout validation
has_items = True
payment_method = "credit_card"
payment_verified = True
shipping_address_valid = True

if has_items:  # Level 1: items in cart?
    if payment_method == "credit_card":  # Level 2: payment method valid?
        if payment_verified:  # Level 3: payment verified?
            if shipping_address_valid:  # Level 4: shipping valid?
                status = "ORDER_COMPLETE"
            else:
                status = "INVALID_ADDRESS"
        else:
            status = "PAYMENT_DECLINED"
    else:
        status = "UNSUPPORTED_PAYMENT"
else:
    status = "EMPTY_CART"

print(f"Status: {status}")
```

### 3.2 Nested Conditionals with Multiple Blocks

```python
# Game difficulty selection
difficulty = "hard"
player_level = 50
has_powerups = True

if difficulty == "easy":
    health = 200
    enemies = 3
else:  # difficult
    if player_level >= 40:  # Strong player
        health = 100
        if has_powerups:
            enemies = 8
        else:
            enemies = 5
    else:  # Weaker player
        health = 150
        enemies = 3

print(f"Health: {health}, Enemies: {enemies}")
```

---

## 4. Nested Loops with Conditionals (75 min)

### 4.1 Conditionals Inside Loops

```python
# Find prime numbers in range
for num in range(2, 10):
    if num % 2 == 0:
        if num == 2:
            print(f"{num} is prime")
        else:
            print(f"{num} is even (not prime)")
    else:
        print(f"{num} might be prime")
```

### 4.2 Loops with Nested Conditionals

```python
# Validate list of ages
ages = [17, 18, 25, 16, 30]

for age in ages:
    if age >= 18:
        if age >= 65:
            status = "SENIOR"
        elif age >= 55:
            status = "NEAR_RETIREMENT"
        else:
            status = "WORKING_AGE"
    else:
        status = "MINOR"
    
    print(f"Age {age}: {status}")
```

### 4.3 Nested Loops with Conditionals

```python
# Matrix searching
matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

target = 5

for row in matrix:
    for num in row:
        if num == target:
            print(f"Found {target}!")
            break  # Exit inner loop
```

---

## 5. Alternatives to Nesting (60 min)

### 5.1 Using Logical Operators Instead

```python
# NESTED VERSION - harder to read
age = 25
has_license = True
clean_record = True

if age >= 18:
    if has_license:
        if clean_record:
            can_drive = True
        else:
            can_drive = False
    else:
        can_drive = False
else:
    can_drive = False

# BETTER - using AND operators
if age >= 18 and has_license and clean_record:
    can_drive = True
else:
    can_drive = False

# EVEN BETTER - direct assignment
can_drive = age >= 18 and has_license and clean_record
```

### 5.2 When Nesting IS Better

```python
# Complex decision tree (nesting clearer than logic)
score = 75
bonus_points = 10
is_final_exam = True

if is_final_exam:
    if score + bonus_points >= 90:
        grade = "A"
    elif score + bonus_points >= 80:
        grade = "B"
    else:
        grade = "C"
else:
    if score >= 90:
        grade = "A"
    elif score >= 80:
        grade = "B"
    else:
        grade = "C"

print(f"Grade: {grade}")
```

### 5.3 De Morgan's Laws for Simplification

```python
# NESTED COMPLEX
is_valid_account = True
has_sufficient_funds = True

if is_valid_account:
    if has_sufficient_funds:
        print("Transaction approved")

# SIMPLIFIED with De Morgan's Laws
if is_valid_account and has_sufficient_funds:
    print("Transaction approved")

# NEGATION EXAMPLE
if not (not is_valid_account or not has_sufficient_funds):
    print("Transaction approved")
# Same as: if is_valid_account and has_sufficient_funds
```

---

## 6. Common Nesting Patterns (60 min)

### 6.1 Validation Pattern

```python
# Validate user data before processing
name = "Alice"
age = 25
email = "alice@example.com"

if name:  # Name provided?
    if age >= 18:  # Adult?
        if "@" in email:  # Valid email?
            print("User data valid")
        else:
            print("Error: Invalid email")
    else:
        print("Error: Must be 18+")
else:
    print("Error: Name required")
```

### 6.2 State Machine Pattern

```python
# Simple traffic light
light_color = "red"
emergency = False

if light_color == "red":
    if emergency:
        status = "PASS_CAREFULLY"
    else:
        status = "STOP"
elif light_color == "yellow":
    if emergency:
        status = "PASS"
    else:
        status = "PREPARE_TO_STOP"
else:  # green
    status = "GO"

print(f"Action: {status}")
```

### 6.3 Permission Checking Pattern

```python
# Check user permissions
user_role = "admin"
action = "delete"
resource_owner = True

if user_role == "admin":
    allowed = True  # Admins can do anything
elif user_role == "user":
    if action == "delete":
        if resource_owner:
            allowed = True  # Users can delete own resources
        else:
            allowed = False  # Can't delete others' resources
    else:
        allowed = True  # Users can do other things
else:
    allowed = False

print(f"Action allowed: {allowed}")
```

---

## 7. Debugging Nested Conditionals (60 min)

### 7.1 Tracking Execution

```python
# Add temporary debugging prints
score = 75
bonus = 5

if score >= 60:
    print("DEBUG: Outer condition true")
    if score + bonus >= 80:
        print("DEBUG: Inner condition true - passing")
        result = "PASS_WITH_BONUS"
    else:
        print("DEBUG: Inner condition false - regular pass")
        result = "PASS_WITHOUT_BONUS"
else:
    print("DEBUG: Outer condition false")
    result = "FAIL"

print(f"Result: {result}")
```

### 7.2 Using print() to Trace Logic

```python
def check_eligibility(age, income, credit_score):
    """Check if eligible for loan"""
    
    print(f"Checking: age={age}, income={income}, credit={credit_score}")
    
    if age >= 21:
        print("✓ Age requirement met")
        if income >= 30000:
            print("✓ Income requirement met")
            if credit_score >= 700:
                print("✓ Credit requirement met")
                return "APPROVED"
            else:
                print("✗ Credit too low")
                return "DENIED_CREDIT"
        else:
            print("✗ Income too low")
            return "DENIED_INCOME"
    else:
        print("✗ Too young")
        return "DENIED_AGE"

result = check_eligibility(25, 50000, 750)
print(f"Final: {result}")
```

---

## 8. Common Errors and Prevention (45 min)

### 8.1 Indentation Errors

```python
# WRONG - indentation incorrect
age = 25
if age >= 18:
print("Adult")  # IndentationError!

# CORRECT
if age >= 18:
    print("Adult")
```

### 8.2 Logic Errors from Nesting

```python
# WRONG - accidentally nesting when unnecessary
x = 5
y = 10

if x > 0:
    if y > 0:  # Nesting when AND would work
        print("Both positive")

# CLEARER
if x > 0 and y > 0:
    print("Both positive")
```

### 8.3 Off-by-One in Nested Conditions

```python
# Confusing nesting depth
score = 85
level = 2

if level == 1:
    if score >= 70:
        print("Pass Level 1 with minimum score")
elif level == 2:
    if score >= 80:
        print("Pass Level 2 with good score")
elif level == 3:
    if score >= 90:
        print("Pass Level 3 with excellent score")

# Use elif to flatten
if level == 1 and score >= 70:
    print("Pass Level 1 with minimum score")
elif level == 2 and score >= 80:
    print("Pass Level 2 with good score")
elif level == 3 and score >= 90:
    print("Pass Level 3 with excellent score")
```

---

## 9. Mini-Project: Decision Tree

```python
def medical_risk_assessment():
    """Assess patient medical risk level"""
    
    age = int(input("Age: "))
    blood_pressure = int(input("Systolic BP: "))
    cholesterol = int(input("Cholesterol level: "))
    smoker = input("Smoker (yes/no): ").lower() == "yes"
    
    risk = "LOW"
    
    if age >= 40:
        if blood_pressure > 140:
            if cholesterol > 240:
                if smoker:
                    risk = "CRITICAL"
                else:
                    risk = "HIGH"
            else:
                risk = "MODERATE"
        elif cholesterol > 240:
            risk = "MODERATE"
    
    return risk

# Better version using logical operators:
def medical_risk_assessment_v2():
    """Assess patient medical risk using logical operators"""
    
    age = int(input("Age: "))
    blood_pressure = int(input("Systolic BP: "))
    cholesterol = int(input("Cholesterol level: "))
    smoker = input("Smoker (yes/no): ").lower() == "yes"
    
    if age >= 40 and blood_pressure > 140 and cholesterol > 240 and smoker:
        risk = "CRITICAL"
    elif age >= 40 and (blood_pressure > 140 or cholesterol > 240):
        risk = "HIGH"
    elif cholesterol > 240 or (age >= 40 and blood_pressure > 140):
        risk = "MODERATE"
    else:
        risk = "LOW"
    
    print(f"Risk Level: {risk}")
```

---

## 10. Graded Exercises

### Starter Exercises (40 minutes)

**Starter Exercise 1: Simple Nesting**
```python
# TODO: User authentication
# Check if username exists, then check password

username = "alice"
password = "secret123"

# If username correct:
#   If password correct:
#     Print "Login successful"
#   Else:
#     Print "Wrong password"
# Else:
#   Print "User not found"
```

**Starter Exercise 2: Nested with elif**
```python
# TODO: Movie rating system
# Input: movie_rating (0-10), watched_before (yes/no)

# If watched_before:
#   Print what they thought
# Else:
#   If rating >= 8:
#     Print "Worth watching"
#   Elif rating >= 5:
#     Print "Might be okay"
#   Else:
#     Print "Skip it"
```

### Intermediate Exercises (60 minutes)

**Intermediate Exercise 1: Nested Validation**
```python
# TODO: Check if student passes class
# Needs: attendance >= 80%, final_score >= 60

attendance = 85
final_score = 72

# If attendance >= 80:
#   If final_score >= 60:
#     grade = "PASS"
#   Else:
#     grade = "FAIL"
# Else:
#   grade = "FAIL" (poor attendance)
```

**Intermediate Exercise 2: Convert Nesting to Logical Operators**
```python
# TODO: Rewrite using AND/OR instead of nesting

# Original nested version:
if age >= 21:
    if income >= 40000:
        if savings >= 10000:
            approved = True

# TODO: Rewrite as one line with logical operators
```

### Advanced Exercises (90 minutes)

**Advanced Exercise 1: Complex Decision Tree**
```python
# TODO: E-commerce discount system
# Variables: 
#   - customer_type (new/regular/vip)
#   - purchase_amount
#   - has_coupon

# Rules:
# If VIP: 20% discount
# Else if regular AND purchase > $100: 10% discount
# Else if new AND has_coupon: 5% discount
# Else: no discount

# Your code here...
```

**Advanced Exercise 2: Refactor Nested Code**
```python
# TODO: Given highly nested code, refactor to use logical operators

original_code = """
if condition1:
    if condition2:
        if condition3:
            result = True
"""

# Refactor to cleaner version with AND operators
```

---

## 11. Self-Assessment Checklist

- [ ] I can write basic nested if statements
- [ ] I understand nesting depth and readability
- [ ] I can use logical operators as alternative to nesting
- [ ] I know when nesting is appropriate vs when operators are better
- [ ] I can debug nested conditionals with print statements
- [ ] I understand common nesting patterns
- [ ] I can avoid common nesting errors

---

## 12. Assessment Questions

**True/False:**
1. Nested conditionals must always use an `else` block
2. Deep nesting (5+ levels) is usually clearer than using `and/or`
3. The indentation level must increase for each nested level

**Short Answer:**
1. When would you choose nesting over logical operators?
2. How can you debug a nested conditional that's not working?

**Coding Challenge:**
1. Write a nested conditional that checks three conditions
2. Refactor it using logical operators
3. Explain which is more readable

---

## 13. Additional Resources

- Understanding code readability and nesting depth
- Refactoring techniques for deeply nested code
- Decision trees and flowcharts
- Next Lesson: Lesson 1.1.14 - Ternary Operator

---

**Next Lesson:** Lesson 1.1.14 - Ternary Operator




