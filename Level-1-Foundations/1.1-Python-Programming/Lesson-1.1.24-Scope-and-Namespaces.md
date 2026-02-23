# Lesson 1.1.24: Scope & Namespaces

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.23 (Parameters & Arguments) | **Topic**: Functions - Variable Scope

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Understand variable scope and namespaces
- Apply the LEGB rule for variable resolution
- Distinguish between local and global scope
- Use `global` and `nonlocal` keywords correctly
- Debug scope-related issues
- Follow scope best practices

---

## 1. Understanding Scope (90 min)

### 1.1 What is Scope?

```python
# Scope: The region where a variable is accessible

# GLOBAL SCOPE: Top level, accessible everywhere
global_var = "I'm global"

def my_function():
    # LOCAL SCOPE: Inside function, only accessible here
    local_var = "I'm local"
    
    print(global_var)    # Can access global
    print(local_var)     # Can access local
    
    def nested():
        # NESTED SCOPE: Inside nested function
        nested_var = "I'm nested"
        
        print(global_var)    # Can access global
        print(local_var)     # Can access from outer function
        print(nested_var)    # Can access own local

my_function()

# ❌ Cannot access local_var here
# print(local_var)  # NameError: not defined
```

### 1.2 The LEGB Rule

```python
print("=== LEGB RULE ===\n")

# Python searches for variables in this order:
# L: Local scope (inside function)
# E: Enclosing scope (inside outer function, for nested functions)
# G: Global scope (module level)
# B: Built-in scope (Python keywords, functions)

# Example demonstrating LEGB
x = "GLOBAL"  # G: Global scope

def outer():
    x = "ENCLOSING"  # E: Enclosing scope
    
    def inner():
        x = "LOCAL"  # L: Local scope
        print(x)     # Which x? LOCAL - closest one wins!
    
    inner()
    print(x)  # E: Enclosing scope

outer()
print(x)  # G: Global scope

# Output:
# LOCAL
# ENCLOSING
# GLOBAL

# Built-in scope example
print = "override"  # Bad idea, but can be done
# Now print is a string, not the function!

# Reset: Delete to use built-in again
del print

# len is a built-in function
result = len([1, 2, 3])
print(f"Length: {result}")
```

### 1.3 Local vs Global

```python
print("\n=== LOCAL VS GLOBAL ===\n")

# GLOBAL: Defined at module level
counter = 0

def increment_global():
    global counter  # Must declare if modifying
    counter += 1
    return counter

print(f"Initial: {counter}")          # 0
print(f"After call 1: {increment_global()}")  # 1
print(f"After call 2: {increment_global()}")  # 2
print(f"Final global: {counter}")     # 2

# LOCAL: Defined inside function (default)
def count_players():
    players = 0  # LOCAL: new variable each call
    players += 1
    return players

print(f"\nPlayers in call 1: {count_players()}")  # 1
print(f"Players in call 2: {count_players()}")  # 1 (fresh start)
print(f"Players in call 3: {count_players()}")  # 1 (fresh start)
```

---

## 2. Global and Nonlocal Keywords (90 min)

### 2.1 Modifying Global Variables

```python
print("=== GLOBAL KEYWORD ===\n")

# ❌ WRONG: Trying to modify global
total = 10

def add_to_total_wrong(amount):
    total = total + amount  # UnboundLocalError!
    # Python sees 'total =' and treats it as local
    # But 'total' on right side doesn't exist locally yet
    return total

# This raises an error if uncommented

# ✅ CORRECT: Declare global first
total = 10

def add_to_total(amount):
    global total  # Tell Python we want the global one
    total = total + amount
    return total

print(f"Initial: {total}")
result = add_to_total(5)
print(f"After adding 5: {total}")
print(f"Result: {result}")

# ✅ Also works if only reading (no modification)
total = 10

def read_total():
    # No global needed if just reading
    return total * 2

print(f"Read only: {read_total()}")
```

### 2.2 Nested Functions and Nonlocal

