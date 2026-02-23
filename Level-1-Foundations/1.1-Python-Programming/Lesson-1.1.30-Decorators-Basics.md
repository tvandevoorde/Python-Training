# Lesson 1.1.30: Decorators Basics

**Estimated Time**: 8 hours | **Difficulty**: Advanced  
**Prerequisites**: Lesson 1.1.29 (Generators & Yield) | **Topic**: Functions - Decorators

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Understand what decorators are and how they work
- Create simple decorators
- Use decorators with functions
- Stack multiple decorators
- Apply common decorators (@property, @staticmethod, etc.)
- Understand decorator syntax and execution

---

## 1. Decorator Fundamentals (90 min)

### 1.1 What is a Decorator?

```python
# Decorator: Function that modifies another function or class

# Regular function
def greet(name):
    return f"Hello, {name}!"

print(greet("Alice"))  # Hello, Alice!

# Decorator: Function that takes function as input
def shout(func):
    """Decorator that makes output LOUD"""
    def wrapper(*args, **kwargs):
        result = func(*args, **kwargs)
        return result.upper()
    return wrapper

# Apply decorator
greet = shout(greet)
print(greet("Bob"))  # HELLO, BOB!

# Decorator syntax (cleaner)
@shout
def farewell(name):
    return f"Goodbye, {name}!"

print(farewell("Charlie"))  # GOODBYE, CHARLIE!
```

### 1.2 How Decorators Work

```python
print("=== HOW DECORATORS WORK ===\n")

# Step-by-step decoration

def simple_decorator(func):
    """A simple decorator"""
    def wrapper():
        print("Before function call")
        result = func()
        print("After function call")
        return result
    return wrapper

# Without decorator syntax
def original():
    print("Inside original function")
    return "Done"

# These are equivalent:
decorated = simple_decorator(original)
decorated()

print("\n--- With @decorator syntax ---")

@simple_decorator
def another():
    print("Inside another function")
    return "Finished"

another()

# What @decorator does:
# 1. Define function
# 2. Pass to decorator
# 3. Replace with returned wrapper
# So: another = simple_decorator(another)
```

### 1.3 Decorators with Arguments

```python
print("\n=== DECORATORS WITH ARGUMENTS ===\n")

# Decorator that takes arguments from function
def repeat(func):
    """Decorator that repeats output"""
    def wrapper(*args, **kwargs):
        result = func(*args, **kwargs)
        return f"{result} || {result}"
    return wrapper

@repeat
def say_hi(name):
    return f"Hi, {name}!"

print(say_hi("Alice"))
# Output: Hi, Alice! || Hi, Alice!

# Decorator with its own arguments
def repeat_n_times(n):
    """Decorator factory: returns decorator"""
    def decorator(func):
        def wrapper(*args, **kwargs):
            result = func(*args, **kwargs)
            return " ".join([result] * n)
        return wrapper
    return decorator

@repeat_n_times(3)
def say_bye(name):
    return f"Bye, {name}!"

print(say_bye("Bob"))
# Output: Bye, Bob! Bye, Bob! Bye, Bob!

# How it works:
# 1. repeat_n_times(3) returns decorator function
# 2. @decorator decorates say_bye
# 3. say_bye = decorator(say_bye)
```

---

## 2. Common Decorators (90 min)

### 2.1 Timing Decorator

```python
print("=== TIMING DECORATOR ===\n")

import time

def time_it(func):
    """Decorator that measures function execution time"""
    def wrapper(*args, **kwargs):
        start = time.time()
        result = func(*args, **kwargs)
        end = time.time()
        print(f"{func.__name__} took {end - start:.4f} seconds")
        return result
    return wrapper

@time_it
def slow_function():
    """Simulates slow function"""
    time.sleep(0.1)
    return "Done"

slow_function()

@time_it
def calculate_sum(n):
    """Sum numbers 1 to n"""
    return sum(range(n))

result = calculate_sum(1000000)
print(f"Result: {result}")
```

