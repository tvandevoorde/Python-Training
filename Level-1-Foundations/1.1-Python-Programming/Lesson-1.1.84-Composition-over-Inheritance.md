# Lesson 1.1.84: Composition over Inheritance

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




