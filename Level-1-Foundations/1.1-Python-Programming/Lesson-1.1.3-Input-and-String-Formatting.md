# Lesson 1.1.3: Input and String Formatting

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.1.1 - 1.1.2 | **Topic**: Variables, Types, Operators

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Take user input with `input()`
- Convert input strings to other data types
- Format strings using f-strings
- Use `.format()` method for string formatting
- Understand string escape sequences
- Build interactive programs

---

## 1. Getting User Input (90 min)

### 1.1 The `input()` Function

`input()` allows your program to pause and wait for user input.

```python
# Basic input
name = input("What is your name? ")
print(f"Hello, {name}!")

# Input always returns a string
age_string = input("How old are you? ")
print(type(age_string))  # <class 'str'> - even if user types "25"!
```

### 1.2 Common Input Pattern

```python
# Get input
response = input("Do you want to continue? (yes/no): ")

# Process it
if response.lower() == "yes":
    print("Continuing...")
else:
    print("Exiting...")
```

### 1.3 Input Always Returns String

**Critical**: `input()` ALWAYS returns a string, even if the user types a number.

```python
# User types: 25
age = input("Enter your age: ")
print(type(age))           # <class 'str'>
print(age + 5)             # ERROR: can't add int to str

# Must convert first
age = int(input("Enter your age: "))
print(type(age))           # <class 'int'>
print(age + 5)             # Works! 30
```

### 1.4 Multiple Inputs

```python
# Get multiple pieces of info
first_name = input("First name: ")
last_name = input("Last name: ")
age = int(input("Age: "))

print(f"{first_name} {last_name} is {age} years old")
```

---

## 2. String Formatting (90 min)

### 2.1 F-Strings (Recommended - Python 3.6+)

F-strings provide clean, readable string formatting.

```python
# Basic f-string
name = "Alice"
age = 30
print(f"I am {name} and I am {age} years old")
# Output: I am Alice and I am 30 years old

# Expressions inside f-strings
x = 10
y = 20
print(f"The sum is {x + y}")
# Output: The sum is 30

# Function calls in f-strings
def get_title():
    return "Engineer"

name = "Bob"
print(f"Bob is a {get_title()}")
# Output: Bob is a Engineer
```

### 2.2 F-String Formatting Options

```python
# Decimal places
pi = 3.14159
print(f"Pi: {pi:.2f}")        # Output: Pi: 3.14
print(f"Pi: {pi:.4f}")        # Output: Pi: 3.1416

# Width and alignment
name = "Alice"
print(f"|{name:10}|")         # Right-align, width 10
# Output: |     Alice|

print(f"|{name:<10}|")        # Left-align
# Output: |Alice     |

print(f"|{name:^10}|")        # Center-align
# Output: |  Alice   |

# Leading zeros
number = 42
print(f"ID: {number:05d}")    # Output: ID: 00042

# Thousands separator
big_number = 1000000
print(f"Number: {big_number:,}")  # Output: Number: 1,000,000

# Percentage
score = 0.857
print(f"Score: {score:.1%}")  # Output: Score: 85.7%
```

### 2.3 The `.format()` Method

Alternative to f-strings (works in older Python):

```python
# Positional arguments
print("Hello {}, you are {} years old".format("Alice", 30))
# Output: Hello Alice, you are 30 years old

# Named arguments
print("My name is {name} and I am {age}".format(name="Bob", age=25))
# Output: My name is Bob and I am 25

# Formatting with .format()
price = 19.99
print("Price: ${:.2f}".format(price))  # Output: Price: $19.99
```

### 2.4 String Concatenation (Don't do this for complex strings!)

```python
# ❌ Awkward
name = "Alice"
age = 30
message = "Hello, " + name + "! You are " + str(age) + " years old"

# ✅ Better with f-strings
message = f"Hello, {name}! You are {age} years old"
```

---

## 3. Escape Sequences (60 min)

Special characters in strings using backslash:

```python
# Newline
print("Line 1\nLine 2")
# Output:
# Line 1
# Line 2

# Tab (indentation)
print("Name\tAge\tCity")
print("Alice\t30\tNew York")
# Output:
# Name	Age	City
# Alice	30	New York

# Backslash literal
print("Path: C:\\Users\\Alice\\Documents")
# Output: Path: C:\Users\Alice\Documents

# Single quote inside string with single quotes
print('It\'s a beautiful day')
# Output: It's a beautiful day

# Double quote inside string with double quotes
print("She said \"Hello\"")
# Output: She said "Hello"
```

---

## 4. Practical Interactive Programs (90 min)

### 4.1 Simple Single-Item Program

```python
# Get item info
item_name = input("Item name: ")
price = float(input("Price: $"))
quantity = int(input("Quantity: "))

# Calculate
total = price * quantity

# Display formatted output
print(f"\n--- Receipt ---")
print(f"Item: {item_name}")
print(f"Price: ${price:.2f}")
print(f"Quantity: {quantity}")
print(f"Total: ${total:.2f}")
```

### 4.2 Multi-step Program

