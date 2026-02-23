# Lesson 1.1.6: Special Numbers & Math

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.1.5 (String Manipulation) | **Topic**: Numbers & Math Operations

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Understand and work with special floating-point values (infinity, NaN, scientific notation)
- Use the `math` module for advanced mathematical operations
- Understand floating-point precision and limitations
- Apply mathematical functions to real-world problems

---

## 1. Floating-Point Precision & Limitations (90 min)

### 1.1 Understanding Floating-Point Representation

Computers represent floating-point numbers using binary, which can lead to precision issues.

```python
# Precision problem example
x = 0.1 + 0.2
print(x)  # Output: 0.30000000000000004 (not 0.3!)

# This happens because 0.1 and 0.2 cannot be represented exactly in binary
print(0.1)  # Output: 0.1
print(repr(0.1))  # Output: 0.1000000000000000055511151231...

# Comparing floats directly can be problematic
a = 0.1 + 0.2
b = 0.3
print(a == b)  # Output: False (even though mathematically they should be equal)
```

**Why this matters**: In money, measurements, and ML calculations, precision errors compound!

### 1.2 Handling Floating-Point Comparisons

```python
# ❌ WRONG: Direct comparison
if total_price == expected_price:
    print("Prices match")

# ✅ CORRECT: Use tolerance (epsilon comparison)
epsilon = 0.0001
if abs(total_price - expected_price) < epsilon:
    print("Prices match (within tolerance)")

# ✅ BETTER: Use round() for money
price1 = 19.99 + 20.01
price2 = 40.00
print(round(price1, 2) == round(price2, 2))  # Output: True

# ✅ BEST for money: Use Decimal module (specialized for finance)
from decimal import Decimal
price1 = Decimal('19.99') + Decimal('20.01')
price2 = Decimal('40.00')
print(price1 == price2)  # Output: True (exact!)
```

### 1.3 Scientific Notation & Large Numbers

```python
# Scientific notation is useful for very large/small numbers
distance_to_moon = 3.844e8  # 384,400,000 meters
electron_mass = 9.109e-31  # 0.0000000000000000000000000000009109 kg

print(distance_to_moon)  # Output: 384400000.0
print(f"{electron_mass:.2e}")  # Output: 9.11e-31

# Converting
large_num = 1e10
print(large_num)  # Output: 10000000000.0

# Back to scientific notation
print(f"{1000000000:.2e}")  # Output: 1.00e+09
```

---

## 2. Special Floating-Point Values (90 min)

### 2.1 Infinity and Negative Infinity

```python
# Create infinity
positive_infinity = float('inf')
negative_infinity = float('-inf')

print(positive_infinity)  # Output: inf
print(negative_infinity)  # Output: -inf

# Operations with infinity
print(1 + float('inf'))  # Output: inf
print(float('inf') - 1)  # Output: inf
print(float('inf') * 2)  # Output: inf
print(float('inf') / float('inf'))  # Output: nan (not a number!)

# Checking for infinity
import math
print(math.isinf(float('inf')))  # Output: True
print(math.isinf(100))  # Output: False

# Real-world use: initialization for "find minimum" problems
minimum_price = float('inf')  # Start with infinity
for price in prices:
    if price < minimum_price:
        minimum_price = price
print(f"Cheapest: ${minimum_price}")
```

### 2.2 NaN (Not a Number)

```python
# Create NaN
nan_value = float('nan')
print(nan_value)  # Output: nan

# Operations that produce NaN
print(0 / 0)  # ❌ ERROR: ZeroDivisionError
print(float('inf') - float('inf'))  # Output: nan (indeterminate)
print(float('inf') / float('inf'))  # Output: nan

# ⚠️ GOTCHA: NaN != NaN
print(float('nan') == float('nan'))  # Output: False (!!)

# Correct way to check for NaN
import math
print(math.isnan(float('nan')))  # Output: True
print(math.isnan(255))  # Output: False

# Real-world use: handling missing or invalid data
data = [10, 20, float('nan'), 30]
for value in data:
    if math.isnan(value):
        print(f"Invalid data: {value}")
    else:
        print(f"Valid: {value}")
```

### 2.3 Checking Number Types with `math` Module

```python
import math

# Check if number is finite (not inf or nan)
print(math.isfinite(3.14))  # Output: True
print(math.isfinite(float('inf')))  # Output: False
print(math.isfinite(float('nan')))  # Output: False

# Practical use
def safe_average(numbers):
    """Calculate average only if all numbers are valid"""
    # Filter out any nan or inf values
    valid_numbers = [n for n in numbers if math.isfinite(n)]
    
    if not valid_numbers:
        return float('nan')  # Return nan if no valid data
    
    return sum(valid_numbers) / len(valid_numbers)

data = [10, 20, 30, float('nan'), 40]
print(safe_average(data))  # Output: 25.0 (nan excluded)
```

