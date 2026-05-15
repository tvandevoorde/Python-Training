# Lesson 1.1.78: Static Methods

> Previous Lesson: [Lesson 1.1.77: Class Variables & Methods](Lesson-1.1.77-Class-Variables-Methods.md)

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.1.77

---

## Learning Objectives

1. **Create** static methods using @staticmethod
2. **Distinguish** static, class, and instance methods
3. **Implement** utility functions in classes
4. **Understand** when to use static methods
5. **Apply** static methods appropriately

---

## Introduction: Why This Matters

Static Methods matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Static Methods

### @staticmethod Decorator

```python
class MathUtils:
    @staticmethod
    def add(a, b):
        """Static method - doesn't need self or cls."""
        return a + b
    
    @staticmethod
    def multiply(a, b):
        return a * b

# No instance needed
print(MathUtils.add(5, 3))  # 8

# Also works on instances
calc = MathUtils()
print(calc.multiply(4, 7))  # 28
```

### Comparison

```python
class Example:
    class_var = "shared"
    
    def instance_method(self):
        # Receives self - accesses instance data
        return f"Instance: {self.class_var}"
    
    @classmethod
    def class_method(cls):
        # Receives cls - accesses class data
        return f"Class: {cls.class_var}"
    
    @staticmethod
    def static_method():
        # No self or cls - pure utility
        return "Static: no access to instance or class data"
```

---

## Self-Assessment

- [ ] I use @staticmethod effectively
- [ ] I distinguish method types
- [ ] I choose appropriate method type
- [ ] I implement utility functions

---

**Next: [Lesson 1.1.79: Magic Methods](Lesson-1.1.79-Magic-Methods-Dunder.md)**




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

1. Clarify one concrete goal for: Static Methods.
2. Implement the smallest working version for: Static Methods.
3. Handle one invalid-input case explicitly.
4. Refactor repeated logic into a named function.

```python
LESSON_ID = "1.1.78"
LESSON_TOPIC = "Static Methods"

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

**Next Lesson**: [Lesson 1.1.79: Magic Methods (Dunder Methods)](Lesson-1.1.79-Magic-Methods-Dunder.md)

