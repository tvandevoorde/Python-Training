# Lesson 1.1.83: Multiple Inheritance

**Estimated Time**: 8 hours | **Difficulty**: Advanced  
**Prerequisites**: Lesson 1.1.82

---

## Learning Objectives

1. **Implement** multiple inheritance
2. **Understand** Method Resolution Order (MRO)
3. **Resolve** diamond problem
4. **Apply** multiple inheritance appropriately

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
