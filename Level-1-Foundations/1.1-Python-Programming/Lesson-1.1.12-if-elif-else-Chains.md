# Lesson 1.1.12: `if-elif-else` Chains

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.1.11 (The `if` Statement) | **Topic**: Multi-way Conditionals

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Use `elif` to check multiple conditions in sequence
- Implement `else` as a default case
- Build complex decision trees with multiple branches
- Understand the order of condition evaluation
- Apply chains to real-world scenarios

---

## 1. The Problem with Multiple `if` Statements (90 min)

### 1.1 Inefficient Multiple `if` Statements

```python
# ❌ PROBLEM: All conditions checked, even after match found
score = 85

if score >= 90:
    print("Grade: A")

if score >= 80 and score < 90:  # Must add upper bound!
    print("Grade: B")

if score >= 70 and score < 80:
    print("Grade: C")

if score >= 60 and score < 70:
    print("Grade: D")

if score < 60:
    print("Grade: F")

# This works, but:
# 1. Checks all conditions even after finding match
# 2. Need upper bounds on every condition
# 3. Gets hard to read with many conditions
```

### 1.2 Inefficiency Example

```python
# What actually happens:
score = 85

if score >= 90:  # Check: 85 >= 90? NO, skip
    print("Grade: A")

if score >= 80 and score < 90:  # Check: YES! Print and continue...
    print("Grade: B")  # ← Prints "Grade: B"

if score >= 70 and score < 80:  # Still checks this!
    print("Grade: C")  # Doesn't print, but still evaluated

if score >= 60 and score < 70:  # Still checks this!
    print("Grade: D")

if score < 60:  # Still checks this!
    print("Grade: F")

# All conditions are evaluated! Wasteful.
```

### 1.3 The `elif` Solution

`elif` (else if) stops checking as soon as one condition is True.

```python
# ✅ BETTER: Using elif - stops after first match
score = 85

if score >= 90:
    print("Grade: A")
elif score >= 80:  # Only checked if score < 90
    print("Grade: B")  # ← Prints this
elif score >= 70:  # Not checked (already matched above)
    print("Grade: C")
elif score >= 60:  # Not checked
    print("Grade: D")
else:  # Not checked
    print("Grade: F")

# Stops after first match! Much more efficient.
```

---

## 2. Understanding `elif` and `else` (90 min)

### 2.1 `elif` (else if) - Another Condition

```python
# Structure:
if condition1:
    # runs if condition1 is True
elif condition2:  # Only checked if condition1 is False
    # runs if condition2 is True and condition1 was False
elif condition3:  # Only checked if condition1 and condition2 were False
    # runs if condition3 is True
else:  # Runs if ALL conditions above are False
    # default case

# IMPORTANT: elif conditions are only checked if PREVIOUS were False!
```

### 2.2 Simple `elif` Chain

```python
time_of_day = int(input("Hour (0-23): "))

if time_of_day < 6:
    print("🌙 Night - sleep time")
elif time_of_day < 12:
    print("🌅 Morning - wake up!")
elif time_of_day < 17:
    print("☀️ Afternoon - work time")
elif time_of_day < 21:
    print("🌆 Evening - relax time")
else:
    print("🌙 Late night - wind down")

# Test:
# Input 3 → prints "🌙 Night - sleep time"
# Input 10 → prints "🌅 Morning - wake up!"
# Input 14 → prints "☀️ Afternoon - work time"
# Input 22 → prints "🌙 Late night - wind down"
```

### 2.3 Order Matters!

```python
# ❌ WRONG ORDER - Later conditions never reached
score = 85

if score >= 60:      # True! But too broad
    print("Passed")
elif score >= 80:    # Never reaches here (previous matched)
    print("Excellent")
elif score >= 90:    # Never reaches here
    print("Perfect")

# ✅ CORRECT ORDER - Most specific first
score = 85

if score >= 90:
    print("Perfect")
elif score >= 80:
    print("Excellent")  # ← Matches here
elif score >= 60:
    print("Passed")

# Always order from most specific → most general!
```

### 2.4 Multiple `elif` vs Nested `if`

```python
age = 25
has_license = True

# Using elif (mutually exclusive)
if age < 16:
    print("Cannot register vehicle")
elif age >= 16 and age < 18:
    print("May need parental consent")
elif age >= 18 and has_license:
    print("Can register independently")
elif age >= 18:
    print("Need license first")

# Using nested if (different logic)
if age >= 16:
    print("Old enough to drive")
    if has_license:
        print("You can drive!")
    else:
        print("Get a license first")
```

---

## 3. Real-World Decision Trees (90 min)

