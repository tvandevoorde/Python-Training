# Lesson 1.1.82: Properties & Getters/Setters

> Previous Lesson: [Lesson 1.1.81: Encapsulation](Lesson-1.1.81-Encapsulation.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.81

---

## Learning Objectives

1. **Use** @property decorator
2. **Implement** getters and setters
3. **Create** computed properties
4. **Validate** on property access
5. **Design** properties appropriately

---

## Introduction: Why This Matters

Properties & Getters/Setters matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Properties

### @property Decorator

```python
class Temperature:
    def __init__(self, celsius):
        self._celsius = celsius
    
    @property
    def fahrenheit(self):
        return self._celsius * 9/5 + 32
    
    @property
    def celsius(self):
        return self._celsius
    
    @celsius.setter
    def celsius(self, value):
        if value < -273.15:
            raise ValueError("Invalid temperature")
        self._celsius = value

temp = Temperature(25)
print(temp.fahrenheit)      # 77.0
temp.celsius = 30           # Uses setter
print(temp.celsius)         # 30
```

---

## Self-Assessment

- [ ] I use @property decorator
- [ ] I implement getters and setters
- [ ] I create computed properties
- [ ] I validate on access
- [ ] I design properties effectively

---

**Next: [Lesson 1.1.83: Multiple Inheritance](Lesson-1.1.83-Multiple-Inheritance.md)**




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

1. Clarify one concrete goal for: Properties & Getters/Setters.
2. Implement the smallest working version for: Properties & Getters/Setters.
3. Handle one invalid-input case explicitly.
4. Refactor repeated logic into a named function.

```python
LESSON_ID = "1.1.82"
LESSON_TOPIC = "Properties & Getters/Setters"

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

**Next Lesson**: [Lesson 1.1.83: Multiple Inheritance](Lesson-1.1.83-Multiple-Inheritance.md)

