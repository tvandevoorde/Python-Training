# Lesson 1.1.53: Reading Files

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.52 (File I/O Basics)

---

## Learning Objectives

By the end of this lesson, you will:

1. Master different file reading strategies (`read()`, `readline()`, `readlines()`)
2. Choose the right reading method for different scenarios
3. Handle files of any size efficiently
4. Understand memory implications of different approaches
5. Work with file pointers and repositioning
6. Process files line-by-line with iteration
7. Handle incomplete reads and partial data
8. Debug common reading mistakes

---

## 1. Three Ways to Read Files

### Method 1: `read()` - Read Everything

```python
with open("story.txt", "r") as f:
    entire_content = f.read()
    
print(entire_content)  # Returns entire file as single string
```

**When to use**: Small files, when you need all content at once

**Drawback**: Large files consume all RAM

```python
# Get file size
import os
size_mb = os.path.getsize("video.mp4") / (1024 * 1024)
if size_mb > 100:
    print("Too large to read() all at once!")
```

### Method 2: `readline()` - Read One Line

```python
with open("data.txt", "r") as f:
    line1 = f.readline()  # "First line\n"
    line2 = f.readline()  # "Second line\n"
    line3 = f.readline()  # "Third line\n"
    line4 = f.readline()  # "" (empty string = EOF)
    
# Note: lines include newline character '\n'
```

**When to use**: Reading specific lines, sequential processing

---

### Method 3: `readlines()` - Read All Lines as List

```python
with open("data.txt", "r") as f:
    all_lines = f.readlines()
    
# Returns: ["Line 1\n", "Line 2\n", "Line 3\n"]
```

**When to use**: Need random access to lines, working with Python lists

---

## 2. Best Practice: Iteration

**Recommended approach** for most cases:

```python
with open("data.txt", "r") as f:
    for line in f:
        print(line.strip())  # .strip() removes '\n'
```

**Advantages**:
- Memory-efficient (one line at a time)
- Clean, Pythonic syntax
- No need to call methods

---

## 3. Reading Bytes vs. Text

### Text Mode (Default)

```python
with open("data.txt", "r") as f:
    content = f.read()  # str with decoded text
    # content is automatically decoded using encoding
```

### Binary Mode

```python
with open("image.jpg", "rb") as f:
    raw_bytes = f.read()  # bytes object, no decoding
    # Treat as raw binary data
```

**Key difference**:
- Text mode: Automatically decodes bytes to strings
- Binary mode: Raw bytes without interpretation

---

## 4. Reading Specified Amounts

### Read N Characters

```python
with open("data.txt", "r") as f:
    chunk1 = f.read(10)  # First 10 characters
    chunk2 = f.read(10)  # Next 10 characters
    chunk3 = f.read()    # Rest of file
```

**Use case**: Processing large files in chunks

```python
def read_in_chunks(filename, chunk_size=8192):
    """Read file in chunks - memory efficient for large files"""
    with open(filename, "rb") as f:
        while True:
            chunk = f.read(chunk_size)
            if not chunk:
                break
            process_chunk(chunk)
```

---

## 5. File Pointers Revisited

Each file has a position pointer:

```python
with open("data.txt", "r") as f:
    f.tell()  # 0 - at beginning
    
    char1 = f.read(1)  # Read 1 char
    f.tell()  # 1 - pointer moved
    
    char2 = f.read(1)  # Read next char
    f.tell()  # 2
    
    f.seek(0)  # Reset to beginning
    f.tell()  # 0
    
    char1_again = f.read(1)  # Re-read first char
```

### Seeking From Different Positions

```python
with open("data.txt", "r") as f:
    f.seek(0, 0)   # Absolute: position 0 from start
    f.seek(-10, 2) # Relative: 10 bytes from end
    f.seek(5, 1)   # Relative: 5 bytes forward from current
```

---

## 6. Buffering and Flushing

Python buffers file operations for efficiency:

```python
import time

with open("log.txt", "w") as f:
    f.write("Event 1\n")
    # Data might not be on disk yet
    
    time.sleep(1)  # While sleeping, data might be flushed
    
    f.write("Event 2\n")
    f.flush()      # Force write to disk NOW
    
    time.sleep(1)  # Data is on disk
```