### 2.2 Validation Decorator

```python
print("\n=== VALIDATION DECORATOR ===\n")

def validate_positive(func):
    """Decorator that validates positive arguments"""
    def wrapper(*args, **kwargs):
        for arg in args:
            if isinstance(arg, (int, float)) and arg < 0:
                raise ValueError(f"Expected positive, got {arg}")
        return func(*args, **kwargs)
    return wrapper

@validate_positive
def square_root(x):
    """Calculate square root"""
    return x ** 0.5

print(f"square_root(9) = {square_root(9)}")

try:
    square_root(-4)
except ValueError as e:
    print(f"Error: {e}")
```

### 2.3 Caching Decorator

```python
print("\n=== CACHING DECORATOR ===\n")

def memoize(func):
    """Decorator that caches function results"""
    cache = {}
    
    def wrapper(*args):
        if args in cache:
            print(f"Cache hit for {args}")
            return cache[args]
        
        result = func(*args)
        cache[args] = result
        return result
    
    return wrapper

@memoize
def fibonacci(n):
    """Fibonacci with caching"""
    if n <= 1:
        return n
    return fibonacci(n-1) + fibonacci(n-2)

# Much faster than uncached version!
print(f"fib(20) = {fibonacci(20)}")
print(f"fib(21) = {fibonacci(21)}")  # Uses cached results
```

---

## 3. Advanced Decorator Patterns (90 min)

### 3.1 Decorators with functools

```python
print("=== FUNCTOOLS ===\n")

from functools import wraps

# Problem: Decorated function loses metadata
def simple_decorator(func):
    def wrapper(*args, **kwargs):
        """Wrapper function"""
        return func(*args, **kwargs)
    return wrapper

@simple_decorator
def important():
    """Important function"""
    pass

print(f"Function name: {important.__name__}")  # Shows 'wrapper', not 'important'!
print(f"Docstring: {important.__doc__}")

# Solution: Use @wraps decorator
def better_decorator(func):
    @wraps(func)  # Preserves metadata
    def wrapper(*args, **kwargs):
        """Wrapper function"""
        return func(*args, **kwargs)
    return wrapper

@better_decorator
def another_important():
    """Another important function"""
    pass

print(f"\nWith @wraps:")
print(f"Function name: {another_important.__name__}")  # 'another_important'
print(f"Docstring: {another_important.__doc__}")
```

### 3.2 Class Decorators

```python
print("\n=== CLASS DECORATORS ===\n")

def add_repr(cls):
    """Decorator that adds __repr__ method to class"""
    def __repr__(self):
        attrs = ", ".join(f"{k}={v}" for k, v in self.__dict__.items())
        return f"{cls.__name__}({attrs})"
    
    cls.__repr__ = __repr__
    return cls

@add_repr
class Person:
    def __init__(self, name, age):
        self.name = name
        self.age = age

person = Person("Alice", 25)
print(person)  # Person(name=Alice, age=25)

# Dataclass decorator
from dataclasses import dataclass

@dataclass
class Point:
    """Automatically adds __init__, __repr__, etc."""
    x: float
    y: float

p = Point(3.0, 4.0)
print(p)  # Point(x=3.0, y=4.0)
```

### 3.3 Stacking Decorators

```python
print("\n=== STACKING DECORATORS ===\n")

def uppercase(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        result = func(*args, **kwargs)
        return result.upper()
    return wrapper

def add_exclamation(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        result = func(*args, **kwargs)
        return result + "!"
    return wrapper

# Stack decorators: applied bottom-to-top
@uppercase
@add_exclamation
def greet(name):
    return f"hello, {name}"

print(greet("alice"))
# Order: greet -> add_exclamation -> uppercase
# Result: "HELLO, ALICE!"

# Reverse order
@add_exclamation
@uppercase
def farewell(name):
    return f"goodbye, {name}"

print(farewell("bob"))
# Result: "GOODBYE, BOB!"
```

