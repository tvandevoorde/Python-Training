# Lesson 1.1.22: Defining Functions

**Estimated Time**: 8 hours | **Difficulty**: Beginner-Intermediate  
**Prerequisites**: Lesson 1.1.21 (Milestone Test 2) | **Topic**: Functions - Basics

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Understand the purpose of functions
- Define functions with `def` keyword
- Use parameters to pass data to functions
- Return values from functions
- Call functions with appropriate arguments
- Apply DRY (Don't Repeat Yourself) principle

---

## 1. Introduction to Functions (60 min)

### 1.1 Why Functions?

```python
# ❌ WITHOUT FUNCTIONS: Code repetition
print("="*30)
print("User 1 Report")
print("="*30)
print("Name: Alice")
print("Score: 95")
print()

print("="*30)
print("User 2 Report")
print("="*30)
print("Name: Bob")
print("Score: 87")
print()

print("="*30)
print("User 3 Report")
print("="*30)
print("Name: Charlie")
print("Score: 92")
print()

# ✅ WITH FUNCTIONS: Write once, use many times
def print_user_report(name, score):
    """Print formatted user report"""
    print("="*30)
    print(f"{name} Report")
    print("="*30)
    print(f"Name: {name}")
    print(f"Score: {score}")
    print()

# Use three times
print_user_report("Alice", 95)
print_user_report("Bob", 87)
print_user_report("Charlie", 92)
```

### 1.2 What is a Function?

A function is a **reusable block of code** that:
- Performs a specific task
- Can take inputs (parameters)
- Can return output (return value)
- Runs when called

```python
# Simple function structure
def function_name():
    """Docstring explaining what function does"""
    # Code block
    pass

# Function with one parameter
def greet(name):
    """Greet a person by name"""
    print(f"Hello, {name}!")

# Function with return value
def add(a, b):
    """Add two numbers"""
    return a + b

# Function with both parameters and return
def multiply_and_report(x, y):
    """Multiply and return result"""
    result = x * y
    print(f"{x} × {y} = {result}")
    return result
```

### 1.3 Function Benefits

```python
print("=== FUNCTION BENEFITS ===\n")

print("1. REUSABILITY - Write once, use many times")
def square(n):
    return n ** 2

print(f"Square of 5: {square(5)}")
print(f"Square of 10: {square(10)}")
print(f"Square of -3: {square(-3)}")

print("\n2. READABILITY - Clear intent from function names")
def calculate_area_of_circle(radius):
    return 3.14159 * (radius ** 2)

print(f"Area: {calculate_area_of_circle(5):.2f}")

print("\n3. TESTING - Can test function independently")
def is_even(n):
    return n % 2 == 0

# Easy to test
assert is_even(4) == True
assert is_even(5) == False
print("✓ All tests pass")

print("\n4. MAINTAINABILITY - Change once, affects everywhere")
def convert_celsius_to_fahrenheit(celsius):
    """Convert Celsius to Fahrenheit"""
    return (celsius * 9/5) + 32

print(f"0°C = {convert_celsius_to_fahrenheit(0):.1f}°F")
print(f"100°C = {convert_celsius_to_fahrenheit(100):.1f}°F")
```

---

## 2. Defining Simple Functions (90 min)

### 2.1 Function Definition Syntax

```python
# Basic structure:
# def function_name():
#     """Optional docstring"""
#     code block
#     return optional_value

# Example 1: Function with no parameters, no return
def say_hello():
    """Simple greeting"""
    print("Hello, World!")

say_hello()  # Call the function

# Example 2: Function with parameter, no return
def say_name(name):
    """Greet someone by name"""
    print(f"Hello, {name}!")

say_name("Alice")
say_name("Bob")

# Example 3: Function with parameter and return
def add_one(number):
    """Add 1 to a number"""
    return number + 1

result = add_one(5)
print(f"add_one(5) = {result}")

# Example 4: Function with multiple parameters
def add(a, b):
    """Add two numbers"""
    return a + b

print(f"add(3, 7) = {add(3, 7)}")
```

### 2.2 Parameters and Arguments

```python
# PARAMETER: Name in function definition
# ARGUMENT: Value passed when calling

def greet(name, greeting="Hello"):
    """Greet with custom message"""
    print(f"{greeting}, {name}!")

# Parameters: name, greeting
# Arguments: "Alice", "Hi"
greet("Alice", "Hi")

# Can call with default greeting
greet("Bob")  # Uses default "Hello"

# Multiple parameters
def describe_person(name, age, city):
    """Describe a person"""
    print(f"{name} is {age} years old and lives in {city}")

describe_person("Alice", 25, "NYC")
describe_person("Bob", 30, "LA")
```

### 2.3 Return Values

```python
# Return sends value back to caller

# Example 1: Return simple value
def get_pi():
    """Return value of pi"""
    return 3.14159

pi = get_pi()
print(f"Pi is approximately {pi}")

# Example 2: Return calculation
def calculate_area(radius):
    """Calculate circle area"""
    pi = 3.14159
    area = pi * (radius ** 2)
    return area

area = calculate_area(5)
print(f"Area of circle with radius 5: {area:.2f}")

# Example 3: Return True/False
def is_adult(age):
    """Check if age qualifies as adult"""
    if age >= 18:
        return True
    else:
        return False

print(f"Is 25 an adult? {is_adult(25)}")
print(f"Is 15 an adult? {is_adult(15)}")

# Example 4: Return multiple values (as tuple)
def min_max(a, b):
    """Return both minimum and maximum"""
    return min(a, b), max(a, b)

minimum, maximum = min_max(10, 5)
print(f"Min: {minimum}, Max: {maximum}")

# Example 5: Early return
def validate_age(age):
    """Return error message or None if valid"""
    if age < 0:
        return "Age cannot be negative"
    if age > 150:
        return "Age seems unrealistic"
    return None  # No error

print(validate_age(-5))  # Error message
print(validate_age(25))  # None (valid)
```

---

## 3. Function Flow (90 min)

### 3.1 Execution Flow

```python
print("=== FUNCTION EXECUTION FLOW ===\n")

def demonstrate_flow():
    """Show how execution flows"""
    print("1. Inside function, line 1")
    print("2. Inside function, line 2")
    return "Done"
    print("3. This never executes - after return")

print("Start")
result = demonstrate_flow()
print(f"Function returned: {result}")
print("End")

# Output:
# Start
# 1. Inside function, line 1
# 2. Inside function, line 2
# Function returned: Done
# End
# (Note: "3. This never..." doesn't print because return exits)
```

### 3.2 Function Call Stack

```python
print("\n=== FUNCTION CALL NESTING ===\n")

def calculate_total_price(quantity, unit_price, tax_rate=0.1):
    """Calculate total with tax"""
    
    def calculate_subtotal(qty, price):
        """Helper: calculate before tax"""
        return qty * price
    
    subtotal = calculate_subtotal(quantity, unit_price)
    tax = subtotal * tax_rate
    total = subtotal + tax
    
    print(f"Subtotal: ${subtotal:.2f}")
    print(f"Tax: ${tax:.2f}")
    
    return total

result = calculate_total_price(5, 10.00)
print(f"Total: ${result:.2f}")

# Output:
# Subtotal: $50.00
# Tax: $5.00
# Total: $55.00
```

### 3.3 Return and Continue

```python
print("\n=== EARLY RETURN ===\n")

def check_password(password):
    """Validate password"""
    
    if len(password) < 5:
        print("✗ Too short")
        return False  # Exit early
    
    if not any(c.isdigit() for c in password):
        print("✗ No numbers")
        return False  # Exit early
    
    print("✓ Valid password")
    return True  # Successful validation

check_password("abc")      # Too short
check_password("pass")     # Too short
check_password("password") # No numbers
check_password("pass123")  # Valid
```

---

## 4. Documentation and Best Practices (60 min)

### 4.1 Docstrings

```python
# BAD: No documentation
def calc(x, y):
    return x + y

# GOOD: Clear docstring
def add(a, b):
    """Add two numbers and return result"""
    return a + b

# BETTER: Detailed docstring
def add(a, b):
    """
    Add two numbers together.
    
    Parameters:
        a: First number
        b: Second number
    
    Returns:
        Sum of a and b
    """
    return a + b

# BEST: Full documentation with examples
def calculate_compound_interest(principal, rate, time):
    """
    Calculate compound interest.
    
    Formula: A = P(1 + r/100)^t
    
    Parameters:
        principal (float): Initial amount
        rate (float): Annual interest rate (%)
        time (int): Time in years
    
    Returns:
        float: Final amount after interest
    
    Example:
        >>> calculate_compound_interest(1000, 5, 2)
        1102.5
    """
    amount = principal * ((1 + rate/100) ** time)
    return amount

result = calculate_compound_interest(1000, 5, 2)
print(f"${result:.2f}")
```

### 4.2 Naming Conventions

```python
# ✅ GOOD: Descriptive, verb-based names
def calculate_average(numbers):
    return sum(numbers) / len(numbers)

def is_valid_email(email):
    return "@" in email

def get_user_input():
    return input("Enter something: ")

def process_data(data):
    # Do processing
    return processed_data

# ❌ BAD: Unclear, single-letter (except for loops)
def f(x):  # What does this do?
    return x * 2

def calc():  # What's being calculated?
    return 42

def data():  # What data?
    return [1, 2, 3]
```

### 4.3 Function Design Principles

```python
print("=== FUNCTION DESIGN PRINCIPLES ===\n")

# 1. DRY: Don't Repeat Yourself
print("1. DRY Principle")

# ❌ Repetitive
def print_score_1(name, score):
    print(f"{name}: {score}")
    if score >= 90:
        print("Grade: A")
    elif score >= 80:
        print("Grade: B")

def print_score_2(name, score):
    print(f"{name}: {score}")
    if score >= 90:
        print("Grade: A")
    elif score >= 80:
        print("Grade: B")

# ✅ Reusable
def get_grade(score):
    """Get grade letter for score"""
    if score >= 90:
        return "A"
    elif score >= 80:
        return "B"
    return "C"

def print_score(name, score):
    """Print name and grade"""
    grade = get_grade(score)
    print(f"{name}: {score} ({grade})")

print_score("Alice", 95)
print_score("Bob", 85)

# 2. Single Responsibility
print("\n2. Single Responsibility")

# ❌ Does too much
def process_and_save_user(data):
    # Validate
    if not data:
        return False
    # Process
    processed = data.upper()
    # Save (simulated)
    file.write(processed)
    return True

# ✅ Each function does one thing
def validate_data(data):
    """Check if data is valid"""
    return data and len(data) > 0

def process_data(data):
    """Process/transform data"""
    return data.upper()

def save_data(processed_data):
    """Save data to file"""
    # Save logic here
    pass

# 3. Keep it simple
print("\n3. Keep Functions Simple")

# ✅ Simple, clear function
def is_leap_year(year):
    """Check if year is leap year"""
    return year % 4 == 0 and (year % 100 != 0 or year % 400 == 0)

print(f"1900 leap year? {is_leap_year(1900)}")
print(f"2000 leap year? {is_leap_year(2000)}")
```

---

## 5. Practical Examples (60 min)

### 5.1 Math Functions

```python
def celsius_to_fahrenheit(celsius):
    """Convert Celsius to Fahrenheit"""
    return (celsius * 9/5) + 32

def fahrenheit_to_celsius(fahrenheit):
    """Convert Fahrenheit to Celsius"""
    return (fahrenheit - 32) * 5/9

def distance_between_points(x1, y1, x2, y2):
    """Calculate distance between two points"""
    import math
    return math.sqrt((x2 - x1)**2 + (y2 - y1)**2)

print(f"0°C = {celsius_to_fahrenheit(0):.1f}°F")
print(f"Distance: {distance_between_points(0, 0, 3, 4):.2f}")
```

### 5.2 String Functions

```python
def reverse_string(text):
    """Reverse a string"""
    return text[::-1]

def count_vowels(text):
    """Count vowels in text"""
    vowels = "aeiouAEIOU"
    return sum(1 for char in text if char in vowels)

def title_case_custom(text):
    """Convert to title case manually"""
    return " ".join(word.capitalize() for word in text.split())

print(f"Reversed: {reverse_string('hello')}")
print(f"Vowels in 'hello': {count_vowels('hello')}")
print(f"Title: {title_case_custom('hello world')}")
```

### 5.3 Validation Functions

```python
def is_valid_email(email):
    """Check if email looks valid"""
    return "@" in email and "." in email.split("@")[1]

def is_strong_password(password):
    """Check if password is strong"""
    has_upper = any(c.isupper() for c in password)
    has_lower = any(c.islower() for c in password)
    has_digit = any(c.isdigit() for c in password)
    long_enough = len(password) >= 8
    
    return has_upper and has_lower and has_digit and long_enough

def validate_age(age):
    """Validate age input"""
    try:
        age_int = int(age)
        return 0 <= age_int <= 150
    except ValueError:
        return False

print(f"Valid email? {is_valid_email('user@email.com')}")
print(f"Strong password? {is_strong_password('Pass123')}")
print(f"Valid age? {validate_age('25')}")
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.22.1**: Simple Function
```python
def double(x):
    ???

# Should return x * 2
result = double(5)
print(result)  # Should print 10
```

**Exercise 1.1.22.2**: Function with Parameters
```python
def greet(name):
    ???

greet("Alice")  # Should print: Hello, Alice!
```

**Exercise 1.1.22.3**: Return Value
```python
def get_name():
    ???

name = get_name()
print(f"Hello, {name}")
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.22.4**: Multiple Parameters
```python
def multiply(a, b):
    """Return product of a and b"""
    ???

print(multiply(3, 4))  # Should be 12
```

**Exercise 1.1.22.5**: Conditional Return
```python
def is_positive(number):
    """Return True if number is positive"""
    ???

print(is_positive(5))   # True
print(is_positive(-3))  # False
```

**Exercise 1.1.22.6**: String Function
```python
def create_message(name, age):
    """Return formatted message about person"""
    ???

msg = create_message("Alice", 25)
print(msg)  # Alice is 25 years old.
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.22.7**: Multiple Returns
```python
def get_min_max(numbers):
    """Return both min and max of list"""
    ???

min_val, max_val = get_min_max([1, 5, 3])
print(f"Min: {min_val}, Max: {max_val}")  # Min: 1, Max: 5
```

**Exercise 1.1.22.8**: Conditional Logic
```python
def calculate_discount(price, is_member):
    """
    Calculate final price with discount.
    Members get 10% discount.
    """
    ???

print(calculate_discount(100, True))   # 90
print(calculate_discount(100, False))  # 100
```

**Exercise 1.1.22.9**: Complex Function
```python
def summarize_list(numbers):
    """
    Return string with sum, average, count.
    Return "Empty list" if list is empty.
    """
    ???

result = summarize_list([1, 2, 3, 4, 5])
# Should return something like: "Sum: 15, Avg: 3.0, Count: 5"
```

---

## Mini-Project: Calculator Functions

Build a simple calculator with separate functions.

```python
def add(a, b):
    """Add two numbers"""
    return a + b

def subtract(a, b):
    """Subtract b from a"""
    return a - b

def multiply(a, b):
    """Multiply two numbers"""
    return a * b

def divide(a, b):
    """Divide a by b"""
    if b == 0:
        return "Error: Division by zero"
    return a / b

def percentage(value, percent):
    """Calculate percent of value"""
    return value * (percent / 100)

def main():
    """Main calculator program"""
    print("="*40)
    print("CALCULATOR")
    print("="*40)
    
    # Test operations
    num1 = 10
    num2 = 3
    
    print(f"\nNumber 1: {num1}")
    print(f"Number 2: {num2}\n")
    
    print(f"Add:      {add(num1, num2)}")
    print(f"Subtract: {subtract(num1, num2)}")
    print(f"Multiply: {multiply(num1, num2)}")
    print(f"Divide:   {divide(num1, num2):.2f}")
    print(f"10% of 50: {percentage(50, 10)}")

if __name__ == "__main__":
    main()
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **A function must have a return statement.**
   - Answer: False (optional)

2. **Parameters are defined in the function definition.**
   - Answer: True

3. **You can return multiple values as a tuple.**
   - Answer: True

4. **A function can only be called once.**
   - Answer: False (can call many times)

---

### Conceptual Questions

5. **What's the difference between a parameter and an argument?**
   - Expected: Parameter is in definition, argument is value passed

6. **Why is DRY (Don't Repeat Yourself) important?**
   - Expected: Easier to maintain, less bugs, cleaner code

7. **What does `return` do?**
   - Expected: Sends value back to caller and exits function

---

### Coding Challenge

8. **Create function that validates username:**
   - Length 3-20 characters
   - Only letters and numbers
   - Returns True/False

   ```python
   def is_valid_username(username):
       """Validate username"""
       if not (3 <= len(username) <= 20):
           return False
       return all(c.isalnum() for c in username)
   ```

---

## Key Takeaways

✅ **Functions reuse code and improve readability** - Write once, use everywhere  
✅ **Parameters let functions accept different inputs** - Make functions flexible  
✅ **Return values send results back to caller** - Functions produce output  
✅ **Good naming clarifies intent** - Use descriptive verb-based names  
✅ **Docstrings document what functions do** - Always explain your code

---

## Additional Resources

- [Python Function Documentation](https://docs.python.org/3/tutorial/controlflow.html#defining-functions)
- [PEP 257 - Docstring Conventions](https://www.python.org/dev/peps/pep-0257/)
- [Function Best Practices](https://realpython.com/defining-your-own-python-function/)

---

## Next Lesson Preview

**Lesson 1.1.23**: Function Parameters & Arguments
- Positional vs keyword arguments
- Default parameters
- `*args` and `**kwargs` introduction
- Proper argument handling

---

## Homework

- [ ] Complete Exercises 1.1.22.1 - 1.1.22.9
- [ ] Build and test Calculator Functions
- [ ] Create 3 custom functions for any task
- [ ] Challenge: Combine functions for advanced calculation
- [ ] Quiz: Answer all assessment questions

**Expected time**: 3-4 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.23** when you're ready.
