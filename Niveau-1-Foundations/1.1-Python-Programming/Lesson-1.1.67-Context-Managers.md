# Lesson 1.1.67: Context Managers

**Estimated Time**: 8 hours | **Difficulty**: Advanced  
**Prerequisites**: Lessons 1.1.62-1.1.66

---

## Learning Objectives

1. **Use** context managers with `with` statement
2. **Create** custom context manager classes
3. **Implement** `__enter__` and `__exit__` methods
4. **Use** contextlib decorators
5. **Understand** resource management patterns
6. **Handle** exceptions in context managers
7. **Manage** multiple resources

---

## Context Manager Basics

### with Statement

```python
# Context manager automatical cleanup
with open('file.txt', 'r') as f:
    content = f.read()
# File is automatically closed here

# Equivalent manual management (don't do this)
f = open('file.txt', 'r')
try:
    content = f.read()
finally:
    f.close()
```

### Built-in Context Managers

```python
# File operations
with open('file.txt', 'r') as f:
    data = f.read()

# Multiple resources
with open('input.txt') as infile, open('output.txt', 'w') as outfile:
    for line in infile:
        outfile.write(line.upper())

# Lock/threading
import threading
lock = threading.Lock()
with lock:
    # Critical section
    shared_resource += 1
```

---

## Custom Context Manager Class

### Implementing __enter__ and __exit__

```python
class FileManager:
    """Custom context manager for file operations."""
    
    def __init__(self, filename, mode):
        self.filename = filename
        self.mode = mode
        self.file = None
    
    def __enter__(self):
        """Called when entering 'with' block."""
        print(f"Opening {self.filename}")
        self.file = open(self.filename, self.mode)
        return self.file
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        """Called when exiting 'with' block (even if exception)."""
        print(f"Closing {self.filename}")
        if self.file:
            self.file.close()
        # Return False to propagate exceptions
        return False

# Usage
with FileManager('test.txt', 'w') as f:
    f.write('Hello, world!')
```

### Return Value from __enter__

```python
class DatabaseConnection:
    """Database connection context manager."""
    
    def __init__(self, host, port):
        self.host = host
        self.port = port
        self.connection = None
    
    def __enter__(self):
        # Return object that will be assigned to 'as' variable
        print(f"Connecting to {self.host}:{self.port}")
        self.connection = self._create_connection()
        return self.connection
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        print(f"Disconnecting from {self.host}")
        if self.connection:
            self.connection.close()
        return False
    
    def _create_connection(self):
        # Simulate connection
        return {"host": self.host, "port": self.port}

# Usage
with DatabaseConnection('localhost', 5432) as conn:
    print(f"Connected: {conn}")
    # Use connection
```

---

## Exception Handling in Context Managers

### __exit__ Exception Parameters

```python
class SafeFile:
    """Context manager that handles exceptions."""
    
    def __init__(self, filename):
        self.filename = filename
        self.file = None
    
    def __enter__(self):
        self.file = open(self.filename, 'r')
        return self.file
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        """
        exc_type: Exception class (None if no exception)
        exc_val: Exception instance (None if no exception)
        exc_tb: Traceback (None if no exception)
        
        Return True to suppress exception, False to propagate
        """
        if exc_type is not None:
            print(f"Exception occurred: {exc_type.__name__}: {exc_val}")
        
        if self.file:
            self.file.close()
        
        # Return False to let exception propagate
        return False

# Usage
try:
    with SafeFile('missing.txt') as f:
        content = f.read()
except FileNotFoundError:
    print("File not found")
```

### Suppressing Exceptions

```python
class IgnoreErrors:
    """Context manager that suppresses exceptions."""
    
    def __enter__(self):
        return self
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        # Return True to suppress exception
        if exc_type is not None:
            print(f"Ignoring: {exc_type.__name__}")
        return True  # Suppress!

# Usage
with IgnoreErrors():
    risky_operation()
    # If it fails, error is suppressed
```

---

## contextlib Module

### @contextmanager Decorator

```python
from contextlib import contextmanager

@contextmanager
def timer(name):
    """Time a code block."""
    import time
    print(f"Starting {name}")
    start = time.time()
    try:
        yield  # Body of with statement runs here
    finally:
        elapsed = time.time() - start
        print(f"{name} took {elapsed:.2f}s")

# Usage
with timer("database query"):
    # Simulated operation
    import time
    time.sleep(1)

# Output:
# Starting database query
# database query took 1.00s
```

### Decorator Implementation Pattern

```python
from contextlib import contextmanager

@contextmanager
def transaction(database):
    """Database transaction context manager."""
    print("BEGIN TRANSACTION")
    try:
        yield database
    except Exception as e:
        print(f"ROLLBACK: {e}")
        raise
    else:
        print("COMMIT")

# Usage
with transaction(db) as tx:
    tx.insert("users", {"name": "Alice"})
    # Either commits or rolls back on exception
```

---

## Multiple Resources

### Multiple with Statements

```python
# Python 3.10+: Multiple context managers
with open('input.txt') as infile, \
     open('output.txt', 'w') as outfile, \
     lock:
    for line in infile:
        outfile.write(process(line))
```

### Nested Context Managers

```python
@contextmanager
def multi_file_operation(*filenames):
    """Open multiple files as a single context."""
    files = {}
    try:
        for name in filenames:
            files[name] = open(name, 'r')
        yield files
    finally:
        for f in files.values():
            if f:
                f.close()

# Usage
with multi_file_operation('a.txt', 'b.txt') as files:
    a_content = files['a.txt'].read()
    b_content = files['b.txt'].read()
```

---

## Graded Exercises

### Starter Level

1. Use built-in context managers
2. Demonstrate automatic cleanup with with statement
3. Compare with manual try-finally

### Intermediate Level

1. Create custom context manager class
2. Implement __enter__ and __exit__
3. Test with and without exceptions

### Advanced Level

1. Create @contextmanager decorator function
2. Implement context manager that handles multiple resources
3. Demonstrate exception handling in __exit__

---

## Self-Assessment

- [ ] I understand when to use context managers
- [ ] I can implement __enter__ and __exit__
- [ ] I know what parameters __exit__ receives
- [ ] I can suppress exceptions by returning True
- [ ] I use @contextmanager decorator
- [ ] I manage multiple resources correctly
- [ ] I understand yield in context managers

---

**Next: [Lesson 1.1.68: Writing Defensive Code](Lesson-1.1.68-Writing-Defensive-Code.md)**
