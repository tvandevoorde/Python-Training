# Lesson 1.1.29: Generators & Yield

**Estimated Time**: 8 hours | **Difficulty**: Intermediate-Advanced  
**Prerequisites**: Lesson 1.1.28 (Recursion) | **Topic**: Functions - Generator Functions

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Create generator functions using yield
- Understand lazy evaluation and memory efficiency
- Use generators with loops and comprehensions
- Create custom iterators
- Apply generators to real-world problems
- Optimize code with yield expressions

---

## 1. Generator Fundamentals (90 min)

### 1.1 What is a Generator?

```python
# Generator: Function that yields multiple values one at a time

# Regular function returns all at once
def regular_function():
    """Returns list of numbers"""
    result = []
    result.append(1)
    result.append(2)
    result.append(3)
    return result

result = regular_function()
print(f"Regular: {result}")  # [1, 2, 3]

# Generator yields one value at a time
def generator_function():
    """Yields numbers one by one"""
    print("About to yield 1")
    yield 1
    print("About to yield 2")
    yield 2
    print("About to yield 3")
    yield 3
    print("Done")

print("\nGenerator function:")
gen = generator_function()  # Creates generator object
print(f"Type: {type(gen)}")

# Get values one at a time
print(f"First value: {next(gen)}")
print(f"Second value: {next(gen)}")
print(f"Third value: {next(gen)}")

try:
    print(f"Fourth value: {next(gen)}")
except StopIteration:
    print("No more values!")
```

### 1.2 Generators vs Lists

```python
print("\n=== GENERATORS VS LISTS ===\n")

# List: Creates all values in memory
def numbers_list(n):
    """Return list of numbers"""
    result = []
    for i in range(n):
        result.append(i)
    return result

# Generator: Creates values on demand (lazy)
def numbers_generator(n):
    """Yield numbers one at a time"""
    for i in range(n):
        yield i

# Memory difference
import sys

# Small example
nums_list = numbers_list(5)
nums_gen = numbers_generator(5)

print(f"List size: {sys.getsizeof(nums_list)} bytes")
print(f"Generator size: {sys.getsizeof(nums_gen)} bytes")

# List has all values
print(f"List values: {nums_list}")

# Generator produces values on demand
gen = numbers_generator(5)
print(f"Generator: {gen}")
print(f"Generator values: {list(gen)}")

# Larger example
large_list = numbers_list(1000000)
large_gen = numbers_generator(1000000)

print(f"\n1M numbers:")
print(f"List: {sys.getsizeof(large_list)} bytes (all in memory)")
print(f"Generator: {sys.getsizeof(large_gen)} bytes (lazy evaluation)")
```

### 1.3 Using Generators in Loops

```python
print("\n=== GENERATORS IN LOOPS ===\n")

def countdown(n):
    """Yield numbers counting down"""
    while n > 0:
        yield n
        n -= 1

# Use generator in for loop
print("Countdown from 5:")
for num in countdown(5):
    print(num, end=" ")
print("\n")

# Generator comprehension (like list comprehension)
even_gen = (x for x in range(10) if x % 2 == 0)
print(f"Even numbers generator: {even_gen}")
print(f"Values: {list(even_gen)}")

# Can iterate multiple times? NO!
gen = countdown(3)
print(f"First iteration: {list(gen)}")
print(f"Second iteration: {list(gen)}")  # Empty! Generator exhausted

# Create new generator for new iteration
gen1 = countdown(3)
gen2 = countdown(3)
print(f"New generator 1: {list(gen1)}")
print(f"New generator 2: {list(gen2)}")
```

---

## 2. Creating Generators (90 min)

### 2.1 Generator Functions

```python
print("=== GENERATOR FUNCTIONS ===\n")

# Fibonacci generator
def fibonacci(limit):
    """Generate Fibonacci sequence up to limit"""
    a, b = 0, 1
    while a < limit:
        yield a
        a, b = b, a + b

print("Fibonacci numbers < 100:")
for fib in fibonacci(100):
    print(fib, end=" ")
print("\n")

# Read file lines
def read_large_file(filename):
    """Read file line by line (memory efficient)"""
    try:
        with open(filename, 'r') as f:
            for line in f:
                yield line.rstrip('\n')
    except FileNotFoundError:
        print(f"File {filename} not found")
        return

# Usage: for line in read_large_file('big_file.txt'): ...
# Only keeps one line in memory at a time!

# Infinite sequence
def count_up():
    """Generate infinite sequence of integers"""
    n = 0
    while True:
        yield n
        n += 1

# Use with break or limit
print("First 5 numbers from infinite generator:")
counter = count_up()
for i in range(5):
    print(next(counter), end=" ")
print("\n")

# Nested iteration
def nested_generator():
    """Generate from nested structure"""
    lists = [[1, 2], [3, 4], [5, 6]]
    for sublist in lists:
        for item in sublist:
            yield item

print("Nested values:")
for val in nested_generator():
    print(val, end=" ")
print("\n")
```

