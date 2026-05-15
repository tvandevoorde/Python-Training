# Lesson 1.1.85: Abstract Base Classes

> Previous Lesson: [Lesson 1.1.84: Composition over Inheritance](Lesson-1.1.84-Composition-over-Inheritance.md)

**Estimated Time**: 8 hours | **Difficulty**: Advanced  
**Prerequisites**: Lesson 1.1.84

---

## Learning Objectives

1. **Understand** abstract base classes
2. **Enforce** contracts
3. **Create** abstract methods
4. **Design** interfaces
5. **Build** extensible systems

---

## Introduction: Why This Matters

Abstract Base Classes matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Abstract Base Classes

### Using abc Module

```python
from abc import ABC, abstractmethod

class Animal(ABC):
    @abstractmethod
    def sound(self):
        pass
    
    @abstractmethod
    def move(self):
        pass
    
    def describe(self):
        return f"I am a {self.__class__.__name__}"

class Dog(Animal):
    def sound(self):
        return "Woof!"
    
    def move(self):
        return "Running on four legs"

class Bird(Animal):
    def sound(self):
        return "Tweet!"
    
    def move(self):
        return "Flying"

# dog = Dog()  # Must implement all abstract methods
dog = Dog()
print(dog.sound())      # Woof!
print(dog.describe())   # I am a Dog
```

### Abstract Properties

```python
from abc import ABC, abstractmethod

class Vehicle(ABC):
    @property
    @abstractmethod
    def max_speed(self):
        pass

class Car(Vehicle):
    @property
    def max_speed(self):
        return 200

car = Car()
print(car.max_speed)  # 200
```

---

## Self-Assessment

- [ ] I understand abstract base classes
- [ ] I enforce contracts with ABC
- [ ] I create abstract methods
- [ ] I design extensible systems

---

**Next: [Lesson 1.1.86: Mini-Project Banking System](Lesson-1.1.86-Mini-Project-Banking-System.md)**




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

1. Clarify one concrete goal for: Abstract Base Classes.
2. Implement the smallest working version for: Abstract Base Classes.
3. Handle one invalid-input case explicitly.
4. Refactor repeated logic into a named function.

```python
LESSON_ID = "1.1.85"
LESSON_TOPIC = "Abstract Base Classes"

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

**Next Lesson**: [Lesson 1.1.86: Mini-Project Banking System](Lesson-1.1.86-Mini-Project-Banking-System.md)

