# Lesson 1.1.54: Writing Files

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.52 (File I/O Basics)

---

## Learning Objectives

By the end of this lesson, you will:

1. Safely write to files without data loss
2. Understand write modes and their behaviors
3. Use `write()` and `writelines()`
4. Manage file overwrites intentionally
5. Build content before writing to disk
6. Format output for readability
7. Handle write errors gracefully
8. Implement atomic writes for data safety

---

## 1. Write Modes

### Mode 'w' - Write (Overwrites)

```python
with open("output.txt", "w") as f:
    f.write("Hello, World!")
    f.write("\n")
    f.write("Line 2")

# Result: File contains exactly these 3 lines
# Previous content is LOST
```

**⚠️ WARNING**: Mode 'w' overwrites completely!

### Mode 'a' - Append (No Overwrite)

```python
with open("log.txt", "a") as f:
    f.write(f"Log entry: {datetime.now()}\n")

# New content ADDED to existing content
# Nothing is lost
```

### Mode 'x' - Exclusive (Fail if Exists)

```python
try:
    with open("new_file.txt", "x") as f:
        f.write("Initial content")
except FileExistsError:
    print("File already exists!")
```

---

## 2. The `write()` Method

### Basic Writing

```python
with open("data.txt", "w") as f:
    bytes_written = f.write("Hello")
    print(bytes_written)  # 5 (number of characters written)
    
    f.write("\n")
    f.write("World")

# Result: "Hello\nWorld"
```

**Important**: `write()` returns number of characters written

### Newlines

```python
with open("lines.txt", "w") as f:
    f.write("Line 1")
    # Problem: No newline!
    f.write("Line 2")

# Result: "Line 1Line 2" (all on same line)

# ✅ Correct way
with open("lines.txt", "w") as f:
    f.write("Line 1\n")  # Include '\n'
    f.write("Line 2\n")

# Result: "Line 1\nLine 2\n"
```

---

## 3. The `writelines()` Method

### Writing Multiple Lines

```python
lines = ["First\n", "Second\n", "Third\n"]

with open("output.txt", "w") as f:
    f.writelines(lines)

# Result: "First\nSecond\nThird\n"

# ✅ Even cleaner
with open("output.txt", "w") as f:
    f.writelines("\n".join(["First", "Second", "Third"]))
```

---

## 4. Building Content Strategy

### Strategy 1: Build in Memory, Write Once

```python
content = []

for i in range(100):
    content.append(f"Line {i}\n")

with open("output.txt", "w") as f:
    f.writelines(content)
```

**Pros**: Efficient, single write operation  
**Cons**: High memory for huge files

### Strategy 2: Write as You Go

```python
with open("output.txt", "w") as f:
    for i in range(1000000):
        f.write(f"Line {i}\n")
        if i % 10000 == 0:
            print(f"Written {i} lines")
```

**Pros**: Low memory  
**Cons**: Many write operations (slower)

### Strategy 3: Batch Writing

```python
batch_size = 1000

with open("output.txt", "w") as f:
    batch = []
    for i in range(1000000):
        batch.append(f"Line {i}\n")
        if len(batch) >= batch_size:
            f.writelines(batch)
            batch = []
    
    if batch:  # Write remaining
        f.writelines(batch)
```

**Pros**: Balance between memory and performance

---

## 5. String Formatting for Output

### Using f-strings

```python
name = "Alice"
age = 30
salary = 50000.50

with open("report.txt", "w") as f:
    f.write(f"Name: {name}\n")
    f.write(f"Age: {age}\n")
    f.write(f"Salary: ${salary:,.2f}\n")
```

### Creating Structured Output

```python
people = [
    {"name": "Alice", "age": 30},
    {"name": "Bob", "age": 25},
]

with open("report.txt", "w") as f:
    f.write("=" * 30 + "\n")
    f.write("PEOPLE REPORT\n")
    f.write("=" * 30 + "\n\n")
    
    for person in people:
        f.write(f"Name: {person['name']}\n")
        f.write(f"Age: {person['age']}\n")
        f.write("-" * 30 + "\n")
```

---

## 6. Safe Writing Patterns

### Pattern 1: Write to Temp, Then Replace

```python
import os
import tempfile

# Write to temporary file first
temp_filename = "data.txt.tmp"

with open(temp_filename, "w") as f:
    f.write("Important data\n")
    f.write("More data\n")

# Verify it worked, then replace original
os.replace(temp_filename, "data.txt")
```

**Benefit**: If write fails, original file untouched

### Pattern 2: Append Instead of Overwrite