---

## 4. Real-World Decorators (60 min)

### 4.1 Logging Decorator

```python
print("=== LOGGING DECORATOR ===\n")

import logging

logging.basicConfig(level=logging.INFO)

def log_calls(func):
    """Decorator that logs function calls"""
    @wraps(func)
    def wrapper(*args, **kwargs):
        logging.info(f"Calling {func.__name__} with args={args}, kwargs={kwargs}")
        try:
            result = func(*args, **kwargs)
            logging.info(f"{func.__name__} returned {result}")
            return result
        except Exception as e:
            logging.error(f"{func.__name__} raised {e}")
            raise
    return wrapper

@log_calls
def divide(a, b):
    return a / b

divide(10, 2)

try:
    divide(10, 0)
except ZeroDivisionError:
    print("Caught division by zero")
```

### 4.2 Rate Limiting Decorator

```python
print("\n=== RATE LIMITING ===\n")

import time

def rate_limit(max_calls, time_window):
    """Limit function calls to max_calls per time_window seconds"""
    def decorator(func):
        calls = []
        
        @wraps(func)
        def wrapper(*args, **kwargs):
            now = time.time()
            # Remove old calls outside time window
            calls[:] = [c for c in calls if c > now - time_window]
            
            if len(calls) >= max_calls:
                raise Exception(f"Rate limit exceeded: {max_calls} calls per {time_window}s")
            
            calls.append(now)
            return func(*args, **kwargs)
        
        return wrapper
    return decorator

@rate_limit(3, 1)  # Max 3 calls per 1 second
def api_call():
    return "Success"

# First 3 calls succeed
for i in range(3):
    print(f"Call {i+1}: {api_call()}")

# 4th call fails
try:
    api_call()
except Exception as e:
    print(f"Call 4: {e}")
```

### 4.3 Property Decorator

```python
print("\n=== PROPERTY DECORATOR ===\n")

class Temperature:
    """Temperature converter"""
    def __init__(self, celsius):
        self._celsius = celsius
    
    @property
    def celsius(self):
        """Get temperature in Celsius"""
        return self._celsius
    
    @property
    def fahrenheit(self):
        """Get temperature in Fahrenheit"""
        return (self._celsius * 9/5) + 32
    
    @celsius.setter
    def celsius(self, value):
        """Set temperature in Celsius"""
        self._celsius = value

temp = Temperature(0)
print(f"0°C = {temp.fahrenheit}°F")

temp.celsius = 100
print(f"100°C = {temp.fahrenheit}°F")

# Properties look like attributes but run functions!
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.30.1**: Simple Decorator
```python
def bold(func):
    # Make output bold with **text**
    pass

@bold
def say_hello():
    return "Hello"

print(say_hello())  # **Hello**
```

**Exercise 1.1.30.2**: Argument Decorator
```python
def uppercase(func):
    # Convert output to uppercase
    pass

@uppercase
def greet(name):
    return f"Hello, {name}"

print(greet("alice"))  # HELLO, ALICE
```

**Exercise 1.1.30.3**: Decorator with Arguments
```python
def repeat(n):
    # Repeat output n times
    pass

@repeat(2)
def say_hi():
    return "Hi!"

print(say_hi())  # Hi!Hi!
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.30.4**: Timing Decorator
```python
def measure_time(func):
    # Time function execution
    # Print execution time
    pass
```

**Exercise 1.1.30.5**: Stacked Decorators
```python
@uppercase
@add_exclamation
def message():
    return "hello"

# What prints? Why?
```

**Exercise 1.1.30.6**: Caching Results
```python
def cache(func):
    # Cache function results
    # Return cached value if called with same args
    pass
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.30.7**: Validation Decorator
```python
def validate(validation_func):
    # Apply validation_func to arguments
    # Raise error if validation fails
    pass
