# Lesson 1.1.37: Mini-Project: Function Library

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.1.24–1.1.36 (Functions & Scope)

---

## Learning Objectives

By the end of this lesson, you will be able to:

1. **Integrate** multiple function concepts into a cohesive library
2. **Design** modular functions with clear responsibilities
3. **Implement** reusable math, string, and list utility functions
4. **Document** functions with meaningful docstrings
5. **Test** functions manually and systematically
6. **Refactor** code for clarity and reusability
7. **Apply** scope rules to organize function-level variables
8. **Debug** common function design issues

---

## Part 1: Project Overview & Design

### What You'll Build

A **Function Library** – a collection of ~15 reusable utility functions organized by category:

- **Math Utilities**: `factorial()`, `gcd()`, `is_prime()`, `fibonacci()`
- **String Utilities**: `reverse_string()`, `is_palindrome()`, `word_count()`, `count_vowels()`
- **List Utilities**: `remove_duplicates()`, `flatten()`, `find_max_min()`, `rotate_list()`
- **Validation Utilities**: `is_valid_email()`, `is_valid_phone()`, `is_strong_password()`

### Design Principles

```python
# Good function design:
# 1. Single responsibility (one job per function)
# 2. Clear parameters and return values
# 3. Consistent naming conventions
# 4. Complete docstrings
# 5. Defensive input validation
# 6. No side effects (pure functions preferred)

def is_prime(n: int) -> bool:
    """
    Check if a number is prime.
    
    Args:
        n: Integer to check (must be > 1)
    
    Returns:
        True if n is prime, False otherwise
    
    Raises:
        ValueError: If n <= 1
    
    Example:
        >>> is_prime(17)
        True
        >>> is_prime(4)
        False
    """
    if n <= 1:
        raise ValueError("Number must be greater than 1")
    if n == 2:
        return True
    if n % 2 == 0:
        return False
    for i in range(3, int(n**0.5) + 1, 2):
        if n % i == 0:
            return False
    return True
```

---

## Part 2: Math Utilities

### Factorial Function

```python
def factorial(n: int) -> int:
    """
    Calculate n! (factorial).
    
    Args:
        n: Non-negative integer
    
    Returns:
        The factorial of n
    
    Raises:
        ValueError: If n < 0
        TypeError: If n is not an integer
    """
    if not isinstance(n, int):
        raise TypeError("n must be an integer")
    if n < 0:
        raise ValueError("n must be non-negative")
    if n == 0 or n == 1:
        return 1
    
    result = 1
    for i in range(2, n + 1):
        result *= i
    return result

# Test
print(factorial(5))  # 120
print(factorial(0))  # 1
```

### GCD Function

```python
def gcd(a: int, b: int) -> int:
    """
    Find greatest common divisor using Euclidean algorithm.
    
    Args:
        a: First integer
        b: Second integer
    
    Returns:
        GCD of a and b
    """
    a, b = abs(a), abs(b)
    while b:
        a, b = b, a % b
    return a

print(gcd(48, 18))  # 6
print(gcd(100, 50))  # 50
```

### Fibonacci Generator

```python
def fibonacci(n: int) -> list:
    """
    Generate first n Fibonacci numbers.
    
    Args:
        n: Number of Fibonacci numbers to generate
    
    Returns:
        List of first n Fibonacci numbers
    
    Raises:
        ValueError: If n < 1
    """
    if n < 1:
        raise ValueError("n must be at least 1")
    
    fib_list = []
    a, b = 0, 1
    for _ in range(n):
        fib_list.append(a)
        a, b = b, a + b
    return fib_list

print(fibonacci(7))  # [0, 1, 1, 2, 3, 5, 8]
```

---

## Part 3: String Utilities

### Reverse String

```python
def reverse_string(s: str) -> str:
    """
    Reverse a string.
    
    Args:
        s: String to reverse
    
    Returns:
        Reversed string
    """
    return s[::-1]

print(reverse_string("hello"))  # "olleh"
```

### Palindrome Checker

```python
def is_palindrome(s: str) -> bool:
    """
    Check if string is a palindrome (case-insensitive, ignoring spaces).
    
    Args:
        s: String to check
    
    Returns:
        True if palindrome, False otherwise
    """
    # Clean: remove spaces and convert to lowercase
    cleaned = s.replace(" ", "").lower()
    return cleaned == cleaned[::-1]

print(is_palindrome("race car"))  # True
print(is_palindrome("hello"))     # False
```

### Vowel Counter

