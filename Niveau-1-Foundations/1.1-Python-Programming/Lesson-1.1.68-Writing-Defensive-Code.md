# Lesson 1.1.68: Writing Defensive Code

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.1.62-1.1.67

---

## Learning Objectives

1. **Validate** inputs before processing
2. **Check** preconditions and postconditions
3. **Use** assertions for invariants
4. **Implement** fail-fast principles
5. **Provide** meaningful error messages
6. **Design** robust functions
7. **Handle** edge cases systematically

---

## Input Validation

### Type Checking

```python
def calculate_discount(price, discount_rate):
    """Calculate discount with validation."""
    if not isinstance(price, (int, float)):
        raise TypeError(f"price must be number, got {type(price)}")
    if not isinstance(discount_rate, (int, float)):
        raise TypeError(f"discount_rate must be number, got {type(discount_rate)}")
    
    if price < 0:
        raise ValueError("price cannot be negative")
    if not (0 <= discount_rate <= 1):
        raise ValueError("discount_rate must be between 0 and 1")
    
    return price * (1 - discount_rate)

# Good inputs
print(calculate_discount(100, 0.1))  # 90.0

# Bad inputs raise exceptions
try:
    calculate_discount("100", 0.1)  # TypeError
except TypeError as e:
    print(f"Error: {e}")
```

### Value Range Checking

```python
def set_temperature(celsius):
    """Set temperature with range validation."""
    if not isinstance(celsius, (int, float)):
        raise TypeError("Temperature must be a number")
    
    if celsius < -273.15:
        raise ValueError("Temperature cannot go below absolute zero (-273.15°C)")
    if celsius > 1000:
        raise ValueError("Temperature too high (practical limit)")
    
    return celsius

print(set_temperature(25))    # 25
print(set_temperature(-274)) # ValueError
```

### Shape and Size Validation

```python
def process_matrix(matrix):
    """Process 2D matrix with validation."""
    if not isinstance(matrix, list):
        raise TypeError("matrix must be a list")
    
    if not matrix:
        raise ValueError("matrix cannot be empty")
    
    # Check all rows have same length
    row_len = len(matrix[0])
    for i, row in enumerate(matrix):
        if not isinstance(row, list):
            raise TypeError(f"Row {i} is not a list")
        if len(row) != row_len:
            raise ValueError(f"Row {i} has wrong length")
    
    return f"Matrix is {len(matrix)}x{row_len}"

matrix = [[1, 2, 3], [4, 5, 6]]
print(process_matrix(matrix))  # Matrix is 2x3
```

---

## Assertions

### Assert for Invariants

```python
def binary_search(arr, target):
    """Search with precondition assertion."""
    # Precondition: array must be sorted
    assert len(arr) == 0 or all(arr[i] <= arr[i+1] for i in range(len(arr)-1)), \
           "Array must be sorted"
    
    left, right = 0, len(arr) - 1
    
    while left <= right:
        mid = (left + right) // 2
        if arr[mid] == target:
            # Postcondition: must find in valid range
            assert left <= mid <= right
            return mid
        elif arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    
    # Postcondition: return -1 if not found
    assert not any(x == target for x in arr)
    return -1

# Valid usage
sorted_arr = [1, 3, 5, 7, 9]
print(binary_search(sorted_arr, 5))  # 2

# Invalid usage (fails assertion)
unsorted = [3, 1, 5]
binary_search(unsorted, 3)  # AssertionError
```

### Assert for Loop Invariants

```python
def fibonacci_valid(n):
    """Generate Fibonacci with invariants."""
    if n < 1:
        raise ValueError("n must be at least 1")
    
    fib = []
    a, b = 0, 1
    
    for i in range(n):
        # Invariant: next two numbers
        assert isinstance(a, int) and isinstance(b, int)
        
        fib.append(a)
        a, b = b, a + b
        
        # Invariant: each number is sum of previous
        if len(fib) >= 2:
            assert fib[-2] + fib[-1] == b or i < 1
    
    return fib

print(fibonacci_valid(5))  # [0, 1, 1, 2, 3]
```

---

## Fail Fast Principle

### Check Early

```python
# ✗ Bad: Checks late, does unnecessary work
def process_user(user_data):
    # Process first
    name = user_data['name'].upper()
    email = user_data['email'].lower()
    age = user_data['age'] * 2
    
    # Check later
    if not user_data:
        raise ValueError("user_data cannot be None")
    
    return {'name': name, 'email': email, 'age': age}

# ✓ Good: Checks early
def process_user_v2(user_data):
    # Validate first
    if not user_data or not isinstance(user_data, dict):
        raise TypeError("user_data must be non-empty dict")
    if 'name' not in user_data or 'email' not in user_data:
        raise ValueError("Missing required fields")
    
    # Process with confidence
    name = user_data['name'].upper()
    email = user_data['email'].lower()
    age = user_data.get('age', 0) * 2
    
    return {'name': name, 'email': email, 'age': age}
```

### Return Early

```python
# ✗ Bad: Nested conditions
def categorize_age(age):
    if isinstance(age, int):
        if age >= 0:
            if age < 13:
                category = "child"
            elif age < 18:
                category = "teen"
            elif age < 65:
                category = "adult"
            else:
                category = "senior"
        else:
            category = None
    else:
        category = None
    return category

# ✓ Good: Guard clauses (return early)
def categorize_age_v2(age):
    if not isinstance(age, int):
        raise TypeError("age must be integer")
    if age < 0:
        raise ValueError("age cannot be negative")
    
    # Now we know age is valid integer
    if age < 13:
        return "child"
    if age < 18:
        return "teen"
    if age < 65:
        return "adult"
    return "senior"
```

---

## Meaningful Error Messages

### Context-Rich Messages

```python
# ✗ Poor error message
def validate_email(email):
    if '@' not in email:
        raise ValueError("Invalid email")

# ✓ Good error message
def validate_email_v2(email):
    if not email:
        raise ValueError("Email cannot be empty")
    if '@' not in email:
        raise ValueError(f"Email '{email}' must contain @ symbol")
    
    local, domain = email.split('@')
    if not local:
        raise ValueError("Email must have characters before @")
    if '.' not in domain:
        raise ValueError(f"Domain '{domain}' must contain at least one dot")
    
    return email
```

### Suggestions in Messages

```python
def parse_datetime(date_str):
    """Parse with helpful error messages."""
    if not date_str:
        raise ValueError("Date cannot be empty")
    
    try:
        from datetime import datetime
        return datetime.strptime(date_str, '%Y-%m-%d')
    except ValueError as e:
        raise ValueError(
            f"Invalid date format: '{date_str}'. "
            f"Expected format: YYYY-MM-DD (e.g., 2024-02-15)"
        ) from e
```

---

## Graded Exercises

### Starter Level

1. Write function with input validation
2. Raise appropriate exceptions
3. Test with valid and invalid inputs

### Intermediate Level

1. Create function with comprehensive validation
2. Use assertions for invariants
3. Provide meaningful error messages
4. Test all validation paths

### Advanced Level

1. Implement complex validation strategy
2. Use fail-fast principles
3. Create custom exception types
4. Validate and test edge cases

---

## Self-Assessment

- [ ] I validate input types before processing
- [ ] I check value ranges and constraints
- [ ] I raise appropriate, meaningful exceptions
- [ ] I use assertions for invariants
- [ ] I implement fail-fast patterns
- [ ] I provide helpful error messages
- [ ] I test validation paths systematically

---

**Next: [Lesson 1.1.69: Debugging with Exceptions](Lesson-1.1.69-Debugging-with-Exceptions.md)**
