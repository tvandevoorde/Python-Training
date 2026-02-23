# Lesson 1.1.4: Type Conversion & Casting

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.1.1 - 1.1.3 | **Topic**: Variables, Types, Operators

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Convert between int, float, str, and bool types
- Understand implicit vs explicit type conversion
- Handle conversion errors gracefully
- Know when conversions fail
- Use type conversion in real programs

---

## 1. Explicit Type Conversion (90 min)

### 1.1 String to Integer

```python
# Successful conversion
age_string = "25"
age = int(age_string)
print(age, type(age))  # 25 <class 'int'>

# Works with whitespace
age = int("  25  ")
print(age)  # 25 (whitespace ignored)

# Negative numbers
temperature = int("-10")
print(temperature)  # -10

# From float (truncates, not rounds)
value = int(3.99)
print(value)  # 3 (not 4!)

# Will FAIL - common errors
# int("25.5")      # ERROR: can't convert string "25.5" directly to int
# int("25 years")  # ERROR: non-numeric characters
# int("abc")       # ERROR: not a number at all
```

### 1.2 String to Float

```python
# Successful conversions
price = float("19.99")
print(price)  # 19.99

temperature = float("-5.5")
print(temperature)  # -5.5

# Integer strings also work
number = float("42")
print(number)  # 42.0

# Scientific notation
large = float("1.5e10")
print(large)  # 15000000000.0
```

### 1.3 Number to String

```python
# Integer to string
age = 30
age_string = str(age)
print(age_string, type(age_string))  # "30" <class 'str'>

# Float to string
price = 19.99
price_string = str(price)
print(price_string)  # "19.99"

# Concatenation now works
print("You are " + str(age) + " years old")
# Better: use f-strings instead!
print(f"You are {age} years old")
```

### 1.4 To Boolean

```python
# Non-zero numbers are True
print(bool(1))      # True
print(bool(-5))     # True
print(bool(3.14))   # True

# Zero is False
print(bool(0))      # False
print(bool(0.0))    # False

# Non-empty strings are True
print(bool("hello"))    # True
print(bool("0"))        # True (string "0" is non-empty!)

# Empty string is False
print(bool(""))         # False

# Convert from boolean
value = True
print(str(value))   # "True"
print(int(value))   # 1

value = False
print(str(value))   # "False"
print(int(value))   # 0
```

---

## 2. Common Conversion Patterns (90 min)

### 2.1 Input and Convert

```python
# Pattern: get input, convert to number, use in calculation
age = int(input("Enter your age: "))
birth_year = 2026 - age
print(f"You were born around {birth_year}")

# Pattern: multiply prices
quantity = int(input("How many? "))
price = float(input("Price each: $"))
total = quantity * price
print(f"Total: ${total:.2f}")

# Pattern: multiple conversions
hours = float(input("Hours worked: "))
rate = float(input("Hourly rate: $"))
pay = hours * rate
print(f"Payment: ${pay:.2f}")
```

### 2.2 Chaining Conversions

```python
# Get input as string → convert to int → use
user_input = input("Number: ")
number = int(user_input)
result = number * 2
print(result)

# Can do it in one line (not usually recommended for clarity)
result = int(input("Number: ")) * 2
print(result)
```

### 2.3 Converting Between Numeric Types

```python
# Integer to float
age = 25
age_float = float(age)
print(age_float)  # 25.0

# Float to integer (truncates)
price = 19.99
cents = int(price * 100)
print(cents)  # 1999 (multiply first to avoid truncation)

# Keep decimals
price = 19.99
rounded = round(price, 1)
print(rounded)  # 19.99

# Round to nearest integer
rounded = round(price)
print(rounded)  # 20
```

---

## 3. Handling Conversion Errors (90 min)

### 3.1 Common Errors

```python
# ❌ String with non-numeric characters
try:
    number = int("25abc")  # ERROR!
except ValueError:
    print("Could not convert - invalid format")

# ❌ Float string to int directly
try:
    number = int("3.5")    # ERROR!
except ValueError:
    print("Can't convert decimal directly")
    # Solution: int(float("3.5"))

# ❌ Empty string
try:
    number = int("")       # ERROR!
except ValueError:
    print("Empty string can't convert")
```

