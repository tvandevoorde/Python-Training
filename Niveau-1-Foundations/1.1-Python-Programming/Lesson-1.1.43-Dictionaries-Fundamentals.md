# Lesson 1.1.41: Dictionaries Fundamentals

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.1.1-1.1.6, 1.1.39 (Lists Fundamentals)

---

## Learning Objectives

By the end of this lesson, you will:

1. **Create and initialize** dictionaries using different methods
2. **Access and modify** dictionary values using keys
3. **Apply** core dictionary methods (`keys()`, `values()`, `items()`, `get()`, `pop()`, `update()`)
4. **Iterate** through dictionaries efficiently
5. **Understand** keys must be immutable; values can be any type
6. **Solve** real-world problems using dictionaries for key-value data storage
7. **Debug** common dictionary-related errors

---

## 1. What Are Dictionaries and Why They Matter (60 min)

### 1.1 Introduction to Dictionaries

A **dictionary** is an unordered collection of key-value pairs in Python. Unlike lists that use numeric indices, dictionaries use keys to access values.

**Key Characteristics:**
- **Key-Value Pairs**: Each value associated with a unique key
- **Unordered**: Items don't have a guaranteed order (though Python 3.7+ maintains insertion order)
- **Mutable**: Can add, modify, or remove items after creation
- **Flexible Keys**: Keys must be immutable (strings, numbers, tuples)
- **Flexible Values**: Values can be any data type

**Why Dictionaries Matter:**
- Store related data with meaningful keys rather than numeric indices
- Represent real-world entities (people, products, configurations)
- Look up information quickly using keys
- More readable than lists of tuples
- Foundation for JSON and data interchange formats

### 1.2 Real-World Dictionary Scenarios

```python
# User profile: key-value pairs describe a person
user = {
    "name": "Alice Johnson",
    "age": 28,
    "email": "alice@email.com",
    "active": True
}

# Product inventory: item names and quantities
inventory = {
    "apples": 50,
    "bananas": 35,
    "oranges": 42
}

# Grade tracking: student names and grades
grades = {
    "Alice": 92,
    "Bob": 88,
    "Charlie": 95
}

# Configuration settings: program settings
config = {
    "debug_mode": True,
    "max_retries": 3,
    "timeout": 30
}

# API response: nested structure
response = {
    "status": "success",
    "data": {
        "user_id": 123,
        "username": "john_doe"
    }
}
```

---

## 2. Creating and Initializing Dictionaries (75 min)

### 2.1 Dictionary Creation Methods

```python
# Method 1: Dictionary literal (most common)
person = {"name": "Alice", "age": 25, "city": "New York"}
print(person)  # Output: {'name': 'Alice', 'age': 25, 'city': 'New York'}

# Method 2: Using dict() constructor
empty_dict = dict()  # Empty dictionary
print(empty_dict)  # Output: {}

# Method 3: dict() with keyword arguments
person2 = dict(name="Bob", age=30, city="Boston")
print(person2)  # Output: {'name': 'Bob', 'age': 30, 'city': 'Boston'}

# Method 4: dict() with list of tuples
pairs = [("key1", "value1"), ("key2", "value2")]
dict_from_pairs = dict(pairs)
print(dict_from_pairs)  # Output: {'key1': 'value1', 'key2': 'value2'}

# Method 5: dict.fromkeys() - create with default values
my_keys = ["name", "age", "city"]
template = dict.fromkeys(my_keys, "Unknown")
print(template)  # Output: {'name': 'Unknown', 'age': 'Unknown', 'city': 'Unknown'}

# Method 6: Mixed types in dictionary
mixed = {
    "string": "hello",
    "number": 42,
    "float": 3.14,
    "boolean": True,
    "none": None,
    "list": [1, 2, 3],
    "dict": {"nested": "value"}
}
print(mixed)  # All types preserved
```

### 2.2 Dictionary Size and Length

```python
# Using len() function
inventory = {"apples": 50, "bananas": 35, "oranges": 42}
print(len(inventory))  # Output: 3 (three items)

# Empty dictionary
config = {}
print(len(config))  # Output: 0

# Nested dictionary - counts only top level
data = {
    "user1": {"name": "Alice", "age": 25},
    "user2": {"name": "Bob", "age": 30}
}
print(len(data))  # Output: 2 (two users, not counting nested keys)
```

---

## 3. Accessing Dictionary Values (75 min)