```python
print("\n=== NONLOCAL KEYWORD ===\n")

# Nested functions can modify enclosing scope with nonlocal

def outer():
    counter = 0
    
    def increment():
        nonlocal counter  # Modify counter from outer function
        counter += 1
        return counter
    
    def decrement():
        nonlocal counter
        counter -= 1
        return counter
    
    def get_count():
        return counter
    
    return increment, decrement, get_count

inc, dec, get = outer()

print(f"Initial: {get()}")      # 0
print(f"Increment: {inc()}")    # 1
print(f"Increment: {inc()}")    # 2
print(f"Decrement: {dec()}")    # 1
print(f"Current: {get()}")      # 1

# Counter persists in the outer function's scope!
```

### 2.3 Common Mistakes

```python
print("\n=== COMMON SCOPE MISTAKES ===\n")

# Mistake 1: Forgetting global/nonlocal
total = 0

def add_wrong(amount):
    total += amount  # UnboundLocalError!
    return total
    
# Don't run this: add_wrong(5)

# Fix: Add global
total = 0

def add_right(amount):
    global total
    total += amount
    return total

print(f"Fixed: {add_right(10)}")  # Works now

# Mistake 2: Modifying function parameter as global
def process_data(data):
    global data  # ❌ Can't make parameter global!
    return data

# Parameters are always local to function

# Mistake 3: Assuming local changes affect global
my_list = [1, 2, 3]

def bad_modify_list():
    my_list = [4, 5, 6]  # Creates new local variable
    return my_list

print(f"After 'modification': {my_list}")  # Still [1, 2, 3]
print(f"Local: {bad_modify_list()}")       # [4, 5, 6]

# ✅ Correct: Use global if reassigning
my_list_2 = [1, 2, 3]

def good_modify_list():
    global my_list_2
    my_list_2 = [4, 5, 6]

good_modify_list()
print(f"Modified globally: {my_list_2}")  # [4, 5, 6]

# ✅ Or better: Modify contents without reassignment
my_list_3 = [1, 2, 3]

def modify_list_contents():
    my_list_3.append(4)  # No global needed!
    my_list_3[0] = 10

# Note: Can't modify list reference without global,
# but can modify list contents
```

---

## 3. Scope in Practice (90 min)

### 3.1 Function Scope Example

```python
print("=== FUNCTION SCOPE EXAMPLE ===\n")

name = "Alice"  # Global

def set_name(new_name):
    name = new_name  # Creates local variable (shadows global)
    print(f"Inside function: {name}")

print(f"Before: {name}")      # Alice
set_name("Bob")              # Prints: Inside function: Bob
print(f"After: {name}")       # Still Alice!

# To modify global:
name = "Alice"

def set_name_global(new_name):
    global name
    name = new_name
    print(f"Inside function: {name}")

print(f"Before: {name}")      # Alice
set_name_global("Charlie")   # Prints: Inside function: Charlie
print(f"After: {name}")       # Now Charlie
```

### 3.2 Closures and Scope

```python
print("\n=== CLOSURES ===\n")

# Closure: Function that "remembers" variables from enclosing scope

def make_multiplier(n):
    """Create function that multiplies by n"""
    def multiplier(x):
        return x * n  # 'n' from enclosing scope
    return multiplier

# Create specific multipliers
times_2 = make_multiplier(2)
times_5 = make_multiplier(5)

print(f"times_2(10) = {times_2(10)}")  # 20
print(f"times_5(10) = {times_5(10)}")  # 50

# Another closure example
def make_accumulator():
    """Create function that accumulates values"""
    total = 0  # Captured in closure
    
    def add(amount):
        nonlocal total
        total += amount
        return total
    
    return add

add_to_total = make_accumulator()

print(f"\nadd_to_total(5) = {add_to_total(5)}")    # 5
print(f"add_to_total(3) = {add_to_total(3)}")    # 8
print(f"add_to_total(2) = {add_to_total(2)}")    # 10

# Each closure is independent
add_to_other = make_accumulator()
print(f"add_to_other(100) = {add_to_other(100)}")  # 100
```

### 3.3 Scope Debugging