```

**Exercise 1.1.30.8**: Property Class
```python
class Circle:
    # radius property
    # area property (calculated)
    # circumference property (calculated)
    pass
```

**Exercise 1.1.30.9**: Complex Decorator
```python
def retry(max_attempts):
    # Try function up to max_attempts times
    # Return on success, raise after max attempts
    pass
```

---

## Mini-Project: API Client with Decorators

Build API client using decorators for retry, caching, logging.

```python
from functools import wraps
import time

def retry_on_failure(max_retries=3, delay=1):
    """Retry decorator for API calls"""
    def decorator(func):
        @wraps(func)
        def wrapper(*args, **kwargs):
            for attempt in range(max_retries):
                try:
                    result = func(*args, **kwargs)
                    if attempt > 0:
                        print(f"Success after {attempt} retries")
                    return result
                except Exception as e:
                    if attempt == max_retries - 1:
                        raise
                    print(f"Attempt {attempt+1} failed: {e}. Retrying...")
                    time.sleep(delay)
        return wrapper
    return decorator

def cache_result(func):
    """Cache decorator for API calls"""
    cache = {}
    
    @wraps(func)
    def wrapper(*args, **kwargs):
        key = (args, tuple(sorted(kwargs.items())))
        if key in cache:
            print(f"Using cached result")
            return cache[key]
        
        result = func(*args, **kwargs)
        cache[key] = result
        return result
    
    return wrapper

class APIClient:
    @retry_on_failure(max_retries=3)
    @cache_result
    def get_user(self, user_id):
        """Fetch user from API"""
        print(f"Fetching user {user_id}...")
        # Simulate API call
        return {"id": user_id, "name": f"User {user_id}"}
    
    def get_post(self, post_id):
        """Fetch post from API"""
        print(f"Fetching post {post_id}...")
        return {"id": post_id, "title": f"Post {post_id}"}

# Usage
client = APIClient()
user = client.get_user(1)
print(f"User: {user}")

user = client.get_user(1)  # Uses cache
print(f"User: {user}")
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **Decorators modify function behavior.**
   - Answer: True

2. **Decorator syntax @func uses @ prefix.**
   - Answer: True

3. **Decorators are applied inside-out.**
   - Answer: False (bottom-up, like nested functions)

4. **@property creates computed attributes.**
   - Answer: True

---

### Conceptual Questions

5. **What is a decorator?**
   - Expected: Function that wraps another function, modifying behavior

6. **How do decorator arguments work?**
   - Expected: Decorator factory returns actual decorator

7. **Why use @wraps from functools?**
   - Expected: Preserves metadata (__name__, __doc__) of original function

---

### Coding Challenge

8. **Create timing decorator:**
   - Measure function execution time
   - Print: "Function X took Y seconds"
   - Use @wraps

---

## Key Takeaways

✅ **Decorators modify functions** - Wrap to add behavior  
✅ **@decorator syntax sugar** - Cleaner than manual decoration  
✅ **Stacking decorators** - Applied bottom-up  
✅ **@wraps preserves metadata** - Keep __name__ and __doc__  
✅ **Common patterns** - Timing, caching, validation, logging

---

## Additional Resources

- [Decorators in Python](https://realpython.com/primer-on-python-decorators/)
- [functools Documentation](https://docs.python.org/3/library/functools.html)
- [Advanced Decorator Patterns](https://wiki.python.org/moin/PythonDecoratorLibrary)

---

## Next Lesson Preview

**Lesson 1.1.31**: Functions Capstone Project
- Build complete function library
- Integrate all function concepts
- Real-world application

---

## Homework

- [ ] Complete Exercises 1.1.30.1 - 1.1.30.9
- [ ] Build and test API Client
- [ ] Create 3 different decorators
- [ ] Stack decorators properly
- [ ] Quiz: Answer all assessment questions

**Expected time**: 3-4 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.31** when you're ready.




