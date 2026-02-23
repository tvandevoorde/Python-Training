# Lesson 1.1.55: Working with Text Files

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.53 (Reading Files), Lesson 1.1.54 (Writing Files)

---

## Learning Objectives

By the end of this lesson, you will:

1. Parse text files into structured data
2. Clean and normalize text data
3. Handle line endings across platforms
4. Extract specific information from text
5. Transform text data programmatically
6. Deal with inconsistent formatting
7. Process large text files efficiently
8. Work with delimited data (tabs, spaces, custom delimiters)

---

## 1. Text Processing Fundamentals

### Line Endings Across Platforms

```python
# Windows: \r\n (carriage return + newline)
# macOS/Linux: \n (newline only)
# Old Mac: \r (carriage return only)

# Python's universal newline mode handles this:
with open("data.txt", "r") as f:  # Automatically converts to '\n'
    for line in f:
        print(line)  # Works correctly on all platforms
```

### Whitespace Issues

```python
with open("data.txt", "r") as f:
    for line in f:
        line = line.strip()  # Remove leading/trailing whitespace
        if line and not line.startswith("#"):  # Skip empty/comment lines
            process(line)
```

---

## 2. Parsing Structured Text

### Fixed-Width Columns

```
Name      Age City
Alice     30  New York
Bob       25  Los Angeles
Charlie   35  Chicago
```

**Parser:**

```python
def parse_fixed_width(filename, column_widths):
    """Parse fixed-width text file"""
    data = []
    
    with open(filename, "r") as f:
        for line in f:
            row = {}
            start = 0
            for col_name, width in column_widths:
                value = line[start:start+width].strip()
                row[col_name] = value
                start += width
            data.append(row)
    
    return data

widths = [("name", 10), ("age", 5), ("city", 15)]
people = parse_fixed_width("data.txt", widths)
```

### Delimiter-Separated Values

```python
def parse_delimited(filename, delimiter=","):
    """Parse delimited text file"""
    data = []
    
    with open(filename, "r") as f:
        header = f.readline().strip().split(delimiter)
        
        for line in f:
            if not line.strip():  # Skip empty lines
                continue
            
            values = line.strip().split(delimiter)
            row = dict(zip(header, values))
            data.append(row)
    
    return data

# Usage
people = parse_delimited("data.csv", ",")
people = parse_delimited("data.tsv", "\t")
```

---

## 3. Text Cleaning

### Remove Extra Whitespace

```python
text = "  Hello    World   \n"
print(text.strip())           # "Hello    World"
print(" ".join(text.split()))  # "Hello World"
```

### Normalize Case

```python
def normalize_names(filename):
    """Convert names to title case"""
    with open(filename, "r") as f:
        lines = f.readlines()
    
    with open(filename, "w") as f:
        for line in lines:
            name = line.strip().title()
            f.write(name + "\n")

normalize_names("names.txt")
```

### Remove Punctuation

```python
import string

def remove_punctuation(text):
    """Remove all punctuation from text"""
    return text.translate(str.maketrans("", "", string.punctuation))

text = "Hello, World! How are you?"
print(remove_punctuation(text))  # "Hello World How are you"
```

---

## 4. Extracting Information

### Using String Methods

```python
def extract_emails(filename):
    """Find all email-like patterns"""
    emails = []
    
    with open(filename, "r") as f:
        for line in f:
            if "@" in line:
                # Simple extraction (not production-grade)
                words = line.split()
                for word in words:
                    if "@" in word:
                        emails.append(word.strip(".,;:"))
    
    return emails
```

### Using Regular Expressions

```python
import re

def extract_phone_numbers(filename):
    """Extract phone numbers using regex"""
    pattern = r"\b\d{3}-\d{3}-\d{4}\b"
    matches = []
    
    with open(filename, "r") as f:
        for line in f:
            found = re.findall(pattern, line)
            matches.extend(found)
    
    return matches
```

---

## 5. Transforming Text

### Line-by-Line Transformation

```python
def convert_to_uppercase(input_file, output_file):
    """Convert all text to uppercase"""
    with open(input_file, "r") as f_in:
        with open(output_file, "w") as f_out:
            for line in f_in:
                f_out.write(line.upper())
```

### Data Transformation

```python
def reformat_dates(input_file, output_file):
    """Convert dates from MM/DD/YYYY to YYYY-MM-DD"""
    import re
    
    with open(input_file, "r") as f_in:
        with open(output_file, "w") as f_out:
            for line in f_in:
                # Replace MM/DD/YYYY with YYYY-MM-DD
                result = re.sub(
                    r"(\d{2})/(\d{2})/(\d{4})",
                    r"\3-\1-\2",
                    line
                )
                f_out.write(result)
```

---

## 6. Aggregating Data

### Counting Occurrences

```python
def count_words(filename):
    """Count word frequencies"""
    word_count = {}
    
    with open(filename, "r") as f:
        for line in f:
            words = line.lower().split()
            for word in words:
                # Remove punctuation
                word = word.strip(".,;:!?")
                word_count[word] = word_count.get(word, 0) + 1
    
    # Sort by frequency
    sorted_words = sorted(word_count.items(), key=lambda x: x[1], reverse=True)
    return sorted_words

top_10 = count_words("document.txt")
for word, count in top_10:
    print(f"{word}: {count}")
```

### Summary Statistics

