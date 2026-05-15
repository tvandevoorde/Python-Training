# Lesson 1.1.101: Advanced Testing Patterns

> Previous Lesson: [Lesson 1.1.100: Test Coverage](Lesson-1.1.100-Test-Coverage.md)

**Estimated Time**: 8 hours | **Difficulty**: Advanced  
**Prerequisites**: Lesson 1.1.100

---

## Learning Objectives

1. **Apply** testing patterns
2. **Test** asynchronous code
3. **Use** parametrization
4. **Organize** test suites
5. **Test** edge cases

---

## Introduction: Why This Matters

Advanced Testing Patterns matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Parametrization

### Test Multiple Cases

```python
import pytest

@pytest.mark.parametrize("input,expected", [
    (2, 4),
    (3, 9),
    (4, 16),
    (-2, 4),
])
def test_square(input, expected):
    assert input ** 2 == expected
```

---

## Test Organization

### Test by Behavior

```python
class TestCalculator:
    """Tests for calculator."""
    
    def test_addition(self):
        calc = Calculator()
        assert calc.add(2, 3) == 5
    
    def test_subtraction(self):
        calc = Calculator()
        assert calc.subtract(5, 2) == 3
    
    def test_division_by_zero(self):
        calc = Calculator()
        with pytest.raises(ZeroDivisionError):
            calc.divide(10, 0)
```

---

## Async Testing

### Testing Async Code

```python
import pytest
import asyncio

@pytest.mark.asyncio
async def test_async_function():
    result = await async_operation()
    assert result == expected

# Or
@pytest.fixture
def event_loop():
    loop = asyncio.get_event_loop()
    yield loop
    loop.close()
```

---

## Edge Cases

### Test Edge Cases Systematically

```python
def divide(a, b):
    if b == 0:
        raise ValueError("Cannot divide by zero")
    return a / b

class TestDivide:
    def test_normal_division(self):
        assert divide(10, 2) == 5
    
    def test_decimal_result(self):
        assert divide(7, 2) == 3.5
    
    def test_zero_numerator(self):
        assert divide(0, 5) == 0
    
    def test_zero_denominator(self):
        with pytest.raises(ValueError):
            divide(10, 0)
```

---

## Self-Assessment

- [ ] I apply testing patterns
- [ ] I parametrize tests
- [ ] I organize test suites
- [ ] I test edge cases

---

**Next: [Lesson 1.1.102: CAPSTONE PROJECT Testing Best Practices](Lesson-1.1.102-CAPSTONE.md)**




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

1. Clarify one concrete goal for: Advanced Testing Patterns.
2. Implement the smallest working version for: Advanced Testing Patterns.
3. Handle one invalid-input case explicitly.
4. Refactor repeated logic into a named function.

```python
LESSON_ID = "1.1.101"
LESSON_TOPIC = "Advanced Testing Patterns"

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

**Next Lesson**: [Lesson 1.1.102: CAPSTONE PROJECT Testing Best Practices](Lesson-1.1.102-CAPSTONE.md)