### 3.1 Basic Access with Keys

```python
# Access value using key
person = {"name": "Alice", "age": 25, "city": "New York"}

print(person["name"])  # Output: Alice
print(person["age"])   # Output: 25
print(person["city"])  # Output: New York

# KeyError if key doesn't exist
try:
    print(person["phone"])  # KeyError: 'phone'
except KeyError:
    print("Key not found")

# Keys are case-sensitive
data = {"Name": "Alice", "name": "Bob"}
print(data["Name"])  # Output: Alice (different from "name")
print(data["name"])  # Output: Bob
```

### 3.2 Safe Access with .get()

```python
# get() returns None if key doesn't exist (doesn't raise error)
person = {"name": "Alice", "age": 25}

print(person.get("name"))      # Output: Alice
print(person.get("phone"))     # Output: None (no error!)
print(person.get("phone", "N/A"))  # Output: N/A (default value)

# Practical use case: API responses
response = {"status": "success", "user_id": 123}
user_id = response.get("user_id")  # Works
email = response.get("email", "not provided")  # Default if missing

# Safer than direct access
def process_user(user_dict):
    name = user_dict.get("name", "Unknown")
    age = user_dict.get("age", 0)
    city = user_dict.get("city", "Not specified")
    
    return f"{name}, age {age}, from {city}"

user1 = {"name": "Alice", "age": 25}
user2 = {"name": "Bob"}  # Missing age and city

print(process_user(user1))  # Alice, age 25, from Not specified
print(process_user(user2))  # Bob, age 0, from Not specified
```

### 3.3 Checking for Key Existence

```python
# Using 'in' operator
inventory = {"apples": 50, "bananas": 35}

if "apples" in inventory:
    print("We have apples")  # This prints

if "oranges" in inventory:
    print("We have oranges")  # This doesn't print
else:
    print("No oranges in inventory")

# Using 'not in' operator
if "grapes" not in inventory:
    print("No grapes")  # This prints

# Checking values instead of keys
if 50 in inventory.values():
    print("We have something with 50 units")
```

---

## 4. Modifying Dictionaries (75 min)

### 4.1 Adding and Updating Values

```python
# Add new key-value pair
inventory = {"apples": 50}
inventory["bananas"] = 35  # Add if key doesn't exist
print(inventory)  # Output: {'apples': 50, 'bananas': 35}

# Update existing value
inventory["apples"] = 60   # Update if key exists
print(inventory)  # Output: {'apples': 60, 'bananas': 35}

# Multiple additions
settings = {}
settings["language"] = "English"
settings["theme"] = "dark"
settings["notifications"] = True
print(settings)  # Output: {'language': 'English', 'theme': 'dark', 'notifications': True}

# Using setdefault() - add only if key doesn't exist
user = {"name": "Alice"}
user.setdefault("age", 25)  # Adds if missing
print(user)  # Output: {'name': 'Alice', 'age': 25}

user.setdefault("age", 30)  # Doesn't overwrite
print(user)  # Output: {'name': 'Alice', 'age': 25} - still 25
```

### 4.2 Removing Values

```python
# Method 1: pop() - remove and return value
scores = {"Alice": 92, "Bob": 88, "Charlie": 95}
alice_score = scores.pop("Alice")  # Remove and return
print(alice_score)  # Output: 92
print(scores)  # Output: {'Bob': 88, 'Charlie': 95}

# pop() with default value
missing = scores.pop("Diana", 0)  # Returns 0 if not found
print(missing)  # Output: 0 (no error)

# Method 2: del statement - remove without returning
data = {"x": 10, "y": 20, "z": 30}
del data["y"]  # Remove y
print(data)  # Output: {'x': 10, 'z': 30}

# Method 3: clear() - remove all items
temp = {"a": 1, "b": 2}
temp.clear()
print(temp)  # Output: {}

# Method 4: popitem() - remove arbitrary key-value pair
dict1 = {"first": 1, "second": 2, "third": 3}
key, value = dict1.popitem()  # Remove one item
print(key, value)  # Output: third 3 (or another item)
print(dict1)  # Output: {'first': 1, 'second': 2} (one fewer item)
```

### 4.3 Updating Multiple Values