**When it matters**: Real-time logs, critical data

---

## 7. Detecting End of File

### Method 1: Empty String from `readline()`

```python
with open("data.txt", "r") as f:
    while True:
        line = f.readline()
        if not line:  # Empty string = EOF
            break
        print(line.strip())
```

### Method 2: Check Position

```python
import os

with open("data.txt", "r") as f:
    while f.tell() < os.path.getsize("data.txt"):
        line = f.readline()
        print(line.strip())
```

---

## 8. Reading Pattern: Process Line-by-Line

**Common pattern** for data processing:

```python
def count_words(filename):
    """Count total words in a file"""
    total_words = 0
    
    with open(filename, "r") as f:
        for line in f:
            words = line.split()
            total_words += len(words)
    
    return total_words

count = count_words("document.txt")
print(f"Total words: {count}")
```

---

## 9. Mini-Project: CSV Reader

Create a simple CSV reader without using the `csv` module:

**data.csv:**
```
name,age,city
Alice,30,New York
Bob,25,Los Angeles
Charlie,35,Chicago
```

**Your implementation:**

```python
def read_csv(filename):
    """Read CSV file and return as list of dicts"""
    data = []
    
    with open(filename, "r") as f:
        # Read header
        header = f.readline().strip().split(",")
        
        # Read data rows
        for line in f:
            values = line.strip().split(",")
            row_dict = dict(zip(header, values))
            data.append(row_dict)
    
    return data

people = read_csv("data.csv")
for person in people:
    print(f"{person['name']} is {person['age']} years old")
```

**Extension**: Handle quoted fields with commas: `"Smith, John""`

---

## 10. Graded Exercises

### Starter Level

**Exercise 1**: Read and Display

```python
# 1. Read a file using three different methods
# 2. Compare which is best for your use case
# (Hint: Create a small test file first)
```

**Exercise 2**: Line Counter

```python
# Create a function that counts:
# - Total lines
# - Non-empty lines
# - Lines starting with '#'
'''
def analyze_file(filename):
    # Returns (total_lines, non_empty, comment_lines)
    ...
'''
```

### Intermediate Level

**Exercise 3**: First N Lines

```python
# Create a function `head(filename, n)` that:
# - Returns first N lines of a file
# - Don't load entire file into memory
# head("data.csv", 10)
```

**Exercise 4**: Find Line Number

```python
# Create a function that finds a string in file:
'''
def find_line(filename, search_term):
    # Returns line number (1-indexed) of first match
    # Returns None if not found
    ...
'''
```

### Advanced Level

**Exercise 5**: Binary File Analyzer

```python
# Analyze a binary file and show:
# - Total size in bytes
# - Byte pattern frequency (most common bytes)
# - Position of first occurrence of a byte sequence
```

**Exercise 6**: Smart File Reader

```python
# Create a reader that auto-detects encoding:
'''
def smart_read(filename):
    # Try UTF-8, then Latin-1, then ASCII
    # Return content with the working encoding
    ...
'''
```

---

## 11. Self-Assessment Checklist

- [ ] I understand the difference between `read()`, `readline()`, `readlines()`
- [ ] I can choose the right reading method for each scenario
- [ ] I can iterate over files efficiently
- [ ] I understand file pointers with `tell()` and `seek()`
- [ ] I know when to use text mode vs. binary mode
- [ ] I can read files in chunks for memory efficiency
- [ ] I can detect end of file correctly
- [ ] I understand buffering and when to use `flush()`
- [ ] I handle different encodings without crashing

---

## 12. Additional Resources

- [Python file methods documentation](https://docs.python.org/3/tutorial/inputoutput.html)
- [I/O Best Practices](https://docs.python.org/3/library/io.html#io-overview)
- Real Python: [Working with Files in Python](https://realpython.com/working-with-files-in-python/)

---

**Next Lesson**: [1.1.54 - Writing Files](Lesson-1.1.54-Writing-Files.md)  
**Previous Lesson**: [1.1.52 - File I/O Basics](Lesson-1.1.52-File-IO-Basics.md)
