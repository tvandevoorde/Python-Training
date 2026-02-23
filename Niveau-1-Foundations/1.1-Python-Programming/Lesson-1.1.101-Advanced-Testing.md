# Lesson 1.1.101: Advanced Testing Patterns

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