```python
print("\n=== DEBUGGING SCOPE ISSUES ===\n")

# Use globals() and locals() to inspect scope

def show_scope():
    local_var = "I'm local"
    global_var_copy = global_var  # Access global in function
    
    print("Local variables:")
    print(locals())
    
    print("\nGlobal variables (selected):")
    for key in ['global_var', 'show_scope']:
        if key in globals():
            print(f"  {key}: {globals()[key]}")

global_var = "I'm global"
show_scope()

# Practical debugging
def calculate(x):
    y = x * 2
    z = y + 10
    
    print(f"At function end, locals: {locals()}")
    return z

result = calculate(5)
print(f"Result: {result}")
```

---

## 4. Scope Best Practices (60 min)

### 4.1 Minimize Global Variables

```python
print("=== BEST PRACTICES ===\n")

# ❌ BAD: Function depends on global variable
counter = 0

def increment():
    global counter
    counter += 1

def decrement():
    global counter
    counter -= 1

def get_count():
    return counter

# Hard to test, reason about, and maintain

# ✅ GOOD: Class-based approach
class Counter:
    def __init__(self):
        self.count = 0
    
    def increment(self):
        self.count += 1
    
    def decrement(self):
        self.count -= 1
    
    def get(self):
        return self.count

counter = Counter()
counter.increment()
print(f"Count: {counter.get()}")

# ✅ ALSO GOOD: Return values instead of modifying state
def increment_counter(current_count):
    """Return incremented count"""
    return current_count + 1

count = 0
count = increment_counter(count)
print(f"New count: {count}")
```

### 4.2 Clear Variable Names

```python
print("\n=== CLEAR NAMING ===\n")

# ❌ UNCLEAR: What scope is 'x'?
x = 10

def func1(x):
    return x + 5

def func2():
    x = 20
    return x

# ✅ CLEAR: Specific names indicate purpose
global_config = {"debug": True}

def process_data(data):
    """Process data (parameter is local)"""
    local_result = data * 2
    return local_result

def read_config():
    """Access global configuration"""
    return global_config["debug"]
```

### 4.3 Documentation

```python
print("\n=== DOCUMENT SCOPE ===\n")

# Use docstrings to explain scope usage

def calculate_area(radius):
    """
    Calculate circle area.
    
    Uses only local variables and parameters.
    No global state accessed or modified.
    
    Parameters:
        radius (float): Circle radius
    
    Returns:
        float: Area of circle
    """
    PI = 3.14159  # Local constant
    area = PI * (radius ** 2)
    return area

def get_settings():
    """
    Retrieve global settings.
    
    Accesses global:
        app_settings (dict): Application configuration
    
    Returns:
        dict: Copy of settings
    """
    global app_settings  # Would need this if modifying
    return app_settings.copy()

app_settings = {"theme": "dark", "language": "en"}
print(f"Settings: {get_settings()}")
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.24.1**: Local vs Global
```python
x = 10

def func():
    x = 20
    print(x)

func()
print(x)

# What prints? Why?
```

**Exercise 1.1.24.2**: Simple Global
```python
count = 0

def increment():
    global count
    count += 1

increment()
increment()
print(count)

# What prints?
```

**Exercise 1.1.24.3**: LEGB Rule
```python
x = "global"

def outer():
    x = "enclosing"
    
    def inner():
        x = "local"
        print(x)
    
    inner()
    print(x)

outer()
print(x)

# What prints in order?
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.24.4**: Nonlocal
```python
def make_counter():
    count = 0
    
    def increment():
        nonlocal count
        count += 1
        return count
    
    return increment

counter = make_counter()
print(counter())
print(counter())
print(counter())

# What prints?
```

**Exercise 1.1.24.5**: Scope Error
```python
def func():
    x += 10
    return x

x = 5
try:
    func()
except Exception as e:
    print(f"Error type: {type(e).__name__}")

# What error and why?
```

**Exercise 1.1.24.6**: Closure
```python
def make_adder(n):
    def add(x):
        return x + n
    return add

add_5 = make_adder(5)
add_10 = make_adder(10)

print(add_5(3))
print(add_10(3))

# What prints?
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.24.7**: Complex Scope
```python
x = "global"

def func1():
    x = "level1"
    
    def func2():
        nonlocal x
        x = "level2"
    
    func2()
    print(x)

func1()
print(x)

