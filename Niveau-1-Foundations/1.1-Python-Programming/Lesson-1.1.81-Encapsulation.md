# Lesson 1.1.81: Encapsulation

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.80

---

## Learning Objectives

1. **Implement** private and protected attributes
2. **Use** name mangling
3. **Control** attribute access
4. **Design** encapsulated classes
5. **Apply** access control principles

---

## Private Attributes

### Name Mangling

```python
class BankAccount:
    def __init__(self, balance):
        self.__balance = balance  # Private (name mangling)
    
    def deposit(self, amount):
        self.__balance += amount
    
    def get_balance(self):
        return self.__balance

account = BankAccount(1000)
account.deposit(500)
print(account.get_balance())  # 1500
# print(account.__balance)    # AttributeError
# print(account._BankAccount__balance)  # Works but don't do this!
```

### Protected Attributes

```python
class Vehicle:
    def __init__(self, speed):
        self._speed = speed  # Protected (single underscore)
    
    def get_speed(self):
        return self._speed

class Car(Vehicle):
    def accelerate(self):
        self._speed += 10  # Subclasses can access
```

---

## Self-Assessment

- [ ] I use private attributes correctly
- [ ] I understand name mangling
- [ ] I apply access control
- [ ] I design encapsulated classes

---

**Next: [Lesson 1.1.82: Properties & Getters/Setters](Lesson-1.1.82-Properties-Getters-Setters.md)**
