# Lesson 1.1.9: Mini-Project: Simple Calculator

**Estimated Time**: 8 hours | **Difficulty**: Beginner-Intermediate  
**Prerequisites**: Lessons 1.1.1 - 1.1.8 | **Topic**: Topic 1 Capstone (Variables, Operators, Scope)

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Integrate all Topic 1 concepts into one application
- Build interactive user programs with input/output
- Apply scope principles to organize code
- Handle type conversion and user input safely
- Debug and test a multi-function application

---

## 1. Project Overview & Architecture (60 min)

### 1.1 Project Scope

You'll build a **Scientific Calculator** that:
- Performs basic arithmetic (+, -, *, /, //, %, **)
- Performs trigonometric calculations (sin, cos, tan)
- Calculates statistics (mean, variance, std dev)
- Maintains calculation history
- Supports both interactive and command modes

### 1.2 Architecture Design

```
simple_calculator/
├── calculator.py          # Main application
├── operations.py          # Math operations module
├── history.py            # History management
├── utils.py              # Utility functions
└── test_calculator.py    # Tests
```

### 1.3 Key Concepts Used

- **Variables & Types** (Lesson 1.1.1): Store numbers, strings, lists
- **Operators** (Lesson 1.1.2): Arithmetic, comparison, logical operators
- **Input/Output** (Lesson 1.1.3): `input()`, f-strings, formatted output
- **Type Conversion** (Lesson 1.1.4): Convert strings to numbers safely
- **String Manipulation** (Lesson 1.1.5): Parse input, format output
- **Math Module** (Lesson 1.1.6): Use `math` functions
- **Boolean Logic** (Lesson 1.1.7): Validation and control flow
- **Scope** (Lesson 1.1.8): Organize code with proper variable scoping

---

## 2. Project Implementation - Part 1: Core Operations (120 min)

### 2.1 Module 1: `operations.py` - Math Functions

```python
"""
operations.py - Mathematical operations for calculator
Demonstrates: scope, math module, function organization
"""

import math

# Global constants
PRECISION = 4  # Decimal places for display
MAX_VALUE = 1e10  # Maximum displayable value

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
    """Divide a by b (with zero check)"""
    if b == 0:
        raise ValueError("Division by zero")
    return a / b

def floor_divide(a, b):
    """Integer division"""
    if b == 0:
        raise ValueError("Division by zero")
    return a // b

def modulo(a, b):
    """Remainder after division"""
    if b == 0:
        raise ValueError("Division by zero")
    return a % b

def power(a, b):
    """Raise a to power b"""
    if a < 0 and isinstance(b, float) and not b.is_integer():
        raise ValueError("Negative number to fractional power")
    return a ** b

def square_root(a):
    """Calculate square root"""
    if a < 0:
        raise ValueError("Square root of negative number")
    return math.sqrt(a)

def sine(degrees):
    """Calculate sine (input in degrees)"""
    radians = math.radians(degrees)
    return math.sin(radians)

def cosine(degrees):
    """Calculate cosine (input in degrees)"""
    radians = math.radians(degrees)
    return math.cos(radians)

def tangent(degrees):
    """Calculate tangent (input in degrees)"""
    radians = math.radians(degrees)
    return math.tan(radians)

def factorial(n):
    """Calculate factorial (n!)"""
    if not isinstance(n, int) or n < 0:
        raise ValueError("Factorial requires non-negative integer")
    return math.factorial(n)

# Statistical functions
def mean(numbers):
    """Calculate average of list"""
    if not numbers:
        raise ValueError("Cannot calculate mean of empty list")
    return sum(numbers) / len(numbers)

def variance(numbers):
    """Calculate variance"""
    if not numbers:
        raise ValueError("Cannot calculate variance of empty list")
    avg = mean(numbers)
    squared_diffs = [(x - avg) ** 2 for x in numbers]
    return sum(squared_diffs) / len(numbers)

def standard_deviation(numbers):
    """Calculate standard deviation"""
    return math.sqrt(variance(numbers))

# Helper function
def format_result(result):
    """Format result to consistent precision"""
    if isinstance(result, float):
        if math.isfinite(result):
            return round(result, PRECISION)
        else:
            return result
    return result
```

### 2.2 Module 2: `history.py` - Calculation History

```python
"""
history.py - Maintain calculation history
Demonstrates: lists, scope, encapsulation
"""

def create_history_manager():
    """Factory function to create a history manager
    
    Uses nonlocal to maintain state
    """
    history = []
    
    def add_calculation(expression, result):
        """Add calculation to history"""
        entry = {
            'expression': expression,
            'result': result
        }
        history.append(entry)
        return len(history)  # Return entry number
    
    def get_history(limit=None):
        """Get history entries (most recent first)"""
        if limit is None:
            return history[::-1]
        else:
            return history[-limit:][::-1]
    
    def clear_history():
        """Clear all history"""
        nonlocal history
        history = []
    
    def get_last_result():
        """Get last calculation result"""
        if history:
            return history[-1]['result']
        return None
    
    def display_history(limit=10):
        """Display history in formatted way"""
        entries = get_history(limit)
        if not entries:
            return "History is empty"
        
        output = "Calculation History:\n"
        for i, entry in enumerate(entries, 1):
            output += f"{i}. {entry['expression']} = {entry['result']}\n"
        return output
    
    return add_calculation, get_history, clear_history, get_last_result, display_history
```

### 2.3 Module 3: `utils.py` - Input Validation

```python
"""
utils.py - Utility functions for input handling
Demonstrates: type conversion, error handling, user input patterns
"""

def safe_float_input(prompt):
    """Get float input from user with error handling"""
    while True:
        try:
            value = input(prompt)
            return float(value)
        except ValueError:
            print("❌ Invalid input. Please enter a number.")

def safe_int_input(prompt):
    """Get integer input from user"""
    while True:
        try:
            value = input(prompt)
            if '.' in value:
                print("❌ Please enter a whole number (no decimal)")
                continue
            return int(value)
        except ValueError:
            print("❌ Invalid input. Please enter an integer.")

def get_operation_choice():
    """Display menu and get user's choice"""
    print("\n" + "="*40)
    print("CALCULATOR OPERATIONS")
    print("="*40)
    print("Basic Operations:")
    print("  1. Add (+)")
    print("  2. Subtract (-)")
    print("  3. Multiply (*)")
    print("  4. Divide (/)")
    print("  5. Floor Divide (//)")
    print("  6. Modulo (%)")
    print("  7. Power (**)")
    print("\nAdvanced Functions:")
    print("  8. Square Root")
    print("  9. Sine (degrees)")
    print(" 10. Cosine (degrees)")
    print(" 11. Tangent (degrees)")
    print(" 12. Factorial")
    print("  0. Exit")
    print("="*40)
    
    while True:
        choice = input("Enter choice (0-12): ").strip()
        if choice in '0123456789':
            return int(choice)
        elif choice == '10':
            return 10
        elif choice == '11':
            return 11
        elif choice == '12':
            return 12
        else:
            print(f"❌ Invalid choice: '{choice}'. Please select 0-12")

def confirm_action(prompt):
    """Get yes/no confirmation from user"""
    while True:
        response = input(prompt + " (y/n): ").strip().lower()
        if response in ['y', 'yes']:
            return True
        elif response in ['n', 'no']:
            return False
        else:
            print("❌ Please enter 'y' or 'n'")

def display_title():
    """Display application title"""
    title = "SCIENTIFIC CALCULATOR"
    print("\n" + "="*50)
    print(title.center(50))
    print("="*50)
    print("Built with Python - Topic 1 Capstone Project")
    print("="*50 + "\n")
```

---

## 3. Project Implementation - Part 2: Main Application (120 min)

### 3.1 Module 4: `calculator.py` - Main Application

```python
"""
calculator.py - Main calculator application
Demonstrates: all Topic 1 concepts integration
"""

import operations as ops
from utils import (safe_float_input, safe_int_input, get_operation_choice,
                   confirm_action, display_title)
from history import create_history_manager

# Create history manager using factory pattern
add_to_history, get_history, clear_history, get_last_result, display_history = \
    create_history_manager()

def handle_basic_operation(choice, num1=None, num2=None):
    """Handle basic arithmetic operations"""
    
    # Get first number if not provided
    if num1 is None:
        num1 = safe_float_input("Enter first number: ")
    
    # Get second number if not provided
    if num2 is None:
        num2 = safe_float_input("Enter second number: ")
    
    # Perform operation based on choice
    try:
        if choice == 1:
            result = ops.add(num1, num2)
            expr = f"{num1} + {num2}"
        elif choice == 2:
            result = ops.subtract(num1, num2)
            expr = f"{num1} - {num2}"
        elif choice == 3:
            result = ops.multiply(num1, num2)
            expr = f"{num1} × {num2}"
        elif choice == 4:
            result = ops.divide(num1, num2)
            expr = f"{num1} ÷ {num2}"
        elif choice == 5:
            result = ops.floor_divide(num1, num2)
            expr = f"{num1} // {num2}"
        elif choice == 6:
            result = ops.modulo(num1, num2)
            expr = f"{num1} % {num2}"
        elif choice == 7:
            result = ops.power(num1, num2)
            expr = f"{num1} ** {num2}"
        else:
            return None
        
        # Format and display result
        result = ops.format_result(result)
        print(f"\n✓ Result: {result}")
        
        # Add to history
        add_to_history(expr, result)
        
        return result
        
    except ValueError as e:
        print(f"❌ Error: {e}")
        return None

def handle_single_input_operation(choice, number=None):
    """Handle operations needing single input"""
    
    operations = {
        8: ("Square Root", ops.square_root),
        9: ("Sine", ops.sine),
        10: ("Cosine", ops.cosine),
        11: ("Tangent", ops.tangent),
        12: ("Factorial", ops.factorial),
    }
    
    if choice not in operations:
        return None
    
    op_name, op_function = operations[choice]
    
    # Get number if not provided
    if number is None:
        if choice == 12:
            number = safe_int_input(f"Enter number for {op_name}: ")
        else:
            number = safe_float_input(f"Enter number for {op_name}: ")
    
    try:
        result = op_function(number)
        result = ops.format_result(result)
        print(f"\n✓ {op_name}({number}) = {result}")
        
        # Add to history
        add_to_history(f"{op_name}({number})", result)
        
        return result
    except ValueError as e:
        print(f"❌ Error: {e}")
        return None

def calculate_statistics():
    """Calculate statistics from input list"""
    print("\nEnter numbers for statistics (or 'done' to finish):")
    numbers = []
    
    while True:
        try:
            value_str = input(f"Enter number #{len(numbers) + 1} (or 'done'): ")
            if value_str.lower() == 'done':
                break
            number = float(value_str)
            numbers.append(number)
        except ValueError:
            print("❌ Invalid number. Try again.")
    
    if not numbers:
        print("No numbers entered.")
        return
    
    try:
        mean_val = ops.mean(numbers)
        variance_val = ops.variance(numbers)
        std_dev_val = ops.standard_deviation(numbers)
        
        print(f"\n--- Statistics ---")
        print(f"Count: {len(numbers)}")
        print(f"Mean: {ops.format_result(mean_val)}")
        print(f"Variance: {ops.format_result(variance_val)}")
        print(f"Std Dev: {ops.format_result(std_dev_val)}")
        
        # Add to history
        add_to_history(f"mean({len(numbers)} numbers)", mean_val)
    except ValueError as e:
        print(f"❌ Error: {e}")

def main():
    """Main application loop"""
    display_title()
    
    while True:
        choice = get_operation_choice()
        
        # Exit
        if choice == 0:
            if confirm_action("Are you sure you want to exit?"):
                print("\nThank you for using the calculator!")
                break
            continue
        
        # View history
        elif choice == 13:  # Special case (hidden in menu)
            print(display_history())
            continue
        
        # Handle operations
        elif choice in [1, 2, 3, 4, 5, 6, 7]:
            handle_basic_operation(choice)
        
        elif choice in [8, 9, 10, 11, 12]:
            handle_single_input_operation(choice)

if __name__ == "__main__":
    main()
```

---

## 4. Testing & Validation (60 min)

### 4.1 Manual Testing Script

```python
"""
test_calculator.py - Test calculator functionality
Demonstrates: test structure, assertions, error cases
"""

import operations as ops

def test_basic_operations():
    """Test basic arithmetic"""
    print("Testing basic operations...")
    
    assert ops.add(2, 3) == 5
    assert ops.subtract(10, 3) == 7
    assert ops.multiply(4, 5) == 20
    assert ops.divide(10, 2) == 5
    assert ops.floor_divide(10, 3) == 3
    assert ops.modulo(10, 3) == 1
    assert ops.power(2, 3) == 8
    
    print("✓ Basic operations passed")

def test_error_handling():
    """Test error conditions"""
    print("Testing error handling...")
    
    # Division by zero
    try:
        ops.divide(5, 0)
        assert False, "Should raise ValueError"
    except ValueError:
        pass
    
    # Square root of negative
    try:
        ops.square_root(-1)
        assert False, "Should raise ValueError"
    except ValueError:
        pass
    
    print("✓ Error handling passed")

def test_trigonometry():
    """Test trigonometric functions"""
    print("Testing trigonometry...")
    
    # sin(0) = 0
    assert abs(ops.sine(0) - 0) < 0.0001
    
    # cos(0) = 1
    assert abs(ops.cosine(0) - 1) < 0.0001
    
    # sin(90) = 1
    assert abs(ops.sine(90) - 1) < 0.0001
    
    print("✓ Trigonometry passed")

def test_statistics():
    """Test statistical functions"""
    print("Testing statistics...")
    
    numbers = [2, 4, 6, 8, 10]
    
    assert ops.mean(numbers) == 6
    assert ops.variance(numbers) == 8
    assert abs(ops.standard_deviation(numbers) - 2.828) < 0.01
    
    print("✓ Statistics passed")

def run_all_tests():
    """Run all test suites"""
    print("\n" + "="*40)
    print("Running Calculator Tests")
    print("="*40 + "\n")
    
    test_basic_operations()
    test_error_handling()
    test_trigonometry()
    test_statistics()
    
    print("\n" + "="*40)
    print("✓ All tests passed!")
    print("="*40 + "\n")

if __name__ == "__main__":
    run_all_tests()
```

### 4.2 Test Cases

```
Test Case 1: Basic Operations
Input: 10 + 5
Expected: 15

Test Case 2: Error Handling
Input: 10 / 0
Expected: "Error: Division by zero"

Test Case 3: Chained Operations
Input: (5 + 3) * 2
Expected: 16 (via history)

Test Case 4: Statistics
Input: [1, 2, 3, 4, 5]
Expected: mean=3, variance=2, std_dev≈1.41

Test Case 5: Edge Cases
Input: 0 * 1000
Expected: 0

Input: -5 ** 2
Expected: 25

Input: sqrt(0)
Expected: 0
```

---

## 5. Run Instructions

### 5.1 Step 1: Create File Structure

```bash
mkdir simple_calculator
cd simple_calculator
touch operations.py history.py utils.py calculator.py test_calculator.py
```

### 5.2 Step 2: Copy Code

Copy each module code into respective `.py` files

### 5.3 Step 3: Run Tests

```bash
python test_calculator.py
```

Expected output:
```
========================================
Running Calculator Tests
========================================

Testing basic operations...
✓ Basic operations passed
Testing error handling...
✓ Error handling passed
Testing trigonometry...
✓ Trigonometry passed
Testing statistics...
✓ Statistics passed

========================================
✓ All tests passed!
========================================
```

### 5.4 Step 4: Run Application

```bash
python calculator.py
```

Interactive menu appears for calculations

---

## 6. Extension Challenges

### Challenge 1: Memory Function
Add M+, M-, MR, MC buttons to store/recall values

### Challenge 2: Expression Parsing
Parse expressions like "2+3*4" instead of one operation at a time

### Challenge 3: Unit Conversion
Add temperature (C↔F), distance (m↔ft), weight (kg↔lb) conversions

### Challenge 4: Graph Support
Display simple ASCII graphs of functions (e.g., sin wave from 0-360°)

### Challenge 5: Persistent History
Save calculation history to a JSON file that persists between runs

---

## Project Summary

### Concepts Integrated

✅ **Variables & Types** - Store calculation results, user input  
✅ **Operators** - All basic math and boolean operators used  
✅ **Input/Output** - `input()` for user interaction, f-strings for display  
✅ **Type Conversion** - Convert string input to floats/integers  
✅ **String Manipulation** - Parse user input, format output  
✅ **Math Module** - `math.sin()`, `math.sqrt()`, `math.factorial()`  
✅ **Boolean Logic** - Validation, error checking, control flow  
✅ **Scope** - `nonlocal` in factory pattern, function-level organization  

### Code Quality

- ✅ Multiple modules (organization)
- ✅ Error handling (try-except)
- ✅ Input validation
- ✅ Clear function documentation
- ✅ Consistent naming conventions
- ✅ Comments for complex logic

### Portfolio Value

This project demonstrates:
- Problem decomposition into modules
- User interface design
- Error handling and validation
- State management with closures
- Testing and debugging
- Complete end-to-end application

---

## Grading Rubric

### Completeness (40 points)
- [ ] All 5 modules created (8 pts)
- [ ] All operations functional (12 pts)
- [ ] History system working (8 pts)
- [ ] Input validation complete (8 pts)
- [ ] Tests passing (4 pts)

### Code Quality (30 points)
- [ ] Clear variable names (5 pts)
- [ ] Functions are focused (5 pts)
- [ ] Proper scope usage (5 pts)
- [ ] No code duplication (5 pts)
- [ ] Documentation/comments (5 pts)
- [ ] PEP 8 style (5 pts)

### Functionality (20 points)
- [ ] Basic math works (8 pts)
- [ ] Advanced functions work (6 pts)
- [ ] Error handling works (4 pts)
- [ ] History tracking works (2 pts)

### Testing (10 points)
- [ ] Test suite complete (5 pts)
- [ ] All tests pass (5 pts)

**Total: 100 points**

---

## Key Takeaways from Topic 1

You've learned:
- How variables store data
- How operators transform data
- How to get input and produce output
- How to convert between types safely
- How to manipulate strings
- Special float values and the math module
- Boolean logic and decision-making
- Variable scope and encapsulation

This calculator consolidates all these concepts into a real application!

---

## What's Next?

Next topic: **Control Flow**
- if/elif/else statements
- while loops
- for loops
- Loop control (break, continue, pass)

---

## Congratulations! 🎉

You've completed **Topic 1: Variables, Types, and Operators**

You're ready for:
- Lesson 1.1.10: MILESTONE TEST (comprehensive assessment)
- Topic 2: Control Flow

---

**Project Complete!** 

💾 Save your calculator project - it's portfolio-worthy!  
📈 Next: Move to Topic 2 - Control Flow





