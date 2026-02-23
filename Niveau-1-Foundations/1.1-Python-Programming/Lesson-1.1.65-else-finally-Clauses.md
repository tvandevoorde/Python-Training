# Lesson 1.1.65: else & finally Clauses

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.1.62-1.1.64

---

## Learning Objectives

1. **Use** else clause when no exception occurs
2. **Implement** finally for guaranteed cleanup
3. **Combine** try-except-else-finally patterns
4. **Understand** execution flow in complex error scenarios
5. **Apply** context managers with finally
6. **Use** finally for resource management
7. **Design** robust error handling workflows

---

## The else Clause

### When else Executes

```python
# else runs only if NO exception occurred
try:
    value = int("42")  # No exception
except ValueError:
    print("Could not convert")
else:
    # This ONLY runs if try succeeded
    print(f"Successfully converted: {value}")
    print(f"Value is: {value}")

# Output:
# Successfully converted: 42
# Value is: 42
```

### When else Does NOT Execute

```python
try:
    value = int("abc")  # Raises ValueError
except ValueError:
    print("Could not convert")
else:
    # This is SKIPPED because exception occurred
    print(f"Value is: {value}")

# Output:
# Could not convert
```

### Practical Example

```python
def process_user_input(user_input):
    """Process input with else clause."""
    try:
        age = int(user_input)
    except ValueError:
        print("Invalid input - must be a number")
        return None
    else:
        # This only runs if conversion succeeded
        if age < 0:
            print("Age cannot be negative")
            return None
        elif age > 150:
            print("Age seems unreasonable")
            return None
        else:
            print(f"User age accepted: {age}")
            return age

print(process_user_input("25"))   # Valid: age accepted
print(process_user_input("abc"))  # ValueError caught
print(process_user_input("-5"))   # Validation in else
```

### Else vs. Not Using Else

```python
# ✗ Without else - mixing concerns
try:
    file_content = open('file.txt').read()
    process(file_content)  # What if process() fails?
except FileNotFoundError:
    print("File not found")

# ✓ With else - clear separation
try:
    file_content = open('file.txt').read()
except FileNotFoundError:
    print("File not found")
else:
    # This only runs if read succeeded
    process(file_content)  # If process() fails, it's a different error
```

---

## The finally Clause

### Basic finally

```python
# finally ALWAYS executes, regardless of exceptions
try:
    print("Trying...")
    value = 10 / 0
except ZeroDivisionError:
    print("Caught division by zero")
finally:
    print("This always runs")

# Output:
# Trying...
# Caught division by zero
# This always runs
```

### finally Even Without Exception

```python
try:
    print("Try block")
finally:
    print("Finally always runs")

# Output:
# Try block
# Finally always runs
```

### finally Even With Return

```python
def function_with_finally():
    """Finally runs even if function returns."""
    try:
        print("In try")
        return "Success"
    finally:
        print("Finally still runs before return")

result = function_with_finally()
print(f"Got: {result}")

# Output:
# In try
# Finally still runs before return
# Got: Success
```

---

## finally for Resource Cleanup

### File Handling with finally

```python
def read_file_with_finally(filename):
    """Ensure file is closed even if error occurs."""
    f = None
    try:
        f = open(filename, 'r')
        content = f.read()
        return content.upper()
    except FileNotFoundError:
        print("File not found")
        return None
    finally:
        # This MUST run to clean up
        if f:
            f.close()
            print("File closed")
```

### Compare with Context Manager (Better)

```python
# Context managers are preferred for this pattern
def read_file_best(filename):
    """Using context manager (with statement)."""
    try:
        with open(filename, 'r') as f:
            content = f.read()
        return content.upper()
    except FileNotFoundError:
        print("File not found")
        return None
    # File automatically closed by 'with' statement
```

### Database Connection Cleanup

