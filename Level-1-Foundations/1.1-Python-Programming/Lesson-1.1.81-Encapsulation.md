# Lesson 1.1.81: Encapsulation

> Previous Lesson: [Lesson 1.1.80: Inheritance Basics](Lesson-1.1.80-Inheritance-Basics.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.80

---

## Learning Objectives

1. **Implement** private and protected attributes
2. **Use** name mangling
3. **Control** attribute access
4. **Design** encapsulated classes
5. **Apply** access control principles

---

## Introduction: Why This Matters

Encapsulation matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Private Attributes

### Name Mangling

```python
class BankAccount:
    def __init__(self, balance):
        self.__balance = balance  # Private (name mangling)
    
    def deposit(self, amount):
        self.__balance += amount
    
    def get_balance(self):
        return self.__balance

account = BankAccount(1000)
account.deposit(500)
print(account.get_balance())  # 1500
# print(account.__balance)    # AttributeError
# print(account._BankAccount__balance)  # Works but don't do this!
```

### Protected Attributes

```python
class Vehicle:
    def __init__(self, speed):
        self._speed = speed  # Protected (single underscore)
    
    def get_speed(self):
        return self._speed

class Car(Vehicle):
    def accelerate(self):
        self._speed += 10  # Subclasses can access
```

---

## Self-Assessment

- [ ] I use private attributes correctly
- [ ] I understand name mangling
- [ ] I apply access control
- [ ] I design encapsulated classes

---

**Next: [Lesson 1.1.82: Properties & Getters/Setters](Lesson-1.1.82-Properties-Getters-Setters.md)**




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

1. Clarify one concrete goal for: Encapsulation.
2. Implement the smallest working version for: Encapsulation.
3. Handle one invalid-input case explicitly.
4. Refactor repeated logic into a named function.

```python
LESSON_ID = "1.1.81"
LESSON_TOPIC = "Encapsulation"

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

**Next Lesson**: [Lesson 1.1.82: Properties & Getters/Setters](Lesson-1.1.82-Properties-Getters-Setters.md)

