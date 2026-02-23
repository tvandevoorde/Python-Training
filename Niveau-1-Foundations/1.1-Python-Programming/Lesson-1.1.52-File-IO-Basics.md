# Lesson 1.1.52: File I/O Basics

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.27 (Return Values), Lesson 1.1.39 (Lists)

---

## Learning Objectives

By the end of this lesson, you will:

1. Understand how Python interacts with files on disk
2. Master the `open()` function and file modes (read, write, append, binary)
3. Use context managers (`with` statement) for safe file handling
4. Understand file pointers and file positioning
5. Learn why context managers are essential for resource management
6. Avoid common file handling mistakes (unclosed files, encoding errors)
7. Work with different file encodings (UTF-8, ASCII, etc.)
8. Implement proper error handling when working with files

---

## 1. Files on Disk: How They Work

Files are persistent data stored on your computer's hard drive. Unlike variables in memory (which disappear when the program ends), files remain until explicitly deleted.

### File Types

- **Text files**: Human-readable content (`.txt`, `.py`, `.csv`, `.json`)
- **Binary files**: Encoded data for specific programs (`.jpg`, `.pdf`, `.zip`)

### File Paths

Paths tell Python where a file is located:

```python
# Absolute path (starts from root)
"/Users/tom/Documents/data.txt"  # macOS/Linux
"C:\\Users\\Tom\\Documents\\data.txt"  # Windows

# Relative path (from current directory)
"data.txt"
"./data.txt"  # Explicitly current directory
"../data.txt"  # One directory up
"./subdir/data.txt"  # In subdirectory
```

**Key Insight**: Always use forward slashes `/` in Python paths, or raw strings `r"C:\..."` to avoid escape sequence issues.

---

## 2. Opening Files: The `open()` Function

The `open()` function returns a file object that represents the connection to a file:

```python
file_object = open(filename, mode, encoding)
```

### File Modes

| Mode | Purpose | Creates? | Overwrites? |
|------|---------|----------|-----------|
| `'r'` | Read only | No | No |
| `'w'` | Write (text) | Yes | Yes |
| `'a'` | Append (text) | Yes | No |
| `'x'` | Exclusive create (fail if exists) | Yes | No |
| `'rb'` | Read (binary) | No | No |
| `'wb'` | Write (binary) | Yes | Yes |
| `'ab'` | Append (binary) | Yes | No |
| `'r+'` | Read & write | No | No |

### Encoding

Text files have encodings. Always specify:

```python
# UTF-8 is standard (and default in Python 3)
open("data.txt", "r", encoding="utf-8")

# Latin-1 for older files
open("data.txt", "r", encoding="latin-1")
```

---

## 3. Context Managers: The `with` Statement

**ALWAYS** use `with` statements to open files:

```python
# ❌ BAD: File might not close properly
file = open("data.txt", "r")
content = file.read()
file.close()  # What if an error occurs above?

# ✅ GOOD: File closes automatically, even on error
with open("data.txt", "r") as file:
    content = file.read()
# File automatically closed here
```

**Why?** If an error occurs, the file stays open and consumes system resources. The `with` statement guarantees cleanup.

```python
# How it works internally
with open("data.txt") as f:
    # __enter__() is called: file opens
    content = f.read()
    # If error occurs here, __exit__() is still called
# __exit__() is called: file closes (regardless of errors)
```

---

## 4. File Object Methods

Once you have a file object, you can use these methods:

### Reading

```python
with open("data.txt", "r") as f:
    # Read entire file as string
    content = f.read()  # Returns: "Line 1\nLine 2\n..."
    
    # Read one line
    line = f.readline()  # Returns: "Line 1\n" (with newline)
    
    # Read all lines as list
    lines = f.readlines()  # Returns: ["Line 1\n", "Line 2\n", ...]
```

### Writing

```python
with open("output.txt", "w") as f:
    f.write("Hello, World!")
    f.write("\n")
    f.write("Line 2")
    
# Result: "Hello, World!\nLine 2"
```

### Appending

```python
with open("output.txt", "a") as f:
    f.write("\nLine 3")  # Adds WITHOUT overwriting
```

---

## 5. Iterating Over Files

You can iterate directly over file objects:

```python
with open("data.txt", "r") as f:
    for line in f:
        print(line.strip())  # .strip() removes trailing newline
```

This is memory-efficient—doesn't load entire file into memory.

---

## 6. File Positioning

The file pointer tracks your position:

```python
with open("data.txt", "r") as f:
    first_char = f.read(1)  # Read 1 character
    # Pointer now at position 1
    
    second_char = f.read(1)  # Reads character 2
    
    f.seek(0)  # Reset pointer to beginning
    first_char_again = f.read(1)  # Re-read first character
```

Methods:
- `f.seek(offset)`: Move pointer to position
- `f.tell()`: Get current position

---

## 7. Encoding Errors

Python can handle text encoding issues:

