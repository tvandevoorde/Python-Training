# Lesson 1.1.87: MILESTONE TEST OOP Basics

**Estimated Time**: 6 hours | **Difficulty**: Assessment  
**Prerequisites**: All Topic 7 lessons (1.1.75-1.1.86)

---

## Assessment Overview

This milestone test covers all Object-Oriented Programming concepts: classes, inheritance, encapsulation, properties, composition, and abstract base classes.

**Format**: 60 points total
- Written Questions: 20 points
- Coding Challenges: 30 points
- Project: 10 points

---

## Section 1: Written Questions (20 points)

### Question 1 (3 points)
**Explain the difference between a class and an instance. Provide an example.**

*Expected Answer*:
- Class: Blueprint/template
- Instance: Specific object created from the class
- Example: `class Dog:` is blueprint, `my_dog = Dog()` is instance

### Question 2 (3 points)
**What is the purpose of the `self` parameter in methods?**

*Expected Answer*:
- Refers to the current instance
- Allows access to instance variables and methods
- Makes instance-specific data accessible

### Question 3 (3 points)
**Compare class variables and instance variables. When would you use each?**

*Expected Answer*:
- Instance: Unique per object (`self.age`)
- Class: Shared across all instances (`Dog.species`)
- Use instance for individual data, class for shared data

### Question 4 (3 points)
**What is inheritance and give an example of when you'd use it.**

*Expected Answer*:
- Inheritance: Creating child class from parent class
- Example: Vehicle (parent), Car (child)
- Use for is-a relationships

### Question 5 (3 points)
**Explain composition and contrast it with inheritance.**

*Expected Answer*:
- Composition: Has-a relationship (objects contain other objects)
- Inheritance: Is-a relationship (objects are types of other objects)
- Composition often more flexible than inheritance

### Question 6 (2 points)
**What problem does properties (@property) solve?**

*Expected Answer*:
- Allows validation on access
- Provides computed properties
- Maintains Pythonic interface (no get/set methods)

---

## Section 2: Coding Challenges (30 points)

### Challenge 1: Class Definition (10 points)

**Problem**: Create a `Rectangle` class with:
- Attributes: width, height
- Method: area() and perimeter()
- Property: is_square (True if width == height)
- Docstring for all

```python
# Example solution
class Rectangle:
    """A rectangle defined by width and height."""
    
    def __init__(self, width: float, height: float):
        """Initialize a rectangle."""
        self.width = width
        self.height = height
    
    def area(self) -> float:
        """Calculate area."""
        return self.width * self.height
    
    def perimeter(self) -> float:
        """Calculate perimeter."""
        return 2 * (self.width + self.height)
    
    @property
    def is_square(self) -> bool:
        """Check if rectangle is a square."""
        return self.width == self.height

# Test
rect = Rectangle(5, 10)
print(rect.area())       # 50
print(rect.is_square)    # False

square = Rectangle(5, 5)
print(square.is_square)  # True
```

**Grading**:
- [ ] Class structure correct (2 pts)
- [ ] Methods implemented correctly (4 pts)
- [ ] Property works correctly (3 pts)
- [ ] Documentation present (1 pt)

---

### Challenge 2: Inheritance (10 points)

**Problem**: Create an inheritance hierarchy:
- `Shape` parent class with abstract area()
- `Circle` child class
- `Triangle` child class
- Each with proper area calculation
- Use ABC if possible

```python
# Example solution
from abc import ABC, abstractmethod
import math

class Shape(ABC):
    """Abstract shape class."""
    
    @abstractmethod
    def area(self) -> float:
        """Calculate area."""
        pass

class Circle(Shape):
    """Circle shape."""
    
    def __init__(self, radius: float):
        self.radius = radius
    
    def area(self) -> float:
        """Calculate circle area."""
        return math.pi * self.radius ** 2

class Triangle(Shape):
    """Triangle shape."""
    
    def __init__(self, base: float, height: float):
        self.base = base
        self.height = height
    
    def area(self) -> float:
        """Calculate triangle area."""
        return 0.5 * self.base * self.height

# Test
circle = Circle(5)
print(f"Circle area: {circle.area():.2f}")

triangle = Triangle(10, 8)
print(f"Triangle area: {triangle.area()}")
```