### 3.2 Safe Conversion with Try-Except

```python
# Safe version
user_input = input("Enter a number: ")
try:
    number = int(user_input)
    print(f"You entered: {number}")
except ValueError:
    print(f"Invalid input: '{user_input}' is not a number")

# More detailed error handling
user_input = input("Age: ")
try:
    age = int(user_input)
    if age < 0 or age > 150:
        print("Please enter a realistic age")
    else:
        print(f"You are {age} years old")
except ValueError:
    print("Age must be a number")
```

### 3.3 Conversion with Defaults

```python
# If conversion fails, use default
def safe_int(value, default=0):
    try:
        return int(value)
    except ValueError:
        return default

age = safe_int(input("Age: "))
print(f"Age: {age}")  # If invalid, will be 0

count = safe_int(input("Count: "), 1)
print(f"Count: {count}")  # If invalid, will be 1
```

---

## 4. Implicit Type Conversion (60 min)

Python sometimes converts automatically:

```python
# Integer + Float → Float
result = 5 + 2.5
print(result, type(result))  # 7.5 <class 'float'>

# Integer + Float in division
result = 10 / 4
print(result, type(result))  # 2.5 <class 'float'> (always float!)

# String multiplication repeats the string
greeting = "ha" * 3
print(greeting)  # "hahaha"

# BUT: String + Integer fails
# print("Age: " + 25)  # ERROR!
# Must convert explicitly
print("Age: " + str(25))  # Works!
```

---

## 5. Real-World Examples (60 min)

### 5.1 Currency Converter

```python
amount_usd = float(input("Amount in USD: $"))
exchange_rate = 0.92  # 1 USD = 0.92 EUR
amount_eur = amount_usd * exchange_rate
print(f"${amount_usd:.2f} USD = €{amount_eur:.2f} EUR")
```

### 5.2 Grade Calculator

```python
score_str = input("Score (0-100): ")
try:
    score = float(score_str)
    if score >= 90:
        grade = "A"
    elif score >= 80:
        grade = "B"
    else:
        grade = "C"
    print(f"Grade: {grade} ({score:.1f}%)")
except ValueError:
    print(f"Invalid score: {score_str}")
```

### 5.3 Loan Calculator

```python
principal = float(input("Loan amount: $"))
rate = float(input("Annual interest rate (%): "))
years = int(input("Years: "))

# Calculate total interest
monthly_rate = rate / 100 / 12
months = years * 12
# Simplified formula
total = principal * (1 + (rate / 100) * years)

print(f"\nLoan: ${principal:,.2f}")
print(f"Rate: {rate}% per year")
print(f"Term: {years} years")
print(f"Total to pay: ${total:,.2f}")
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.4.1**: String to number
```python
# Convert and calculate
num_str = "10"
num = int(num_str)
print(num + 5)  # 15
```

**Exercise 1.1.4.2**: Number to string for display
```python
# Convert for concatenation
age = 30
print("I am " + str(age) + " years old")
```

**Exercise 1.1.4.3**: Float from string
```python
price_str = "19.99"
price = float(price_str)
print(price * 2)  # 39.98
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.4.4**: Multiple conversions
```python
# Get inputs, convert, calculate
hours_str = input("Hours worked: ")
rate_str = input("Hourly rate: $")

hours = float(hours_str)
rate = float(rate_str)
total = hours * rate

print(f"Total pay: ${total:.2f}")
```

**Exercise 1.1.4.5**: Percentage calculation
```python
total = float(input("Total amount: $"))
percent = float(input("Percentage: "))

discount = total * (percent / 100)
final = total - discount

print(f"Discount: ${discount:.2f}")
print(f"Final: ${final:.2f}")
```

**Exercise 1.1.4.6**: Temperature conversion
```python
celsius_str = input("Temperature (C): ")
celsius = float(celsius_str)
fahrenheit = (celsius * 9/5) + 32
print(f"{celsius}°C = {fahrenheit:.1f}°F")
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.4.7**: Safe input conversion
```python
def get_positive_number(prompt):
    while True:
        try:
            value = float(input(prompt))
            if value > 0:
                return value
            else:
                print("Must be positive!")
        except ValueError:
            print("Invalid number!")

