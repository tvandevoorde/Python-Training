# Lesson 1.1.79: Magic Methods (Dunder Methods)

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




