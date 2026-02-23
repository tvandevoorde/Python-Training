# Lesson 1.1.100: Test Coverage

**Estimated Time**: 8 hours | **Difficulty**: Advanced  
**Prerequisites**: Lesson 1.1.99

---

## Learning Objectives

1. **Measure** code coverage
2. **Identify** untested code
3. **Improve** test quality
4. **Achieve** coverage targets
5. **Balance** coverage and practicality

---

## Coverage Basics

### Install and Run

```bash
pip install coverage

# Run tests and measure coverage
coverage run -m pytest

# Generate report
coverage report

# HTML report
coverage html
```

---

## Coverage Report

**Example output**:
```
Name                      Stmts   Miss  Cover
---------------------------------------------
my_module/__init__.py         5      0   100%
my_module/utils.py           20      3    85%
my_module/helpers.py         15      8    47%
---------------------------------------------
TOTAL                        40     11    72%
```

---

## Increasing Coverage

### Before (47% coverage)

```python
def validate_email(email):
    """Validate email format."""
    if '@' in email:
        domain = email.split('@')[1]
        if '.' in domain:
            return True
    return False

def process_user(user):
    """Process user."""
    if validate_email(user.email):
        send_welcome_email(user)
```

### After (100% coverage)

```python
def test_validate_email():
    assert validate_email('user@example.com') == True
    assert validate_email('invalid-email') == False
    assert validate_email('user@') == False

def test_process_user():
    user = Mock(email='valid@example.com')
    process_user(user)
    assert send_welcome_email.called
```

---

## Coverage Configuration

**.coveragerc**:
```ini
[run]
source = my_module
omit = 
    */tests/*
    */site-packages/*

[report]
exclude_lines =
    pragma: no cover
    def __repr__
    raise AssertionError
    raise NotImplementedError
```

---

## Self-Assessment

- [ ] I measure code coverage
- [ ] I identify gaps
- [ ] I improve test quality
- [ ] I set realistic goals

---

**Next: [Lesson 1.1.101: Advanced Testing Patterns](Lesson-1.1.101-Advanced-Testing.md)**