```python
# ❌ BAD: Crashes on non-UTF-8 characters
with open("data.txt", "r", encoding="utf-8") as f:
    content = f.read()

# ✅ GOOD: Handles errors gracefully
with open("data.txt", "r", encoding="utf-8", errors="ignore") as f:
    content = f.read()  # Non-UTF-8 chars are skipped

# ✅ GOOD: Replace bad characters with placeholder
with open("data.txt", "r", encoding="utf-8", errors="replace") as f:
    content = f.read()  # Non-UTF-8 chars become '?'
```

Error strategies:
- `"strict"`: Raise exception (default, safest)
- `"ignore"`: Skip bad characters
- `"replace"`: Replace with `?`
- `"backslashreplace"`: Use escape sequences

---

## 8. File Modes in Practice

### Overwrite a file:

```python
with open("config.txt", "w") as f:
    f.write("setting1=value1\n")
    f.write("setting2=value2\n")
# Previous content is lost
```

### Read and process:

```python
with open("data.txt", "r") as f:
    lines = f.readlines()
    # Now work with lines in memory
```

### Append to file:

```python
with open("log.txt", "a") as f:
    f.write(f"Event occurred at {datetime.now()}\n")
```

### Fail if file exists:

```python
try:
    with open("new_file.txt", "x") as f:
        f.write("This will only work if file doesn't exist")
except FileExistsError:
    print("File already exists, not overwriting")
```

---

## 9. Mini-Project: Log File Parser

Create a program that:
1. Reads a log file (create sample_log.txt first)
2. Counts occurrences of each log level (INFO, WARNING, ERROR)
3. Writes a summary to summary.txt

**sample_log.txt:**
```
INFO: Application started
WARNING: Low disk space
ERROR: Connection timeout
INFO: Retrying connection
ERROR: Failed to save file
INFO: Cleanup completed
```

**Your implementation:**

```python
log_counts = {"INFO": 0, "WARNING": 0, "ERROR": 0}

# Task 1: Read and count
with open("sample_log.txt", "r") as f:
    for line in f:
        for level in log_counts:
            if line.startswith(level):
                log_counts[level] += 1

# Task 2: Write summary
with open("summary.txt", "w") as f:
    f.write("Log Summary\n")
    f.write("===========\n")
    for level, count in log_counts.items():
        f.write(f"{level}: {count} occurrences\n")
```

**Extension**: Add timestamps and error details.

---

## 10. Graded Exercises

### Starter Level

**Exercise 1**: Write and Read

```python
# 1. Write a file with your name, age, and favorite color
# 2. Read it back and print each on a new line
# 3. Append a new line with your favorite food
# 4. Verify the file has all 4 lines
```

**Exercise 2**: Line Counter

```python
# Create a function that counts non-empty lines in a file:
# def count_lines(filename):
#     ...
# 
# (Ignore blank lines and lines with only whitespace)
```

### Intermediate Level

**Exercise 3**: File Merger

```python
# Create a function that merges two files:
# def merge_files(file1, file2, output_file):
#     # Combine file1 and file2 into output_file
#     # Keep order: all of file1, then all of file2
#     ...
```

**Exercise 4**: Duplicate Line Detector

```python
# Create a function that finds duplicate consecutive lines:
# def find_duplicate_lines(filename):
#     # Return a list of (line_number, line_content) tuples
#     # where line == previous line
#     ...
```

### Advanced Level

**Exercise 5**: Log File Analysis

```python
# Analyze a log file and create a report:
# - Count lines per hour
# - List all ERROR lines with context (line before/after)
# - Calculate time between errors
# - Write formatted report to file
```

**Exercise 6**: File Diff Utility

```python
# Create a function showing differences between two files:
# def file_diff(file_before, file_after):
#     # Show line numbers where content differs
#     # Show what changed
#     ...
```

---

## 11. Self-Assessment Checklist

- [ ] I can open files using `with` statements
- [ ] I understand file modes (r, w, a, x) and when to use each
- [ ] I can read files with `read()`, `readline()`, `readlines()`
- [ ] I can iterate over file lines efficiently
- [ ] I can write to files without overwriting unintentionally
- [ ] I understand file pointers and `seek()`
- [ ] I can handle encoding properly (UTF-8 vs others)
- [ ] I can handle encoding errors gracefully
- [ ] I understand why `with` statements are essential
- [ ] I can work with file paths correctly

---

## 12. Additional Resources

- [Python `open()` documentation](https://docs.python.org/3/library/functions.html#open)
- [Built-in Types: File Objects](https://docs.python.org/3/tutorial/inputoutput.html#reading-and-writing-files)
- [Context Managers (PEP 343)](https://www.python.org/dev/peps/pep-0343/)
- Real Python: [Reading and Writing Files in Python](https://realpython.com/read-write-files-python/)

---

**Next Lesson**: [1.1.53 - Reading Files](Lesson-1.1.53-Reading-Files.md)  
**Previous Lesson**: [1.1.51 - MILESTONE TEST: Data Structures](Lesson-1.1.51-Milestone-Test-Data-Structures.md)
