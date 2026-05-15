# Lesson 1.1.83: Multiple Inheritance

> Previous Lesson: [Lesson 1.1.82: Properties & Getters/Setters](Lesson-1.1.82-Properties-Getters-Setters.md)

**Estimated Time**: 8 hours | **Difficulty**: Advanced  
**Prerequisites**: Lesson 1.1.82

---

## Learning Objectives

1. **Implement** multiple inheritance
2. **Understand** Method Resolution Order (MRO)
3. **Resolve** diamond problem
4. **Apply** multiple inheritance appropriately

---

## Introduction: Why This Matters

Multiple Inheritance matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Multiple Inheritance

### Basic Multiple Inheritance

```python
class Swimmer:
    def swim(self):
        return "Swimming..."

class Flyer:
    def fly(self):
        return "Flying..."

class Duck(Swimmer, Flyer):
    def quack(self):
        return "Quack!"

duck = Duck()
print(duck.swim())   # Swimming...
print(duck.fly())    # Flying...
print(duck.quack())  # Quack!
```

### Method Resolution Order (MRO)

```python
class A:
    def method(self):
        return "A"

class B(A):
    def method(self):
        return "B"

class C(A):
    def method(self):
        return "C"

class D(B, C):
    pass

d = D()
print(d.method())      # B (from MRO)
print(D.mro())         # Shows resolution order
```

---

## Self-Assessment

- [ ] I implement multiple inheritance
- [ ] I understand MRO
- [ ] I resolve conflicts
- [ ] I apply appropriately

---

**Next: [Lesson 1.1.84: Composition over Inheritance](Lesson-1.1.84-Composition-over-Inheritance.md)**




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

1. Clarify one concrete goal for: Multiple Inheritance.
2. Implement the smallest working version for: Multiple Inheritance.
3. Handle one invalid-input case explicitly.
4. Refactor repeated logic into a named function.

```python
LESSON_ID = "1.1.83"
LESSON_TOPIC = "Multiple Inheritance"

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

**Next Lesson**: [Lesson 1.1.84: Composition over Inheritance](Lesson-1.1.84-Composition-over-Inheritance.md)

