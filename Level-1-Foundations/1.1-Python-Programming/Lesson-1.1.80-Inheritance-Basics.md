# Lesson 1.1.80: Inheritance Basics

> Previous Lesson: [Lesson 1.1.79: Magic Methods (Dunder Methods)](Lesson-1.1.79-Magic-Methods-Dunder.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.79

---

## Learning Objectives

1. **Create** parent and child classes
2. **Override** parent methods
3. **Use** super() function
4. **Understand** inheritance hierarchy
5. **Apply** is-a relationships
6. **Design** inheritance structures

---

## Introduction: Why This Matters

Inheritance Basics matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Basic Inheritance

### Parent and Child Classes

```python
class Animal:
    def __init__(self, name):
        self.name = name
    
    def speak(self):
        return f"{self.name} makes a sound"

class Dog(Animal):
    def speak(self):  # Override
        return f"{self.name} barks!"

class Cat(Animal):
    def speak(self):  # Override
        return f"{self.name} meows!"

dog = Dog("Rex")
cat = Cat("Whiskers")

print(dog.speak())  # Rex barks!
print(cat.speak())  # Whiskers meows!
```

### Using super()

```python
class Vehicle:
    def __init__(self, brand):
        self.brand = brand
    
    def info(self):
        return f"Brand: {self.brand}"

class Car(Vehicle):
    def __init__(self, brand, doors):
        super().__init__(brand)  # Call parent __init__
        self.doors = doors
    
    def info(self):
        return f"{super().info()}, Doors: {self.doors}"

car = Car("Toyota", 4)
print(car.info())  # Brand: Toyota, Doors: 4
```

---

## Self-Assessment

- [ ] I create parent and child classes
- [ ] I override methods appropriately
- [ ] I use super() correctly
- [ ] I understand inheritance hierarchy
- [ ] I apply is-a relationships

---

**Next: [Lesson 1.1.81: Encapsulation](Lesson-1.1.81-Encapsulation.md)**




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

1. Clarify one concrete goal for: Inheritance Basics.
2. Implement the smallest working version for: Inheritance Basics.
3. Handle one invalid-input case explicitly.
4. Refactor repeated logic into a named function.

```python
LESSON_ID = "1.1.80"
LESSON_TOPIC = "Inheritance Basics"

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

**Next Lesson**: [Lesson 1.1.81: Encapsulation](Lesson-1.1.81-Encapsulation.md)

