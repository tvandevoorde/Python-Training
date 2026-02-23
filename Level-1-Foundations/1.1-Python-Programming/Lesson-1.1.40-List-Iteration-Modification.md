# Lesson 1.1.40: List Iteration & Modification

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.1.39 (Lists Fundamentals)

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Iterate through lists using for loops
- Modify lists in place using various methods
- Add, remove, and replace list elements
- Use enumerate() and zip() for advanced iteration
- Understand list methods and their side effects
- Work with list indices during modification

---

## 1. Iterating Through Lists (75 min)

### 1.1 Basic For Loop Iteration

```python
# Simple iteration
numbers = [1, 2, 3, 4, 5]
for num in numbers:
    print(num)

# String iteration
colors = ["red", "green", "blue"]
for color in colors:
    print(f"Color: {color}")

# Mixed types
mixed = [1, "hello", 3.14, True]
for item in mixed:
    print(f"{item} is type {type(item)}")
```

### 1.2 Index-Based Iteration with range()

```python
# Access by index
numbers = [10, 20, 30, 40]
for i in range(len(numbers)):
    print(f"Index {i}: {numbers[i]}")

# When you need the index and value
fruits = ["apple", "banana", "cherry"]
for i in range(len(fruits)):
    numbers[i] = numbers[i] * 2  # Can modify while iterating with index
```

### 1.3 enumerate() - Index and Value Together

```python
# enumerate returns (index, value) tuples
fruits = ["apple", "banana", "cherry"]

for i, fruit in enumerate(fruits):
    print(f"{i}: {fruit}")
# Output:
# 0: apple
# 1: banana
# 2: cherry

# Start index from 1
for i, fruit in enumerate(fruits, start=1):
    print(f"{i}: {fruit}")
# Output:
# 1: apple
# 2: banana
# 3: cherry
```

---

## 2. Modifying Lists (75 min)

### 2.1 Adding Elements

```python
# append() - add to end O(1)
numbers = [1, 2, 3]
numbers.append(4)
print(numbers)  # [1, 2, 3, 4]

# insert() - add at specific position O(n)
numbers.insert(0, 0)
print(numbers)  # [0, 1, 2, 3, 4]

numbers.insert(2, 1.5)
print(numbers)  # [0, 1, 1.5, 2, 3, 4]

# extend() - add multiple elements O(k) where k is items being added
numbers = [1, 2, 3]
numbers.extend([4, 5, 6])
print(numbers)  # [1, 2, 3, 4, 5, 6]

# += with list (same as extend)
numbers += [7, 8]
print(numbers)  # [1, 2, 3, 4, 5, 6, 7, 8]
```

### 2.2 Removing Elements

```python
# remove() - remove first occurrence by value O(n)
numbers = [1, 2, 3, 2, 4]
numbers.remove(2)
print(numbers)  # [1, 3, 2, 4]

# pop() - remove and return by index O(1) if end, O(n) if start
numbers = [10, 20, 30, 40]
last = numbers.pop()
print(last)      # 40
print(numbers)   # [10, 20, 30]

first = numbers.pop(0)
print(first)     # 10
print(numbers)   # [20, 30]

# del - delete by index or slice
numbers = [1, 2, 3, 4, 5]
del numbers[0]
print(numbers)   # [2, 3, 4, 5]

del numbers[1:3]
print(numbers)   # [2, 5]

# clear() - remove all elements
numbers = [1, 2, 3]
numbers.clear()
print(numbers)   # []
```

### 2.3 Replacing Elements

```python
# Direct assignment
numbers = [1, 2, 3, 4, 5]
numbers[2] = 30
print(numbers)   # [1, 2, 30, 4, 5]

# Slice assignment
numbers = [1, 2, 3, 4, 5]
numbers[1:3] = [20, 30]
print(numbers)   # [1, 20, 30, 4, 5]

# Replace with different length
numbers = [1, 2, 3, 4, 5]
numbers[1:4] = [99]
print(numbers)   # [1, 99, 5]
```

---

## 3. Advanced Iteration Techniques (75 min)

### 3.1 zip() - Iterate Multiple Lists

```python
# Combine two lists for parallel iteration
names = ["Alice", "Bob", "Carol"]
ages = [25, 30, 28]

for name, age in zip(names, ages):
    print(f"{name} is {age} years old")

# zip with three lists
names = ["Alice", "Bob", "Carol"]
ages = [25, 30, 28]
cities = ["NYC", "LA", "Chicago"]

for name, age, city in zip(names, ages, cities):
    print(f"{name}, {age}, from {city}")

# zip stops at shortest list
x = [1, 2, 3, 4]
y = ['a', 'b']
for num, letter in zip(x, y):
    print(num, letter)
# Prints: 1 a, 2 b (stops when y is exhausted)
```

### 3.2 Modifying While Iterating (Carefully!)

