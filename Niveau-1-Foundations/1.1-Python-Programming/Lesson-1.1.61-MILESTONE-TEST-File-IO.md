# Lesson 1.1.61: MILESTONE TEST: File I/O

**Estimated Time**: 8 hours | **Difficulty**: Intermediate-Advanced  
**Prerequisites**: All Topic 5 lessons (1.1.52-1.1.60)

---

## Learning Objectives

By the end of this milestone assessment, you will have:

1. Demonstrated mastery of file I/O in Python
2. Applied all learned concepts in comprehensive problems
3. Shown ability to handle real-world file scenarios
4. Implemented error handling and edge cases
5. Written production-quality file handling code
6. Integrated multiple file format skills
7. Optimized file operations for performance
8. Validated your readiness for advanced topics

---

## Milestone Competencies

This test assesses your ability to:

- ✅ Read and write text, binary, and structured (CSV/JSON) files
- ✅ Handle file paths cross-platform
- ✅ Validate and transform file data
- ✅ Manage resources with context managers
- ✅ Process large files efficiently
- ✅ Implement robust error handling
- ✅ Work with multiple file formats in one program
- ✅ Design and implement file-based applications

---

## Test Structure

**Total Points**: 100  
**Time Limit**: 8 hours (or split across 2-3 sessions)  
**Passing Score**: 80+ points

### Sections:
1. **Knowledge Assessment** (20 points)
2. **Practical Exercises** (40 points)
3. **Project-Based Problem** (40 points)

---

## Section 1: Knowledge Assessment (20 points)

Answer these questions. Each correct answer: 2 points.

### Question 1: File Modes

What is the difference between these modes? When would you use each?

```python
a) open("file.txt", "r")
b) open("file.txt", "w")
c) open("file.txt", "a")
d) open("file.txt", "x")
```

**Answer**: [Your response]

---

### Question 2: Context Managers

Why is this code problematic? Show the correct way:

```python
file = open("data.txt", "r")
content = file.read()
file.close()
```

**Answer**: [Your response]

---

### Question 3: Binary vs. Text

What's the difference in these two reads?

```python
a) with open("file", "r") as f:
       data = f.read()
       
b) with open("file", "rb") as f:
       data = f.read()
```

**Answer**: [Your response]

---

### Question 4: CSV vs. JSON

Which format would you choose for:
- Storing configuration data that needs comments?
- Exporting spreadsheet data?
- API responses?
- Time-series data with varying field count?

**Answer**: [Your response]

---

### Question 5: Path Handling

What's wrong with this code? Fix it to work cross-platform:

```python
path = "C:\\Users\\Tom\\Documents\\data.txt"
with open(path) as f:
    data = f.read()
```

**Answer**: [Your response]

---

### Question 6: Large File Processing

How would you read a 10GB file without running out of memory?

**Answer**: [Your response]

---

### Question 7: Error Handling

Write code to safely attempt to read a JSON file, handling both file not found and JSON decode errors:

**Answer**: [Your response]

---

### Question 8: Encoding

What does this line do and why might you use it?

```python
with open("file.txt", "r", encoding="utf-8-sig") as f:
    data = f.read()
```

**Answer**: [Your response]

---

### Question 9: CSV Quoting

In this CSV, why are quotes included?

```csv
name,description
product,"Coffee, hot and ready"
```

**Answer**: [Your response]

---

### Question 10: Path Operations

What does each return?

```python
from pathlib import Path
p = Path("/home/user/documents/report.pdf")

a) p.name
b) p.stem
c) p.suffix
d) p.parent
```

**Answer**: [Your response]

---

## Section 2: Practical Exercises (40 points)

### Exercise 1: File Reading Comparison (10 points)

Create a file `data.txt` with 10 lines of text.

Then write three different functions to count the lines:

```python
def count_lines_v1(filename):
    """Using read() and split()"""
    pass

def count_lines_v2(filename):
    """Using readlines()"""
    pass

def count_lines_v3(filename):
    """Using iteration"""
    pass
```