```python
# Method 1: update() - merge another dictionary
inventory = {"apples": 50, "bananas": 35}
new_items = {"oranges": 42, "grapes": 100}
inventory.update(new_items)
print(inventory)  # Output: {'apples': 50, 'bananas': 35, 'oranges': 42, 'grapes': 100}

# update() overwrites existing keys
prices = {"apple": 1.50, "banana": 0.75}
price_changes = {"apple": 1.75, "orange": 2.00}  # apple exists, orange is new
prices.update(price_changes)
print(prices)  # Output: {'apple': 1.75, 'banana': 0.75, 'orange': 2.0}

# Method 2: Slice and replace (for specific operations)
config = {"debug": False, "timeout": 30, "retries": 3}
config.update(debug=True, timeout=60)  # Using keyword arguments
print(config)  # Output: {'debug': True, 'timeout': 60, 'retries': 3}
```

---

## 5. Getting Dictionary Information (60 min)

### 5.1 Keys, Values, and Items

```python
# Get all keys
person = {"name": "Alice", "age": 25, "city": "New York"}

keys = person.keys()
print(keys)  # Output: dict_keys(['name', 'age', 'city'])
print(list(keys))  # Convert to list: ['name', 'age', 'city']

# Get all values
values = person.values()
print(values)  # Output: dict_values(['Alice', 25, 'New York'])
print(list(values))  # Convert to list: ['Alice', 25, 'New York']

# Get all key-value pairs
items = person.items()
print(items)  # Output: dict_items([('name', 'Alice'), ('age', 25), ('city', 'New York')])
print(list(items))  # Convert to list: [('name', 'Alice'), ('age', 25), ('city', 'New York')]

# Count specific values
grades = {"A": 5, "B": 8, "C": 3, "F": 1}
print(grades.values())  # dict_values([5, 8, 3, 1])
```

### 5.2 Iterating Over Dictionaries

```python
# Iterate over keys (default)
person = {"name": "Alice", "age": 25, "city": "New York"}

for key in person:  # Iterates over keys
    print(key)
# Output:
# name
# age
# city

# Iterate over keys explicitly
for key in person.keys():
    print(f"{key}: {person[key]}")
# Output:
# name: Alice
# age: 25
# city: New York

# Iterate over values
for value in person.values():
    print(value)
# Output:
# Alice
# 25
# New York

# Iterate over key-value pairs (most useful)
for key, value in person.items():
    print(f"{key}: {value}")
# Output:
# name: Alice
# age: 25
# city: New York
```

### 5.3 Conditional Iteration

```python
# Filter while iterating
grades = {"Alice": 92, "Bob": 78, "Charlie": 88, "Diana": 95}

# Find high scorers
print("High scorers:")
for name, grade in grades.items():
    if grade >= 90:
        print(f"  {name}: {grade}")

# Count specific values
scores = {"excellent": 5, "good": 8, "average": 3, "poor": 1}
total = 0
for count in scores.values():
    total += count
print(f"Total items: {total}")  # Output: 17

# Find keys with specific values
best_grade = max(grades.values())
for name, grade in grades.items():
    if grade == best_grade:
        print(f"{name} has the highest grade: {grade}")
```

---

## 6. Nested Dictionaries (75 min)

### 6.1 Dictionaries Within Dictionaries

```python
# Nested structure for complex data
company = {
    "name": "TechCorp",
    "address": {
        "street": "123 Tech Ave",
        "city": "San Francisco",
        "zip": "94105"
    },
    "employees": {
        "manager1": {"name": "Alice", "salary": 120000},
        "dev1": {"name": "Bob", "salary": 95000},
        "dev2": {"name": "Charlie", "salary": 90000}
    }
}

# Access nested values
print(company["name"])  # Output: TechCorp
print(company["address"]["city"])  # Output: San Francisco
print(company["employees"]["manager1"]["name"])  # Output: Alice

# Modify nested values
company["address"]["zip"] = "94102"
company["employees"]["dev1"]["salary"] = 100000

# Add nested structure
company["employees"]["dev3"] = {"name": "Diana", "salary": 92000}
```

### 6.2 Working with Lists of Dictionaries

```python
# Common pattern: list of dictionaries (like database records)
students = [
    {"id": 1, "name": "Alice", "grade": 92},
    {"id": 2, "name": "Bob", "grade": 88},
    {"id": 3, "name": "Charlie", "grade": 95}
]

# Access individual records
print(students[0]["name"])  # Output: Alice

# Find specific record
for student in students:
    if student["name"] == "Bob":
        print(f"Bob's grade: {student['grade']}")

# Get all names
names = [student["name"] for student in students]
print(names)  # Output: ['Alice', 'Bob', 'Charlie']

# Get high scorers
high_scorers = [s for s in students if s["grade"] >= 90]
print(high_scorers)  # [{'id': 1, 'name': 'Alice', 'grade': 92}, ...]
```

