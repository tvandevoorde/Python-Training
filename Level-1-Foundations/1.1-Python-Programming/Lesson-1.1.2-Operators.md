# Lesson 1.1.2: Operators (Arithmetic, Comparison, Logical)

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.1.1 | **Topic**: Variables, Types, Operators

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Use arithmetic operators (+, -, *, /, //, %, **)
- Understand operator precedence (order of operations)
- Use comparison operators (==, !=, <, >, <=, >=)
- Use logical operators (and, or, not)
- Build complex boolean expressions
- Understand truthy and falsy values

---

## 1. Arithmetic Operators

Arithmetic operators perform mathematical operations on numbers.

### 1.1 Basic Arithmetic

| Operator | Name | Example | Result |
|----------|------|---------|--------|
| `+` | Addition | `10 + 3` | `13` |
| `-` | Subtraction | `10 - 3` | `7` |
| `*` | Multiplication | `10 * 3` | `30` |
| `/` | Division | `10 / 3` | `3.333...` |
| `//` | Floor Division | `10 // 3` | `3` (no decimals) |
| `%` | Modulo (Remainder) | `10 % 3` | `1` |
| `**` | Exponentiation | `10 ** 3` | `1000` |

### 1.2 Examples

```python
# Basic arithmetic
a = 10
b = 3

print(a + b)        # 13
print(a - b)        # 7
print(a * b)        # 30
print(a / b)        # 3.3333333333333335 (float)
print(a // b)       # 3 (integer division)
print(a % b)        # 1 (remainder)
print(a ** b)       # 1000 (10 to power 3)

# Real-world example: Calculate total price with tax
item_price = 99.99
tax_rate = 0.08     # 8% tax
total = item_price + (item_price * tax_rate)
print(f"Total: ${total:.2f}")  # Total: $107.99
```

### 1.3 Modulo Operator (%)

Often used to check if a number is even or odd:

```python
# Check if even or odd
number = 10
if number % 2 == 0:
    print("Even")  # Output: Even
else:
    print("Odd")

number = 7
if number % 2 == 0:
    print("Even")
else:
    print("Odd")   # Output: Odd

# Check if divisible by 5
number = 25
if number % 5 == 0:
    print("Divisible by 5")  # Output: Divisible by 5
```

---

## 2. Operator Precedence (PEMDAS/BODMAS)

Python follows standard math precedence. Use parentheses to be explicit.

```python
# Without parentheses
result = 2 + 3 * 4    # Order: First 3*4=12, then 2+12=14
print(result)         # Output: 14

# With parentheses (clear intent)
result = (2 + 3) * 4  # Order: First 2+3=5, then 5*4=20
print(result)         # Output: 20

# Exponentiation has high precedence
result = 2 ** 3 * 4   # Order: 2**3=8, then 8*4=32
print(result)         # Output: 32

# Always use parentheses for clarity
result = 10 + 5 * 2
print(result)         # 20, but is this what we meant?
result = (10 + 5) * 2
print(result)         # 30, much clearer
```

**Operator Precedence (High to Low):**
1. `**` (Exponentiation)
2. `*`, `/`, `//`, `%` (Multiplication, Division, etc.)
3. `+`, `-` (Addition, Subtraction)

---

## 3. Comparison Operators

Comparison operators compare two values and return `True` or `False`.

| Operator | Name | Example | Result |
|----------|------|---------|--------|
| `==` | Equal to | `10 == 10` | `True` |
| `!=` | Not equal to | `10 != 5` | `True` |
| `<` | Less than | `5 < 10` | `True` |
| `>` | Greater than | `10 > 5` | `True` |
| `<=` | Less than or equal to | `10 <= 10` | `True` |
| `>=` | Greater than or equal to | `10 >= 5` | `True` |

### 3.1 Examples

```python
age = 18

print(age == 18)      # True (equals)
print(age != 18)      # False (not equals)
print(age < 21)       # True (less than)
print(age > 16)       # True (greater than)
print(age <= 18)      # True (less than or equal)
print(age >= 18)      # True (greater than or equal)

# String comparison
name = "Alice"
print(name == "Alice")     # True
print(name != "Bob")       # True
print(name > "Bob")        # False (alphabetical order)
```

### 3.2 Common Comparison Patterns

```python
# Check if in range
score = 75
print(score >= 60 and score < 80)  # True (we'll cover 'and' next)

# Check if empty
items = []
print(len(items) == 0)  # True (empty list)

# Check age eligibility
age = 25
can_vote = age >= 18
print(can_vote)         # True
```

---

## 4. Logical Operators

Logical operators combine boolean values: `and`, `or`, `not`

| Operator | Meaning | Example | Result |
|----------|---------|---------|--------|
| `and` | Both must be True | `True and True` | `True` |
| `and` | Both must be True | `True and False` | `False` |
| `or` | At least one must be True | `True or False` | `True` |
| `or` | At least one must be True | `False or False` | `False` |
| `not` | Reverses the value | `not True` | `False` |

### 4.1 AND Operator

All conditions must be True:

```python
age = 25
has_license = True

# AND requires both to be True
can_drive = age >= 18 and has_license
print(can_drive)  # True

# If either is False, result is False
has_license = False
can_drive = age >= 18 and has_license
print(can_drive)  # False

# Real-world: Login validation
username = "alice"
password = "secret123"
correct_username = username == "alice"
correct_password = password == "secret123"

is_logged_in = correct_username and correct_password
print(is_logged_in)  # True
```

### 4.2 OR Operator

At least one condition must be True:

```python
day = "Saturday"

# OR needs at least one to be True
is_weekend = day == "Saturday" or day == "Sunday"
print(is_weekend)  # True

day = "Monday"
is_weekend = day == "Saturday" or day == "Sunday"
print(is_weekend)  # False

# Real-world: Guest list
name = "Alice"
is_vip = False
has_ticket = True

can_enter = is_vip or has_ticket
print(can_enter)  # True (has ticket)
```

### 4.3 NOT Operator

Reverses a boolean value:

```python
is_raining = True
should_go_out = not is_raining
print(should_go_out)  # False

is_student = False
should_pay_full_price = not is_student
print(should_pay_full_price)  # True

# Real-world: Password validation
is_weak_password = len("12345") < 8
is_strong = not is_weak_password
print(is_strong)  # False (password is weak)
```

---

## 5. Combining Operators

### 5.1 Complex Conditions

```python
# User age, membership, and purchase amount
age = 21
is_member = True
purchase = 50

# Check if eligible for discount
eligible_for_discount = (age >= 18) and (is_member or purchase > 100)
print(eligible_for_discount)  # True (age OK and is member)

# Enrollment eligibility
gpa = 3.5
sat_score = 1200
has_community_service = True

can_enroll = (gpa >= 3.0 and sat_score >= 1050) or has_community_service
print(can_enroll)  # True (either academic OR community service)
```

### 5.2 Precedence of Logical Operators

Order: `not` → `and` → `or`

```python
# Examples to understand precedence
result = True or False and False
print(result)  # True (because AND is evaluated first: False and False = False, then True or False = True)

result = not True or False
print(result)  # False (because NOT is evaluated first: not True = False, then False or False = False)

# Use parentheses to be explicit
result = (not True) or False
print(result)  # False
result = not (True or False)
print(result)  # False
```

---

## 6. Truthy and Falsy Values

In Python, not just `True` and `False` are treated as booleans. Many values are "truthy" or "falsy":

### 6.1 Falsy Values

These are considered `False` in a boolean context:
- `False` (boolean)
- `0`, `0.0` (numeric zero)
- `""` (empty string)
- `[]` (empty list)
- `{}` (empty dict)
- `None` (null value)

### 6.2 Truthy Values

Everything else is considered `True`:
- `True` (boolean)
- Non-zero numbers: `1`, `-5`, `3.14`
- Non-empty strings: `"hello"`, `"0"` (note: string "0" is truthy!)
- Non-empty collections: `[1, 2]`, `{"a": 1}`

### 6.3 Examples

```python
# Falsy examples
if 0:
    print("This won't print")
else:
    print("0 is falsy")  # Output

if "":
    print("This won't print")
else:
    print("Empty string is falsy")  # Output

if []:
    print("This won't print")
else:
    print("Empty list is falsy")  # Output

# Truthy examples
if 1:
    print("1 is truthy")  # Output

if "hello":
    print("Non-empty string is truthy")  # Output

if [1, 2, 3]:
    print("Non-empty list is truthy")  # Output
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.2.1**: Basic arithmetic
```python
# Calculate:
# 1. Sum of 15 + 25
# 2. Product of 6 * 7
# 3. 50 divided by 4 (show both / and //)
# 4. Remainder of 17 divided by 5

sum_result = 15 + 25
print(sum_result)           # 40

product = 6 * 7
print(product)              # 42

division = 50 / 4
floor_division = 50 // 4
print(division, floor_division)    # 12.5 12

remainder = 17 % 5
print(remainder)            # 2
```

**Exercise 1.1.2.2**: Comparison operators
```python
# Store age and check conditions
age = 21

print(age >= 18)            # True
print(age < 65)             # True
print(age == 21)            # True
print(age != 20)            # True
```

**Exercise 1.1.2.3**: Logical operators
```python
# Check if person can vote (age >= 18) and is registered (True)
age = 20
is_registered = True

can_vote = age >= 18 and is_registered
print(can_vote)             # True
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.2.4**: Order discount calculation
```python
# If item costs $50 and order quantity is 10:
# - Base total: 50 * 10 = $500
# - Apply 10% discount
# - Calculate final total

item_price = 50
quantity = 10
base_total = item_price * quantity
discount_rate = 0.10
discount_amount = base_total * discount_rate
final_total = base_total - discount_amount

print(f"Base: ${base_total}, Discount: ${discount_amount}, Final: ${final_total}")
# Output: Base: $500, Discount: $50.0, Final: $450.0
```

**Exercise 1.1.2.5**: Check if number is even and positive
```python
# Given number = 42, check if it's even AND positive
number = 42

is_even = number % 2 == 0
is_positive = number > 0

print(f"Even: {is_even}, Positive: {is_positive}")  # Even: True, Positive: True
print(is_even and is_positive)                      # True
```

**Exercise 1.1.2.6**: Movie ticket eligibility
```python
# Free ticket if: age < 12 OR age >= 65
# Otherwise: $12 entrance fee
age = 10

is_free = age < 12 or age >= 65
price = 0 if is_free else 12

print(f"Age {age}: Price = ${price}")  # Age 10: Price = $0
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.2.7**: Complex eligibility check
```python
# College scholarship eligibility:
# - GPA >= 3.5 AND SAT >= 1400
# - OR GPA >= 3.8 (regardless of SAT score)

gpa = 3.6
sat_score = 1300

eligible = (gpa >= 3.5 and sat_score >= 1400) or gpa >= 3.8

print(f"Eligible: {eligible}")  # False (GPA 3.6 is good but SAT < 1400 and GPA < 3.8)

# Test with different values
gpa = 3.9
eligible = (gpa >= 3.5 and sat_score >= 1400) or gpa >= 3.8
print(f"Eligible: {eligible}")  # True (GPA >= 3.8)
```

**Exercise 1.1.2.8**: Temperature alert system
```python
# Alert if: too hot (> 95°F) OR too cold (< 32°F)
# Otherwise: comfortable

temperature = 105

is_alert = temperature > 95 or temperature < 32
status = "ALERT" if is_alert else "Comfortable"

print(f"Temperature: {temperature}°F - {status}")  # ALERT
```

**Exercise 1.1.2.9**: Banking withdrawal validation
```python
# Can withdraw if:
# - Account balance >= withdrawal amount
# - AND account is not blocked
# - AND daily withdrawal limit not exceeded

balance = 500
withdrawal_amount = 200
is_blocked = False
daily_withdrawn = 100
daily_limit = 500

can_withdraw = (balance >= withdrawal_amount) and \
               (not is_blocked) and \
               (daily_withdrawn + withdrawal_amount <= daily_limit)

print(f"Can withdraw: {can_withdraw}")  # True
```

---

## Mini-Project: Grade Calculator with Feedback

Create a script that calculates final grade and provides feedback.

```python
# grade_calculator.py

# Student scores
exam1 = 85
exam2 = 92
project = 88
participation = 90

# Calculate weighted average
final_grade = (exam1 * 0.25) + (exam2 * 0.25) + (project * 0.25) + (participation * 0.25)

# Determine letter grade
if final_grade >= 90:
    letter_grade = "A"
    status = "Excellent"
elif final_grade >= 80:
    letter_grade = "B"
    status = "Good"
elif final_grade >= 70:
    letter_grade = "C"
    status = "Satisfactory"
elif final_grade >= 60:
    letter_grade = "D"
    status = "Needs Improvement"
else:
    letter_grade = "F"
    status = "Failing"

# Provide feedback
print(f"Final Grade: {final_grade:.1f} ({letter_grade})")
print(f"Status: {status}")

# Bonus: Show if student passes (>= 60)
is_passing = final_grade >= 60
print(f"Passing: {'Yes' if is_passing else 'No'}")

# Output:
# Final Grade: 88.8 (B)
# Status: Good
# Passing: Yes
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **10 / 3 returns 3 in Python.**
   - Answer: False (returns 3.333..., use // for integer division)

2. **The modulo operator (%) returns the remainder.**
   - Answer: True

3. **Both `and` and `or` must have all conditions True to return True.**
   - Answer: False (only `and` requires all True; `or` needs just one)

4. **An empty string "" is falsy in Python.**
   - Answer: True

---

### Conceptual Questions

5. **What's the difference between `/` and `//` in Python?**
   - `/`: Division (returns float) | `//`: Floor division (returns integer, rounded down)

6. **What does the `not` operator do?**
   - It reverses/negates a boolean value (True becomes False, False becomes True)

7. **Explain the difference between `and` and `or`:**
   - `and`: All conditions must be True | `or`: At least one condition must be True

---

### Coding Challenge

8. **Write a script that checks if a number is within a valid range (1-100) and is even:**
   ```python
   number = 50
   is_valid = (number >= 1 and number <= 100) and number % 2 == 0
   print(is_valid)  # True
   ```

---

## Key Takeaways

✅ **Arithmetic operators** (+, -, *, /, //, %, **) perform math operations  
✅ **Comparison operators** (==, !=, <, >, <=, >=) return True/False  
✅ **Logical operators** (and, or, not) combine boolean values  
✅ **Operator precedence** matters: use parentheses for clarity  
✅ **Truthy/falsy values** help write concise code  

---

## Additional Resources

- **Python Operators**: [Using Operators in Python](https://docs.python.org/3/reference/expressions.html)
- **Boolean Logic**: [Truth Value Testing](https://docs.python.org/3/library/stdtypes.html#truth-value-testing)
- **Practice**: [HackerRank - Python Basics](https://www.hackerrank.com/domains/python)

---

## Next Lesson Preview

**Lesson 1.1.3**: Input and String Formatting
- Read user input with `input()`
- Format strings with f-strings
- Combine input, variables, and operators

---

## Homework

1. **Complete all 3 Starter exercises** (1.1.2.1 - 1.1.2.3)
2. **Solve 3 Intermediate exercises** (your choice from 1.1.2.4 - 1.1.2.6)
3. **Complete the Mini-Project** (Grade Calculator)
4. **Challenge**: Modify the grade calculator to also check if the student qualifies for honors (>= 95)
5. **Quiz Prep**: Review the Quiz & Assessment above

**Expected time**: 2-3 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.3** when you're ready.