```python
def analyze_numbers(filename):
    """Calculate statistics from numeric file"""
    numbers = []
    
    with open(filename, "r") as f:
        for line in f:
            try:
                num = float(line.strip())
                numbers.append(num)
            except ValueError:
                pass  # Skip non-numeric lines
    
    if not numbers:
        return None
    
    return {
        "min": min(numbers),
        "max": max(numbers),
        "avg": sum(numbers) / len(numbers),
        "count": len(numbers)
    }

stats = analyze_numbers("data.txt")
print(f"Average: {stats['avg']:.2f}")
```

---

## 7. Handling Encoding Issues

### Detect and Fix Encoding

```python
def read_with_encoding_fallback(filename):
    """Try multiple encodings"""
    encodings = ["utf-8", "latin-1", "ascii"]
    
    for encoding in encodings:
        try:
            with open(filename, "r", encoding=encoding) as f:
                return f.read(), encoding
        except UnicodeDecodeError:
            continue
    
    raise ValueError("Could not decode file with any encoding")

content, used_encoding = read_with_encoding_fallback("data.txt")
print(f"Successfully decoded with {used_encoding}")
```

### Handle Mixed Encodings

```python
def read_with_error_handling(filename):
    """Read file, replacing problematic characters"""
    with open(filename, "r", encoding="utf-8", errors="replace") as f:
        return f.read()

# Errors parameter options:
# "strict"      - Raise exception (default)
# "ignore"      - Skip problematic characters
# "replace"     - Replace with '?'
# "backslashreplace" - Use escape sequences
```

---

## 8. Efficient Text Processing

### Process Large Files

```python
def process_large_file(input_file, output_file, batch_size=1000):
    """Process large file without loading into memory"""
    with open(input_file, "r") as f_in:
        with open(output_file, "w") as f_out:
            batch = []
            
            for line in f_in:
                processed = line.upper().strip()
                batch.append(processed + "\n")
                
                if len(batch) >= batch_size:
                    f_out.writelines(batch)
                    batch = []
            
            if batch:
                f_out.writelines(batch)

process_large_file("huge_input.txt", "huge_output.txt")
```

---

## 9. Mini-Project: Log Analyzer

Create a comprehensive log analyzer:

```python
import re
from collections import defaultdict

def analyze_log_file(filename):
    """Comprehensive log analysis"""
    log_pattern = r"(\d{4}-\d{2}-\d{2}) \[(\w+)\] (.*)"
    
    stats = {
        "levels": defaultdict(int),
        "messages": defaultdict(int),
        "errors_by_hour": defaultdict(int)
    }
    
    with open(filename, "r") as f:
        for line in f:
            match = re.match(log_pattern, line)
            if match:
                date, level, message = match.groups()
                
                stats["levels"][level] += 1
                stats["messages"][message] += 1
    
    return stats

# Write report
stats = analyze_log_file("app.log")

with open("log_report.txt", "w") as f:
    f.write("LOG ANALYSIS REPORT\n")
    f.write("=" * 50 + "\n\n")
    
    f.write("Levels:\n")
    for level, count in sorted(stats["levels"].items()):
        f.write(f"  {level}: {count}\n")
    
    f.write("\nTop Messages:\n")
    top = sorted(stats["messages"].items(), key=lambda x: x[1], reverse=True)[:10]
    for msg, count in top:
        f.write(f"  {msg}: {count}\n")
```

**Extension**: Generate alerts for high error rates

---

## 10. Graded Exercises

### Starter Level

**Exercise 1**: Line Processor

```python
# Read a text file and:
# - Remove empty lines
# - Strip whitespace
# - Count total and non-empty lines
# - Write cleaned version
```

**Exercise 2**: Word Counter

```python
# Count words in a file:
# - Total word count
# - Unique word count
# - Top 10 most common words
```

### Intermediate Level

**Exercise 3**: Data Filter

```python
# Read data file (CSV-like) and:
# - Filter by criteria
# - Extract specific columns
# - Write filtered results
```

**Exercise 4**: Text Normalizer

```python
# Normalize names in file:
# - Title case
# - Remove duplicates
# - Sort alphabetically
# - Write sorted unique names
```

### Advanced Level

**Exercise 5**: Log Parser

```python
# Parse complex log format:
# - Extract errors
# - Find error patterns
# - Generate statistics
# - Create summary report
```

**Exercise 6**: Language Detector

```python
# Analyze text file for:
# - Language detection (based on word patterns)
# - Reading level
# - Average sentence length
# - Vocabulary complexity score
```

---

## 11. Self-Assessment Checklist

- [ ] I can parse fixed-width text files
- [ ] I can parse delimited text files
- [ ] I can handle different line endings
- [ ] I can clean and normalize text data
- [ ] I can extract information using string methods and regex
- [ ] I can transform text data programmatically
- [ ] I can aggregate statistics from text
- [ ] I handle encoding issues gracefully
- [ ] I can process large files efficiently
- [ ] I can create summary reports from text files

---

## 12. Additional Resources

- [Python string methods](https://docs.python.org/3/library/stdtypes.html#string-methods)
- [Regular expressions](https://docs.python.org/3/library/re.html)
- Real Python: [Text Processing](https://realpython.com/search/text/)
- [Unicode and Encodings](https://docs.python.org/3/tutorial/interpreter.html#source-code-encoding)

---

**Next Lesson**: [1.1.56 - Reading & Writing Binary Files](Lesson-1.1.56-Reading-Writing-Binary-Files.md)  
**Previous Lesson**: [1.1.54 - Writing Files](Lesson-1.1.54-Writing-Files.md)