### 6.3 Deep vs. Shallow Copy

```python
# WRONG: Assignment creates reference
original = {"name": "Alice", "score": 90}
copy_ref = original  # Both point to same dict!

copy_ref["score"] = 100
print(original["score"])  # Output: 100 - changed!

# CORRECT: Use copy() method
import copy

original = {"name": "Alice", "score": 90}
shallow_copy = original.copy()  # Shallow copy

shallow_copy["score"] = 100
print(original["score"])  # Output: 90 - unchanged

# Shallow copy with nested dict (modifying nested still affects original)
person = {"name": "Alice", "address": {"city": "NYC"}}
shallow = person.copy()
shallow["address"]["city"] = "LA"  # Modifies nested!
print(person["address"]["city"])  # Output: LA - changed!

# Deep copy for nested structures
deep = copy.deepcopy(person)
deep["address"]["city"] = "Boston"
print(person["address"]["city"])  # Output: LA - unchanged
```

---

## 7. Real-World Dictionary Patterns (75 min)

### 7.1 Counting with Dictionaries

```python
# Count occurrences
text = "mississippi"
letter_count = {}

for letter in text:
    letter_count[letter] = letter_count.get(letter, 0) + 1

print(letter_count)  # Output: {'m': 1, 'i': 4, 's': 4, 'p': 2}

# Alternative with setdefault()
votes = ["Alice", "Bob", "Alice", "Charlie", "Alice", "Bob"]
vote_count = {}

for vote in votes:
    vote_count.setdefault(vote, 0)
    vote_count[vote] += 1

print(vote_count)  # Output: {'Alice': 3, 'Bob': 2, 'Charlie': 1}
```

### 7.2 Grouping Data

```python
# Group students by grade level
students = [
    {"name": "Alice", "grade": 10},
    {"name": "Bob", "grade": 11},
    {"name": "Charlie", "grade": 10},
    {"name": "Diana", "grade": 12}
]

by_grade = {}
for student in students:
    grade = student["grade"]
    by_grade.setdefault(grade, [])
    by_grade[grade].append(student["name"])

print(by_grade)
# Output: {10: ['Alice', 'Charlie'], 11: ['Bob'], 12: ['Diana']}

# Use with "grades"
for grade_num in sorted(by_grade.keys()):
    print(f"Grade {grade_num}: {by_grade[grade_num]}")
```

### 7.3 Configuration and Settings

```python
# Store application configuration
app_config = {
    "database": {
        "host": "localhost",
        "port": 5432,
        "name": "myapp"
    },
    "features": {
        "debug_mode": False,
        "caching": True,
        "notifications": True
    },
    "limits": {
        "max_retries": 3,
        "timeout": 30,
        "max_users": 1000
    }
}

# Access config values
db_host = app_config["database"]["host"]
debug = app_config["features"]["debug_mode"]
max_retries = app_config["limits"]["max_retries"]

# Use .get() for safety (in case key is missing)
timeout = app_config.get("limits", {}).get("timeout", 60)  # Default 60 if missing
```

---

## 8. Common Dictionary Errors (60 min)

### 8.1 KeyError and Type Errors

```python
# KeyError: trying to access non-existent key
data = {"name": "Alice", "age": 25}
try:
    print(data["phone"])  # KeyError!
except KeyError:
    print("Key doesn't exist - use .get() instead")

# Solution: use .get()
phone = data.get("phone", "N/A")
print(phone)  # Output: N/A

# TypeError: using unhashable type as key
try:
    bad_dict = {[1, 2, 3]: "value"}  # Error! Lists aren't hashable
except TypeError:
    print("Can't use mutable types as keys")

# Solution: use tuples (immutable) instead
good_dict = {(1, 2, 3): "value"}  # Tuples work
print(good_dict)  # Output: {(1, 2, 3): 'value'}
```

### 8.2 Mutable Default Values