### 3.1 E-Commerce Shipping Decision

```python
print("=== Shipping Calculator ===")

order_total = float(input("Order total ($): "))
weight_lbs = float(input("Weight (lbs): "))
express_requested = input("Express shipping? (yes/no): ").lower() == "yes"

# Determine shipping method and cost
if order_total >= 100 and not express_requested:
    shipping_cost = 0
    method = "FREE standard shipping"
elif order_total >= 50 and not express_requested:
    shipping_cost = 5.99
    method = "Standard shipping ($5.99)"
elif express_requested:
    if weight_lbs > 20:
        shipping_cost = 25
        method = "Express Heavy ($25)"
    else:
        shipping_cost = 15
        method = "Express ($15)"
else:
    shipping_cost = 8.99
    method = "Standard shipping ($8.99)"

total = order_total + shipping_cost

print(f"\nOrder: ${order_total:.2f}")
print(f"Shipping ({method}): ${shipping_cost:.2f}")
print(f"Total: ${total:.2f}")
```

### 3.2 Quiz Grading with Feedback

```python
score = int(input("Quiz score: "))
total = 20  # Out of 20

percentage = (score / total) * 100

# Detailed feedback
if percentage >= 95:
    grade = "A+"
    feedback = "Outstanding work!"
elif percentage >= 90:
    grade = "A"
    feedback = "Excellent understanding"
elif percentage >= 80:
    grade = "B"
    feedback = "Good work, but review weak areas"
elif percentage >= 70:
    grade = "C"
    feedback = "Passing, but needs improvement"
elif percentage >= 60:
    grade = "D"
    feedback = "Barely passing - seek help"
else:
    grade = "F"
    feedback = "Review material and retake"

print(f"\nScore: {score}/{total} ({percentage:.1f}%)")
print(f"Grade: {grade}")
print(f"Feedback: {feedback}")
```

### 3.3 Login System with Attempts

```python
stored_password = "secret123"
max_attempts = 3

for attempt in range(1, max_attempts + 1):
    password = input(f"Attempt {attempt}/{max_attempts} - Password: ")
    
    if password == stored_password:
        print("✓ Login successful!")
        break  # Exit loop
    elif attempt < max_attempts:
        print(f"✗ Wrong password. {max_attempts - attempt} attempts left")
    else:
        print("✗ Account locked - too many attempts")
```

---

## 4. Understanding Condition Evaluation (60 min)

### 4.1 How Python Evaluates Chains

```python
# Step-by-step evaluation
age = 25

print("Checking age = 25...")

if age < 18:
    print("Teen")  # Not executed
    result = "Teen"
elif age < 25:  # age < 25? → 25 < 25? → False
    print("Young Adult")  # Not executed
    result = "Young Adult"
elif age < 35:  # age < 35? → 25 < 35? → True! ✓
    print("Adult")  # Executed
    result = "Adult"
elif age < 50:  # Not even checked!
    print("Middle-aged")
    result = "Middle-aged"
else:
    print("Senior")
    result = "Senior"

print(f"Result: {result}")  # "Adult"

# Once a condition is True, rest are skipped
```

### 4.2 Using Complex Conditions in `elif`

```python
# Can use and/or in conditions
score = 85
has_bonus = True

if score >= 95:
    print("Perfect")
elif score >= 90 and has_bonus:  # AND operator
    print("Excellent with bonus")
elif score >= 90 or has_bonus:   # OR operator  
    print("Very good or bonus earned")
elif score >= 80:
    print("Good")
else:
    print("Needs improvement")

# Test with score=85, has_bonus=True
# → Goes to "Very good or bonus earned"
```

### 4.3 Early Exit Pattern

```python
# Pattern: Check failures first, exit early
def validate_purchase(age, has_payment, quantity):
    if age < 18:
        print("✗ Must be 18 or older")
        return False
    elif not has_payment:
        print("✗ Payment method required")
        return False
    elif quantity <= 0:
        print("✗ Invalid quantity")
        return False
    else:
        print("✓ Purchase valid")
        return True

# This is cleaner than nested ifs!
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.12.1**: Simple Grade Calculation
```python
score = 75

if score >= 90:
    print("A")
elif score >= 80:
    print("B")
elif score >= 70:
    print("C")
else:
    print("F")

# What prints?
```

**Exercise 1.1.12.2**: Order Classification
```python
order_total = 55

if order_total >= 100:
    shipping = "Free"
elif order_total >= 50:
    shipping = "$5"
else:
    shipping = "$10"

print(f"Shipping: {shipping}")
# What prints?
```

**Exercise 1.1.12.3**: Simple Day Check
```python
day = "Monday"