```python
def query_database(query):
    """Example: cleanup database connection."""
    connection = None
    try:
        connection = create_connection()
        results = connection.execute(query)
        return results
    except DatabaseError as e:
        print(f"Query failed: {e}")
        return None
    finally:
        if connection:
            connection.close()
            print("Connection closed")
```

---

## Complete try-except-else-finally

### Full Pattern

```python
try:
    # Attempt operation
    risky_operation()
except SpecificException:
    # Handle expected error
    handle_error()
else:
    # Success - do something after
    process_success()
finally:
    # Always cleanup
    cleanup()
```

### Real Example

```python
def process_file(filename):
    """Complete error handling pattern."""
    try:
        # Try to open and process
        with open(filename, 'r') as f:
            data = f.read()
        
        if not data:
            raise ValueError("File is empty")
        
        result = parse_json(data)
    
    except FileNotFoundError:
        print("File not found - using default")
        result = get_default_data()
    
    except ValueError as e:
        print(f"Data error: {e}")
        result = None
    
    else:
        # If no exception, process result
        print(f"Successfully loaded {len(result)} items")
        log_success(filename)
    
    finally:
        # Cleanup (though 'with' handles file closing)
        print(f"Processing of {filename} complete")

process_file('data.json')
```

---

## Execution Order

### Order Diagram

```python
# Exception case:
try:
    # ① Run
    raise SomeException()
except SomeException:
    # ② Run (exception caught)
    pass
else:
    # ③ SKIP (exception occurred)
    pass
finally:
    # ④ ALWAYS RUN

# No exception case:
try:
    # ① Run
    normal_code()
except SomeException:
    # ② SKIP (no exception)
    pass
else:
    # ③ Run (no exception)
    pass
finally:
    # ④ ALWAYS RUN
```

---

## finally with Exceptions

### finally Runs Before Propagation

```python
try:
    try:
        raise ValueError("Original error")
    finally:
        print("Inner finally")
except ValueError:
    print("Exception caught")
finally:
    print("Outer finally")

# Output:
# Inner finally
# Exception caught
# Outer finally
```

### finally Can Suppress Exceptions

```python
def risky_with_suppression():
    """finally can suppress exceptions (generally don't do this)."""
    try:
        raise ValueError("Important error")
    finally:
        return "Success"  # Suppresses the ValueError!

result = risky_with_suppression()
print(result)  # Output: Success (ValueError lost!)
```

---

## Common Patterns

### Pattern 1: Acquire-Use-Release

```python
def work_with_resource():
    """Pattern: acquire resource, use it, release it."""
    resource = None
    try:
        resource = acquire_resource()
        result = use_resource(resource)
        return result
    except Exception as e:
        print(f"Error: {e}")
        return None
    finally:
        if resource:
            release_resource(resource)
```

### Pattern 2: Try Multiple Operations

```python
def validate_and_process(data):
    """Pattern: validate, then process."""
    try:
        validate_data(data)
    except ValidationError as e:
        print(f"Validation failed: {e}")
        return False
    else:
        # Only if validation passed
        process_data(data)
        return True
    finally:
        log_operation("validate_and_process")
```

---

## Graded Exercises

### Starter Level

1. Write function using try-except-else
2. Show what runs in each case
3. Write function using try-finally

### Intermediate Level

1. Implement full try-except-else-finally pattern
2. Include resource cleanup in finally
3. Demonstrate execution order with print statements

### Advanced Level

1. Create complex error handling with multiple finally blocks
2. Implement cleanup procedures
3. Handle nested try-except-finally

---

## Self-Assessment

- [ ] I understand when else clause executes
- [ ] I use finally for guaranteed cleanup
- [ ] I understand execution order
- [ ] I know finally runs even with return statements
- [ ] I can implement complete try-except-else-finally patterns
- [ ] I use context managers instead of manual finally cleanup
- [ ] I don't suppress exceptions accidentally in finally

---

**Next: [Lesson 1.1.66: Raising Custom Exceptions](Lesson-1.1.66-Raising-Custom-Exceptions.md)**
