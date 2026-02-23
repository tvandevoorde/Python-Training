# Lesson 1.1.76: Instance Variables & Methods

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.1.75 (Classes & Objects)

---

## Learning Objectives

1. **Create** instance variables in `__init__`
2. **Define** instance methods
3. **Use** the `self` parameter correctly
4. **Modify** instance state
5. **Access** instance variables
6. **Implement** behavior specific to instances
7. **Distinguish** instance from class variables

---

## Instance Variables

### Creating Instance Variables

```python
class Person:
    def __init__(self, name, age):
        self.name = name      # Instance variable
        self.age = age        # Instance variable
    
    def greet(self):
        return f"Hello, I'm {self.name}"

person1 = Person("Alice", 30)
person2 = Person("Bob", 25)

print(person1.name)  # Alice
print(person2.name)  # Bob (different instance)
```

### Instance Methods

```python
class BankAccount:
    def __init__(self, account_id, balance):
        self.account_id = account_id
        self.balance = balance
    
    def deposit(self, amount):
        """Instance method - modifies state."""
        if amount > 0:
            self.balance += amount
            return True
        return False
    
    def withdraw(self, amount):
        """Instance method - modifies state."""
        if 0 < amount <= self.balance:
            self.balance -= amount
            return True
        return False
    
    def get_balance(self):
        """Instance method - returns state."""
        return self.balance

# Usage
account = BankAccount("001", 1000)
account.deposit(500)
print(account.get_balance())  # 1500
```

---

## self Parameter

### Understanding self

```python
class Dog:
    def __init__(self, name):
        self.name = name
    
    def bark(self):
        # self refers to the specific instance
        return f"{self.name} says woof!"

dog1 = Dog("Rex")
dog2 = Dog("Buddy")

# These are equivalent:
print(dog1.bark())           # Rex says woof!
print(Dog.bark(dog1))        # Rex says woof! (explicit self)
```

---

## Graded Exercises

### Starter Level

1. Create class with 2-3 instance variables
2. Implement 3-4 instance methods
3. Create multiple instances and test

### Intermediate Level

1. Create class with 5+ instance variables
2. Implement 5+ instance methods
3. Modify instance state through methods
4. Write tests for all methods

### Advanced Level

1. Complex class with multiple instance methods
2. Methods interacting with each other
3. Proper encapsulation
4. Comprehensive testing

---

## Self-Assessment

- [ ] I create instance variables in __init__
- [ ] I use self correctly
- [ ] I define instance methods
- [ ] I modify instance state
- [ ] I access instance variables properly
- [ ] I understand instance independence

---

**Next: [Lesson 1.1.77: Class Variables & Methods](Lesson-1.1.77-Class-Variables-Methods.md)**




