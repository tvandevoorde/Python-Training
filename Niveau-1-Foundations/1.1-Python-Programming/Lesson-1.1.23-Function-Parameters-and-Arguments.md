# Lesson 1.1.23: Function Parameters & Arguments

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.22 (Defining Functions) | **Topic**: Functions - Parameter Handling

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Distinguish between parameters and arguments
- Use positional arguments correctly
- Use keyword arguments for clarity
- Set default parameter values
- Understand parameter ordering
- Use `*args` and `**kwargs` for variable arguments

---

## 1. Parameters vs Arguments (60 min)

### 1.1 Terminology

```python
# PARAMETER: Name in function definition
# ARGUMENT: Value passed when calling function

def greet(name, greeting):  # name, greeting are PARAMETERS
    """Greet someone"""
    print(f"{greeting}, {name}!")

# "Alice" and "Hi" are ARGUMENTS
greet("Alice", "Hi")

# More examples to clarify:
def add(a, b):  # a and b are PARAMETERS
    """Add numbers"""
    return a + b

result = add(5, 3)  # 5 and 3 are ARGUMENTS
```

### 1.2 Positional Arguments

```python
# Arguments matched by position (order matters!)

def describe_person(name, age, city):
    """Describe person - order matters"""
    print(f"{name} is {age} and lives in {city}")

# Correct order
describe_person("Alice", 25, "NYC")
# Output: Alice is 25 and lives in NYC

# Wrong order (confusing!)
describe_person("Bob", "LA", 30)
# Output: Bob is LA and lives in 30
# This is nonsensical!

# More arguments
def order_pizza(size, crust, toppings):
    """Order pizza"""
    print(f"Size: {size}, Crust: {crust}, Toppings: {toppings}")

order_pizza("Large", "Thin", "Pepperoni")
# Size: Large, Crust: Thin, Toppings: Pepperoni
```

### 1.3 Keyword Arguments

```python
# Use parameter names when calling (order doesn't matter)

def describe_person(name, age, city):
    """Describe person"""
    print(f"{name} is {age} and lives in {city}")

# Using keyword arguments (order flexible)
describe_person(age=25, name="Alice", city="NYC")
# Output: Alice is 25 and lives in NYC

describe_person(name="Bob", city="LA", age=30)
# Output: Bob is 30 and lives in LA

# Mixing positional and keyword (positional first!)
describe_person("Charlie", city="Chicago", age=28)
# Output: Charlie is 28 and lives in Chicago

# ❌ WRONG: Positional after keyword
# describe_person(name="Dave", 35, "Boston")
# SyntaxError: positional argument follows keyword argument
```

---

## 2. Default Parameters (90 min)

### 2.1 Providing Defaults

```python
# Parameters can have default values
# Used when argument not provided

def greet(name, greeting="Hello"):
    """Greet with optional custom greeting"""
    print(f"{greeting}, {name}!")

# Called without greeting argument
greet("Alice")  # Uses default "Hello"
# Output: Hello, Alice!

# Called with greeting argument
greet("Bob", "Hi")
# Output: Hi, Bob!

# More examples
def create_user(username, role="user", active=True):
    """Create user with defaults for role and active"""
    print(f"User: {username}, Role: {role}, Active: {active}")

create_user("alice")                           # Uses defaults
create_user("bob", role="admin")               # Override role
create_user("charlie", "moderator", False)     # Override both
create_user("diana", active=False)             # Override only active
```

### 2.2 Default Parameter Rules

```python
print("=== DEFAULT PARAMETER RULES ===\n")

# Rule 1: Required parameters come BEFORE defaults
# ❌ WRONG: Required after optional
# def function(name="John", age):  # SyntaxError!
#     pass

# ✅ CORRECT: Required parameters first
def function(name, age="25"):
    pass

# Rule 2: Defaults evaluated left to right
def create_list(item1, item2="B", item3="C"):
    """Parameters: item1 required, item2 and item3 optional"""
    return [item1, item2, item3]

result1 = create_list("A")              # ["A", "B", "C"]
result2 = create_list("A", "X")         # ["A", "X", "C"]
result3 = create_list("A", "X", "Y")    # ["A", "X", "Y"]

print(result1)
print(result2)
print(result3)

# Rule 3: Mutable defaults can be dangerous
# ❌ PROBLEM: Default list shared across calls
def add_item_bad(item, my_list=[]):
    """Don't do this with mutable defaults!"""
    my_list.append(item)
    return my_list

# This demonstrates the issue:
print("\n❌ Problem with mutable defaults:")
print(add_item_bad(1))      # [1]
print(add_item_bad(2))      # [1, 2] - UNEXPECTED!
print(add_item_bad(3))      # [1, 2, 3] - Same list!

# ✅ SOLUTION: Use None as default
def add_item_good(item, my_list=None):
    """Correct way with mutable defaults"""
    if my_list is None:
        my_list = []
    my_list.append(item)
    return my_list

print("\n✅ Correct with None default:")
print(add_item_good(1))      # [1]
print(add_item_good(2))      # [2]
print(add_item_good(3))      # [3]
```