**Grading**:
- [ ] Inheritance structure (3 pts)
- [ ] Proper abstraction (2 pts)
- [ ] Correct area calculations (3 pts)
- [ ] Code quality (2 pts)

---

### Challenge 3: Composition (10 points)

**Problem**: 
- Create `Author` class (name, email)
- Create `Book` class that has an Author
- Add methods to print book info
- Demonstrate composition

```python
# Example solution
class Author:
    """Author of a book."""
    
    def __init__(self, name: str, email: str):
        self.name = name
        self.email = email

class Book:
    """Book with author."""
    
    def __init__(self, title: str, author: Author, year: int):
        self.title = title
        self.author = author
        self.year = year
    
    def info(self) -> str:
        """Get book information."""
        return (f"'{self.title}' by {self.author.name} "
                f"({self.year})")

# Test
author = Author("Jane Austen", "jane@example.com")
book = Book("Pride and Prejudice", author, 1813)
print(book.info())
```

**Grading**:
- [ ] Author class complete (2 pts)
- [ ] Book class with composition (3 pts)
- [ ] Proper info() method (3 pts)
- [ ] Correct usage (2 pts)

---

## Section 3: Project (10 points)

### Mini Challenge: Employee Management System

**Requirements**:
1. Create `Employee` parent class
2. Create `Manager` child class (supervises employees)
3. Create `Contractor` child class (has contract_end_date)
4. Manager can add/remove employees
5. Display hierarchy

```python
# Example solution
class Employee:
    """Base employee class."""
    
    def __init__(self, name: str, employee_id: str, salary: float):
        self.name = name
        self.employee_id = employee_id
        self.salary = salary
    
    def display(self) -> str:
        return f"{self.name} (ID: {self.employee_id})"

class Manager(Employee):
    """Manager supervises employees."""
    
    def __init__(self, name: str, employee_id: str, salary: float):
        super().__init__(name, employee_id, salary)
        self.team = []
    
    def add_employee(self, employee: Employee) -> None:
        """Add employee to team."""
        self.team.append(employee)
    
    def display_team(self) -> str:
        """Display team members."""
        result = f"\n{self.display()} manages:\n"
        for emp in self.team:
            result += f"  - {emp.display()}\n"
        return result

class Contractor(Employee):
    """Contractor with end date."""
    
    def __init__(self, name: str, employee_id: str, 
                 salary: float, contract_end: str):
        super().__init__(name, employee_id, salary)
        self.contract_end = contract_end
    
    def display(self) -> str:
        return f"{super().display()} (Contract ends: {self.contract_end})"

# Test
manager = Manager("Alice", "M001", 80000)
emp1 = Employee("Bob", "E001", 50000)
contractor = Contractor("Carol", "C001", 45000, "2024-12-31")

manager.add_employee(emp1)
manager.add_employee(contractor)

print(manager.display_team())
```

**Grading**:
- [ ] Class hierarchy correct (3 pts)
- [ ] Manager functionality (3 pts)
- [ ] Contractor implementation (2 pts)
- [ ] Code quality and testing (2 pts)

---

## Self-Assessment

- [ ] I understand class design
- [ ] I use inheritance correctly
- [ ] I implement encapsulation
- [ ] I combine OOP concepts
- [ ] I build scalable systems

---

## Answer Key Summary

| Question | Key Concept | Expected Quality |
|----------|-------------|-----------------|
| 1-6 | Foundational OOP | Clear explanations |
| Challenge 1 | Class design | Working code + docs |
| Challenge 2 | Inheritance | Proper abstraction |
| Challenge 3 | Composition | Clear has-a relationship |
| Project | Integration | Full system working |

---

**Course Progress**: 87/102 lessons complete (85%)

---

**Next: [Lesson 1.1.88: Modules & Packages](Lesson-1.1.88-Modules-Packages.md)**