---

## 3. The `math` Module (60 min)

### 3.1 Common Math Functions

```python
import math

# Constants
print(math.pi)  # Output: 3.141592653589793
print(math.e)   # Output: 2.718281828459045

# Rounding functions
print(math.floor(3.7))  # Output: 3 (round down)
print(math.ceil(3.2))   # Output: 4 (round up)
print(math.trunc(3.7))  # Output: 3 (truncate decimal)

# Absolute value
print(math.fabs(-15))  # Output: 15.0

# Powers and roots
print(math.pow(2, 3))   # Output: 8.0 (2³)
print(math.sqrt(16))    # Output: 4.0
print(math.exp(1))      # Output: 2.718... (e¹)

# Logarithms
print(math.log(10))     # Output: 2.302... (natural log)
print(math.log10(1000)) # Output: 3.0
print(math.log(8, 2))   # Output: 3.0 (log base 2)

# Trigonometry (angles in radians!)
angle_radians = math.pi / 4  # 45 degrees
print(math.sin(angle_radians))  # Output: 0.707...
print(math.cos(angle_radians))  # Output: 0.707...
print(math.tan(angle_radians))  # Output: 1.0
```

### 3.2 Converting Between Degrees and Radians

```python
import math

# Convert degrees to radians
degrees = 45
radians = math.radians(degrees)
print(f"{degrees}° = {radians} radians")
# Output: 45° = 0.7853981633974483 radians

# Convert radians back to degrees
radians = math.pi / 3  # 60 degrees
degrees = math.degrees(radians)
print(f"{radians} radians = {degrees}°")
# Output: 1.0471975511965976 radians = 60.0°

# Practical example: calculating distance
def distance(angle_degrees):
    """Calculate projectile distance (simplified physics)"""
    angle_rad = math.radians(angle_degrees)
    initial_velocity = 50  # m/s
    gravity = 9.81  # m/s²
    
    distance = (initial_velocity ** 2 * math.sin(2 * angle_rad)) / gravity
    return distance

print(f"Distance at 45°: {distance(45):.2f} meters")
# Output: Distance at 45°: 255.00 meters
```

### 3.3 Factorial and Combinatorics

```python
import math

# Factorial: n! = n × (n-1) × (n-2) × ... × 1
print(math.factorial(5))  # Output: 120 (5! = 5×4×3×2×1)

# Combinations: C(n,k) = n! / (k! × (n-k)!)
def combinations(n, k):
    """Calculate number of ways to choose k items from n"""
    return math.factorial(n) // (math.factorial(k) * math.factorial(n - k))

print(combinations(10, 3))  # Output: 120 (ways to choose 3 from 10)

# Practical: lottery probability
def lottery_odds(total_numbers, pick_numbers, winning_numbers):
    """Calculate lottery odds"""
    ways_to_win = combinations(winning_numbers, pick_numbers)
    total_ways = combinations(total_numbers, pick_numbers)
    probability = ways_to_win / total_ways
    return probability

odds = lottery_odds(49, 6, 6)
print(f"Lottery odds: 1 in {1/odds:.0f}")
# Output: Lottery odds: 1 in 13983816
```

---

## 4. Real-World Math Applications (60 min)

### 4.1 Financial Calculations

```python
import math

# Compound interest formula: A = P(1 + r/n)^(nt)
def compound_interest(principal, annual_rate, compounds_per_year, years):
    """Calculate compound interest"""
    rate = annual_rate / 100
    amount = principal * math.pow(1 + rate / compounds_per_year, 
                                   compounds_per_year * years)
    return amount

# $1000 at 5% interest, compounded quarterly for 10 years
final = compound_interest(1000, 5, 4, 10)
print(f"Final amount: ${final:.2f}")
# Output: Final amount: $1643.62

# Compare different compounding frequencies
principal = 1000
rate = 5
years = 10

for frequency, label in [(1, "Annually"), (2, "Semi-annually"), 
                          (4, "Quarterly"), (12, "Monthly"), 
                          (365, "Daily")]:
    amount = compound_interest(principal, rate, frequency, years)
    print(f"{label:15} ${amount:.2f}")
```

### 4.2 Statistics Concepts

```python
import math

def mean(numbers):
    """Calculate average"""
    return sum(numbers) / len(numbers)

def variance(numbers):
    """Measure of spread - average squared difference from mean"""
    avg = mean(numbers)
    squared_diffs = [(x - avg) ** 2 for x in numbers]
    return sum(squared_diffs) / len(numbers)

def standard_deviation(numbers):
    """Square root of variance - typical difference from mean"""
    return math.sqrt(variance(numbers))

# Sample data
test_scores = [85, 90, 78, 92, 88, 76, 95, 89, 83, 91]

print(f"Mean: {mean(test_scores):.2f}")
print(f"Variance: {variance(test_scores):.2f}")
print(f"Std Dev: {standard_deviation(test_scores):.2f}")

# Output:
# Mean: 86.70
# Variance: 36.21
# Std Dev: 6.02
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.6.1**: Floating-Point Rounding
```python
# Fix this code to correctly compare floating-point numbers
price1 = 19.99 + 20.01
price2 = 40.00

