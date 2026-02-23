# Lesson 1.1.11: The `if` Statement

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.1.7 (Boolean Logic & Truth Values) | **Topic**: Control Flow - Conditional Execution

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Understand the purpose of conditional statements in programming
- Write and execute `if` statements with various conditions
- Understand indentation and code blocks in Python
- Use different data types in conditions (not just boolean)
- Apply `if` statements to solve practical problems

---

## 1. Introduction to Control Flow (60 min)

### 1.1 What is Control Flow?

Control flow is how a program decides which code to execute. Without it, every program would just run top-to-bottom with no decisions.

```python
# LINEAR FLOW (no control flow) - always executes in order
print("Step 1")
print("Step 2")
print("Step 3")
# Output:
# Step 1
# Step 2
# Step 3

# WITH CONTROL FLOW - can skip code
age = 15

if age >= 18:
    print("You are an adult")
else:
    print("You are a minor")

# Output depends on age value:
# If age >= 18: "You are an adult"
# If age < 18: "You are a minor"
```

### 1.2 Basic `if` Structure

```python
if condition:
    # Code here runs ONLY if condition is True
    # This is called a "code block"
    statement1
    statement2

# Code here runs regardless (outside the if block)
```

**Key Rules**:
1. Condition must be something that evaluates to True/False (or truthy/falsy)
2. Colon (`:`) ends the `if` line
3. Code block is indented (4 spaces or 1 tab)
4. Indentation shows which code is "inside" the if

### 1.3 Indentation is Critical

```python
x = 10

# ✅ CORRECT
if x > 5:
    print("X is greater than 5")       # Indented (inside if)
print("This always prints")             # Not indented (outside if)

# ❌ WRONG - IndentationError
if x > 5:
print("X is greater than 5")           # ERROR! Not indented

# ❌ WRONG - Logic error (not what you intended)
if x > 5:
    print("X is greater than 5")
    print("This won't be in the if")  # Accidental extra indentation
```

---

## 2. Writing Conditions (90 min)

### 2.1 Boolean Conditions

```python
# Condition using comparison operators
is_raining = True

if is_raining:
    print("Bring an umbrella")

# Condition using comparison
age = 25

if age >= 18:
    print("You can vote")

# Condition using variable
logged_in = True

if logged_in:
    print("Welcome back!")
```

### 2.2 Numeric Comparisons in Conditions

```python
score = 85

if score > 80:
    print("Great job!")

if score >= 80:
    print("Passed!")

if score < 60:
    print("Failed")

if score == 85:
    print("Exactly 85!")

if score != 100:
    print("Not perfect, but good")

# Using arithmetic in conditions
if score * 2 > 150:
    print("Score doubled is > 150")

if score / 10 >= 8:
    print("Scaled score >= 8")
```

### 2.3 String Comparisons in Conditions

```python
name = "Alice"

if name == "Alice":
    print("Hello Alice!")

if name != "Bob":
    print("You're not Bob")

# String length
password = input("Enter password: ")
if len(password) >= 8:
    print("Strong password length")

# Checking if substring exists
email = "user@example.com"
if "@" in email:
    print("Valid email format")

# Case-insensitive comparison (important!)
user_input = input("Continue? (yes/no): ")
if user_input.lower() == "yes":  # ← Convert to lowercase first
    print("Continuing...")
```

### 2.4 Using Truthiness in Conditions

```python
# Remember: certain values are "truthy" or "falsy"
# Empty collections are falsy, non-empty are truthy

items = [1, 2, 3]

if items:  # True because list has items
    print(f"You have {len(items)} items")

# Empty list
cart = []
if not cart:  # True because cart is empty (falsy)
    print("Your cart is empty")

# Check if variable was set
name = None
if name:  # Falsy (None)
    print(f"Hello {name}")
else:
    print("Name not set")

# Checking for zero
count = 0
if count:  # Falsy
    print("You have items")
else:
    print("No items")
```

---

## 3. Multiple Statements in an `if` Block (90 min)

### 3.1 Multiple Statements - Same Indentation

```python
age = 25

if age >= 18:
    print("You are an adult")        # Statement 1
    print("You can vote")             # Statement 2
    print("Welcome!")                 # Statement 3
    # All these run if age >= 18

print("Done")  # This always runs
```

### 3.2 Nested Indentation (if inside if)

```python
age = 25
has_license = True

if age >= 18:
    print("You are an adult")
    
    if has_license:
        print("You can drive")  # Only if BOTH conditions true
    
    print("You can vote")  # Runs if age >= 18

print("Done")
```

### 3.3 Building Simple Validators

