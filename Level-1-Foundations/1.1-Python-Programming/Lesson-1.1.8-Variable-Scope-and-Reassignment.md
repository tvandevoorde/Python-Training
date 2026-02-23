# Lesson 1.1.8: Variable Scope & Reassignment

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.7 (Boolean Logic & Truth Values) | **Topic**: Scope & Variable Lifetime

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Understand the LEGB rule for variable scope resolution
- Identify and resolve variable shadowing issues
- Use global and nonlocal keywords effectively
- Understand variable reassignment and mutation
- Apply scope best practices to avoid bugs

---

## 1. Understanding Variable Scope (90 min)

### 1.1 What is Scope?

Scope defines where a variable is accessible and when it exists in memory.

```python
# Global scope - accessible anywhere in the module
message = "Hello"

def outer_function():
    # Function scope - only accessible inside this function
    local_message = "Inside outer"
    print(local_message)  # Works
    
    def inner_function():
        # Nested function scope
        nested_message = "Inside inner"
        print(nested_message)  # Works
    
    # This would NOT work:
    # print(nested_message)  # ❌ NameError - not in this scope

print(message)  # Works - global scope
# print(local_message)  # ❌ NameError - local_message is local to outer_function()
```

### 1.2 The LEGB Rule

Python resolves variable names using LEGB (Local, Enclosing, Global, Built-in):

```python
# 1. BUILT-IN scope
print(len)  # Built-in function from Python
print(int)  # Built-in type

# 2. GLOBAL scope
global_var = "I'm global"

def outer():
    # 3. ENCLOSING scope (for nested functions)
    enclosing_var = "I'm enclosing"
    
    def inner():
        # 4. LOCAL scope
        local_var = "I'm local"
        
        # Resolution order when accessing a name:
        print(local_var)        # 1. Check LOCAL first
        print(enclosing_var)    # 2. Check ENCLOSING
        print(global_var)       # 3. Check GLOBAL
        print(len)              # 4. Check BUILT-IN
    
    return inner()

outer()
```

### 1.3 Demonstrating LEGB with Conflicts

```python
name = "global"  # GLOBAL

def show_legb():
    name = "enclosing"  # ENCLOSING/LOCAL for nested function
    
    def inner():
        name = "local"  # LOCAL
        print(name)  # Which 'name' is used?
    
    inner()  # Prints: "local"
    print(name)  # Prints: "enclosing"

show_legb()
print(name)  # Prints: "global"

# Python always finds the CLOSEST scope (goes from L→E→G→B)
```

---

## 2. Variable Shadowing & Name Conflicts (90 min)

### 2.1 Understanding Variable Shadowing

Variable shadowing occurs when a variable in an inner scope has the same name as one in an outer scope, hiding the outer variable.

```python
count = 10  # Global scope

def process():
    count = 0  # Local scope - SHADOWS the global count
    
    for i in range(5):
        count += 1  # Modifies LOCAL count, not global
    
    print(f"Inside function: {count}")  # Output: 5

process()
print(f"Global count: {count}")  # Output: 10 (unchanged!)

# This is often unintended and can cause bugs
```

### 2.2 Nested Shadowing Issues

```python
x = 1  # Global

def level1():
    x = 2  # Shadows global x
    
    def level2():
        x = 3  # Shadows level1's x
        
        def level3():
            x = 4  # Shadows level2's x
            print(f"Level 3: {x}")
        
        level3()
        print(f"Level 2: {x}")
    
    level2()
    print(f"Level 1: {x}")

level1()
print(f"Global: {x}")

# Output:
# Level 3: 4
# Level 2: 3
# Level 1: 2
# Global: 1

# Each level only sees its own local variable!
```

### 2.3 Common Shadowing Mistakes

```python
# ❌ MISTAKE: Shadowing a built-in
list = [1, 2, 3]  # Shadows built-in list() function!
my_list = list(range(5))  # ❌ ERROR! list is now a list, not a function

# ✅ CORRECT: Use different names
my_list = [1, 2, 3]
another_list = list(range(5))  # OK

# ❌ MISTAKE: Shadowing import
import math
math = 42  # Shadows the math module!
print(math.pi)  # ❌ ERROR! math is now 42

# ✅ CORRECT: Use different names for variables
import math
pi_value = 42
print(math.pi)  # OK

# ❌ MISTAKE: Loop variable shadowing outer variable
data = 100

def process_data():
    for data in [1, 2, 3]:  # SHADOWS outer 'data'
        print(data)
    
    print(data)  # Output: 3 (refers to loop variable, not 100)
```

---

## 3. The `global` and `nonlocal` Keywords (60 min)

### 3.1 Using `global` to Modify Global Variables