if day == "Saturday" or day == "Sunday":
    print("Weekend!")
else:
    print("Weekday")

# What prints?
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.12.4**: Temperature Advisory
```python
temp = int(input("Temperature: "))

if temp < 32:
    advisory = "Freezing - stay inside"
elif temp < 50:
    advisory = "Cold - wear coat"
elif temp < 70:
    advisory = "Cool - light jacket"
elif temp < 90:
    advisory = "Warm - comfortable"
else:
    advisory = "Hot - seek shade"

print(advisory)
```

**Exercise 1.1.12.5**: Ticket Price Calculator
```python
age = int(input("Age: "))

if age < 3:
    price = 0
elif age < 12:
    price = 5
elif age < 18:
    price = 8
elif age < 65:
    price = 12
else:
    price = 8  # Senior discount

print(f"Ticket price: ${price}")
```

**Exercise 1.1.12.6**: BMI Category
```python
weight_lbs = float(input("Weight (lbs): "))
height_in = float(input("Height (inches): "))

height_m = height_in * 0.0254
weight_kg = weight_lbs * 0.4536

bmi = weight_kg / (height_m ** 2)

if bmi < 18.5:
    category = "Underweight"
elif bmi < 25:
    category = "Normal weight"
elif bmi < 30:
    category = "Overweight"
else:
    category = "Obese"

print(f"BMI: {bmi:.1f} - {category}")
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.12.7**: Complex Eligibility Check
```python
# Loan eligibility: credit > 650 AND income > 30k OR score > 700
credit_score = int(input("Credit score: "))
income = float(input("Annual income: "))

if credit_score > 700:
    print("✓ Eligible - excellent credit")
elif credit_score > 650 and income > 30000:
    print("✓ Eligible - good credit and income")
elif income > 50000:
    print("✓ Eligible - strong income")
else:
    print("✗ Not eligible")
```

**Exercise 1.1.12.8**: Nested elif Chains
```python
# Restaurant recommendation based on budget and cuisine preference
budget = float(input("Budget per person: $"))
cuisine = input("Cuisine preference (Mexican/Italian/Asian): ").lower()

if budget < 10:
    if cuisine == "mexican":
        print("Taco Bell")
    elif cuisine == "italian":
        print("Pizza Hut")
    else:
        print("Panda Express")
elif budget < 25:
    if cuisine == "mexican":
        print("Chipotle")
    elif cuisine == "italian":
        print("Olive Garden")
    else:
        print("Benihana")
else:
    print("Fine dining restaurant")
```

**Exercise 1.1.12.9**: Multi-Step Decision Logic
```python
# Medical triage: classify patient urgency
symptoms = input("Symptoms (chest pain/dizziness/cough/headache): ").lower()
fever = input("Fever? (yes/no): ").lower() == "yes"
conscious = input("Conscious? (yes/no): ").lower() == "yes"

if not conscious:
    urgency = "🔴 CRITICAL - Call 911"
elif symptoms == "chest pain":
    urgency = "🔴 EMERGENT - See doctor immediately"
elif symptoms == "dizziness" or fever:
    urgency = "🟡 URGENT - See doctor today"
elif symptoms in ["cough", "headache"]:
    if fever:
        urgency = "🟡 URGENT - See doctor today"
    else:
        urgency = "🟢 ROUTINE - Schedule appointment"
else:
    urgency = "🟢 ROUTINE - Monitor and check back if worse"

print(f"Triage: {urgency}")
```

---

## Mini-Project: Restaurant Menu Ordering System

Build a menu system that uses if/elif/else chains to process orders.

```python
print("="*40)
print("RESTAURANT ORDERING SYSTEM")
print("="*40)

# Menu with prices
menu = {
    "burger": 8.99,
    "pizza": 12.99,
    "salad": 6.99,
    "pasta": 10.99,
    "fries": 3.99,
    "drink": 2.99,
}

total = 0
items = []

while True:
    print("\nItems available:")
    for item, price in menu.items():
        print(f"  • {item}: ${price:.2f}")
    
    choice = input("\nWhat would you like? (or 'done'): ").lower()
    
    if choice == "done":
        break
    elif choice in menu:
        quantity = int(input("How many? "))
        price = menu[choice] * quantity
        total += price
        items.append(f"{quantity}x {choice} (${price:.2f})")
        print(f"✓ Added to cart")
    elif choice == "quit":
        print("Order cancelled")
        exit()
    else:
        print("✗ Invalid item")