### 2.2 Generator Expressions

```python
print("\n=== GENERATOR EXPRESSIONS ===\n")

# Like list comprehension but with ()
squares_list = [x**2 for x in range(5)]
squares_gen = (x**2 for x in range(5))

print(f"List: {squares_list}")
print(f"Generator: {squares_gen}")
print(f"Values: {list(squares_gen)}")

# Filtering
numbers = range(20)
evens_gen = (x for x in numbers if x % 2 == 0)
print(f"Even numbers: {list(evens_gen)}")

# Multiple conditions
filtered = (x for x in range(100) if x % 2 == 0 if x % 3 == 0)
print(f"Divisible by 2 and 3: {list(filtered)}")

# Combining with functions
def process_stream(data):
    """Process each value"""
    for x in data:
        yield x * 2 + 1

def filter_stream(data, limit):
    """Filter by limit"""
    for x in data:
        if x < limit:
            yield x

# Chain operations
raw_data = range(10)
processed = process_stream(raw_data)  # Generator
filtered = filter_stream(processed, 15)  # Another generator
result = list(filtered)
print(f"Chained generators: {result}")
```

### 2.3 Generator Delegation

```python
print("\n=== GENERATOR DELEGATION ===\n")

# Use yield from to delegate to another generator

def inner_generator():
    """Yield some values"""
    yield 1
    yield 2

def outer_generator_manual():
    """Manually iterate"""
    for val in inner_generator():
        yield val

def outer_generator_delegated():
    """Delegate with yield from"""
    yield from inner_generator()

print("Manual delegation:")
print(list(outer_generator_manual()))

print("Delegated with yield from:")
print(list(outer_generator_delegated()))

# More complex example
def flatten(nested):
    """Flatten nested lists recursively"""
    for item in nested:
        if isinstance(item, list):
            yield from flatten(item)  # Delegate to recursive call
        else:
            yield item

nested_list = [1, [2, 3], [[4, 5], 6], 7]
print(f"Flattened: {list(flatten(nested_list))}")
```

---

## 3. Advanced Generator Patterns (90 min)

### 3.1 Two-Way Generators (send)

```python
print("=== SEND AND GENERATORS ===\n")

# Generators can receive values with send()

def echo_generator():
    """Receive values and yield them"""
    while True:
        value = yield  # Pause and wait for input
        print(f"Received: {value}")
        yield f"Echo: {value}"

gen = echo_generator()
next(gen)  # Prime the generator
result = gen.send("Hello")
print(result)

# More practical example
def accumulator():
    """Accumulate values sent to generator"""
    total = 0
    while True:
        value = yield total  # Yield current total, wait for input
        if value is not None:
            total += value

gen = accumulator()
print(f"Initial: {next(gen)}")
print(f"After 5: {gen.send(5)}")
print(f"After 3: {gen.send(3)}")
print(f"After 2: {gen.send(2)}")

# Pipeline pattern
def producer():
    """Produce values"""
    for i in range(5):
        yield i

def filter_step(iterable, predicate):
    """Filter generator"""
    for item in iterable:
        if predicate(item):
            yield item

def transform_step(iterable, transform):
    """Transform generator"""
    for item in iterable:
        yield transform(item)

# Chain: produce -> filter -> transform
data = producer()
filtered = filter_step(data, lambda x: x % 2 == 0)
transformed = transform_step(filtered, lambda x: x * 10)

print(f"Pipeline result: {list(transformed)}")
```

### 3.2 Generator Coroutines

```python
print("\n=== GENERATOR COROUTINES ===\n")

# Coroutines: Generators that can be interrupted and resumed

def simple_coroutine():
    """Example coroutine"""
    print("Coroutine started")
    x = yield  # Pause point 1
    print(f"Received x={x}")
    y = yield  # Pause point 2
    print(f"Received y={y}")
    return x + y

coro = simple_coroutine()
print("Prime the coroutine:")
print(next(coro))  # Start, stops at first yield

print("Send first value:")
print(coro.send(10))

print("Send second value:")
try:
    result = coro.send(20)
except StopIteration as e:
    print(f"Coroutine finished: result = {e.value}")

# Data pipeline coroutine
def data_sink():
    """Coroutine that receives and processes data"""
    data = []
    while True:
        item = yield data
        if item is not None:
            data.append(item)

sink = data_sink()
next(sink)  # Prime it
result = sink.send(1)
result = sink.send(2)
result = sink.send(3)
print(f"Accumulated data: {result}")
```