By default, assignment creates a LOCAL variable. Use `global` to modify a global one.

```python
counter = 0  # Global

def increment_counter():
    global counter  # Declare intent to use global variable
    counter += 1

def reset_counter():
    global counter
    counter = 0

increment_counter()
print(counter)  # Output: 1

increment_counter()
print(counter)  # Output: 2

reset_counter()
print(counter)  # Output: 0

# WITHOUT 'global' keyword:
def bad_increment():
    counter += 1  # ❌ UnboundLocalError! counter is local, not defined yet

# The same variable name is treated as local once you assign to it
```

### 3.2 Practical `global` Usage (Config/State)

```python
# Configuration stored globally
DEBUG = True
MAX_RETRIES = 3

def set_debug_mode(enabled):
    global DEBUG
    DEBUG = enabled
    print(f"Debug mode: {DEBUG}")

def retry_operation():
    attempt = 0
    while attempt < MAX_RETRIES:  # OK to READ global
        attempt += 1
        if DEBUG:
            print(f"Attempt {attempt}")
        # ... operation code ...

set_debug_mode(False)
set_debug_mode(True)
```

### 3.3 Using `nonlocal` for Enclosing Scope

`nonlocal` refers to variables in the ENCLOSING scope (for nested functions).

```python
def outer():
    count = 0  # Enclosing variable
    
    def inner():
        nonlocal count  # Refer to enclosing count, not local
        count += 1
        return count
    
    result1 = inner()  # Returns 1
    result2 = inner()  # Returns 2 (same count variable)
    result3 = inner()  # Returns 3
    
    return result1, result2, result3

print(outer())  # Output: (1, 2, 3)

# WITHOUT nonlocal (would create local variable):
def outer_wrong():
    count = 0
    
    def inner():
        count = count + 1  # ❌ UnboundLocalError - trying to read local before assignment
        return count
    
    return inner()

# This creates a counter/accumulator pattern
```

### 3.4 Factories with `nonlocal`

```python
def make_counter():
    """Create a counter function that remembers state"""
    count = 0
    
    def increment():
        nonlocal count
        count += 1
        return count
    
    def decrement():
        nonlocal count
        count -= 1
        return count
    
    def reset():
        nonlocal count
        count = 0
    
    def get_value():
        return count
    
    return increment, decrement, reset, get_value

# Create two independent counters
inc1, dec1, reset1, get1 = make_counter()
inc2, dec2, reset2, get2 = make_counter()

print(inc1())   # 1
print(inc1())   # 2
print(get1())   # 2

print(inc2())   # 1 (different counter)
print(get2())   # 1

print(get1())   # 2 (first counter unchanged)
```

---

## 4. Variable Reassignment & Mutation (60 min)

### 4.1 Reassignment vs Mutation

```python
# REASSIGNMENT: Variable points to new value
x = 5
x = 10  # x now points to 10

# MUTATION: Modifying object contents (for mutable types)
my_list = [1, 2, 3]
my_list.append(4)  # Mutate the list object
print(my_list)  # [1, 2, 3, 4]

my_list = [5, 6]  # Reassignment - point to new list
print(my_list)  # [5, 6]
```

### 4.2 Understanding Mutable vs Immutable

```python
# IMMUTABLE: Can't change, only reassign
x = 5
# x[0] = 10  # ❌ ERROR - integers don't support item assignment

# MUTABLE: Can change contents
my_dict = {'name': 'Alice'}
my_dict['name'] = 'Bob'  # Mutate existing dictionary
my_dict['age'] = 30      # Add new key

# When reassigning vs mutating matters:
def process_list(items):
    items.append(99)  # Mutates original list
    items = []        # Reassignment doesn't affect caller's variable
    items.append(100)

my_list = [1, 2, 3]
process_list(my_list)
print(my_list)  # [1, 2, 3, 99] - original was mutated
```

### 4.3 Reassignment Patterns

```python
# In-place operations
x = 10
x = x + 5      # Reassignment (takes old value + 5)
print(x)       # 15

# Compound assignment (shorthand)
x = 10
x += 5         # Same as x = x + 5
print(x)       # 15

# Works with other types
name = "Hello"
name += " World"  # Reassignment (concatenation creates new string)
print(name)  # "Hello World"

my_list = [1, 2]
my_list += [3, 4]  # In-place addition (mutates)
print(my_list)  # [1, 2, 3, 4]
```

### 4.4 Swapping with Reassignment

```python
# Simple swap using reassignment
a = 5
b = 10
a, b = b, a  # Reassign both simultaneously
print(a, b)  # 10 5

# Useful pattern without temporary variable
x, y = 1, 2
x, y = y, x  # One line swap!
```

---

## 5. Scope Best Practices (30 min)

### 5.1 Designing for Clear Scope