```python
# WRONG: Mutable default in multiple calls affects all instances
def add_item(item, inventory={}):
    inventory.setdefault("items", [])
    inventory["items"].append(item)
    return inventory

inv1 = add_item("apple")
inv2 = add_item("banana")  # Unexpectedly has both apple and banana!

# CORRECT: Use None as default, create new dict inside function
def add_item_correct(item, inventory=None):
    if inventory is None:
        inventory = {}
    inventory.setdefault("items", [])
    inventory["items"].append(item)
    return inventory

inv1 = add_item_correct("apple")
inv2 = add_item_correct("banana")  # Only has banana
print(inv1)  # {'items': ['apple']}
print(inv2)  # {'items': ['banana']}
```

### 8.3 Iteration Issues

```python
# ERROR: Modifying dictionary while iterating (can cause issues)
scores = {"Alice": 92, "Bob": 88, "Charlie": 95}

# WRONG: Changing dict size during iteration
try:
    for name in scores:
        if scores[name] < 90:
            del scores[name]  # RuntimeError in some situations
except RuntimeError:
    print("Can't modify dict size during iteration")

# CORRECT: Iterate over copy of keys
scores = {"Alice": 92, "Bob": 88, "Charlie": 95}
for name in list(scores.keys()):  # Create list of keys first
    if scores[name] < 90:
        del scores[name]

print(scores)  # Output: {'Alice': 92, 'Charlie': 95}

# Or use comprehension
scores = {"Alice": 92, "Bob": 88, "Charlie": 95}
scores = {k: v for k, v in scores.items() if v >= 90}
print(scores)  # Output: {'Alice': 92, 'Charlie': 95}
```

---

## 9. Mini-Project: Contact Management System

**Objective:** Build a contact system using dictionaries

```python
def create_contact_system():
    """Contact management system with dictionaries"""
    contacts = {}
    
    def add_contact(name, phone, email, address):
        """Add a new contact"""
        contacts[name] = {
            "phone": phone,
            "email": email,
            "address": address
        }
        return f"Contact {name} added"
    
    def find_contact(name):
        """Find a contact by name"""
        if name in contacts:
            return contacts[name]
        return None
    
    def update_contact(name, **kwargs):
        """Update contact information"""
        if name not in contacts:
            return f"Contact {name} not found"
        
        for key, value in kwargs.items():
            if key in contacts[name]:
                contacts[name][key] = value
        return f"Contact {name} updated"
    
    def delete_contact(name):
        """Remove a contact"""
        if name in contacts:
            del contacts[name]
            return f"Contact {name} deleted"
        return f"Contact {name} not found"
    
    def list_all_contacts():
        """List all contacts"""
        return list(contacts.keys())
    
    def display_contact(name):
        """Display full contact info"""
        if name in contacts:
            info = contacts[name]
            return f"{name}:\n  Phone: {info['phone']}\n  Email: {info['email']}\n  Address: {info['address']}"
        return f"Contact {name} not found"
    
    # Usage example
    add_contact("Alice", "555-1234", "alice@email.com", "123 Main St")
    add_contact("Bob", "555-5678", "bob@email.com", "456 Oak Ave")
    add_contact("Charlie", "555-9999", "charlie@email.com", "789 Elm St")
    
    print(display_contact("Alice"))
    update_contact("Alice", phone="555-1111")
    print(display_contact("Alice"))
    print(f"Contacts: {list_all_contacts()}")
    
    return contacts

# Run it
system = create_contact_system()
```

**Output:**
```
Alice:
  Phone: 555-1234
  Email: alice@email.com
  Address: 123 Main St
Alice:
  Phone: 555-1111
  Email: alice@email.com
  Address: 123 Main St
Contacts: ['Alice', 'Bob', 'Charlie']
```

---

## 10. Graded Exercises

### Starter Exercises (40 minutes)

**Starter Exercise 1: Create and Access**
```python
# TODO: Create a dictionary of 5 favorite foods with their calories
# TODO: Access and print specific items
# TODO: Add a new food item

favorite_foods = {}
# Add items...

# Expected output:
# Pizza has 285 calories
# Total foods: 6
```

**Starter Exercise 2: Basic Modifications**
```python
# TODO: Create a product inventory
# TODO: Add items (quantity > 0)
# TODO: Remove items (set to 0)
# TODO: Check if item exists using 'in'

inventory = {"apples": 50, "bananas": 30}
# Your modifications...
```

**Starter Exercise 3: Iteration**
```python
# TODO: Create a grade dictionary
# TODO: Print all students and their grades
# TODO: Find the highest grade
# TODO: Calculate average grade

grades = {"Alice": 92, "Bob": 88, "Charlie": 95, "Diana": 87}
# Your code here...
```