### 2.3 Common Default Patterns

```python
print("=== COMMON DEFAULT PATTERNS ===\n")

# Pattern 1: Optional behavior control
def log_message(message, level="INFO"):
    """Log with optional level"""
    print(f"[{level}] {message}")

log_message("All OK")
log_message("Issue found", "WARNING")
log_message("Critical error", "ERROR")

# Pattern 2: Optional output format
def format_price(price, currency="$", decimals=2):
    """Format price with optional currency and decimals"""
    return f"{currency}{price:.{decimals}f}"

print(format_price(19.5))           # $19.50
print(format_price(19.5, "€"))      # €19.50
print(format_price(19.5, "€", 1))   # €19.5

# Pattern 3: Optional filtering
def get_users(all_users=[("Alice", 25), ("Bob", 30), ("Charlie", 22)],
              min_age=0):
    """Get users above minimum age"""
    return [user for user, age in all_users if age >= min_age]

all_results = get_users()           # All users
adults = get_users(min_age=25)      # Only 25+

print(f"All: {len(all_results)}")
print(f"Adults: {len(adults)}")
```

---

## 3. Variable Arguments `*args` and `**kwargs` (90 min)

### 3.1 `*args` - Variable Positional Arguments

```python
# *args: Accept any number of positional arguments

def print_numbers(*args):
    """Print any number of arguments"""
    for arg in args:
        print(arg)

print("=== *args DEMO ===")
print_numbers(1)           # One argument
print_numbers(1, 2, 3)     # Three arguments
print_numbers(1, 2, 3, 4, 5)  # Five arguments

# More useful example
def add_all(*numbers):
    """Add any number of arguments"""
    total = 0
    for num in numbers:
        total += num
    return total

print(f"\nadd_all(5, 10): {add_all(5, 10)}")
print(f"add_all(1, 2, 3, 4, 5): {add_all(1, 2, 3, 4, 5)}")
print(f"add_all(100): {add_all(100)}")

# Combined with regular parameters
def greet_people(greeting, *names):
    """Greet multiple people"""
    for name in names:
        print(f"{greeting}, {name}!")

greet_people("Hello", "Alice", "Bob", "Charlie")
# Output:
# Hello, Alice!
# Hello, Bob!
# Hello, Charlie!

# ❌ Warning: Don't forget order
# def func(*args, required_param):  # This doesn't work as expected
#     pass

# ✅ Correct: Regular params first, then *args
def func(required_param, *args):
    pass
```

### 3.2 `**kwargs` - Variable Keyword Arguments

```python
# **kwargs: Accept any number of keyword arguments (as dictionary)

def print_info(**kwargs):
    """Print any keyword arguments"""
    for key, value in kwargs.items():
        print(f"{key}: {value}")

print("\n=== **kwargs DEMO ===")
print_info(name="Alice", age=25, city="NYC")
# Output:
# name: Alice
# age: 25
# city: NYC

# Practical example: flexible configuration
def create_database(**config):
    """Create database with flexible configuration"""
    host = config.get("host", "localhost")
    port = config.get("port", 5432)
    user = config.get("user", "admin")
    
    print(f"Database: {host}:{port} (user: {user})")

create_database()
create_database(host="aws.example.com", user="dbuser")
create_database(host="192.168.1.1", port=3306, user="root")

# Combining with regular parameters
def build_html(tag, **attributes):
    """Build HTML tag with optional attributes"""
    attrs = " ".join(f'{k}="{v}"' for k, v in attributes.items())
    if attrs:
        return f"<{tag} {attrs}>"
    return f"<{tag}>"

print(f"\n{build_html('div')}")
print(f"{build_html('a', href='http://example.com', target='_blank')}")
print(f"{build_html('img', src='photo.jpg', alt='Photo', width='100')}")
```

### 3.3 Combining `*args` and `**kwargs`