**Requirements:**
- All three methods must work correctly (3 points each = 9 points)
- Explain which is most memory-efficient (1 point)

---

### Exercise 2: CSV Processing (10 points)

Create a CSV file with student data:

```csv
name,math,science,english
Alice,95,88,92
Bob,87,91,85
Charlie,92,89,94
Diana,88,86,90
```

Write a function that:

```python
def process_grades(csv_file):
    """
    - Read the CSV file
    - Calculate average for each student (5 points)
    - Write output CSV with averages (3 points)
    - Return list of (name, average) tuples (2 points)
    """
    pass
```

**Output format:**
```csv
name,math,science,english,average
Alice,95,88,92,91.67
Bob,87,91,85,87.67
Charlie,92,89,94,91.67
Diana,88,86,90,88.00
```

---

### Exercise 3: JSON Validation (10 points)

Create and validate a JSON file:

```python
def validate_json_file(filename, required_keys):
    """
    - Read JSON file
    - Check if all required_keys exist
    - Return (is_valid: bool, errors: list)
    
    Requirements:
    - Handle file not found (2 points)
    - Handle invalid JSON (2 points)
    - Check for required keys (3 points)
    - Report detailed errors (3 points)
    """
    pass
```

**Test with:**

```python
result = validate_json_file("config.json", ["api_key", "timeout", "debug"])
print(result)
# (False, ["Missing key: api_key"])
```

---

### Exercise 4: Path Manipulation (10 points)

Write functions using `pathlib`:

```python
def find_largest_file(directory):
    """
    - Search directory recursively
    - Find largest file
    - Return Path object (5 points)
    """
    pass

def organize_by_extension(directory):
    """
    - Create subdirectories for each file type
    - Move files to appropriate directories
    - Return dict: {extension: count} (5 points)
    """
    pass
```

**Requirements:**
- Use `pathlib.Path`
- Handle missing files gracefully
- Work cross-platform

---

## Section 3: Project-Based Problem (40 points)

### Project: Log Analyzer

Create a comprehensive log analyzer that processes application log files.

#### Requirements:

**Part A: Log Parser (10 points)**

```python
class LogParser:
    def __init__(self, log_file):
        """Initialize parser"""
        pass
    
    def parse_logs(self):
        """
        Parse log file with format:
        2024-01-15 10:30:45 [INFO] Application started
        2024-01-15 10:30:46 [ERROR] Connection timeout
        
        Return: List of dicts with:
        - timestamp
        - level
        - message
        """
        pass
```

(8 points for correct parsing, 2 points for error handling)

---

**Part B: Log Analysis (10 points)**

```python
def analyze_logs(parser):
    """
    Return dict with:
    - Total entries (2 points)
    - Count by level: {INFO: X, ERROR: Y, ...} (3 points)
    - Error messages (list) (2 points)
    - Time span (first to last timestamp) (3 points)
    """
    pass
```

---

**Part C: Report Generation (10 points)**

```python
def generate_report(analysis, output_file):
    """
    Write formatted report to file:
    
    LOG ANALYSIS REPORT
    ===================
    
    Total Entries: X
    Time Span: YYYY-MM-DD HH:MM:SS to YYYY-MM-DD HH:MM:SS
    
    Level Summary:
      INFO: X entries
      WARNING: X entries
      ERROR: X entries
    
    Errors:
      - Error 1
      - Error 2
      ...
    
    Return: number of lines written
    """
    pass
```

(8 points for correct format, 2 points for file I/O)

---

**Part D: CSV Export (10 points)**

```python
def export_to_csv(analysis, output_file):
    """
    Export analysis to CSV:
    
    level,count
    INFO,150
    WARNING,23
    ERROR,5
    
    Return: True if successful
    """
    pass
```

---

#### Full Project Example:

