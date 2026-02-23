# Lesson 1.1.72: Unit Testing with Pytest

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.1.62-1.1.71

---

## Learning Objectives

1. **Write** unit tests with pytest
2. **Structure** tests with fixtures
3. **Use** assertions effectively
4. **Mock** external dependencies
5. **Test** error conditions
6. **Organize** test suites
7. **Measure** test coverage

---

## Basic pytest Usage

### Simple Test

```python
# test_math.py
def add(a, b):
    return a + b

def test_add():
    assert add(2, 3) == 5
    assert add(0, 0) == 0
    assert add(-1, 1) == 0

def test_add_negative():
    assert add(-5, -3) == -8
```

### Running Tests

```bash
pytest test_math.py
pytest test_math.py::test_add
pytest -v  # Verbose
pytest -k "add"  # Match by name
```

---

## Assertions

### Common Assertions

```python
def test_assertions():
    # Equality
    assert 2 + 2 == 4
    
    # Membership
    assert 'a' in 'abc'
    assert 5 not in [1, 2, 3]
    
    # Exceptions
    with pytest.raises(ValueError):
        int("invalid")
    
    # Floating point
    assert 0.1 + 0.2 == pytest.approx(0.3)
    
    # Truthy/Falsy
    assert True
    assert not False
```

---

## Fixtures

### Basic Fixture

```python
import pytest

@pytest.fixture
def sample_data():
    return [1, 2, 3, 4, 5]

def test_with_fixture(sample_data):
    assert len(sample_data) == 5
    assert sum(sample_data) == 15
```

### Setup/Teardown

```python
@pytest.fixture
def database():
    # Setup
    db = create_connection()
    db.init()
    
    yield db  # Test runs here
    
    # Teardown
    db.close()

def test_database_query(database):
    result = database.query("SELECT * FROM users")
    assert result is not None
```

---

## Mocking

### Mock Objects

```python
from unittest.mock import Mock, patch

def get_user(user_id):
    response = requests.get(f"/api/users/{user_id}")
    return response.json()

def test_get_user_with_mock():
    # Create mock
    with patch('requests.get') as mock_get:
        mock_response = Mock()
        mock_response.json.return_value = {'id': 1, 'name': 'Alice'}
        mock_get.return_value = mock_response
        
        result = get_user(1)
        assert result['name'] == 'Alice'
        mock_get.assert_called_once_with('/api/users/1')
```

---

## Testing Exceptions

### Test Error Cases

```python
import pytest

def divide(a, b):
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a / b

def test_divide_by_zero():
    with pytest.raises(ValueError, match="Cannot divide"):
        divide(10, 0)

def test_divide_success():
    assert divide(10, 2) == 5.0
```

---

## Test Organization

### Test Structure

```python
# test_calculator.py
class TestCalculator:
    def test_add(self):
        assert add(2, 3) == 5
    
    def test_subtract(self):
        assert subtract(5, 2) == 3
    
    def test_divide_by_zero(self):
        with pytest.raises(ZeroDivisionError):
            divide(10, 0)
```

---

## Graded Exercises

### Starter Level

1. Write 5+ unit tests for function
2. Test normal cases and edge cases
3. Test error conditions

### Intermediate Level

1. Create test suite with 10+ tests
2. Use fixtures for setup
3. Use mocks for external dependencies
4. Organize tests in classes

### Advanced Level

1. Implement comprehensive test suite
2. Use complex fixtures
3. Mock multiple dependencies
4. Achieve 80%+ code coverage

---

## Self-Assessment

- [ ] I write effective unit tests
- [ ] I use pytest framework
- [ ] I understand assertions
- [ ] I create and use fixtures
- [ ] I mock external dependencies
- [ ] I test error conditions
- [ ] I measure code coverage

---

**Next: [Lesson 1.1.73: Mini-Project - Robust File Processor](Lesson-1.1.73-Mini-Project-Robust-File-Processor.md)**
