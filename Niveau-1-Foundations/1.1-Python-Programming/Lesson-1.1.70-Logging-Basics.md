# Lesson 1.1.70: Logging Basics

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**prerequisites**: Lessons 1.1.62-1.1.69

---

## Learning Objectives

1. **Configure** logging system for application
2. **Use** different logging levels appropriately
3. **Create** loggers for modules
4. **Format** log messages effectively
5. **Write** logs to files
6. **Understand** logging best practices
7. **Implement** productive logging strategy

---

## Logging Module Basics

### Simple Configuration

```python
import logging

# Basic setup
logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)

logger = logging.getLogger(__name__)

logger.debug("Debug message")
logger.info("Info message")
logger.warning("Warning message")
logger.error("Error message")
logger.critical("Critical message")
```

### Log Levels

```python
import logging

# Level hierarchy (lowest to highest)
logging.DEBUG       # 10 - Detailed debugging info
logging.INFO        # 20 - General information
logging.WARNING     # 30 - Warning messages (default)
logging.ERROR       # 40 - Error messages
logging.CRITICAL    # 50 - Critical failures

# Configuration
logging.basicConfig(level=logging.INFO)
# Now DEBUG messages are hidden
```

---

## Module-Level Loggers

### Get Logger for Module

```python
# In util.py
import logging
logger = logging.getLogger(__name__)

def calculate(a, b):
    logger.debug(f"Calculating {a} + {b}")
    result = a + b
    logger.info(f"Calculation result: {result}")
    return result

# In main.py
import logging
import util

logging.basicConfig(
    level=logging.DEBUG,
    format='%(name)s - %(levelname)s - %(message)s'
)

util.calculate(5, 3)
# Output: util - DEBUG - Calculating 5 + 3
#         util - INFO - Calculation result: 8
```

---

## Formatting

### Format Specifiers

```python
import logging

# Common format attributes
format_string = '%(asctime)s | %(name)s | %(levelname)s | %(message)s'

logging.basicConfig(
    format=format_string,
    datefmt='%Y-%m-%d %H:%M:%S'
)

logger = logging.getLogger(__name__)
logger.warning("Something to note")
# Output: 2024-02-15 14:30:45 | __main__ | WARNING | Something to note
```

### Custom Formatting

```python
class ColoredFormatter(logging.Formatter):
    """Formatter with colors for console output."""
    
    COLORS = {
        'DEBUG': '\033[36m',      # Cyan
        'INFO': '\033[32m',       # Green
        'WARNING': '\033[33m',    # Yellow
        'ERROR': '\033[31m',      # Red
        'CRITICAL': '\033[35m'    # Magenta
    }
    RESET = '\033[0m'
    
    def format(self, record):
        levelname = record.levelname
        color = self.COLORS.get(levelname, self.RESET)
        record.levelname = f"{color}{levelname}{self.RESET}"
        return super().format(record)
```

---

## File Handlers

### Write to File

```python
import logging

# Create file handler
file_handler = logging.FileHandler('app.log')
file_handler.setLevel(logging.INFO)

# Create formatter
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
file_handler.setFormatter(formatter)

# Add handler to root logger
logging.getLogger().addHandler(file_handler)

# Now logs go to file
logger = logging.getLogger(__name__)
logger.info("This goes to file")
```

### Rotating File Handler

```python
from logging.handlers import RotatingFileHandler
import logging

# Rotate based on file size
handler = RotatingFileHandler(
    'app.log',
    maxBytes=1000000,  # 1 MB
    backupCount=5      # Keep 5 old files
)

formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
handler.setFormatter(formatter)

logger = logging.getLogger(__name__)
logger.addHandler(handler)
```

---

## Multiple Handlers

### Console and File

```python
import logging

# Create logger
logger = logging.getLogger('myapp')
logger.setLevel(logging.DEBUG)

# Console handler
console_handler = logging.StreamHandler()
console_handler.setLevel(logging.INFO)
console_format = logging.Formatter('%(levelname)s: %(message)s')
console_handler.setFormatter(console_format)

# File handler
file_handler = logging.FileHandler('app.log')
file_handler.setLevel(logging.DEBUG)
file_format = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
file_handler.setFormatter(file_format)

# Add both handlers
logger.addHandler(console_handler)
logger.addHandler(file_handler)

# Each message goes to both (with different filters)
logger.debug("Debug info (only in file)")
logger.warning("Warning (in both)")
```

---

## Logging in Applications

### Application Logging Structure

```python
import logging

def setup_logging(log_file='app.log', log_level=logging.INFO):
    """Setup logging for entire application."""
    # Create logger
    logger = logging.getLogger(__name__)
    logger.setLevel(log_level)
    
    # Create handlers
    file_handler = logging.FileHandler(log_file)
    console_handler = logging.StreamHandler()
    
    # Create formatters
    formatter = logging.Formatter(
        '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    )
    file_handler.setFormatter(formatter)
    console_handler.setFormatter(formatter)
    
    # Add handlers
    logger.addHandler(file_handler)
    logger.addHandler(console_handler)
    
    return logger

# In main
if __name__ == "__main__":
    logger = setup_logging()
    logger.info("Application started")
    # ...
    logger.info("Application ended")
```

### Logging Errors

```python
import logging

logger = logging.getLogger(__name__)

try:
    result = 10 / 0
except ZeroDivisionError:
    # Log with full traceback
    logger.exception("Division failed")  # Includes traceback
    # vs.
    logger.error(f"Division failed: {e}")  # Just message
```

---

## Graded Exercises

### Starter Level

1. Create application with basic logging
2. Configure file and console handlers
3. Demonstrate different log levels

### Intermediate Level

1. Implement logging strategy for multi-module app
2. Create custom formatters
3. Use rotating file handler
4. Log at appropriate levels throughout code

### Advanced Level

1. Create sophisticated logging configuration
2. Implement custom handlers/formatters
3. Create logging configuration file
4. Demonstrate professional logging practices

---

## Self-Assessment

- [ ] I configure logging in applications
- [ ] I use appropriate log levels
- [ ] I create loggers for modules
- [ ] I format log messages effectively
- [ ] I write logs to files
- [ ] I understand handler and formatter concepts
- [ ] I implement comprehensive logging strategy

---

**Next: [Lesson 1.1.71: Error Handling Patterns](Lesson-1.1.71-Error-Handling-Patterns.md)**