```python
# Main program
def main():
    # Parse logs
    parser = LogParser("app.log")
    parser.parse_logs()
    
    # Analyze
    analysis = analyze_logs(parser)
    
    # Generate outputs
    generate_report(analysis, "report.txt")
    export_to_csv(analysis, "summary.csv")
    
    print("Analysis complete!")

if __name__ == "__main__":
    main()
```

---

## Grading Rubric

### Knowledge Assessment (20 points)
- 2 points per correct answer
- Partial credit for partially correct answers (1 point)

### Practical Exercises (40 points)
- 10 points per exercise
- Full points for correct, well-implemented solutions
- Partial points for partially working code
- Points deducted for:
  - Missing error handling (-2 points each)
  - Memory inefficiency (-2 points)
  - Not following requirements (-3 points)

### Project-Based Problem (40 points)

| Criterion | Points | Rubric |
|-----------|--------|--------|
| Code Quality | 8 | Clean, readable, well-organized |
| Functionality | 12 | All features work correctly |
| Error Handling | 8 | Handles edge cases and errors |
| File I/O Best Practices | 8 | Proper use of context managers, formats |
| Testing | 4 | Tested with various inputs |

---

## Sample Data for Testing

### sample.log

```
2024-01-15 10:30:45 [INFO] Application started
2024-01-15 10:30:46 [INFO] Loading configuration
2024-01-15 10:31:00 [WARNING] Cache miss on startup
2024-01-15 10:31:05 [INFO] Database connected
2024-01-15 10:35:20 [ERROR] Connection timeout to API
2024-01-15 10:35:21 [WARNING] Retrying connection
2024-01-15 10:35:25 [INFO] Connection restored
2024-01-15 11:00:00 [INFO] Scheduled backup completed
2024-01-15 11:05:30 [ERROR] Backup verification failed
2024-01-15 11:05:31 [WARNING] Retrying backup
2024-01-15 14:30:00 [INFO] Daily cleanup started
2024-01-15 14:35:00 [INFO] Daily cleanup completed
2024-01-15 18:00:00 [INFO] Application shutdown initiated
2024-01-15 18:00:05 [INFO] Application stopped
```

---

## Tips for Success

1. **Start with knowledge questions** - they warm up your brain
2. **Read requirements carefully** - don't miss details
3. **Test with sample data** - verify your code works
4. **Use try-except blocks** - always handle errors
5. **Use context managers** - `with` statements are essential
6. **Comment your code** - explain complex logic
7. **Check file operations** - verify outputs exist and are correct
8. **Be efficient** - don't load huge files into memory unnecessarily

---

## Topics Covered

- ✅ Reading files (`read()`, `readline()`, `readlines()`, iteration)
- ✅ Writing files (`write()`, `writelines()`, appending)
- ✅ Working with text files (parsing, cleaning, transforming)
- ✅ Binary files (reading, writing, pickle)
- ✅ JSON (parsing, generating, validation)
- ✅ CSV (reading, writing, transformations)
- ✅ Paths (`pathlib`, navigation, manipulation)
- ✅ Error handling (file operations, encoding issues)
- ✅ Context managers (resource management)
- ✅ Large file processing (efficiency)

---

## Next Steps After Passing

**If you score 80+**, congratulations! You're ready for:
- Topic 6: Error Handling (1.1.62-1.1.74)
- Advanced file processing with frameworks
- Web API development (consuming/producing files)

**If you score <80**, review:
- Specific topics where you struggled
- Practice with additional exercises
- Retake the milestone test

---

## Passing Requirements

✅ **Minimum Score**: 80/100  
✅ **Knowledge Section**: ≥16 points (80%)  
✅ **Practical Exercises**: ≥32 points (80%)  
✅ **Project**: ≥32 points (80%)

---

**Congratulations on reaching the end of Topic 5!** 🎉

---

**Next Topic**: [Topic 6: Error Handling (1.1.62-1.1.74)](../1.1-Python-Programming/Lesson-1.1.62-Exception-Basics.md)  
**Previous Lesson**: [1.1.60 - Mini-Project: Data Importer](Lesson-1.1.60-Mini-Project-Data-Importer.md)