```python
# DANGEROUS: Modifying list during iteration
numbers = [1, 2, 3, 4, 5]
for num in numbers:
    if num % 2 == 0:
        numbers.remove(num)  # Can skip elements!
print(numbers)  # [1, 3, 5] - but iteration was unpredictable

# SAFE: Create a copy or iterate over indices
numbers = [1, 2, 3, 4, 5]
for num in numbers[:]:  # Iterate over copy
    if num % 2 == 0:
        numbers.remove(num)
print(numbers)  # [1, 3, 5]

# SAFE: Use list comprehension instead
numbers = [1, 2, 3, 4, 5]
numbers = [num for num in numbers if num % 2 != 0]
print(numbers)  # [1, 3, 5]
```

### 3.3 reversed() - Iterate Backwards

```python
numbers = [1, 2, 3, 4, 5]

# Using reversed()
for num in reversed(numbers):
    print(num)
# Prints: 5, 4, 3, 2, 1

# Using slice with negative step
for num in numbers[::-1]:
    print(num)
# Prints: 5, 4, 3, 2, 1

# Modify while iterating backwards is safer
numbers = [1, 2, 3, 4, 5, 6]
for i in range(len(numbers) - 1, -1, -1):
    if numbers[i] % 2 == 0:
        numbers.pop(i)
print(numbers)  # [1, 3, 5]
```

---

## 4. List Methods Summary (60 min)

### 4.1 Common Methods

```python
numbers = [3, 1, 4, 1, 5, 9, 2, 6]

# count() - count occurrences
count_1s = numbers.count(1)  # 2

# index() - find index of first occurrence
index_4 = numbers.index(4)   # 2

# sort() - sort in place (modifies list)
numbers.sort()
print(numbers)  # [1, 1, 2, 3, 4, 5, 6, 9]

# reverse() - reverse in place
numbers.reverse()
print(numbers)  # [9, 6, 5, 4, 3, 2, 1, 1]

# copy() - create shallow copy
original = [1, 2, 3]
copy = original.copy()
copy.append(4)
print(original)  # [1, 2, 3]
print(copy)      # [1, 2, 3, 4]
```

### 4.2 When to Use Which Method

```python
# append() vs extend()
data = [1, 2, 3]
data.append([4, 5])
print(data)  # [1, 2, 3, [4, 5]] - adds list as single element

data = [1, 2, 3]
data.extend([4, 5])
print(data)  # [1, 2, 3, 4, 5] - adds individual elements

# remove() vs pop()
numbers = [1, 2, 3, 4, 5]
numbers.remove(3)  # Remove by value
print(numbers)     # [1, 2, 4, 5]

numbers = [1, 2, 3, 4, 5]
removed = numbers.pop(2)  # Remove and return by index
print(removed)     # 3
print(numbers)     # [1, 2, 4, 5]
```

---

## 5. Mini-Project: Grade Manager

```python
class GradeManager:
    def __init__(self):
        self.grades = []
    
    def add_grade(self, grade):
        """Add single grade"""
        if 0 <= grade <= 100:
            self.grades.append(grade)
    
    def add_grades(self, grade_list):
        """Add multiple grades"""
        for grade in grade_list:
            self.add_grade(grade)
    
    def remove_grade(self, index):
        """Remove grade by index"""
        if 0 <= index < len(self.grades):
            return self.grades.pop(index)
    
    def update_grade(self, index, new_grade):
        """Update grade at index"""
        if 0 <= index < len(self.grades) and 0 <= new_grade <= 100:
            self.grades[index] = new_grade
            return True
        return False
    
    def average(self):
        """Calculate average grade"""
        if not self.grades:
            return 0
        return sum(self.grades) / len(self.grades)
    
    def sorted_grades(self):
        """Return sorted grades"""
        return sorted(self.grades)
    
    def list_all(self):
        """Display all grades with indices"""
        for i, grade in enumerate(self.grades):
            print(f"{i}: {grade}")

# Usage
manager = GradeManager()
manager.add_grades([85, 90, 78, 92, 88])
manager.list_all()
print(f"Average: {manager.average()}")
manager.update_grade(0, 87)
print(f"Sorted: {manager.sorted_grades()}")
```

---

## 6. Graded Exercises

### Starter Exercises (40 minutes)

**Starter 1: Loop Iteration**
```python
# TODO: Iterate through list and print each item
```

**Starter 2: Add and Remove**
```python
# TODO: Create list, add elements, remove one
```

### Intermediate Exercises (60 minutes)

**Intermediate 1: enumerate() Usage**
```python
# TODO: Use enumerate to print index and value
```

**Intermediate 2: Modify While Iterating**
```python
# TODO: Filter list by removing even numbers
```

### Advanced Exercises (90 minutes)

**Advanced 1: Complex Iteration**
```python
# TODO: Use zip() to work with parallel lists
```

---

## 7. Self-Assessment Checklist

- [ ] I can iterate through lists with for loops
- [ ] I know the difference between append and extend
- [ ] I understand when to use remove vs pop
- [ ] I can use enumerate() effectively
- [ ] I know how to safely modify lists while iterating
- [ ] I understand list method performance implications

---

## 8. Additional Resources

- List methods documentation
- Performance characteristics of operations
- Next Lesson: Lesson 1.1.41 - List Comprehensions

---

**Next Lesson:** Lesson 1.1.41 - List Comprehensions