```python
print("=== BMI Calculator ===\n")

# Get input
name = input("Name: ")
height_cm = float(input("Height (cm): "))
weight_kg = float(input("Weight (kg): "))

# Convert height to meters
height_m = height_cm / 100

# Calculate BMI
bmi = weight_kg / (height_m ** 2)

# Interpret result
if bmi < 18.5:
    category = "Underweight"
elif bmi < 25:
    category = "Normal"
elif bmi < 30:
    category = "Overweight"
else:
    category = "Obese"

# Display
print(f"\n{name}'s BMI: {bmi:.1f}")
print(f"Category: {category}")
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.3.1**: Simple input and print
```python
# Get user's name and greet them
name = input("What is your name? ")
print(f"Hello, {name}!")
```

**Exercise 1.1.3.2**: Convert input to numbers
```python
# Get two numbers and add them
num1 = int(input("First number: "))
num2 = int(input("Second number: "))
print(f"Sum: {num1 + num2}")
```

**Exercise 1.1.3.3**: Simple f-string formatting
```python
# Format a price with 2 decimal places
price = 19.9
print(f"Price: ${price:.2f}")  # Output: Price: $19.90
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.3.4**: Rectangle area calculator
```python
# Get dimensions and calculate area
length = float(input("Length: "))
width = float(input("Width: "))
area = length * width
print(f"Area: {area:.2f} square units")
```

**Exercise 1.1.3.5**: Temperature converter
```python
# Convert Celsius to Fahrenheit
celsius = float(input("Temperature in Celsius: "))
fahrenheit = (celsius * 9/5) + 32
print(f"{celsius}°C = {fahrenheit:.1f}°F")
```

**Exercise 1.1.3.6**: Personal info display
```python
# Get info and display formatted
name = input("Name: ")
age = int(input("Age: "))
city = input("City: ")

print("\n--- Information ---")
print(f"Name: {name:20}")
print(f"Age:  {age:20}")
print(f"City: {city:20}")
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.3.7**: Shopping cart
```python
# Get items and format receipt
item1 = input("Item 1: $")
price1 = float(item1) if item1 else 0
qty1 = int(input("Quantity: ")) if item1 else 0

item2 = input("Item 2: $")
price2 = float(item2) if item2 else 0
qty2 = int(input("Quantity: ")) if item2 else 0

total = (price1 * qty1) + (price2 * qty2)

print(f"\nTotal: ${total:,.2f}")
```

**Exercise 1.1.3.8**: Multi-line formatted output
```python
name = input("Name: ")
job = input("Job: ")
salary = float(input("Salary: $"))

output = f"""
{'='*30}
{name.upper()}
{'='*30}
Job: {job}
Salary: ${salary:,.2f}
Annual (approx): ${salary*12:,.2f}
{'='*30}
"""
print(output)
```

**Exercise 1.1.3.9**: Grade input and feedback
```python
student_name = input("Student name: ")
score = float(input("Score (0-100): "))

if score >= 90:
    grade = "A"
elif score >= 80:
    grade = "B"
elif score >= 70:
    grade = "C"
else:
    grade = "F"

print(f"\n{student_name}'s Grade: {grade}")
print(f"Score: {score:.1f}%")
```

---

## Mini-Project: Personal Profile Creator

Create an interactive program that builds a formatted profile:

```python
# profile_creator.py

print("=== CREATE YOUR PROFILE ===\n")

# Get information
name = input("Full name: ")
age = int(input("Age: "))
email = input("Email: ")
phone = input("Phone: ")
city = input("City: ")
job = input("Job title: ")

# Create formatted output
profile = f"""
{'='*40}
                PROFILE
{'='*40}

Name:        {name:30}
Age:         {age:<30}
Email:       {email:30}
Phone:       {phone:30}
Location:    {city:30}
Job:         {job:30}

{'='*40}
"""

print(profile)

# Save to file
response = input("Save to file? (yes/no): ")
if response.lower() == "yes":
    filename = f"{name.replace(' ', '_')}_profile.txt"
    with open(filename, 'w') as f:
        f.write(profile)
    print(f"Saved to {filename}")
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **`input()` always returns a string, even if user enters numbers.**
   - Answer: True

2. **F-strings are the only way to format strings in Python.**
   - Answer: False (also `.format()`, string concatenation)

3. **`\n` creates a newline in a string.**
   - Answer: True

4. **`float("19.99")` returns a string.**
   - Answer: False (returns float 19.99)

---

### Conceptual Questions

5. **What's the difference between `input()` and `print()`?**
   - `input()`: Reads from user | `print()`: Writes to output

6. **How do you display money with two decimal places using f-strings?**
   - `f"${price:.2f}"`

7. **Why must you convert input to int/float before math operations?**
   - Because `input()` returns strings, and you can't do math with strings

---

### Coding Challenge

8. **Write a program that:**
   - Asks for name, age, and salary
   - Calculates monthly salary
   - Displays formatted output

   Solution:
   ```python
   name = input("Name: ")
   age = int(input("Age: "))
   annual = float(input("Annual salary: $"))
   monthly = annual / 12
   print(f"{name} makes ${monthly:,.2f}/month")
   ```

---

## Key Takeaways

✅ **`input()`** reads user input and returns a string  
✅ **F-strings** (`f"..."`) are the modern way to format strings  
✅ **Type conversion** required before math on input  
✅ **Formatting options**: decimals, width, alignment, thousands separator  
✅ **Escape sequences** (`\n`, `\t`, etc.) add special characters  

---

## Additional Resources

- [F-Strings PEP 498](https://www.python.org/dev/peps/pep-0498/)
- [String Methods](https://docs.python.org/3/library/stdtypes.html#string-methods)
- [Format Specification](https://docs.python.org/3/library/string.html#format-specification-mini-language)

---

## Next Lesson Preview

**Lesson 1.1.4**: Type Conversion & Casting
- Deep dive into type conversion functions
- Implicit vs explicit conversion
- Handling conversion errors

---

## Homework

1. **Complete Starter exercises** (1-3)
2. **Complete Intermediate exercises** (4-6, pick 2)
3. **Build the Mini-Project** (Profile Creator)
4. **Challenge**: Modify Profile Creator to calculate years to retirement (assuming retirement at 65)
5. **Quiz Prep**: Run through assessment above

**Expected time**: 2-3 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.4** when you're ready.




