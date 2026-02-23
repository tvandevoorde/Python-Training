# Lesson 1.1.85: Abstract Base Classes

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