```python
def count_vowels(s: str) -> dict:
    """
    Count vowels in a string.
    
    Args:
        s: String to analyze
    
    Returns:
        Dictionary with counts for a, e, i, o, u
    """
    vowels = "aeiouAEIOU"
    counts = {v.lower(): 0 for v in vowels}
    
    for char in s:
        if char in vowels:
            counts[char.lower()] += 1
    
    return counts

print(count_vowels("hello world"))  # {'a': 0, 'e': 1, 'i': 0, 'o': 2, 'u': 0}
```

### Word Count

```python
def word_count(s: str) -> dict:
    """
    Count frequency of each word in a string.
    
    Args:
        s: String to analyze
    
    Returns:
        Dictionary with word frequencies
    """
    words = s.lower().split()
    word_freq = {}
    
    for word in words:
        # Remove punctuation (simplified)
        word = word.strip(".,!?;:")
        word_freq[word] = word_freq.get(word, 0) + 1
    
    return word_freq

print(word_count("hello world hello"))  # {'hello': 2, 'world': 1}
```

---

## Part 4: List Utilities

### Remove Duplicates (Preserve Order)

```python
def remove_duplicates(lst: list) -> list:
    """
    Remove duplicates while preserving order.
    
    Args:
        lst: List that may contain duplicates
    
    Returns:
        List with duplicates removed
    """
    seen = set()
    result = []
    
    for item in lst:
        if item not in seen:
            seen.add(item)
            result.append(item)
    
    return result

print(remove_duplicates([1, 2, 2, 3, 1, 4]))  # [1, 2, 3, 4]
```

### Flatten Nested List

```python
def flatten(lst: list) -> list:
    """
    Flatten a nested list.
    
    Args:
        lst: Nested list
    
    Returns:
        Flattened list
    """
    result = []
    
    for item in lst:
        if isinstance(item, list):
            result.extend(flatten(item))
        else:
            result.append(item)
    
    return result

print(flatten([1, [2, 3], [4, [5, 6]]]))  # [1, 2, 3, 4, 5, 6]
```

### Find Max and Min

```python
def find_max_min(lst: list) -> tuple:
    """
    Find maximum and minimum in list without using built-in functions.
    
    Args:
        lst: Non-empty list of comparable items
    
    Returns:
        Tuple (max, min)
    
    Raises:
        ValueError: If list is empty
    """
    if not lst:
        raise ValueError("List cannot be empty")
    
    max_val = min_val = lst[0]
    
    for item in lst[1:]:
        if item > max_val:
            max_val = item
        if item < min_val:
            min_val = item
    
    return max_val, min_val

print(find_max_min([3, 7, 2, 9, 1]))  # (9, 1)
```

### Rotate List

```python
def rotate_list(lst: list, steps: int) -> list:
    """
    Rotate list elements to the right.
    
    Args:
        lst: List to rotate
        steps: Number of positions to rotate
    
    Returns:
        Rotated list
    """
    if not lst:
        return lst
    
    # Normalize steps
    steps = steps % len(lst)
    return lst[-steps:] + lst[:-steps]

print(rotate_list([1, 2, 3, 4, 5], 2))  # [4, 5, 1, 2, 3]
```

---

## Part 5: Validation Utilities

### Email Validator (Simple)

```python
def is_valid_email(email: str) -> bool:
    """
    Simple email validation (basic check).
    
    Args:
        email: Email string to validate
    
    Returns:
        True if basic email format is valid
    """
    if not isinstance(email, str):
        return False
    
    # Very basic check: must have @ and at least one dot
    if "@" not in email or "." not in email:
        return False
    
    local, domain = email.split("@")
    return len(local) > 0 and "." in domain

print(is_valid_email("user@example.com"))   # True
print(is_valid_email("invalid.email"))      # False
```

### Phone Validator

```python
def is_valid_phone(phone: str) -> bool:
    """
    Validate phone number (US format: 123-456-7890 or 1234567890).
    
    Args:
        phone: Phone string to validate
    
    Returns:
        True if valid format
    """
    # Remove common separators
    cleaned = phone.replace("-", "").replace(" ", "").replace(".", "")
    
    # Check if 10 or 11 digits (with optional leading 1)
    if len(cleaned) == 10:
        return cleaned.isdigit()
    elif len(cleaned) == 11 and cleaned[0] == "1":
        return cleaned[1:].isdigit()
    
    return False

print(is_valid_phone("123-456-7890"))  # True
print(is_valid_phone("1234567890"))    # True
print(is_valid_phone("12345"))         # False
```

### Strong Password Checker