```python
print("\n=== *args AND **kwargs TOGETHER ===\n")

# Order: positional args → *args → **kwargs
def flexible_function(required, *args, **kwargs):
    """Accept everything"""
    print(f"Required: {required}")
    print(f"Args: {args}")
    print(f"Kwargs: {kwargs}")

flexible_function(1)
flexible_function(1, 2, 3, 4)
flexible_function(1, 2, 3, name="Alice", age=25)

# Practical example: logging with options
def log_entry(timestamp, message, *tags, **options):
    """Log with message, optional tags, and options"""
    level = options.get("level", "INFO")
    verbose = options.get("verbose", False)
    
    log = f"[{timestamp}] [{level}] {message}"
    
    if tags:
        log += f" Tags: {', '.join(tags)}"
    
    if verbose:
        log += f" Options: {options}"
    
    print(log)

log_entry("2024-01-15", "User logged in")
log_entry("2024-01-15", "Error occurred", "ERROR", "CRITICAL", level="ERROR")
log_entry("2024-01-15", "Debug info", "DEBUG", level="DEBUG", verbose=True)
```

---

## 4. Parameter Best Practices (60 min)

### 4.1 Clear Function Signatures

```python
print("=== CLEAR FUNCTION SIGNATURES ===\n")

# ❌ UNCLEAR: What do these parameters mean?
def process(a, b, c, d=True):
    pass

# ✅ CLEAR: Descriptive names
def calculate_shipping_cost(weight_kg, distance_km, expedited=False):
    """Calculate shipping cost based on weight and distance"""
    base_rate = 5.0
    cost = base_rate + (weight_kg * 0.5) + (distance_km * 0.01)
    if expedited:
        cost *= 1.5
    return cost

cost = calculate_shipping_cost(10, 100, expedited=True)
print(f"Shipping cost: ${cost:.2f}")
```

### 4.2 Function Complexity

```python
print("\n=== MANAGING COMPLEXITY ===\n")

# ❌ Too many parameters (hard to use)
def create_user(name, age, email, phone, address, city, 
                state, zip_code, country, role, active):
    pass

# ✅ Better: Use dictionary for related data
def create_user(name, email, user_info):
    """Create user with name, email, and additional info dict"""
    age = user_info.get("age")
    phone = user_info.get("phone")
    address = user_info.get("address")
    # ... etc

user_info = {
    "age": 25,
    "phone": "555-1234",
    "address": "123 Main St",
    "city": "NYC",
    "state": "NY",
    "zip_code": "10001",
    "country": "USA",
    "role": "user",
    "active": True
}

create_user("Alice", "alice@email.com", user_info)

# ✅ Or use a class (more advanced)
class User:
    """Represent user with all properties"""
    def __init__(self, name, email, age=None, phone=None):
        self.name = name
        self.email = email
        self.age = age
        self.phone = phone

user = User("Bob", "bob@email.com", age=30, phone="555-5678")
```

### 4.3 Documentation of Arguments

```python
print("\n=== DOCUMENT ARGUMENTS ===\n")

def calculate_final_grade(assignments, midterm, final, 
                          weights=None):
    """
    Calculate final grade for student.
    
    Parameters:
        assignments (list): List of assignment scores (0-100)
        midterm (float): Midterm exam score (0-100)
        final (float): Final exam score (0-100)
        weights (dict, optional): Weight for each component
            Default: {"assignments": 0.3, "midterm": 0.3, "final": 0.4}
    
    Returns:
        float: Final grade (0-100)
    
    Example:
        >>> calculate_final_grade([90, 85, 95], 88, 92)
        90.6
    """
    if weights is None:
        weights = {"assignments": 0.3, "midterm": 0.3, "final": 0.4}
    
    avg_assignments = sum(assignments) / len(assignments)
    final_grade = (avg_assignments * weights["assignments"] + 
                   midterm * weights["midterm"] + 
                   final * weights["final"])
    
    return final_grade

grade = calculate_final_grade([90, 85, 95], 88, 92)
print(f"Final Grade: {grade:.1f}")
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.23.1**: Default Parameter
```python
def greet(name, greeting="Hello"):
    print(f"{greeting}, {name}!")

greet("Alice")
greet("Bob", "Hi")

# What prints?
```

**Exercise 1.1.23.2**: Keyword Arguments
```python
def describe(name, age, city):
    print(f"{name} is {age} in {city}")

describe(city="NYC", name="Alice", age=25)

# What prints?
```

**Exercise 1.1.23.3**: *args
```python
def sum_all(*numbers):
    return sum(numbers)

print(sum_all(1, 2, 3, 4, 5))

# What prints?
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.23.4**: Mixed Arguments
```python
def calculate(a, b, operation="add"):
    if operation == "add":
        return a + b
    elif operation == "multiply":
        return a * b

print(calculate(5, 3))
print(calculate(5, 3, "multiply"))

# What prints?
```

**Exercise 1.1.23.5**: **kwargs
```python
def print_person(**info):
    for key, value in info.items():
        print(f"{key}: {value}")

print_person(name="Alice", age=25, city="NYC")

# What prints?
```

