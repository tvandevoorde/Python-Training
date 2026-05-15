# Lesson 1.1.77: Class Variables & Methods

> Previous Lesson: [Lesson 1.1.76: Instance Variables & Methods](Lesson-1.1.76-Instance-Variables-Methods.md)

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.1.76

---

## Learning Objectives

1. **Create** class variables
2. **Distinguish** class from instance variables
3. **Use** @classmethod decorator
4. **Implement** class methods
5. **Understand** shared state across instances
6. **Apply** class variables appropriately

---

## Introduction: Why This Matters

Class Variables & Methods matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Class Variables

### Shared StateAcross Instances

```python
class Dog:
    # Class variable (shared by all instances)
    species = "Canis familiaris"
    count = 0
    
    def __init__(self, name):
        self.name = name      # Instance variable
        Dog.count += 1        # Modify class variable
    
    def info(self):
        return f"{self.name} is a {Dog.species}"

dog1 = Dog("Rex")
dog2 = Dog("Buddy")

print(Dog.count)      # 2 (class variable)
print(dog1.species)   # Canis familiaris (accessible via instance)
```

---

## Class Methods

### @classmethod Decorator

```python
from datetime import datetime

class Person:
    planet = "Earth"
    
    def __init__(self, name):
        self.name = name
    
    @classmethod
    def species_type(cls):
        """Class method receives cls instead of self."""
        return "Homo sapiens"
    
    @classmethod
    def from_birth_year(cls, name, birth_year):
        """Factory method using classmethod."""
        age = datetime.now().year - birth_year
        return cls(name)

person1 = Person.from_birth_year("Alice", 1990)
print(person1.name)  # Alice
```

---

## Self-Assessment

- [ ] I understand class variables
- [ ] I distinguish class from instance variables
- [ ] I use @classmethod correctly
- [ ] I implement factory methods
- [ ] I understand shared  state
- [ ] I apply class variables appropriately

---

**Next: [Lesson 1.1.78: Static Methods](Lesson-1.1.78-Static-Methods.md)**




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

1. Clarify one concrete goal for: Class Variables & Methods.
2. Implement the smallest working version for: Class Variables & Methods.
3. Handle one invalid-input case explicitly.
4. Refactor repeated logic into a named function.

```python
LESSON_ID = "1.1.77"
LESSON_TOPIC = "Class Variables & Methods"

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

**Next Lesson**: [Lesson 1.1.78: Static Methods](Lesson-1.1.78-Static-Methods.md)

