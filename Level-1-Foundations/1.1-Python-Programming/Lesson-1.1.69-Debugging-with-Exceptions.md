# Lesson 1.1.69: Debugging with Exceptions

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.1.62-1.1.68

---

## Learning Objectives

1. **Read** and understand tracebacks
2. **Use** exception information for debugging
3. **Add** debug output strategically
4. **Use** logging for error tracking
5. **Implement** debugging best practices
6. **Utilize** Python debugger basics
7. **Isolate** exception root causes

---

## Understanding Tracebacks

### Traceback Structure

```python
# When this code fails:
def calculate():
    return divide_numbers(10, 0)

def divide_numbers(a, b):
    return a / b

calculate()  # Traceback (call stack trace)
```

Output:
```
Traceback (most recent call last):
  File "script.py", line 8, in <module>
    calculate()
  File "script.py", line 2, in calculate
    return divide_numbers(10, 0)
  File "script.py", line 5, in divide_numbers
    return a / b
ZeroDivisionError: division by zero
```

### Reading Bottom-Up

```
Last frame (bottom): Where the error actually occurred
Previous frames: Function calls leading to the error
First frame (top): Entry point of script

Key information:
- File name and line number
- Function name
- Actual code line
- Exception type and message
```

---

## Using Exception Information

### Extract Details from Exception

```python
import traceback

def diagnose_error():
    try:
        data = {'x': 10}
        result = data['y'] / 0
    except Exception as e:
        # Get exception details
        print(f"Exception type: {type(e).__name__}")
        print(f"Exception message: {e}")
        print(f"Exception args: {e.args}")
        
        # Get full traceback
        print("\nFull traceback:")
        traceback.print_exc()
        
        # Get formatted traceback
        tb_lines = traceback.format_exc()
        print("\nFormatted:\n", tb_lines)

diagnose_error()
```

### Get Stack Information

```python
import traceback
import sys

def debug_info():
    try:
        result = 10 / 0
    except ZeroDivisionError:
        # Get detailed traceback info
        exc_type, exc_value, exc_traceback = sys.exc_info()
        
        print(f"Exception: {exc_type.__name__}: {exc_value}")
        
        # Get all frames in stack
        tb = exc_traceback
        while tb:
            frame = tb.tb_frame
            print(f"  File: {frame.f_code.co_filename}")
            print(f"  Function: {frame.f_code.co_name}")
            print(f"  Line: {tb.tb_lineno}")
            print(f"  Variables: {frame.f_locals}")
            tb = tb.tb_next

debug_info()
```

---

## Strategic Debug Output

### Print Before Operations

```python
def process_list(items):
    """Debug by printing before operations."""
    print(f"[DEBUG] Input items: {items}")
    print(f"[DEBUG] Type: {type(items)}, Length: {len(items) if hasattr(items, '__len__') else 'N/A'}")
    
    try:
        result = []
        for i, item in enumerate(items):
            print(f"[DEBUG] Processing item {i}: {item} (type: {type(item).__name__})")
            transformed = item * 2
            print(f"[DEBUG]   Transformed to: {transformed}")
            result.append(transformed)
        
        return result
    except Exception as e:
        print(f"[ERROR] Failed processing item {i}: {e}")
        raise

print(process_list([1, 2, 3]))
```

### Conditional Debug Output

```python
DEBUG = True

def verbose_operation(value):
    if DEBUG:
        print(f"[DEBUG] Starting with value={value}")
    
    try:
        result = calculate(value)
        if DEBUG:
            print(f"[DEBUG] Calculation successful: {result}")
        return result
    except Exception as e:
        if DEBUG:
            print(f"[DEBUG] Error details: {e}")
            import traceback
            traceback.print_exc()
        raise

# Disable debug output
DEBUG = False
```

---

## Logging Module

### Basic Logging

```python
import logging

# Configure logging
logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)

def risky_operation(value):
    logger.debug(f"Starting with value={value}")
    
    try:
        if value < 0:
            logger.warning(f"Negative value detected: {value}")
        
        result = 100 / value
        logger.info(f"Operation successful: {result}")
        return result
    
    except ZeroDivisionError:
        logger.error("Division by zero detected")
        raise
    except Exception as e:
        logger.exception(f"Unexpected error: {e}")  # Logs with traceback
        raise

risky_operation(10)    # Info level
risky_operation(0)     # Error level
```

### Log Levels

```python
logger.debug("Detailed information for debugging")      # 10
logger.info("General information")                      # 20
logger.warning("Warning about something")               # 30
logger.error("Error occurred")                          # 40
logger.critical("Critical error")                       # 50
```

---

## Python Debugger (pdb)

### Setting Breakpoints

```python
import pdb

def problematic_function(data):
    print("Starting...")
    
    # Set breakpoint - execution pauses here
    pdb.set_trace()
    
    # Debugger opens, you can:
    # n - next line
    # s - step into function
    # c - continue
    # p variable - print variable
    # h - help
    
    result = process(data)
    return result
```

### Post-Mortem Debugging

```python
import pdb
import traceback

try:
    result = 10 / 0
except Exception:
    # Start debugger at exception point
    pdb.post_mortem()
```

---

## Common Debugging Patterns

### Narrow Down the Problem

```python
def find_error_in_pipeline(data):
    """Isolate error by testing each step."""
    
    # Step 1: Load
    try:
        loaded = load_data(data)
        print(f"✓ Load successful: {loaded}")
    except Exception as e:
        print(f"✗ Load failed: {e}")
        raise
    
    # Step 2: Transform
    try:
        transformed = transform(loaded)
        print(f"✓ Transform successful: {transformed}")
    except Exception as e:
        print(f"✗ Transform failed: {e}")
        raise
    
    # Step 3: Validate
    try:
        validated = validate(transformed)
        print(f"✓ Validate successful: {validated}")
    except Exception as e:
        print(f"✗ Validate failed: {e}")
        raise
    
    return validated
```

### Store State Before Error

```python
def debug_save_state(operation):
    """Save state before operation for inspection."""
    import json
    
    # Capture state before
    state_before = capture_system_state()
    
    try:
        result = operation()
        return result
    except Exception as e:
        # Save state after error
        state_after = capture_system_state()
        
        debug_info = {
            'error': str(e),
            'error_type': type(e).__name__,
            'state_before': state_before,
            'state_after': state_after
        }
        
        # Write debug file
        with open('debug_state.json', 'w') as f:
            json.dump(debug_info, f, indent=2, default=str)
        
        raise
```

---

## Graded Exercises

### Starter Level

1. Read and interpret a traceback
2. Extract error information from exception
3. Add debug print statements

### Intermediate Level

1. Create function that logs errors systematically
2. Use logging module with different levels
3. Implement debugging output for multi-step process

### Advanced Level

1. Create comprehensive debugging strategy
2. Use pdb to debug complex code
3. Implement error state capture
4. Create debugging utilities for module

---

## Self-Assessment

- [ ] I can read and interpret tracebacks
- [ ] I extract useful information from exceptions
- [ ] I add strategic debug output
- [ ] I understand logging levels
- [ ] I configure and use logging module
- [ ] I know basic pdb commands
- [ ] I can isolate error root causes

---

**Next: [Lesson 1.1.70: Logging Basics](Lesson-1.1.70-Logging-Basics.md)**