```python
# ❌ CONFUSING: Uses global state
total = 0

def add_sale(amount):
    global total
    total += amount

def get_total():
    global total
    return total

# Reset?? No way! Data is stuck!

# ✅ BETTER: Return values, pass parameters
def add_sale(current_total, amount):
    return current_total + amount

def process_sales(sales):
    total = 0
    for sale in sales:
        total = add_sale(total, sale)
    return total

result = process_sales([100, 50, 75])
print(result)  # 225
```

### 5.2 Avoid Shadowing

```python
# ❌ CONFUSING: Different meanings
def calculate(item, price):
    item = process_item(item)  # OK - parameter -> local variable
    item = item * price  # ❌ Now item is a number, not processed item
    return item

# ✅ CLEAR: Different names
def calculate(item, price):
    processed = process_item(item)
    result = processed * price
    return result
```

### 5.3 Function Purity

```python
# ❌ IMPURE: Uses and modifies global state
users = []

def add_user(name):
    global users  # Depends on global state
    users.append(name)

# ✅ PURE: No global dependencies
def add_user_pure(users, name):
    new_users = users + [name]  # Creates new list
    return new_users

users = []
users = add_user_pure(users, "Alice")
users = add_user_pure(users, "Bob")
print(users)  # ['Alice', 'Bob']
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.8.1**: Identifying Scope
```python
x = 100  # Global

def function():
    x = 200  # Local
    print(x)

function()
print(x)

# What prints? [Yes/No] Is the global x changed?
```

**Exercise 1.1.8.2**: Using `global` Keyword
```python
count = 0

def increment():
    global count
    count += 1

increment()
print(count)  # Should print: 1
```

**Exercise 1.1.8.3**: Variable Shadowing
```python
name = "Global"

def print_names():
    name = "Local"
    print(name)

print_names()
print(name)

# What prints at each line?
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.8.4**: Nested Scope with `nonlocal`
```python
def outer():
    count = 0
    
    def inner():
        nonlocal count
        count += 1
        return count
    
    return inner

counter = outer()
print(counter())  # Should print: 1
print(counter())  # Should print: 2
print(counter())  # Should print: 3
```

**Exercise 1.1.8.5**: Fixing Shadowing Bug
```python
# This code has a shadowing bug - fix it
product = 1

def multiply_list(numbers):
    global product
    for number in numbers:
        product *= number  # OK
    
    product = sum(numbers)  # ❌ Bug! Overwrites with sum
    
    return product

# Fix this code so it multiplies correctly
```

**Exercise 1.1.8.6**: LEGB Resolution
```python
# Predict what each print statement outputs
x = 1

def level1():
    x = 2
    
    def level2():
        x = 3
        print(f"Inner: {x}")
    
    print(f"Middle: {x}")
    level2()

print(f"Outer: {x}")
level1()
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.8.7**: Creating a Bank Account Class-like Behavior
```python
def create_account(initial_balance):
    """Create a bank account with deposit/withdraw functions"""
    balance = initial_balance
    
    def deposit(amount):
        nonlocal balance
        balance += amount
        return balance
    
    def withdraw(amount):
        nonlocal balance
        if amount <= balance:
            balance -= amount
            return True
        return False
    
    def get_balance():
        return balance
    
    return deposit, withdraw, get_balance

# Create two accounts
dep1, with1, bal1 = create_account(1000)
dep2, with2, bal2 = create_account(500)

# Use account 1
print(dep1(200))    # 1200
print(with1(500))   # True
print(bal1())       # 700

# Account 2 independent
print(bal2())       # 500 (unchanged)
```

**Exercise 1.1.8.8**: Global vs Local Best Practices
```python
# Rewrite this code to avoid using 'global'
scores = []  # Avoid global state!

def add_score(score):
    global scores  # ❌ Using global
    scores.append(score)

def get_average():
    global scores  # ❌ Using global
    return sum(scores) / len(scores) if scores else 0

# Rewrite to use parameters and return values instead
def add_score_better(current_scores, score):
    return current_scores + [score]

def get_average_better(scores):
    return sum(scores) / len(scores) if scores else 0

# Usage
scores = []
scores = add_score_better(scores, 85)
scores = add_score_better(scores, 90)
print(get_average_better(scores))  # 87.5
```

**Exercise 1.1.8.9**: Debugging Scope Issues
```python
# This code has scope-related bugs - find and fix them
def create_multiplier(factor):
    """Create a function that multiplies by factor"""
    
    def multiply(x):
        return x * factor  # ← What scope is factor from?
    
    return multiply

times_three = create_multiplier(3)
times_five = create_multiplier(5)

print(times_three(10))  # Should be 30
print(times_five(10))   # Should be 50
print(times_three(10))  # Should be 30 again