```python
username = input("Enter username: ")
password = input("Enter password: ")

if username:  # Check if username provided
    print(f"Username: {username}")
    
    if len(password) >= 6:  # Check if password strong enough
        print("Password is strong")
        print("Account created!")
    else:
        print("Password too short")
else:
    print("Username required")
```

---

## 4. Practical Applications (60 min)

### 4.1 Age-Based Examples

```python
age = int(input("Enter your age: "))

if age < 0:
    print("Invalid age")

if age < 13:
    print("You are a child")

if age >= 13 and age < 18:
    print("You are a teenager")

if age >= 18:
    print("You are an adult")

# More specific example
if age >= 65:
    print("You may be eligible for senior discounts")
    if age >= 100:
        print("Congratulations on 100 years!")
```

### 4.2 Form Validation

```python
email = input("Enter email: ")

if email:  # Not empty
    if "@" in email:  # Contains @
        if "." in email:  # Contains dot
            print("✓ Email looks valid")
        else:
            print("✗ Email must have domain (example.com)")
    else:
        print("✗ Email must contain @")
else:
    print("✗ Email required")
```

### 4.3 Business Logic

```python
# Discount calculator
purchase_amount = float(input("Purchase amount: "))
is_member = input("Are you a member? (yes/no): ").lower() == "yes"

if is_member:
    if purchase_amount >= 100:
        print("You get a 15% discount")
    else:
        print("You get a 5% discount")
else:
    if purchase_amount >= 100:
        print("You get a 5% discount")
    else:
        print("No discount for non-members")
```

### 4.4 Error Checking

```python
# Division with safety check
numerator = input("Enter numerator: ")
denominator = input("Enter denominator: ")

# Convert to numbers
try:
    num = float(numerator)
    denom = float(denominator)
    
    if denom == 0:
        print("Cannot divide by zero!")
    else:
        result = num / denom
        print(f"Result: {result}")
except ValueError:
    print("Please enter valid numbers")
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.11.1**: Basic Age Check
```python
age = 20

if age >= 18:
    print("You can vote")

# What prints? Does it print or not?
```

**Exercise 1.1.11.2**: Checking Equality
```python
favorite_color = "blue"

if favorite_color == "blue":
    print("Blue is cool!")

# What prints?
```

**Exercise 1.1.11.3**: Truthiness Check
```python
score = 65

if score:  # Non-zero number is truthy
    print("You have a score")

# Does it print?
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.11.4**: Temperature Check
```python
# Get temperature and check if it's cold
temp = int(input("Enter temperature: "))

if ???:  # Fill in condition for "cold" (< 32°F)
    print("It's cold! Bundle up.")

print("Done")
```

**Exercise 1.1.11.5**: Password Strength
```python
password = input("Enter password: ")

if len(password) >= 8:
    print("✓ Password is long enough")

# Add check for containing a number
# Hint: Use any(c.isdigit() for c in password)
```

**Exercise 1.1.11.6**: Membership Discount
```python
is_member = input("Are you a member? (yes/no): ").lower() == "yes"
purchase = float(input("Purchase amount: $"))

if is_member:
    print("You get a 10% discount!")
    
# Add: If NOT a member, print "Join today to get discounts!"
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.11.7**: Email Validation
```python
# Check if email is valid (has @ and domain)
email = input("Enter email: ")

if email:
    if "@" in email:
        domain = email.split("@")[1]
        if "." in domain:
            print("✓ Email looks valid")
        else:
            print("✗ Invalid domain")
    else:
        print("✗ Missing @")
else:
    print("✗ Email required")
```

**Exercise 1.1.11.8**: Grade Calculator
```python
score = float(input("Enter score (0-100): "))

if score >= 90:
    grade = "A"
elif score >= 80:  # Wait, we haven't learned elif yet!
    grade = "B"
    
# For now, just use nested if statements instead

if score >= 90:
    print("Grade: A")
    
if score >= 80 and score < 90:  # Must check upper bound
    print("Grade: B")
    
if score >= 70 and score < 80:
    print("Grade: C")
```

**Exercise 1.1.11.9**: User Authentication
```python
# Simulate login check
stored_username = "alice"
stored_password = "pass123"

username = input("Username: ")
password = input("Password: ")

if username == stored_username:
    if password == stored_password:
        print("✓ Login successful!")
    else:
        print("✗ Wrong password")
else:
    print("✗ Username not found")
```

---

## Mini-Project: Personal Finance Advisor

Build a program that gives financial advice based on user's age and savings.

```python
print("=== Personal Finance Advisor ===\n")

