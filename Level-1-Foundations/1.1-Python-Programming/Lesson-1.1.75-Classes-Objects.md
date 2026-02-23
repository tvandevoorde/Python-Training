# Lesson 1.1.75: Classes & Objects

**Estimated Time**: 8 hours | **Difficulty**: Intermediate-Advanced  
**Prerequisites**: Lesson 1.1.24 (Function Basics), Lesson 1.1.28 (Scope)

---

## Learning Objectives

By the end of this lesson, you will:

1. Understand object-oriented programming (OOP) fundamentals
2. Create classes and instantiate objects
3. Use `__init__` for initialization
4. Implement instance methods
5. Use `self` correctly
6. Manage instance state
7. Design effective classes
8. Apply OOP to real-world problems

---

## 1. What is OOP?

Object-Oriented Programming organizes code around **objects** that contain both data and behavior.

### Compare: Procedural vs. OOP

**Procedural (Functions)**:
```python
# Data
user_name = "Alice"
user_age = 30
user_email = "alice@example.com"

# Functions operate on data
def birthday(name):
    # ...
```

**OOP (Classes)**:
```python
class User:
    def __init__(self, name, age, email):
        self.name = name
        self.age = age
        self.email = email
    
    def birthday(self):
        self.age += 1

alice = User("Alice", 30, "alice@example.com")
alice.birthday()  # Now 31
```

**Benefits of OOP:**
- Data and related operations grouped together
- Reusability through inheritance
- Clearer code organization
- Easier to maintain and extend

---

## 2. Creating Classes

### Basic Class Definition

```python
class User:
    """A class representing a user"""
    
    def __init__(self, name, email):
        """Initialize a User"""
        self.name = name
        self.email = email
    
    def greet(self):
        """Return a greeting"""
        return f"Hello, {self.name}!"

# Create instance
alice = User("Alice", "alice@example.com")
print(alice.name)  # Alice
print(alice.greet())  # Hello, Alice!
```

### Constructor: `__init__`

```python
class Car:
    def __init__(self, make, model, year):
        self.make = make
        self.model = model
        self.year = year
        self.speed = 0  # Initialize state
    
    def accelerate(self, amount):
        self.speed += amount
    
    def brake(self):
        self.speed = 0

my_car = Car("Toyota", "Camry", 2023)
my_car.accelerate(50)
print(my_car.speed)  # 50
```

---

## 3. Instance Variables and Methods

### Instance Variables (Data)

```python
class Student:
    def __init__(self, name, grade):
        self.name = name  # Instance variable
        self.grade = grade
        self.courses = []  # Mutable instance variable

alice = Student("Alice", "A")
alice.courses.append("Math")

bob = Student("Bob", "B")
# bob.courses is empty - different object!
```

### Instance Methods (Behavior)

```python
class BankAccount:
    def __init__(self, owner, balance):
        self.owner = owner
        self.balance = balance
    
    def deposit(self, amount):
        """Add money to account"""
        self.balance += amount
        return f"Deposited ${amount}"
    
    def withdraw(self, amount):
        """Remove money from account"""
        if amount > self.balance:
            return "Insufficient funds"
        self.balance -= amount
        return f"Withdrew ${amount}"
    
    def get_balance(self):
        """Return current balance"""
        return self.balance

account = BankAccount("Alice", 1000)
print(account.deposit(500))    # Deposited $500
print(account.withdraw(200))   # Withdrew $200
print(account.get_balance())   # 1300
```

---

## 4. The `self` Parameter

Every instance method receives `self` as the first parameter:

```python
class Dog:
    def __init__(self, name):
        self.name = name  # self refers to the specific instance
    
    def bark(self):
        print(f"{self.name} says woof!")

# What happens internally:
# alice = Dog("Buddy")
# alice.bark() is equivalent to Dog.bark(alice)

alice = Dog("Buddy")
alice.bark()  # Buddy says woof!

bob = Dog("Max")
bob.bark()  # Max says woof!
```

---

## 5. Designing Effective Classes

### Bad Design (Too Generic)

```python
class Thing:  # Unclear name
    def __init__(self, x):
        self.x = x
    
    def do_something(self):  # Unclear action
        return self.x * 2
```

### Good Design (Clear and Focused)

```python
class Rectangle:  # Clear name
    """Represents a rectangle with length and width"""
    
    def __init__(self, length, width):
        self.length = length
        self.width = width
    
    def area(self):
        """Calculate area"""
        return self.length * self.width
    
    def perimeter(self):
        """Calculate perimeter"""
        return 2 * (self.length + self.width)
```

---

## 6. Mini-Project: Library System

```python
class Book:
    def __init__(self, title, author, isbn):
        self.title = title
        self.author = author
        self.isbn = isbn
        self.available = True
    
    def checkout(self):
        if self.available:
            self.available = False
            return f"Checked out: {self.title}"
        return f"Not available: {self.title}"
    
    def return_book(self):
        self.available = True
        return f"Returned: {self.title}"

class Library:
    def __init__(self, name):
        self.name = name
        self.books = []
    
    def add_book(self, book):
        self.books.append(book)
    
    def find_book(self, title):
        for book in self.books:
            if book.title == title:
                return book
        return None
    
    def available_count(self):
        return sum(1 for book in self.books if book.available)

# Usage
library = Library("City Library")
library.add_book(Book("1984", "George Orwell", "123456"))
library.add_book(Book("Brave New World", "Aldous Huxley", "789012"))

book = library.find_book("1984")
print(book.checkout())  # Checked out: 1984
print(library.available_count())  # 1
```

---

## 7. Graded Exercises

### Starter Level

**Exercise 1**: Simple Class

Create a `Circle` class with radius, and methods for `area()` and `circumference()`.

**Exercise 2**: Multiple Instances

Create a `Todo` class with task and completed status. Create 3 instances and mark some complete.

### Intermediate Level

**Exercise 3**: Movie Catalog

Create `Movie` class and `Catalog` class to manage a collection.

**Exercise 4**: Bank System

Create `Account` class with deposit, withdraw, and interest calculation.

### Advanced Level

**Exercise 5**: Game Character

Create `Character` class for game with health, experience, and leveling.

**Exercise 6**: E-Commerce

Create `Product`, `Cart`, and `Order` classes for shopping system.

---

## Self-Assessment Checklist

- [ ] I understand OOP concepts
- [ ] I can create and use classes
- [ ] I understand `__init__` and instance variables
- [ ] I can write instance methods
- [ ] I understand `self` parameter
- [ ] I can design effective classes
- [ ] I can instantiate multiple objects
- [ ] I can manage object state

---

**Next Lesson**: [1.1.76 - Instance Variables & Methods](Lesson-1.1.76-Instance-Variables-Methods.md)  
**Previous Lesson**: [1.1.61 - MILESTONE TEST: File I/O](Lesson-1.1.61-MILESTONE-TEST-File-IO.md)