### 3.3 Performance Optimization

```python
print("\n=== GENERATOR OPTIMIZATION ===\n")

import time

# Problem: Process large dataset
# Solution: Use generator to save memory

def large_dataset_list(n):
    """Create large list in memory"""
    result = []
    for i in range(n):
        result.append(i ** 2)
    return result

def large_dataset_generator(n):
    """Generate values on demand"""
    for i in range(n):
        yield i ** 2

# Compare memory and speed
n = 1000000

# List approach
start = time.time()
data_list = large_dataset_list(n)
time_list = time.time() - start

# Generator approach
start = time.time()
data_gen = large_dataset_generator(n)
# Just creating generator is fast!
time_gen = time.time() - start

print(f"Creating {n} values:")
print(f"List approach: {time_list:.4f}s")
print(f"Generator approach: {time_gen:.6f}s")

# Processing is similar
start = time.time()
total_list = sum(data_list)
time_process_list = time.time() - start

start = time.time()
total_gen = sum(large_dataset_generator(n))
time_process_gen = time.time() - start

print(f"\nProcessing {n} values:")
print(f"List: {time_process_list:.4f}s")
print(f"Generator: {time_process_gen:.4f}s")
print(f"Memory saved: Generator only keeps 1 value, list keeps {n}")
```

---

## 4. Real-World Applications (60 min)

### 4.1 File Processing

```python
print("=== FILE PROCESSING ===\n")

# Efficient CSV-like processing
def parse_csv(filename):
    """Parse CSV file line by line"""
    try:
        with open(filename) as f:
            headers = next(f).strip().split(',')
            for line in f:
                values = line.strip().split(',')
                yield dict(zip(headers, values))
    except FileNotFoundError:
        pass

# Usage (if file existed):
# for row in parse_csv('data.csv'):
#     print(row['name'], row['age'])

# Log file analysis
def read_log_file(filename):
    """Read log file yielding each entry"""
    try:
        with open(filename) as f:
            for line in f:
                yield line.rstrip('\n')
    except FileNotFoundError:
        pass

def filter_by_level(lines, level):
    """Filter log lines by level"""
    for line in lines:
        if f"[{level}]" in line:
            yield line

def extract_timestamp(lines):
    """Extract timestamp from log lines"""
    for line in lines:
        parts = line.split(' ')
        if parts:
            yield (parts[0], line)

# Usage: for time, entry in extract_timestamp(filter_by_level(...)):
```

### 4.2 Data Streaming

```python
print("\n=== DATA STREAMING ===\n")

def stream_data(delay=0.1):
    """Simulate streaming data"""
    import time
    data = [1, 2, 3, 4, 5]
    for item in data:
        time.sleep(delay)
        yield item

# Process stream
def batch(iterable, size):
    """Group items into batches"""
    items = []
    for item in iterable:
        items.append(item)
        if len(items) == size:
            yield items
            items = []
    if items:
        yield items

# Usage
print("Streaming in batches:")
for batch_data in batch(stream_data(0.01), 2):
    print(f"Batch: {batch_data}")

# Sliding window
def sliding_window(iterable, size):
    """Create sliding window over stream"""
    from collections import deque
    window = deque(maxlen=size)
    for item in iterable:
        window.append(item)
        if len(window) == size:
            yield list(window)

print("\nSliding window (size=3):")
data = range(10)
for window in sliding_window(data, 3):
    print(f"Window: {window}")
```

### 4.3 Tree Traversal

```python
print("\n=== TREE TRAVERSAL ===\n")

# Binary tree as dict
tree = {
    'value': 1,
    'left': {
        'value': 2,
        'left': {'value': 4, 'left': None, 'right': None},
        'right': {'value': 5, 'left': None, 'right': None}
    },
    'right': {
        'value': 3,
        'left': {'value': 6, 'left': None, 'right': None},
        'right': {'value': 7, 'left': None, 'right': None}
    }
}

def inorder_traversal(node):
    """In-order tree traversal: left, node, right"""
    if node is None:
        return
    
    yield from inorder_traversal(node.get('left'))
    yield node['value']
    yield from inorder_traversal(node.get('right'))

def preorder_traversal(node):
    """Pre-order traversal: node, left, right"""
    if node is None:
        return
    
    yield node['value']
    yield from preorder_traversal(node.get('left'))
    yield from preorder_traversal(node.get('right'))

def postorder_traversal(node):
    """Post-order traversal: left, right, node"""
    if node is None:
        return
    
    yield from postorder_traversal(node.get('left'))
    yield from postorder_traversal(node.get('right'))
    yield node['value']

print(f"Inorder: {list(inorder_traversal(tree))}")
print(f"Preorder: {list(preorder_traversal(tree))}")
print(f"Postorder: {list(postorder_traversal(tree))}")
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.29.1**: Simple Generator
```python
def numbers(n):
    # Yield numbers from 1 to n
    pass