# Your goal: Make this print True
if price1 == price2:
    print("Prices match")
else:
    print("Prices don't match")

# Hint: Use epsilon comparison or round()
```

**Exercise 1.1.6.2**: Using the math module
```python
import math

# Calculate the circumference of a circle with radius 5
radius = 5
circumference = ???  # Use math.pi

print(f"Circumference: {circumference:.2f}")
# Expected output: Circumference: 31.42
```

**Exercise 1.1.6.3**: Converting Angles
```python
import math

# Convert 30 degrees to radians, then calculate sin of that angle
degrees = 30
radians = ???
sine_value = ???

print(f"sin({degrees}°) = {sine_value:.4f}")
# Expected output: sin(30°) = 0.5000
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.6.4**: Temperature Conversion Accuracy
```python
# Celsius to Fahrenheit: F = (C × 9/5) + 32
# Create a program that avoids floating-point errors

celsius_temp = 100
fahrenheit_temp = (celsius_temp * 9/5) + 32

# Check if result equals 212.0 (exact value)
# If not, show the floating-point error

# Your task: Print whether it's exact or has precision error
# Hint: Use epsilon comparison
```

**Exercise 1.1.6.5**: Pythagorean Theorem
```python
import math

# For a right triangle: c² = a² + b²
# Calculate the hypotenuse given two sides

side_a = 3
side_b = 4

hypotenuse = ???  # Use math.sqrt()

print(f"Hypotenuse: {hypotenuse}")
# Expected output: Hypotenuse: 5.0
```

**Exercise 1.1.6.6**: Calculating Logarithms
```python
import math

# Use math.log() to solve: 2^x = 32
# What is x?

base = 2
result = 32
x = math.log(???, ???)  # Fill in arguments

print(f"2^{x} = {result}")
# Expected output: 2^5.0 = 32
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.6.7**: Investment Growth Calculator
```python
import math

# Calculate how long it takes for investment to reach target
# Formula: t = ln(A/P) / ln(1 + r)
# Where: P=principal, A=target, r=annual rate

def years_to_target(principal, target_amount, annual_rate):
    """Calculate years needed to reach target with compound interest"""
    rate = annual_rate / 100
    
    # Your code here
    # Use math.log() to calculate years
    # Return the result rounded to 2 decimal places
    pass

# Test: How long to turn $5000 into $10000 at 5% annual interest?
result = years_to_target(5000, 10000, 5)
print(f"Years needed: {result}")
# Expected output: Years needed: 14.21
```

**Exercise 1.1.6.8**: Standard Deviation Analysis
```python
import math

def standard_deviation(numbers):
    """Calculate standard deviation"""
    # Hint: You learned this in the lesson
    pass

# Test with three datasets
dataset1 = [85, 85, 85, 85, 85]  # No variation
dataset2 = [80, 85, 90]           # Some variation
dataset3 = [50, 85, 95]           # Large variation

for i, data in enumerate([dataset1, dataset2, dataset3], 1):
    std_dev = standard_deviation(data)
    print(f"Dataset {i} Std Dev: {std_dev:.2f}")

# Expected output shows dataset3 has highest variation
```

**Exercise 1.1.6.9**: Orbit Period Calculator
```python
import math

# Kepler's 3rd Law: T² = (4π²/GM) × a³
# Simplified: T ≈ 0.1992 × √(a³)
# Where T = orbital period (years), a = semi-major axis (AU)

def orbital_period(semi_major_axis_au):
    """Calculate orbital period in years using Kepler's law"""
    T = 0.1992 * math.sqrt(semi_major_axis_au ** 3)
    return T

# Test: Mercury's orbit (0.39 AU) vs Earth's (1.0 AU) vs Mars (1.52 AU)
planets = {
    "Mercury": 0.39,
    "Earth": 1.0,
    "Mars": 1.52
}

for planet, axis in planets.items():
    period = orbital_period(axis)
    print(f"{planet}: {period:.2f} years")
```

---

## Mini-Project: Geometric Calculator

Build an interactive calculator that computes properties of geometric shapes using the `math` module.

```python
import math

def circle_properties(radius):
    """Calculate circle area and circumference"""
    area = math.pi * radius ** 2
    circumference = 2 * math.pi * radius
    return area, circumference

def sphere_properties(radius):
    """Calculate sphere volume and surface area"""
    volume = (4/3) * math.pi * radius ** 3
    surface_area = 4 * math.pi * radius ** 2
    return volume, surface_area

