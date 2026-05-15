# Lesson 1.1.79: Magic Methods (Dunder Methods)

> Previous Lesson: [Lesson 1.1.78: Static Methods](Lesson-1.1.78-Static-Methods.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.78

---

## Learning Objectives

1. **Implement** __str__ and __repr__
2. **Use** __len__, __getitem__, __setitem__
3. **Implement** comparison methods
4. **Understand** operator overloading
5. **Create** Pythonic classes
6. **Apply** magic methods effectively

---

## Introduction: Why This Matters

Magic Methods (Dunder Methods) matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Common Magic Methods

### __str__ and __repr__

```python
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age
    
    def __str__(self):
        """User-friendly string."""
        return f"{self.name} (age {self.age})"
    
    def __repr__(self):
        """Developer-friendly representation."""
        return f"Person({self.name!r}, {self.age})"

person = Person("Alice", 30)
print(str(person))     # Alice (age 30)
print(repr(person))    # Person('Alice', 30)
```

### Comparison Methods

```python
class Book:
    def __init__(self, title, pages):
        self.title = title
        self.pages = pages
    
    def __eq__(self, other):
        return self.pages == other.pages
    
    def __lt__(self, other):
        return self.pages < other.pages
    
    def __gt__(self, other):
        return self.pages > other.pages

book1 = Book("Python", 400)
book2 = Book("Ruby", 500)

print(book1 == book2)  # False
print(book1 < book2)   # True
```

### Container Methods

```python
class List:
    def __init__(self, items):
        self.items = items
    
    def __len__(self):
        return len(self.items)
    
    def __getitem__(self, index):
        return self.items[index]
    
    def __setitem__(self, index, value):
        self.items[index] = value

lst = List([1, 2, 3])
print(len(lst))   # 3
print(lst[0])     # 1
lst[0] = 10
print(lst[0])     # 10
```

---

## Self-Assessment

- [ ] I implement __str__ and __repr__
- [ ] I use comparison magic methods
- [ ] I implement container methods
- [ ] I understand operator overloading
- [ ] I create Pythonic classes

---

**Next: [Lesson 1.1.80: Inheritance Basics](Lesson-1.1.80-Inheritance-Basics.md)**




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

1. Clarify one concrete goal for: Magic Methods (Dunder Methods).
2. Implement the smallest working version for: Magic Methods (Dunder Methods).
3. Handle one invalid-input case explicitly.
4. Refactor repeated logic into a named function.

```python
LESSON_ID = "1.1.79"
LESSON_TOPIC = "Magic Methods (Dunder Methods)"

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

**Next Lesson**: [Lesson 1.1.80: Inheritance Basics](Lesson-1.1.80-Inheritance-Basics.md)