# The tricky part: Does each have its own factor?
# Will this work correctly? Write test code to verify
```

---

## Mini-Project: Game State Manager

Build a system that manages game state using proper scope and avoiding global abuse.

```python
def create_game():
    """Create a game with state management"""
    
    # Game state - encapsulated, not global
    score = 0
    level = 1
    lives = 3
    game_over = False
    
    def add_points(points):
        nonlocal score
        if not game_over:
            score += points
            return score
        return -1
    
    def lose_life():
        nonlocal lives, game_over
        lives -= 1
        if lives <= 0:
            game_over = True
        return lives
    
    def advance_level():
        nonlocal level
        level += 1
        return level
    
    def get_status():
        return {
            'score': score,
            'level': level,
            'lives': lives,
            'game_over': game_over
        }
    
    def reset():
        nonlocal score, level, lives, game_over
        score = 0
        level = 1
        lives = 3
        game_over = False
    
    return add_points, lose_life, advance_level, get_status, reset

# Create game
add_points, lose_life, advance_level, get_status, reset = create_game()

# Play
add_points(100)
add_points(50)
advance_level()
print(get_status())
# {'score': 150, 'level': 2, 'lives': 3, 'game_over': False}

lose_life()
lose_life()
print(get_status())
# {'score': 150, 'level': 2, 'lives': 1, 'game_over': False}

reset()
print(get_status())
# {'score': 0, 'level': 1, 'lives': 3, 'game_over': False}
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **A variable assigned inside a function is always local to that function.**
   - Answer: False (unless used `global`, then it's global)

2. **`nonlocal` is used to access variables in the enclosing (outer) function scope.**
   - Answer: True

3. **Variable shadowing occurs when reassigning to a global variable inside a function.**
   - Answer: False (shadowing is when a new local variable hides an outer one)

4. **Without `global` keyword, you cannot read a global variable from inside a function.**
   - Answer: False (you can read globals, just can't reassign without `global`)

---

### Conceptual Questions

5. **Explain the LEGB rule in simple terms. What does each letter stand for?**
   - Expected: Local (function), Enclosing (outer function), Global (module), Built-in (Python)

6. **When would you use `nonlocal` instead of `global`?**
   - Expected: For nested functions to access/modify outer function variables (not module-level)

7. **Give an example of when variable shadowing might be a bug in your code.**
   - Expected: Loop variables overwriting global state; parameters with same name as intended globals

---

### Coding Challenge

8. **Create a counter factory that generates independent counters with increment/decrement/reset functionality:**

   ```python
   def make_counter():
       """Factory that creates independent counters"""
       count = 0
       
       def increment():
           nonlocal count
           count += 1
           return count
       
       def decrement():
           nonlocal count
           count -= 1
           return count
       
       def reset():
           nonlocal count
           count = 0
           return count
       
       def value():
           return count
       
       return increment, decrement, reset, value
   
   # Test
   inc1, dec1, rst1, val1 = make_counter()
   inc2, dec2, rst2, val2 = make_counter()
   
   print(val1())   # 0
   print(inc1())   # 1
   print(inc1())   # 2
   print(val2())   # 0 (different counter)
   print(dec1())   # 1
   print(rst1())   # 0
   print(val1())   # 0
   ```

---

## Key Takeaways

✅ **LEGB Rule**: Python searches Local → Enclosing → Global → Built-in for variables  
✅ **Variable shadowing hides outer variables** - Different scope levels can have same name  
✅ **`global` keyword modifies module-level variables** - Use cautiously, prefer parameters  
✅ **`nonlocal` modifies enclosing function variables** - For closures and factories  
✅ **Reassignment vs mutation** - Different behaviors for mutable (list, dict) vs immutable (int, str)  

---

## Additional Resources

- [Python Scope and Namespace Documentation](https://docs.python.org/3/tutorial/classes.html#python-scopes-and-namespaces)
- [Understanding Closures](https://realpython.com/inner-functions-what-are-they-good-for/)
- [Variable Shadowing Pitfalls](https://en.wikipedia.org/wiki/Variable_shadowing)

---

## Next Lesson Preview

**Lesson 1.1.9**: Mini-Project: Simple Calculator
- Consolidates all Topic 1 concepts
- Variables, operators, input/output, scope
- Building real-world application

---

## Homework

- [ ] Complete Exercises 1.1.8.1 - 1.1.8.9
- [ ] Build and test the Game State Manager
- [ ] Challenge: Create a tic-tac-toe game tracker using closures
- [ ] Review: Verify you understand when to use `global` vs `nonlocal`
- [ ] Quiz: Answer all assessment questions

**Expected time**: 2-3 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.9** when you're ready.