```python
def is_strong_password(password: str) -> dict:
    """
    Check password strength.
    
    Args:
        password: Password to check
    
    Returns:
        Dict with strength assessment and requirements met
    """
    checks = {
        "length_8": len(password) >= 8,
        "has_upper": any(c.isupper() for c in password),
        "has_lower": any(c.islower() for c in password),
        "has_digit": any(c.isdigit() for c in password),
        "has_special": any(c in "!@#$%^&*" for c in password),
    }
    
    strength = sum(checks.values())
    checks["score"] = strength
    checks["is_strong"] = strength >= 4
    
    return checks

result = is_strong_password("MyPass123!")
print(result)  # {'length_8': True, 'has_upper': True, 'has_lower': True, 'has_digit': True, 'has_special': True, 'score': 5, 'is_strong': True}
```

---

## Part 6: Testing Your Library

### Manual Testing

```python
# Test math functions
print("=== MATH TESTS ===")
print(f"factorial(5) = {factorial(5)}")
print(f"is_prime(17) = {is_prime(17)}")
print(f"gcd(48, 18) = {gcd(48, 18)}")

# Test string functions
print("\n=== STRING TESTS ===")
print(f"is_palindrome('race car') = {is_palindrome('race car')}")
print(f"count_vowels('hello') = {count_vowels('hello')}")

# Test list functions
print("\n=== LIST TESTS ===")
print(f"remove_duplicates([1,2,2,3]) = {remove_duplicates([1,2,2,3])}")
print(f"flatten([1,[2,[3,4]]]) = {flatten([1,[2,[3,4]]])}")
```

### Creating a Test Function

```python
def test_library():
    """Run comprehensive tests on all functions."""
    
    # Test factorial
    assert factorial(0) == 1
    assert factorial(5) == 120
    print("✓ factorial tests passed")
    
    # Test is_prime
    assert is_prime(2) == True
    assert is_prime(17) == True
    assert is_prime(4) == False
    print("✓ is_prime tests passed")
    
    # Test palindrome
    assert is_palindrome("racecar") == True
    assert is_palindrome("hello") == False
    print("✓ is_palindrome tests passed")
    
    # Test remove_duplicates
    assert remove_duplicates([1,2,2,3,1]) == [1,2,3]
    print("✓ remove_duplicates tests passed")
    
    # Test is_valid_email
    assert is_valid_email("user@example.com") == True
    assert is_valid_email("invalid") == False
    print("✓ is_valid_email tests passed")
    
    print("\n✓ All tests passed!")

test_library()
```

---

## Part 7: Code Organization

### Best Practice: Group Related Functions

```python
# ===== MATH UTILITIES =====
def factorial(n):
    """..."""
    pass

def is_prime(n):
    """..."""
    pass

def gcd(a, b):
    """..."""
    pass

# ===== STRING UTILITIES =====
def is_palindrome(s):
    """..."""
    pass

def count_vowels(s):
    """..."""
    pass

# ===== LIST UTILITIES =====
def remove_duplicates(lst):
    """..."""
    pass

def flatten(lst):
    """..."""
    pass

# ===== VALIDATION UTILITIES =====
def is_valid_email(email):
    """..."""
    pass

def is_strong_password(password):
    """..."""
    pass

# ===== TESTING =====
def test_library():
    """..."""
    pass

if __name__ == "__main__":
    test_library()
```

---

## Part 8: Scope Management in Your Library

### Local Scope Best Practices

```python
# Good: Local variables don't interfere
def process_data(data):
    # These are local to this function
    result = []
    for item in data:
        transformed = item * 2
        result.append(transformed)
    return result

# Avoid: Using global variables unnecessarily
counter = 0  # Global (generally avoid)

def increment_counter():
    global counter
    counter += 1
    return counter
```

### Using Helper Functions

```python
def is_strong_password_with_feedback(password):
    """Validate password and provide feedback."""
    
    def check_length(pwd):
        return len(pwd) >= 8
    
    def check_complexity(pwd):
        has_upper = any(c.isupper() for c in pwd)
        has_lower = any(c.islower() for c in pwd)
        has_digit = any(c.isdigit() for c in pwd)
        return has_upper and has_lower and has_digit
    
    # Use helper functions
    feedback = {
        "length_ok": check_length(password),
        "complexity_ok": check_complexity(password)
    }
    
    return feedback and feedback["length_ok"] and feedback["complexity_ok"]
```

---

## Mini-Project Starter Code

Save this as `function_library.py`:

```python
"""
Function Library - A collection of utility functions.
Author: [Your Name]
Date: [Today's Date]
"""

# TODO: Implement all 15 functions from lessons 1.1.24-1.1.36

# Math Utilities
def factorial(n: int) -> int:
    """TODO: Implement"""
    pass

def is_prime(n: int) -> bool:
    """TODO: Implement"""
    pass

def gcd(a: int, b: int) -> int:
    """TODO: Implement"""
    pass

def fibonacci(n: int) -> list:
    """TODO: Implement"""
    pass

# String Utilities
def reverse_string(s: str) -> str:
    """TODO: Implement"""
    pass

def is_palindrome(s: str) -> bool:
    """TODO: Implement"""
    pass

def count_vowels(s: str) -> dict:
    """TODO: Implement"""
    pass

def word_count(s: str) -> dict:
    """TODO: Implement"""
    pass

# List Utilities
def remove_duplicates(lst: list) -> list:
    """TODO: Implement"""
    pass

def flatten(lst: list) -> list:
    """TODO: Implement"""
    pass

def find_max_min(lst: list) -> tuple:
    """TODO: Implement"""
    pass

def rotate_list(lst: list, steps: int) -> list:
    """TODO: Implement"""
    pass

# Validation Utilities
def is_valid_email(email: str) -> bool:
    """TODO: Implement"""
    pass

def is_valid_phone(phone: str) -> bool:
    """TODO: Implement"""
    pass

def is_strong_password(password: str) -> dict:
    """TODO: Implement"""
    pass

# Testing
def test_library():
    """Test all functions."""
    # TODO: Write comprehensive tests
    pass

if __name__ == "__main__":
    test_library()
```

---

## Graded Exercises

### Starter Level (Required)

1. **Implement 5 functions** of your choice from the catalog
   - Include docstrings for each
   - Test manually with at least 3 test cases per function
   - Verify they don't have side effects

2. **Create a test function** that validates your 5 implementations
   - Use `assert` statements
   - Test normal cases and edge cases

3. **Submit code** with clear output showing all tests passing

---

### Intermediate Level

1. **Implement all 15 functions** from the lesson
2. **Write comprehensive tests** for all functions (3+ tests each)
3. **Add error handling** using try-except for invalid inputs
4. **Include type hints** for all function parameters and returns
5. **Document each function** with full docstrings including examples

---

### Advanced Level

1. **Complete all Intermediate requirements**
2. **Create variant functions** (e.g., recursive factorial, iterative fibonacci)
3. **Add performance optimization** (e.g., memoization for fibonacci)
4. **Build a menu system** that allows users to test functions interactively
5. **Extend functions** with additional features:
   - Password strength with messages
   - Email validation with detailed error messages
   - Phone validation for multiple countries

---

## Self-Assessment Checklist

- [ ] I have implemented at least 5 utility functions
- [ ] All functions have clear docstrings
- [ ] My functions use appropriate parameters and return types
- [ ] I test each function with multiple cases
- [ ] I handle edge cases (empty lists, negative numbers, invalid input)
- [ ] I organize related functions together with comments
- [ ] I use local variables appropriately within each function
- [ ] I avoid global variables in my library
- [ ] I include type hints for all function definitions
- [ ] My code is readable and follows PEP 8 style
- [ ] All tests pass without errors
- [ ] I can explain the purpose and implementation of each function

---

## Additional Resources

- **Python Docs - Functions**: https://docs.python.org/3/tutorial/controlflow.html#defining-functions
- **PEP 257 - Docstring Conventions**: https://www.python.org/dev/peps/pep-0257/
- **Real Python - Functional Programming**: https://realpython.com/functional-programming-python/
- **Testing Best Practices**: https://docs.python.org/3/library/unittest.html

---

## Key Takeaways

✅ Functions should have **single, clear responsibilities**  
✅ **Docstrings** explain what functions do and how to use them  
✅ **Type hints** make code more maintainable  
✅ **Testing** is crucial for validating your code works correctly  
✅ **Local scope** keeps functions independent and reusable  
✅ **Pure functions** (no side effects) are easier to test and reason about  
✅ **Organization** matters: group related functions logically

---

## Previous & Next Lessons

**← [Lesson 1.1.36: Debugging Functions](Lesson-1.1.36-Debugging-Functions.md)**

**→ [Lesson 1.1.38: MILESTONE TEST - Functions & Scope](Lesson-1.1.38-MILESTONE-TEST-Functions-Scope.md)**

---

**Happy Coding!** 🐍

You've now completed a substantial function library. Use these patterns in your own projects!