# Get user information
age = int(input("What is your age? "))
savings = float(input("How much do you have saved? $"))
monthly_income = float(input("Monthly income? $"))

# Calculate metrics
monthly_savings = savings / 12 if savings > 0 else 0
months_of_emergency = savings / monthly_income if monthly_income > 0 else 0

print("\n--- Your Financial Status ---")
print(f"Age: {age}")
print(f"Total Savings: ${savings:.2f}")
print(f"Monthly Income: ${monthly_income:.2f}")

# Provide age-based advice
if age < 25:
    print("\n🟦 You're young! Focus on:")
    if savings < 1000:
        print("  • Build an emergency fund")
    else:
        print("  • Start investing for the future")

if age >= 25 and age < 50:
    if months_of_emergency < 3:
        print("\n🟨 Priority: Build emergency fund (3-6 months expenses)")
    else:
        print("\n🟩 Emergency fund looks good. Consider investing.")

if age >= 50:
    if months_of_emergency < 6:
        print("\n🟨 Approaching retirement: Build larger emergency fund")
    else:
        print("\n🟩 Consider retirement planning")

# Specific advice
if monthly_income > 5000:
    print("\n💡 With good income, automate savings of 10-20%")
elif monthly_income > 2000:
    print("\n💡 Try to save 10% of income monthly")
else:
    print("\n💡 Budget carefully - focus on necessities first")

print("\nConsult a financial advisor for personalized guidance.")
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **The code inside an `if` block must be indented.**
   - Answer: True

2. **You can have multiple statements inside an `if` block if they have the same indentation.**
   - Answer: True

3. **A condition like `if x:` only works if x is explicitly True or False.**
   - Answer: False (works with truthy/falsy values too)

4. **An `if` statement must have an `else` paired with it.**
   - Answer: False (`else` is optional)

---

### Conceptual Questions

5. **What is indentation and why does Python require it?**
   - Expected: Indentation shows which code belongs to the `if` block; Python uses it to determine scope

6. **Explain the difference between `if age == 18` and `if age >= 18`.**
   - Expected: `==` checks exact equality; `>=` checks "greater than or equal to"

7. **Why is it important to check for empty strings or None values before using them?**
   - Expected: Prevents errors; falsy values behave differently; prevents unexpected skip logic

---

### Coding Challenge

8. **Write a program that checks if a password is "strong" based on these criteria:**
   - At least 8 characters long
   - Contains at least one uppercase letter
   - Contains at least one number
   
   Display which criteria are met/not met:

   ```python
   password = input("Enter password: ")
   
   # Check each criterion
   if len(password) >= 8:
       print("✓ Long enough (8+ characters)")
   else:
       print("✗ Too short (need 8+ characters)")
   
   if any(c.isupper() for c in password):
       print("✓ Has uppercase letter")
   else:
       print("✗ Missing uppercase letter")
   
   if any(c.isdigit() for c in password):
       print("✓ Has number")
   else:
       print("✗ Missing number")
   
   # Overall result
   strong = (len(password) >= 8 and 
             any(c.isupper() for c in password) and 
             any(c.isdigit() for c in password))
   
   if strong:
       print("\n✓✓✓ Strong password!")
   else:
       print("\nPassword needs improvement")
   ```

---

## Key Takeaways

✅ **`if` statements control which code executes** - Based on conditions (True/False)  
✅ **Indentation is crucial** - Shows code blocks and scope  
✅ **Conditions can use any truthy/falsy value** - Not just explicit booleans  
✅ **Nested `if` statements for complex logic** - Multiple levels of conditions  
✅ **Always think about edge cases** - Empty strings, zero, None, etc.  

---

## Additional Resources

- [Python `if` Statements Documentation](https://docs.python.org/3/tutorial/controlflow.html#if-statements)
- [Understanding Indentation in Python](https://docs.python.org/3/reference/lexical_analysis.html#indentation)
- [PEP 8: Indentation Guidelines](https://www.python.org/dev/peps/pep-0008/#indentation)
- [Interactive `if` Examples](https://www.w3schools.com/python/python_conditions.asp)

---

## Next Lesson Preview

**Lesson 1.1.12**: `if-elif-else` Chains
- Handling multiple conditions
- Using `elif` for alternatives
- Using `else` for default case
- Avoiding common logic errors

---

## Homework

- [ ] Complete Exercises 1.1.11.1 - 1.1.11.9
- [ ] Build and test the Personal Finance Advisor project
- [ ] Modify advisor to add more age categories
- [ ] Challenge: Build a BMI calculator with `if` statements
- [ ] Quiz: Answer all assessment questions

**Expected time**: 2-3 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.12** when you're ready.




