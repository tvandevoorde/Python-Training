# Lesson 1.1.64: Multiple Except Blocks

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.1.62-1.1.63

---

## Learning Objectives

1. **Design** multiple except blocks for different exceptions
2. **Order** except blocks correctly (specific to general)
3. **Handle** different exceptions with different logic
4. **Access** exception objects and information
5. **Implement** fallback strategies for each error type
6. **Avoid** catching too broadly or too narrowly
7. **Test** error handling paths systematically

---

## Multiple Except Pattern

### Basic Structure

```python
try:
    # Code that might raise multiple exceptions
    pass
except SpecificException1:
    # Handle first type of error
    pass
except SpecificException2:
    # Handle second type of error
    pass
except Exception:
    # Catch any remaining exceptions
    pass
```

### Real Example

```python
def process_data(filename, index):
    """Process data with multiple possible errors."""
    try:
        # Open file
        with open(filename, 'r') as f:
            data = f.read()
        
        # Split into lines
        lines = data.split('\n')
        
        # Access specific line
        selected_line = lines[index]
        
        # Convert to integer
        number = int(selected_line)
        
        return number
    
    except FileNotFoundError:
        print(f"Error: File '{filename}' not found")
        return None
    except IndexError:
        print(f"Error: Line {index} does not exist")
        return None
    except ValueError:
        print(f"Error: Line content is not a valid integer")
        return None
    except Exception as e:
        print(f"Unexpected error: {type(e).__name__}: {e}")
        return None
```

---

## Ordering Except Blocks

### Specific to General (CORRECT)

```python
# ✓ GOOD: Catches reach from specific to general
try:
    value = int("3.14")  # Will raise ValueError
except ValueError:       # Caught here
    print("Cannot convert to integer")
except Exception:        # Won't be reached for this error
    print("Some other error")
```

### General to Specific (WRONG)

```python
# ✗ WRONG: General exception catches everything
try:
    value = int("3.14")
except Exception:         # Catches ValueError
    print("Some error")
except ValueError:        # Never reached!
    print("Invalid integer")
```

### With Exception Inheritance

```python
# OSError is parent of FileNotFoundError, PermissionError, etc.
try:
    with open('file.txt', 'r') as f:
        data = f.read()
except FileNotFoundError:      # Catches specific case
    print("File doesn't exist")
except PermissionError:        # Catches specific case
    print("No permission to read file")
except OSError:                # Catches other OS-related errors
    print("Could not read file (OS error)")
```

---

## Complex Exception Handling

### With Exception Information

```python
def calculate(expression):
    """Evaluate math expression safely."""
    try:
        values = expression.split(',')
        a = int(values[0])
        b = int(values[1])
        op = values[2]
        
        if op == '+':
            return a + b
        elif op == '-':
            return a - b
        elif op == '/':
            return a / b
        else:
            raise ValueError(f"Unknown operator: {op}")
    
    except IndexError as ie:
        print(f"IndexError: Incomplete expression. {ie}")
        return None
    except ValueError as ve:
        print(f"ValueError: Invalid data. {ve}")
        return None
    except ZeroDivisionError as zde:
        print(f"ZeroDivisionError: Cannot divide by zero")
        return None
    except Exception as e:
        print(f"Unexpected error: {type(e).__name__}: {e}")
        return None
```

### DataFrame/Data Processing

```python
def load_and_process(filename):
    """Load file and process with various error handling."""
    try:
        # Try to read file
        with open(filename, 'r', encoding='utf-8') as f:
            lines = f.readlines()
        
        if not lines:
            raise ValueError("File is empty")
        
        # Process lines
        data = []
        for line in lines:
            value = int(line.strip())
            data.append(value)
        
        return data
    
    except FileNotFoundError:
        print(f"File not found: {filename}")
        return []
    except UnicodeDecodeError:
        print("File encoding error - try opening as UTF-8 or binary")
        return []
    except ValueError as ve:
        print(f"Invalid data in file: {ve}")
        return []
    except IOError as ie:
        print(f"Error reading file: {ie}")
        return []
```

---

## Fallback Strategies

### Return Safe Default

```python
def get_config_value(config, key, default=None):
    """Get config value with fallback."""
    try:
        if not isinstance(config, dict):
            raise TypeError("config must be dictionary")
        
        if key not in config:
            raise KeyError(f"Config key '{key}' not found")
        
        return config[key]
    
    except (KeyError, TypeError):
        print(f"Using default value for {key}")
        return default
```

### Retry Logic

```python
def retry_operation(func, max_attempts=3):
    """Retry operation on failure."""
    for attempt in range(max_attempts):
        try:
            result = func()
            return result
        except (ConnectionError, TimeoutError) as e:
            if attempt < max_attempts - 1:
                print(f"Attempt {attempt + 1} failed: {e}. Retrying...")
            else:
                print(f"All {max_attempts} attempts failed")
                raise
        except Exception as e:
            print(f"Unrecoverable error: {e}")
            raise
```

### Conditional Re-raising

```python
def process_request(request):
    """Process with selective re-raising."""
    try:
        # Simulate request processing
        validate_request(request)
        result = execute_request(request)
        return result
    
    except ValueError:
        # Client error - can be logged and returned
        print("Invalid request format")
        return {"error": "Invalid request"}
    except ConnectionError:
        # Server error - should propagate
        print("Connection failed")
        raise
    except Exception as e:
        # Unknown error - log and return generic response
        print(f"Unexpected error: {e}")
        return {"error": "Internal server error"}
```

---

## Exception Chaining

### From Clause

```python
def load_json_config(filename):
    """Load JSON with exception chaining."""
    try:
        with open(filename, 'r') as f:
            text = f.read()
        return json.loads(text)
    except FileNotFoundError as e:
        # Chain exceptions for context
        raise RuntimeError(f"Config file not found: {filename}") from e
    except json.JSONDecodeError as e:
        raise RuntimeError(f"Invalid JSON in {filename}: {e}") from e
```

---

## Graded Exercises

### Starter Level

1. Write function with 3 except blocks handling different exceptions
2. Test with inputs that trigger each exception
3. Print appropriate message for each case

### Intermediate Level

1. Create function with 5+ except blocks
2. Include exception object information in error messages
3. Use different recovery strategy for each exception
4. Test all exception paths

### Advanced Level

1. Implement complex error handling with fallback strategies
2. Use exception chaining with `from` clause
3. Create retry logic for transient errors
4. Test edge cases and exception ordering

---

## Self-Assessment

- [ ] I order except blocks from specific to general
- [ ] I understand exception inheritance hierarchy
- [ ] I access exception object information
- [ ] I use different recovery strategies per exception
- [ ] I test all exception handling paths
- [ ] I avoid overly broad exception catching
- [ ] I use exception chaining appropriately

---

**Next: [Lesson 1.1.65: else & finally Clauses](Lesson-1.1.65-else-finally-Clauses.md)**