# Process order
if items:
    print("\n" + "="*40)
    print("YOUR ORDER:")
    for item in items:
        print(f"  {item}")
    
    # Calculate tax and total
    tax_rate = 0.08
    tax = total * tax_rate
    final_total = total + tax
    
    print(f"\nSubtotal: ${total:.2f}")
    print(f"Tax (8%): ${tax:.2f}")
    print(f"TOTAL: ${final_total:.2f}")
    
    # Determine delivery fee
    if final_total >= 30:
        delivery = 0
        print("✓ FREE delivery (order $30+)")
    elif final_total >= 20:
        delivery = 2.00
        print("Delivery: $2.00")
    else:
        delivery = 3.50
        print("Delivery: $3.50")
    
    final_total += delivery
    
    print(f"\nFINAL TOTAL: ${final_total:.2f}")
    print("="*40)
    print("✓ Order placed! Estimated time: 30 mins")
else:
    print("No items ordered.")
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **Once an `elif` condition is True, remaining `elif` and `else` are skipped.**
   - Answer: True

2. **You can have as many `elif` blocks as you need.**
   - Answer: True

3. **`elif` must always be preceded by an `if`.**
   - Answer: True

4. **Order of conditions doesn't matter in `elif` chains.**
   - Answer: False (order matters - most specific first)

---

### Conceptual Questions

5. **Why is `elif` more efficient than multiple separate `if` statements?**
   - Expected: `elif` stops checking after first match; separate `if`s check all conditions

6. **What's the difference between these patterns?**
   ```python
   # What's different?
   if x > 10 and x < 20:
       ...
   elif x >= 20:
       ...
   
   # vs
   
   if x > 10:
       ...
   elif x >= 20:
       ...
   ```
   - Expected: Second pattern has cleaner conditions (no need for upper bound in first)

7. **When should you use nested `if` statements vs `elif` chains?**
   - Expected: `elif` for mutually exclusive options; nested `if` when conditions are independent

---

### Coding Challenge

8. **Create a grade assignment system that not only assigns grades but also gives feedback:**

   ```python
   score = float(input("Enter score (0-100): "))
   
   if score >= 95:
       grade = "A+"
       feedback = "Outstanding! Perfect or near-perfect work."
       encouragement = "Keep up the excellent work!"
   elif score >= 90:
       grade = "A"
       feedback = "Excellent understanding of material."
       encouragement = "You're doing great!"
   elif score >= 85:
       grade = "B+"
       feedback = "Very good work with minor issues."
       encouragement = "Nearly perfect - small refinements needed"
   elif score >= 80:
       grade = "B"
       feedback = "Good understanding with some gaps."
       encouragement = "Review weaker topics"
   elif score >= 75:
       grade = "C+"
       feedback = "Acceptable but needs improvement."
       encouragement = "Study more before next test"
   elif score >= 70:
       grade = "C"
       feedback = "Passing but gaps in understanding."
       encouragement = "Seek tutoring help"
   elif score >= 65:
       grade = "D"
       feedback = "Barely passing - major gaps identified."
       encouragement = "Work with instructor immediately"
   else:
       grade = "F"
       feedback = "Not passing - comprehensive review needed."
       encouragement = "Consider retaking with preparation"
   
   print(f"\nScore: {score:.1f}")
   print(f"Grade: {grade}")
   print(f"Feedback: {feedback}")
   print(f"Encouragement: {encouragement}")
   ```

---

## Key Takeaways

✅ **`elif` stops checking after first match** - More efficient than multiple `if` statements  
✅ **Order matters** - Put most specific conditions first  
✅ **`else` is optional** - Provides default case when other conditions fail  
✅ **Can combine with `and`/`or`** - Create complex decision logic  
✅ **Think of mutually exclusive options** - Use `elif` chains for them  

---

## Additional Resources

- [Python `if-elif-else` Documentation](https://docs.python.org/3/tutorial/controlflow.html#if-statements)
- [Decision Trees in Programming](https://en.wikipedia.org/wiki/Decision_tree)
- [Flowcharting for Conditionals](https://www.lucidchart.com/pages/flowchart-symbols-meaning-explained)

---

## Next Lesson Preview

**Lesson 1.1.13**: Comparison Operators & Complex Conditions
- Mastering all comparison operators
- Combining conditions effectively
- Common comparison mistakes

---

## Homework

- [ ] Complete Exercises 1.1.12.1 - 1.1.12.9
- [ ] Build and test the Restaurant Menu system
- [ ] Add 5 more menu items with different prices
- [ ] Challenge: Add discount codes (SAVE10 = 10% off)
- [ ] Quiz: Answer all assessment questions

**Expected time**: 2-3 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.13** when you're ready.




