# Lesson 1.1.98: Introduction to Testing

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: All previous lessons

---

## Learning Objectives

By the end of this lesson, you will:

1. Understand why testing is important
2. Know different types of tests
3. Write unit tests with pytest
4. Use assertions effectively
5. Organize tests logically
6. Understand test-driven development (TDD)
7. Calculate test coverage
8. Best practices for effective testing

---

## 1. Why Testing?

**Without tests**: 
```python
def calculate_total(items):
    total = 0
    for item in items:
        total += item["price"] * item["quantity"]
    return total

# Did it work? How do you know?
result = calculate_total([{"price": 10, "quantity": 2}])
print(result)  # 20 - correct?
```

**With tests**:
```python
def test_calculate_total():
    items = [{"price": 10, "quantity": 2}]
    assert calculate_total(items) == 20

def test_calculate_total_multiple():
    items = [
        {"price": 10, "quantity": 2},
        {"price": 5, "quantity": 3}
    ]
    assert calculate_total(items) == 35

def test_calculate_total_empty():
    assert calculate_total([]) == 0
```

**Benefits**:
- Catch bugs early
- Confidence to refactor
- Documentation of expected behavior
- Prevent regressions

---

## 2. Types of Tests

### Unit Tests

Test individual functions in isolation:

```python
def test_area_of_circle():
    """Test circle area calculation"""
    from math_module import circle_area
    assert circle_area(1) == pytest.approx(3.14159)
    assert circle_area(2) == pytest.approx(12.56636)
```

### Integration Tests

Test how components work together:

```python
def test_user_registration_to_database():
    """Test registration flow: create user, save to DB, retrieve"""
    user = create_user("alice", "alice@example.com")
    db.save(user)
    retrieved = db.get_by_email("alice@example.com")
    assert retrieved.name == "alice"
```

### End-to-End Tests

Test complete workflows:

```python
def test_complete_purchase_flow():
    """Test: add item, checkout, payment, confirmation"""
    # ...
```

---

## 3. Using pytest

### Install pytest

```bash
pip install pytest
```

### Write Tests

```python
# File: test_calculator.py

def test_addition():
    from calculator import add
    assert add(2, 3) == 5
    assert add(-1, 1) == 0
    assert add(0, 0) == 0

def test_multiplication():
    from calculator import multiply
    assert multiply(3, 4) == 12
    assert multiply(0, 100) == 0
```

### Run Tests

```bash
# Run all tests
pytest

# Run specific file
pytest test_calculator.py

# Run with verbose output
pytest -v

# Run specific test
pytest test_calculator.py::test_addition
```

---

## 4. Assertions and Test Structure

### Arrange-Act-Assert Pattern

```python
def test_user_age_update():
    # Arrange
    user = User("Alice", 30)
    
    # Act
    user.have_birthday()
    
    # Assert
    assert user.age == 31
```

### Common Assertions

```python
assert 2 + 2 == 4              # Equality
assert value is not None       # Identity
assert items != []             # Inequality
assert 5 > 3                   # Comparison
assert isinstance(value, int)  # Type checking
assert email in users          # Membership
with pytest.raises(ValueError):  # Exception testing
    risky_function()
```

---

## 5. Test Organization

```python
# test_user.py

import pytest
from user import User, UserError

class TestUserCreation:
    def test_valid_creation(self):
        user = User("Alice", 30)
        assert user.name == "Alice"
    
    def test_invalid_age(self):
        with pytest.raises(ValueError):
            User("Bob", -1)

class TestUserBirthday:
    def test_birthday_increment(self):
        user = User("Charlie", 25)
        user.have_birthday()
        assert user.age == 26
    
    def test_multiple_birthdays(self):
        user = User("Diana", 20)
        for _ in range(5):
            user.have_birthday()
        assert user.age == 25
```

---

## 6. Test-Driven Development (TDD)

The TDD cycle:

1. **Red**: Write failing test for desired feature
2. **Green**: Write minimal code to pass test
3. **Refactor**: Improve code while tests pass

### Example:

**Step 1: Write Test (Red)**
```python
def test_user_email_validation():
    user = User("Alice", "invalid-email")
    assert user.is_email_valid() == False
    
    user = User("Bob", "bob@example.com")
    assert user.is_email_valid() == True
```

**Step 2: Write Code (Green)**
```python
class User:
    def __init__(self, name, email):
        self.name = name
        self.email = email
    
    def is_email_valid(self):
        return "@" in self.email
```

**Step 3: Refactor**
```python
import re

class User:
    def __init__(self, name, email):
        self.name = name
        self.email = email
    
    def is_email_valid(self):
        pattern = r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
        return re.match(pattern, self.email) is not None
```

---

## 7. Mini-Project: Test a Calculator

Create calculator with full test suite:

```python
# calculator.py
def add(a, b):
    return a + b

def divide(a, b):
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a / b
```

```python
# test_calculator.py
import pytest
from calculator import add, divide

def test_add():
    assert add(5, 3) == 8
    assert add(-5, 5) == 0

def test_divide():
    assert divide(10, 2) == 5
    
    with pytest.raises(ValueError):
        divide(10, 0)

def test_divide_floats():
    assert divide(7, 2) == pytest.approx(3.5)
```

---

## 8. Graded Exercises

### Starter Level

**Exercise 1**: Basic Unit Tests
- Test 3 simple functions using pytest
- At least 8 assertions total

**Exercise 2**: Test Fixtures
- Use pytest fixtures for setup/teardown

### Intermediate Level

**Exercise 3**: Class Testing
- Test a class with multiple methods
- Cover different scenarios

**Exercise 4**: Exception Testing
- Test that functions raise correct exceptions

### Advanced Level

**Exercise 5**: TDD Practice
- Write tests first, then implementation

**Exercise 6**: Coverage Report
- Aim for 90%+ code coverage

---

## Self-Assessment Checklist

- [ ] I understand why testing is important
- [ ] I can write tests with pytest
- [ ] I use Arrange-Act-Assert pattern
- [ ] I write meaningful test names
- [ ] I test edge cases and errors
- [ ] I organize tests logically
- [ ] I understand TDD cycle
- [ ] I can measure code coverage

---

**Next Lesson**: [1.1.99 - pytest Framework](Lesson-1.1.99-pytest-Framework.md)
