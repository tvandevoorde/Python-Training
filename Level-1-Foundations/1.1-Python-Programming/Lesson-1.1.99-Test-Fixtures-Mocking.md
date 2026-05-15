# Lesson 1.1.99: Test Fixtures & Mocking

> Previous Lesson: [Lesson 1.1.98: Introduction to Testing](Lesson-1.1.98-Introduction-to-Testing.md)

**Estimated Time**: 8 hours | **Difficulty**: Advanced  
**Prerequisites**: Lesson 1.1.98

---

## Learning Objectives

1. **Create** test fixtures
2. **Mock** external dependencies
3. **Isolate** unit tests
4. **Simplify** test setup
5. **Control** test behavior

---

## Introduction: Why This Matters

Test Fixtures & Mocking matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Test Fixtures

### Basic Fixtures

```python
import pytest

@pytest.fixture
def sample_data():
    """Provide sample data for tests."""
    return [1, 2, 3, 4, 5]

def test_sum(sample_data):
    """Test sum function with fixture."""
    assert sum(sample_data) == 15

def test_length(sample_data):
    """Test length with fixture."""
    assert len(sample_data) == 5
```

### Database Fixture

```python
@pytest.fixture
def database():
    """Create temporary database."""
    db = Database(':memory:')
    db.setUp()
    yield db
    db.tearDown()

def test_query(database):
    database.insert('users', {'name': 'Alice'})
    result = database.query('users')
    assert len(result) == 1
```

---

## Mocking

### Mock Objects

```python
from unittest.mock import Mock, patch

def test_api_call():
    """Test with mocked API."""
    mock_api = Mock()
    mock_api.fetch.return_value = {'status': 'ok'}
    
    result = mock_api.fetch()
    assert result['status'] == 'ok'
    mock_api.fetch.assert_called_once()
```

### Patch Decorator

```python
@patch('requests.get')
def test_fetch_user(mock_get):
    """Mock external API."""
    mock_get.return_value.json.return_value = {'id': 1, 'name': 'Bob'}
    
    user = fetch_user_api(1)
    assert user['name'] == 'Bob'
```

---

## Fixture Scope

```python
@pytest.fixture(scope='session')
def expensive_setup():
    """Run once per session."""
    return expensive_database_setup()

@pytest.fixture(scope='function')
def fresh_data():
    """Run for each test."""
    return generate_test_data()
```

---

## Self-Assessment

- [ ] I create fixtures
- [ ] I use mocks effectively
- [ ] I isolate tests
- [ ] I control dependencies

---

**Next: [Lesson 1.1.100: Test Coverage](Lesson-1.1.100-Test-Coverage.md)**




---

## Core Teaching Content

Focus on one clear concept and connect it to a real workflow scenario.

```python
def run_example(value: int) -> int:
    return value * 2

print(run_example(3))
```

---

## Best Practices (Step-by-Step)

1. Clarify one concrete goal for: Test Fixtures & Mocking.
2. Implement the smallest working version for: Test Fixtures & Mocking.
3. Handle one invalid-input case explicitly.
4. Refactor repeated logic into a named function.

```python
LESSON_ID = "1.1.99"
LESSON_TOPIC = "Test Fixtures & Mocking"

def normalize_name(value: str) -> str:
    text = value.strip()
    if not text:
        raise ValueError("name must not be empty")
    return text.title()

print(normalize_name("  python learner "))
```

## Quick Practice

- Exercise: Modify the example to handle one edge case.
- Quiz: What would break if input validation was removed?

---

**Next Lesson**: [Lesson 1.1.100: Test Coverage](Lesson-1.1.100-Test-Coverage.md)