```python
# SAFER: Append data to existing file
with open("log.txt", "a") as f:
    f.write(f"Event at {datetime.now()}\n")

# Original log is preserved
```

---

## 7. Error Handling

### Permission Errors

```python
try:
    with open("/etc/passwd", "w") as f:  # Can't write as non-admin
        f.write("data")
except PermissionError:
    print("Permission denied!")
```

### Disk Full

```python
try:
    with open("huge_file.txt", "w") as f:
        f.write("x" * 1000000000)  # 1 GB
except IOError as e:
    print(f"Write failed: {e}")
```

### Path Doesn't Exist

```python
try:
    with open("/nonexistent/path/file.txt", "w") as f:
        f.write("data")
except FileNotFoundError:
    print("Directory doesn't exist")
```

---

## 8. Flushing and Syncing

### When Does Data Hit Disk?

```python
import time

with open("test.txt", "w") as f:
    f.write("Data 1\n")
    time.sleep(5)  # Data might still be in buffer
    
    f.flush()  # Force to disk
    time.sleep(5)  # Now definitely on disk
```

### Force Sync to Disk

```python
import os

with open("log.txt", "a") as f:
    f.write("Critical log entry\n")
    f.flush()           # Write to OS buffer
    os.fsync(f.fileno())  # Write to disk physically
```

---

## 9. Mini-Project: Log File Generator

Create a program that generates realistic log files:

```python
import datetime
import random

def generate_log(filename, num_entries=1000):
    """Generate a log file with realistic entries"""
    levels = ["INFO", "WARNING", "ERROR"]
    messages = [
        "Application started",
        "Connection established",
        "Data processed",
        "Cache updated",
        "Task completed",
        "Warning: Low memory",
        "Error: Timeout occurred"
    ]
    
    with open(filename, "w") as f:
        for i in range(num_entries):
            timestamp = datetime.datetime.now().isoformat()
            level = random.choice(levels)
            message = random.choice(messages)
            
            log_line = f"{timestamp} [{level}] {message}\n"
            f.write(log_line)
            
            if i % 100 == 0:
                print(f"Generated {i} entries...")
    
    print(f"Generated {num_entries} log entries in {filename}")

generate_log("application.log", 10000)
```

**Extension**: Include stack traces for ERROR entries

---

## 10. Graded Exercises

### Starter Level

**Exercise 1**: Simple Writer

```python
# 1. Write a file with numbers 1-100
# 2. Each on a new line
# 3. Verify by reading it back
```

**Exercise 2**: Append Log

```python
# 1. Write initial log to file
# 2. Append new events to the same file
# 3. Verify nothing was lost
```

### Intermediate Level

**Exercise 3**: CSV Writer

```python
# Create a function that writes CSV:
'''
def write_csv(filename, data):
    # data: list of dicts [{"name": "Alice", "age": 30}, ...]
    # Write as CSV with header
    ...
'''
```

**Exercise 4**: Safe Writer

```python
# Create a safe write function:
'''
def safe_write(filename, content):
    # Write to temp file
    # Verify success
    # Replace original
    # Handle errors gracefully
    ...
'''
```

### Advanced Level

**Exercise 5**: Formatted Report Writer

```python
# Write a nicely formatted report:
# - Title and borders
# - Aligned columns
# - Summary statistics
# - Page breaks
```

**Exercise 6**: Incremental Backup

```python
# Create a backup system:
# - Append only (never overwrite)
# - Timestamp each backup
# - Compress old entries
# - Maintain version history
```

---

## 11. Self-Assessment Checklist

- [ ] I understand write modes ('w', 'a', 'x') and their behaviors
- [ ] I can write strings to files with `write()` and `writelines()`
- [ ] I can append to files without overwriting
- [ ] I understand when to build in memory vs. stream writing
- [ ] I can format output for readability
- [ ] I can handle write errors (permissions, disk full)
- [ ] I know when to use `flush()` and `fsync()`
- [ ] I can implement safe write patterns (temp files)
- [ ] I understand performance implications of write strategies

---

## 12. Additional Resources

- [Python file writing](https://docs.python.org/3/tutorial/inputoutput.html)
- Real Python: [Write to Files](https://realpython.com/python-write-read-files/)
- [Atomic writes and temp files](https://docs.python.org/3/library/tempfile.html)

---

**Next Lesson**: [1.1.55 - Working with Text Files](Lesson-1.1.55-Working-with-Text-Files.md)  
**Previous Lesson**: [1.1.53 - Reading Files](Lesson-1.1.53-Reading-Files.md)