amount = get_positive_number("Amount: $")
print(f"You entered: ${amount:.2f}")
```

**Exercise 1.1.4.8**: Complete transaction
```python
item_price = float(input("Item price: $"))
quantity = int(input("Quantity: "))
tax_rate = float(input("Tax rate (%): "))

subtotal = item_price * quantity
tax = subtotal * (tax_rate / 100)
total = subtotal + tax

print(f"\nSubtotal: ${subtotal:.2f}")
print(f"Tax ({tax_rate}%): ${tax:.2f}")
print(f"Total: ${total:.2f}")
```

**Exercise 1.1.4.9**: Year grouping
```python
# Group ages into generations
birth_year = int(input("Birth year: "))
age = 2026 - birth_year

if age < 13:
    gen = "Child"
elif age < 20:
    gen = "Teen"
elif age < 65:
    gen = "Adult"
else:
    gen = "Senior"

print(f"Age {age}: {gen}")
```

---

## Mini-Project: Investment Calculator

Create a calculator that shows investment growth:

```python
# investment_calculator.py

print("=== INVESTMENT CALCULATOR ===\n")

# Get inputs
principal = float(input("Initial investment: $"))
annual_rate = float(input("Annual return (%): "))
years = int(input("Years to invest: "))

# Calculate
rate = annual_rate / 100
final = principal * ((1 + rate) ** years)
profit = final - principal
percentage_gain = (profit / principal) * 100

# Display
print("\n--- Results ---")
print(f"Initial: ${principal:,.2f}")
print(f"Rate: {annual_rate}% per year")
print(f"Period: {years} years")
print(f"Final Value: ${final:,.2f}")
print(f"Profit: ${profit:,.2f}")
print(f"Total Gain: {percentage_gain:.1f}%")
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **`int("3.5")` successfully converts to integer.**
   - Answer: False (ERROR! Use `int(float("3.5"))`)

2. **`5 + 2.5` implicitly converts to float.**
   - Answer: True

3. **`str(42)` returns the number 42.**
   - Answer: False (returns string "42")

4. **`bool(0)` is True.**
   - Answer: False (0 is falsy)

---

### Conceptual Questions

5. **What's the difference between `int("3")` and `int(3.0)`?**
   - First converts string to int; second converts float to int

6. **Why must you convert `input()` before math?**
   - Because `input()` returns a string, not a number

7. **What happens when you try `int("abc")`?**
   - Raises `ValueError` - can't convert

---

### Coding Challenge

8. **Write a program that asks for principal and interest rate, then shows final amount after 10 years:**

   Solution:
   ```python
   principal = float(input("Principal: $"))
   rate = float(input("Rate (%): "))
   final = principal * (1 + (rate/100) * 10)
   print(f"After 10 years: ${final:.2f}")
   ```

---

## Key Takeaways

✅ **Explicit conversion**: `int()`, `float()`, `str()`, `bool()`  
✅ **`input()` returns string**: Always convert before math  
✅ **Errors happen**: Use try-except for safe conversion  
✅ **Implicit conversion**: Python auto-converts in some situations  
✅ **Be careful**: `int("3.5")` fails, but `int(float("3.5"))` works  

---

## Additional Resources

- [Type Conversions](https://docs.python.org/3/library/functions.html#type)
- [ValueError Handling](https://docs.python.org/3/library/exceptions.html#ValueError)

---

## Next Lesson Preview

**Lesson 1.1.5**: String Manipulation Deep Dive
- String indexing and slicing
- String methods (upper, lower, split, etc.)
- String operations

---

## Homework

1. **Complete all Starter exercises**
2. **Complete 2 Intermediate exercises**
3. **Build the Mini-Project** (Investment Calculator)
4. **Challenge**: Modify calculator to also ask for monthly deposits
5. **Quiz Prep**: Review assessment

**Expected time**: 2-3 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.5** when you're ready.