### Intermediate Exercises (60 minutes)

**Intermediate Exercise 1: Dictionary Transformation**
```python
# TODO: Convert list of tuples to dictionary
# TODO: Convert dictionary to list of tuples
# TODO: Create new dict with only items meeting criteria

data = [("name", "Alice"), ("age", 25), ("city", "NYC"), ("age", 30)]

# Expected transformation operations:
# 1. to_dict()
# 2. to_list()
# 3. filter_by_value(min_length)
```

**Intermediate Exercise 2: Nested Structures**
```python
# TODO: Work with nested student records
# TODO: Find students in specific grade
# TODO: Calculate class statistics
# TODO: Update student information

students = {
    "grade10": [
        {"name": "Alice", "math": 92, "english": 88},
        {"name": "Bob", "math": 78, "english": 85}
    ],
    "grade11": [
        {"name": "Charlie", "math": 95, "english": 91}
    ]
}

# Your code here...
```

**Intermediate Exercise 3: Counting and Grouping**
```python
# TODO: Count item occurrences
# TODO: Group items by category
# TODO: Find most common items

items = ["apple", "banana", "apple", "cherry", "apple", "banana", "date"]
categories = {
    "fruit": ["apple", "banana", "cherry", "date"],
    "vegetable": ["carrot", "broccoli"]
}

# Your code here...
```

### Advanced Exercises (90 minutes)

**Advanced Exercise 1: Advanced Contact System**
```python
# TODO: Build comprehensive contact management
# 1. Add, update, delete contacts
# 2. Search by name or phone
# 3. Export to list format
# 4. Import from list format
# 5. Generate statistics

def manage_contacts():
    """Advanced contact management system"""
    # Your implementation here
    pass
```

**Advanced Exercise 2: Data Analysis**
```python
# TODO: Analyze sales data
# 1. Group sales by region
# 2. Calculate totals and averages per region
# 3. Find best/worst performing region
# 4. Identify top products by sales
# 5. Generate summary report

sales_data = [
    {"region": "North", "product": "A", "amount": 1000},
    {"region": "North", "product": "B", "amount": 1200},
    {"region": "South", "product": "A", "amount": 800},
    {"region": "South", "product": "C", "amount": 1500},
    {"region": "East", "product": "B", "amount": 900}
]

# Your code here...
```

**Advanced Exercise 3: Configuration Management**
```python
# TODO: Build configuration system
# 1. Load default settings
# 2. Support nested configuration
# 3. Merge user settings with defaults
# 4. Validate configuration values
# 5. Export/import configuration

def config_manager():
    """Advanced configuration management"""
    # Your implementation...
    pass
```

---

## 11. Self-Assessment Checklist

- [ ] I can create dictionaries using different methods
- [ ] I understand keys must be immutable
- [ ] I can access values using keys and .get()
- [ ] I know how to check if key exists using 'in'
- [ ] I can add, modify, and remove dictionary items
- [ ] I understand the difference between .pop() and del
- [ ] I can iterate over keys, values, and items
- [ ] I can work with nested dictionaries
- [ ] I can copy dictionaries (shallow and deep)
- [ ] I understand common patterns (counting, grouping)
- [ ] I can debug common dictionary errors

---

## 12. Assessment Questions

**True/False:**
1. Dictionary keys must always be strings ✓/✗
2. Dictionaries maintain insertion order (Python 3.7+) ✓/✗
3. You can modify a dictionary while iterating over it safely ✓/✗
4. The .get() method raises a KeyError if key doesn't exist ✓/✗

**Short Answer:**
1. What is the difference between accessing with a key `dict[key]` and using `.get(key)`?
2. How would you check if a key exists in a dictionary?
3. What's the difference between shallow and deep copy for nested dictionaries?

**Coding Challenges:**
1. Write a function that counts the frequency of each character in a string
2. Given a list of dictionaries (students with scores), find the student with the highest average
3. Create a function that merges two dictionaries, with the second overwriting conflicts

---

## 13. Additional Resources

- **Dictionary Documentation**: Official Python docs on dictionaries
- **JSON Format**: Understanding JSON and its relationship to dictionaries
- **Performance**: Dictionary lookup time complexity (O(1))
- **Next Lesson Preview**: Advanced dictionary operations and techniques

---

**Next Lesson:** Lesson 1.1.36 - Sets and Tuples
