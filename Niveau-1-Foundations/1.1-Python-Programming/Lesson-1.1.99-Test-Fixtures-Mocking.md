# Lesson 1.1.99: Test Fixtures & Mocking

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
