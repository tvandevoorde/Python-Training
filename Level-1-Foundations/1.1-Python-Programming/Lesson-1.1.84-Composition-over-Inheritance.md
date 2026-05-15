# Lesson 1.1.84: Composition over Inheritance

> Previous Lesson: [Lesson 1.1.83: Multiple Inheritance](Lesson-1.1.83-Multiple-Inheritance.md)

**Estimated Time**: 8 hours | **Difficulty**: Advanced  
**Prerequisites**: Lesson 1.1.83

---

## Learning Objectives

1. **Design** with composition
2. **Choose** composition vs inheritance
3. **Implement** has-a relationships
4. **Combine** objects effectively
5. **Design** flexible systems

---

## Introduction: Why This Matters

Composition over Inheritance matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Composition

### Has-A Relationship

```python
class Engine:
    def start(self):
        return "Engine started"

class Car:
    def __init__(self):
        self.engine = Engine()  # Has-a relationship
    
    def start(self):
        return self.engine.start()

car = Car()
print(car.start())  # Engine started
```

### Composition Benefits

```python
class Musician:
    def __init__(self, name, instrument):
        self.name = name
        self.instrument = instrument
    
    def play(self):
        return f"{self.name} plays {self.instrument.type()}"

class Guitar:
    def type(self):
        return "guitar"

class Piano:
    def type(self):
        return "piano"

musician1 = Musician("Alice", Guitar())
musician2 = Musician("Bob", Piano())

print(musician1.play())  # Alice plays guitar
print(musician2.play())  # Bob plays piano
```

---

## Self-Assessment

- [ ] I design with composition
- [ ] I choose composition vs inheritance
- [ ] I implement has-a relationships
- [ ] I design flexible systems

---

**Next: [Lesson 1.1.85: Abstract Base Classes](Lesson-1.1.85-Abstract-Base-Classes.md)**




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

1. Clarify one concrete goal for: Composition over Inheritance.
2. Implement the smallest working version for: Composition over Inheritance.
3. Handle one invalid-input case explicitly.
4. Refactor repeated logic into a named function.

```python
LESSON_ID = "1.1.84"
LESSON_TOPIC = "Composition over Inheritance"

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

**Next Lesson**: [Lesson 1.1.85: Abstract Base Classes](Lesson-1.1.85-Abstract-Base-Classes.md)