# What prints?
```

**Exercise 1.1.24.8**: State Management
```python
def make_bank_account(initial_balance):
    balance = initial_balance
    
    def deposit(amount):
        nonlocal balance
        balance += amount
        return balance
    
    def withdraw(amount):
        nonlocal balance
        if balance >= amount:
            balance -= amount
            return balance
        return None
    
    return deposit, withdraw

dep, wit = make_bank_account(100)
print(dep(50))
print(wit(30))
print(wit(200))

# What prints?
```

**Exercise 1.1.24.9**: Shadowing
```python
def process():
    items = [1, 2, 3]  # Local list
    
    def modify():
        items = [4, 5, 6]  # New local list
        return items
    
    result = modify()
    return items, result

local, modified = process()
print(local)
print(modified)

# What prints?
```

---

## Mini-Project: Configuration Manager

Use scope and closures to manage application configuration.

```python
def create_config_manager(defaults):
    """Create configuration manager with defaults"""
    config = defaults.copy()
    
    def get(key, default_value=None):
        """Get config value"""
        return config.get(key, default_value)
    
    def set(key, value):
        """Set config value"""
        config[key] = value
        return value
    
    def reset():
        """Reset to defaults"""
        nonlocal config
        config = defaults.copy()
    
    def get_all():
        """Get all config as copy"""
        return config.copy()
    
    return {
        'get': get,
        'set': set,
        'reset': reset,
        'all': get_all
    }

# Usage
defaults = {'theme': 'light', 'language': 'en', 'debug': False}
settings = create_config_manager(defaults)

print(f"Initial theme: {settings['get']('theme')}")
settings['set']('theme', 'dark')
print(f"Updated theme: {settings['get']('theme')}")
print(f"All settings: {settings['all']()}")
settings['reset']()
print(f"After reset: {settings['get']('theme')}")
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **Local variables can be accessed outside their function.**
   - Answer: False (local to function only)

2. **`global` keyword needed to read global variable.**
   - Answer: False (only to modify)

3. **`nonlocal` used in nested functions only.**
   - Answer: True

4. **LEGB rule determines variable search order.**
   - Answer: True

---

### Conceptual Questions

5. **Why does Python use the concept of scope?**
   - Expected: Prevents variable name conflicts, organizes code

6. **When should you use global variables?**
   - Expected: Rarely; use classes or return values instead

7. **What is a closure?**
   - Expected: Function that accesses variables from enclosing scope

---

### Coding Challenge

8. **Create bank account simulator:**
   - Tracks balance in closure
   - deposit() adds money
   - withdraw() removes money
   - balance_check() shows current amount

   ```python
   def create_account(starting_amount):
       balance = starting_amount
       
       def deposit(amount):
           nonlocal balance
           balance += amount
           return balance
       
       def withdraw(amount):
           nonlocal balance
           if amount <= balance:
               balance -= amount
               return balance
           return None
       
       def check_balance():
           return balance
       
       return {'deposit': deposit, 'withdraw': withdraw, 'balance': check_balance}
   ```

---

## Key Takeaways

✅ **Scope determines where variables are accessible** - Local, enclosing, global, built-in  
✅ **LEGB rule: Python searches in order** - Closest scope wins  
✅ **Use `global` to modify global variable** - Needed for assignment  
✅ **Use `nonlocal` in nested functions** - Modify enclosing scope  
✅ **Minimize global state** - Cleaner, easier to test and maintain

---

## Additional Resources

- [Python Scope and Namespaces](https://docs.python.org/3/tutorial/classes.html#python-scopes-and-namespaces)
- [Understanding Scope](https://realpython.com/python-scope-legb-rule/)
- [Closures in Python](https://realpython.com/inner-functions-what-can-they-do-for-you/)

---

## Next Lesson Preview

**Lesson 1.1.25**: Return Values & Advanced Functions
- Multiple return values
- Function chaining
- Pure functions vs side effects
- Pattern: early returns

---

## Homework

- [ ] Complete Exercises 1.1.24.1 - 1.1.24.9
- [ ] Build and test Configuration Manager
- [ ] Create 3 functions using closures
- [ ] Challenge: Create state-tracking function
- [ ] Quiz: Answer all assessment questions

**Expected time**: 3-4 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.25** when you're ready.