**Exercise 1.1.23.6**: Combined Parameters
```python
def make_sentence(subject, *verbs, **details):
    sentence = f"{subject} "
    sentence += " ".join(verbs)
    return sentence

result = make_sentence("The cat", "runs", "jumps", color="orange")

# What's in result?
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.23.7**: Optional Parameters with Logic
```python
def format_output(data, format_type="plain", **options):
    if format_type == "json":
        return str(data)
    elif format_type == "csv":
        return ",".join(str(x) for x in data)

result = format_output([1, 2, 3], "csv")

# What prints?
```

**Exercise 1.1.23.8**: Complex *args/**kwargs
```python
def api_call(endpoint, *params, **headers):
    url = f"/{endpoint}"
    if params:
        url += f"?{'&'.join(params)}"
    return url

result = api_call("users", "id=1", "format=json", Authorization="Bearer token")

# What's in result?
```

**Exercise 1.1.23.9**: All Parameter Types
```python
def report(title, *sections, summary=True, **metadata):
    output = f"=== {title} ===\n"
    for section in sections:
        output += f"- {section}\n"
    if summary:
        output += f"Metadata: {len(metadata)} fields"
    return output

result = report("report", "intro", "main", "conclusion", author="Alice")

# What's in result?
```

---

## Mini-Project: Flexible Data Formatter

Create a versatile data formatting function.

```python
def format_data(*data, format="list", separator=", ", **options):
    """
    Format data in different ways.
    
    Parameters:
        *data: Items to format
        format: Output format (list, csv, json, pretty)
        separator: String between items
        **options: Additional options (indent, quotes, etc.)
    """
    quote = options.get("quote", False)
    
    if format == "list":
        return f"[{separator.join(str(d) for d in data)}]"
    elif format == "csv":
        return separator.join(str(d) for d in data)
    elif format == "json":
        return f'[{", ".join(f\'"{d}\'' for d in data)}]'
    elif format == "pretty":
        return "\n".join(f"  - {d}" for d in data)
    else:
        return str(data)

# Test
print(format_data(1, 2, 3, format="list"))
print(format_data("Alice", "Bob", "Charlie", format="csv", separator=" | "))
print(format_data("apple", "banana", "cherry", format="pretty"))
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **Parameters are values passed to functions.**
   - Answer: False (arguments are, parameters receive them)

2. **Default parameters must come after required parameters.**
   - Answer: True

3. **`*args` must be named exactly `*args`.**
   - Answer: False (the `*` matters, name can vary)

4. **Cannot mix positional and keyword arguments.**
   - Answer: False (can mix, positional first)

---

### Conceptual Questions

5. **What does `*args` do?**
   - Expected: Allows variable number of positional arguments as tuple

6. **Why avoid mutable defaults?**
   - Expected: Default object shared across calls, unexpected behavior

7. **When would you use `**kwargs`?**
   - Expected: For flexible keyword arguments, configuration options

---

### Coding Challenge

8. **Create a function that:**
   - Takes required `title` parameter
   - Accepts any number of items via `*items`
   - Accepts formatting options via `**options`

   ```python
   def format_list(title, *items, **options):
       """Format list with items and options"""
       style = options.get("style", "bullet")
       return f"{title}\n" + "\n".join(
           f"  {'* ' if style == 'bullet' else '- '}{item}"
           for item in items
       )
   ```

---

## Key Takeaways

✅ **Parameters defined in function, arguments passed when calling** - Different terminology  
✅ **Positional arguments matched by order** - First arg to first param  
✅ **Keyword arguments by name, order flexible** - `func(b=2, a=1)`  
✅ **Default parameters save typing** - `def func(param="default")`  
✅ **`*args` for variable positional, `**kwargs` for variable keyword** - Flexible functions

---

## Additional Resources

- [Python Function Arguments](https://docs.python.org/3/tutorial/controlflow.html#more-on-defining-functions)
- [Function Parameters Guide](https://realpython.com/defining-your-own-python-function/)
- [Args and Kwargs](https://realpython.com/args-and-kwargs-in-python/)

---

## Next Lesson Preview

**Lesson 1.1.24**: Scope & Namespaces
- LEGB rule for variable resolution
- Local vs global scope
- `global` and `nonlocal` keywords
- Scope best practices

---

## Homework

- [ ] Complete Exercises 1.1.23.1 - 1.1.23.9
- [ ] Build and test Data Formatter
- [ ] Create 3 functions using `*args` or `**kwargs`
- [ ] Challenge: Combine all parameter types
- [ ] Quiz: Answer all assessment questions

**Expected time**: 3-4 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.24** when you're ready.