print(list(numbers(5)))  # [1, 2, 3, 4, 5]
```

**Exercise 1.1.29.2**: Generator Next
```python
gen = (x * 2 for x in range(3))
# Get values one by one using next()
```

**Exercise 1.1.29.3**: Generator vs List
```python
# Create list and generator for range(10)
# Compare their sizes with sys.getsizeof()
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.29.4**: Fibonacci Generator
```python
def fibonacci(limit):
    # Yield Fibonacci numbers up to limit
    pass

print(list(fibonacci(50)))  # [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
```

**Exercise 1.1.29.5**: Filter Generator
```python
def even_numbers(n):
    # Yield even numbers from 1 to n
    pass

print(list(even_numbers(10)))  # [2, 4, 6, 8, 10]
```

**Exercise 1.1.29.6**: Generator Expression
```python
# Create generator for squares of even numbers
# Use generator expression syntax
gen = # Your expression here
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.29.7**: Flatten Nested Lists
```python
def flatten(nested):
    # Yield all values from nested list structure
    pass

print(list(flatten([1, [2, 3], [[4, 5], 6]])))
# [1, 2, 3, 4, 5, 6]
```

**Exercise 1.1.29.8**: Batch Generator
```python
def batch(iterable, size):
    # Group items into batches of given size
    pass
```

**Exercise 1.1.29.9**: Accumulator Coroutine
```python
def accumulator():
    # Receive values with send(), accumulate
    pass
```

---

## Mini-Project: Log File Analyzer

Efficiently analyze large log files using generators.

```python
def parse_log(filename):
    """Parse log file yielding structured entries"""
    try:
        with open(filename) as f:
            for line in f:
                parts = line.strip().split(' - ')
                if len(parts) >= 3:
                    yield {
                        'timestamp': parts[0],
                        'level': parts[1],
                        'message': ' - '.join(parts[2:])
                    }
    except FileNotFoundError:
        pass

def filter_level(entries, level):
    """Filter entries by log level"""
    for entry in entries:
        if entry['level'] == level:
            yield entry

def by_hour(entries):
    """Group entries by hour"""
    current_hour = None
    batch = []
    
    for entry in entries:
        hour = entry['timestamp'][:2]
        
        if hour != current_hour and batch:
            yield (current_hour, batch)
            batch = []
        
        current_hour = hour
        batch.append(entry)
    
    if batch:
        yield (current_hour, batch)

# Usage (if log file existed):
# log_entries = parse_log('app.log')
# error_entries = filter_level(log_entries, 'ERROR')
# 
# for hour, entries in by_hour(error_entries):
#     print(f"Hour {hour}: {len(entries)} errors")
#     for entry in entries:
#         print(f"  {entry['message']}")
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **Generators create all values in memory.**
   - Answer: False (lazy evaluation)

2. **yield keyword is used in generator functions.**
   - Answer: True

3. **Generators can be iterated multiple times.**
   - Answer: False (exhausted after first iteration)

4. **Generator expressions use square brackets.**
   - Answer: False (parentheses)

---

### Conceptual Questions

5. **What is lazy evaluation?**
   - Expected: Values created on demand, not all at once

6. **When should you use generators?**
   - Expected: Large datasets, streaming, memory efficiency

7. **What's the difference between yield and return?**
   - Expected: yield pauses and resumes, return ends function

---

### Coding Challenge

8. **Create number generator:**
   - Yield numbers 1 to n
   - Skip multiples of 3
   - Skip multiples of 5
   - Use generator expression

---

## Key Takeaways

✅ **Generators: Lazy evaluation** - Create values on demand  
✅ **Memory efficient** - Don't store all values at once  
✅ **yield keyword** - Pause and resume function  
✅ **Composable** - Chain generators together  
✅ **Perfect for large datasets** - Files, streams, pipelines

---

## Additional Resources

- [Generators in Python](https://docs.python.org/3/howto/functional.html#generators)
- [yield and Generators](https://realpython.com/generators-and-yield-in-python/)
- [Advanced Generator Patterns](https://www.python.org/dev/peps/pep-0342/)

---

## Next Lesson Preview

**Lesson 1.1.30**: Decorators Basics
- What are decorators?
- Function modification
- Common decorators
- Creating custom decorators

---

## Homework

- [ ] Complete Exercises 1.1.29.1 - 1.1.29.9
- [ ] Build and test Log File Analyzer
- [ ] Create 3 different generator functions
- [ ] Compare generator vs list performance
- [ ] Quiz: Answer all assessment questions

**Expected time**: 3-4 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.30** when you're ready.