def triangle_area(side_a, side_b, side_c):
    """Calculate triangle area using Heron's formula"""
    s = (side_a + side_b + side_c) / 2  # semi-perimeter
    area = math.sqrt(s * (s - side_a) * (s - side_b) * (s - side_c))
    return area

# Interactive menu
def main():
    print("=== Geometric Calculator ===\n")
    
    while True:
        print("1. Circle properties")
        print("2. Sphere properties")
        print("3. Triangle area")
        print("4. Exit")
        
        choice = input("Enter choice (1-4): ")
        
        if choice == '1':
            radius = float(input("Enter circle radius: "))
            area, circumference = circle_properties(radius)
            print(f"Area: {area:.2f}")
            print(f"Circumference: {circumference:.2f}\n")
        
        elif choice == '2':
            radius = float(input("Enter sphere radius: "))
            volume, surface = sphere_properties(radius)
            print(f"Volume: {volume:.2f}")
            print(f"Surface Area: {surface:.2f}\n")
        
        elif choice == '3':
            a = float(input("Side a: "))
            b = float(input("Side b: "))
            c = float(input("Side c: "))
            area = triangle_area(a, b, c)
            print(f"Area: {area:.2f}\n")
        
        elif choice == '4':
            print("Goodbye!")
            break

if __name__ == "__main__":
    main()
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **0.1 + 0.2 in Python always equals 0.3 exactly.**
   - Answer: False

2. **`float('inf') > 1000000` is True.**
   - Answer: True

3. **`float('nan') == float('nan')` is True.**
   - Answer: False

4. **The `math` module is built into Python and doesn't need installation.**
   - Answer: True

---

### Conceptual Questions

5. **Why do floating-point precision errors occur? Explain in 2-3 sentences.**
   - Expected: Mention binary representation not being exact for decimal numbers

6. **Give one real-world example where NaN (Not a Number) might appear in a program.**
   - Expected: Missing data, division by zero, invalid calculations, etc.

7. **What is the difference between `math.floor()` and `math.trunc()`? When would each be useful?**
   - Expected: Both round down for positive, but differ for negatives; floor is mathematical, trunc removes decimal

---

### Coding Challenge

8. **Write a program that calculates the "Rule of 72" - an estimate for how long money takes to double at a given interest rate.**

   Formula: Years ≈ 72 / Annual Interest Rate
   
   Then compare it to the exact formula: t = ln(2) / ln(1 + r)

   ```python
   import math
   
   def rule_of_72(annual_rate):
       """Estimate years to double using rule of 72"""
       return 72 / annual_rate
   
   def exact_doubling_time(annual_rate):
       """Calculate exact years to double"""
       rate = annual_rate / 100
       return math.log(2) / math.log(1 + rate)
   
   # Test with different interest rates
   rates = [1, 5, 10, 15, 20]
   
   for rate in rates:
       estimate = rule_of_72(rate)
       exact = exact_doubling_time(rate)
       error = abs(estimate - exact)
       print(f"{rate}% APR: Estimate={estimate:.2f}yr, Exact={exact:.2f}yr, Error={error:.2f}yr")
   ```

---

## Key Takeaways

✅ **Floating-point precision is limited** - Never compare floats with `==`, use epsilon comparison  
✅ **Special values: infinity, negative infinity, and NaN** - Check with `math.isinf()` and `math.isnan()`  
✅ **The `math` module provides constants and functions** - Use `math.pi`, `math.sqrt()`, trigonometry, etc.  
✅ **Scientific notation** - Use `e` notation for very large/small numbers  
✅ **Math applies everywhere** - Finance, physics, statistics, geometry all use these concepts

---

## Additional Resources

- [Python `math` Module Documentation](https://docs.python.org/3/library/math.html)
- [IEEE 754 Floating-Point Standard](https://en.wikipedia.org/wiki/IEEE_754) - Why precision issues happen
- [Python `decimal` Module](https://docs.python.org/3/library/decimal.html) - For exact decimal arithmetic (money)
- [Interactive Math Visualizations](https://www.desmos.com/calculator) - Understand math concepts visually

---

## Next Lesson Preview

**Lesson 1.1.7**: Boolean Logic & Truth Values
- Deep dive into truthy/falsy values
- De Morgan's Laws
- Complex boolean expressions
- Short-circuiting

---

## Homework

- [ ] Complete Exercises 1.1.6.1 - 1.1.6.9
- [ ] Build and test the Geometric Calculator mini-project
- [ ] Modify the calculator to add diagonal/volume calculations
- [ ] Challenge: Add a loan calculator (monthly payment formula)
- [ ] Quiz: Answer all assessment questions

**Expected time**: 2-3 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.7** when you're ready.
