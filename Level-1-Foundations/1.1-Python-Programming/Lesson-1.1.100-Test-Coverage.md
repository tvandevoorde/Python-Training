# Lesson 1.1.100: Test Coverage

> Previous Lesson: [Lesson 1.1.99: Test Fixtures & Mocking](Lesson-1.1.99-Test-Fixtures-Mocking.md)

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

## Introduction: Why This Matters

Test Coverage matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

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

1. Define the retrieval objective for Test Coverage (precision vs recall).
2. Start with a small curated document set and deterministic chunking.
3. Retrieve top-k candidates, then rerank before generation.
4. Log source chunks with the final answer for traceability.

```python
LESSON_ID = "1.1.100"
LESSON_TOPIC = "Test Coverage"

def retrieve_top_k(query: str, docs: list[str], k: int = 2) -> list[str]:
    ranked = sorted(docs, key=lambda d: query.lower() in d.lower(), reverse=True)
    return ranked[:k]

chunks = ["LLM inference uses KV cache.", "Pandas handles tabular data."]
print(retrieve_top_k("inference", chunks, k=1))
```

## Quick Practice

- Exercise: Modify the example to handle one edge case.
- Quiz: What would break if input validation was removed?

---

**Next Lesson**: [Lesson 1.1.101: Advanced Testing Patterns](Lesson-1.1.101-Advanced-Testing.md)

