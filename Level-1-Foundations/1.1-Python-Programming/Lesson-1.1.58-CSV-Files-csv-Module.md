# Lesson 1.1.58: CSV Files & csv Module

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.53 (Reading Files), Lesson 1.1.54 (Writing Files)

---

## Learning Objectives

By the end of this lesson, you will:

1. Understand CSV format and its quirks
2. Read CSV files safely with the `csv` module
3. Write CSV files correctly
4. Handle different delimiters and special characters
5. Use `DictReader` for column-based access
6. Use `DictWriter` for dict-based output
7. Handle encoding and newline issues
8. Transform and filter CSV data

---

## 1. Understanding CSV Format

CSV (Comma-Separated Values) is a simple text format for tabular data:

```csv
name,age,email,active
Alice,30,alice@example.com,true
Bob,25,bob@example.com,true
Charlie,35,charlie@example.com,false
```

**Challenges with CSV:**
- Fields might contain commas: `"Smith, John"`
- Fields might contain newlines
- Quoting and escaping rules vary
- Different delimiters (tabs, semicolons)
- Encoding issues

**Always use the `csv` module** instead of manual parsing.

---

## 2. Reading CSV Files

### Basic: reader()

```python
import csv

with open("data.csv", "r") as f:
    reader = csv.reader(f)
    for row in reader:
        print(row)
        # Output: ['name', 'age', 'email']
        #         ['Alice', '30', 'alice@example.com']
```

### Better: DictReader()

```python
import csv

with open("data.csv", "r") as f:
    reader = csv.DictReader(f)
    for row in reader:
        print(row)
        # Output: {'name': 'Alice', 'age': '30', 'email': 'alice@example.com'}
```

**Difference:**
- `reader()`: Returns lists, manual header handling
- `DictReader()`: Returns dicts, automatic header parsing

---

## 3. Writing CSV Files

### Basic: writer()

```python
import csv

data = [
    ["name", "age", "city"],
    ["Alice", "30", "New York"],
    ["Bob", "25", "Los Angeles"]
]

with open("output.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerows(data)

# Result CSV:
# name,age,city
# Alice,30,New York
# Bob,25,Los Angeles
```

**⚠️ Important**: Use `newline=""` to avoid extra blank lines!

### Better: DictWriter()

```python
import csv

data = [
    {"name": "Alice", "age": 30, "city": "New York"},
    {"name": "Bob", "age": 25, "city": "Los Angeles"}
]

with open("output.csv", "w", newline="") as f:
    fieldnames = ["name", "age", "city"]
    writer = csv.DictWriter(f, fieldnames=fieldnames)
    
    writer.writeheader()  # Write header row
    writer.writerows(data)  # Write data rows
```

---

## 4. Handling Quotes and Special Characters

### CSV Module Handles Automatically

```python
import csv

data = [
    ["name", "description"],
    ["Product A", "Has a comma, in description"],
    ["Product B", 'Has a "quote" in description']
]

with open("output.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerows(data)

# Result: 
# name,description
# "Product A","Has a comma, in description"
# "Product B","Has a ""quote"" in description"
```

### Reading Quoted Fields

```python
import csv

# Reading handles quotes automatically
with open("output.csv", "r") as f:
    reader = csv.reader(f)
    for row in reader:
        print(row)
        # Output correctly parses quoted fields
```

---

## 5. Different Delimiters

### Tab-Separated Values (TSV)

```python
import csv

with open("data.tsv", "r") as f:
    reader = csv.reader(f, delimiter="\t")
    for row in reader:
        print(row)
```

### Semicolon-Separated (European CSV)

```python
import csv

with open("data.csv", "r") as f:
    reader = csv.reader(f, delimiter=";")
    for row in reader:
        print(row)
```

### Custom Dialects

```python
import csv

# Define custom format
csv.register_dialect("custom", delimiter="|", quotechar='"', quoting=csv.QUOTE_ALL)

with open("data.txt", "r") as f:
    reader = csv.reader(f, dialect="custom")
    for row in reader:
        print(row)
```

---

## 6. Encoding and Encoding Issues

### UTF-8 (Recommended)

```python
import csv

# Explicit UTF-8
with open("data.csv", "r", encoding="utf-8") as f:
    reader = csv.reader(f)
    for row in reader:
        print(row)
```

### Latin-1 / ISO-8859-1 (Older Files)

```python
import csv

with open("data.csv", "r", encoding="latin-1") as f:
    reader = csv.reader(f)
    for row in reader:
        print(row)
```

### BOM Handling

```python
import csv

# UTF-8 with BOM
with open("data.csv", "r", encoding="utf-8-sig") as f:
    reader = csv.reader(f)
    for row in reader:
        print(row)  # BOM automatically removed
```

---

## 7. Filtering and Transforming CSV

### Filter Rows

```python
import csv

with open("data.csv", "r") as f_in:
    reader = csv.DictReader(f_in)
    
    # Filter rows
    active_users = [row for row in reader if row.get("active") == "true"]

# Write filtered data
with open("active_users.csv", "w", newline="") as f_out:
    if active_users:
        fieldnames = active_users[0].keys()
        writer = csv.DictWriter(f_out, fieldnames=fieldnames)
        writer.writeheader()
        writer.writerows(active_users)
```

### Transform Data

```python
import csv

def transform_row(row):
    """Transform a CSV row"""
    return {
        "name": row["name"].upper(),
        "age": int(row["age"]),
        "email": row["email"].lower()
    }

with open("data.csv", "r") as f_in:
    reader = csv.DictReader(f_in)
    transformed = [transform_row(row) for row in reader]
```

---

## 8. Large File Processing

### Memory-Efficient Streaming

```python
import csv

def process_csv_streaming(input_file, output_file):
    """Process CSV without loading entire file in memory"""
    with open(input_file, "r") as f_in:
        with open(output_file, "w", newline="") as f_out:
            reader = csv.DictReader(f_in)
            writer = csv.DictWriter(f_out, fieldnames=reader.fieldnames)
            
            writer.writeheader()
            for row in reader:
                # Process one row at a time
                row["name"] = row["name"].upper()
                writer.writerow(row)

process_csv_streaming("input.csv", "output.csv")
```

---

## 9. Mini-Project: CSV Data Analysis

Create a program to analyze CSV data:

```python
import csv
from collections import defaultdict

def analyze_csv(filename):
    """Analyze CSV file"""
    stats = {
        "rows": 0,
        "columns": 0,
        "by_column": defaultdict(list)
    }
    
    with open(filename, "r") as f:
        reader = csv.DictReader(f)
        fieldnames = reader.fieldnames
        stats["columns"] = len(fieldnames)
        
        for row in reader:
            stats["rows"] += 1
            for field, value in row.items():
                stats["by_column"][field].append(value)
    
    # Generate report
    report = {
        "total_rows": stats["rows"],
        "total_columns": stats["columns"],
        "column_stats": {}
    }
    
    for field, values in stats["by_column"].items():
        unique = len(set(values))
        report["column_stats"][field] = {
            "unique_values": unique,
            "sample": values[0] if values else None
        }
    
    return report

# Usage
report = analyze_csv("data.csv")

with open("analysis.txt", "w") as f:
    f.write("CSV ANALYSIS REPORT\n")
    f.write("=" * 40 + "\n")
    f.write(f"Total rows: {report['total_rows']}\n")
    f.write(f"Total columns: {report['total_columns']}\n\n")
    f.write("Column statistics:\n")
    for field, stats in report["column_stats"].items():
        f.write(f"  {field}: {stats['unique_values']} unique values\n")
```

**Extension**: Add filtering, grouping, and aggregation

---

## 10. Graded Exercises

### Starter Level

**Exercise 1**: Read and Display

```python
# 1. Read CSV file
# 2. Display first 5 rows
# 3. Show column names
```

**Exercise 2**: Write CSV

```python
# 1. Create data as list of dicts
# 2. Write to CSV file
# 3. Verify by reading back
```

### Intermediate Level

**Exercise 3**: Merge CSVs

```python
# Create a function:
'''
def merge_csv_files(files, output_file):
    # Read multiple CSV files
    # Merge into one
    # Write to output
    # Assume same columns
    ...
'''
```

**Exercise 4**: Filter and Export

```python
# 1. Read CSV file
# 2. Filter by condition
# 3. Export filtered data to new CSV
```

### Advanced Level

**Exercise 5**: CSV Differ

```python
# Compare two CSV files:
# - Find added rows
# - Find removed rows
# - Find modified rows
# - Generate diff report
```

**Exercise 6**: Pivot Table

```python
# Create pivot table from CSV:
# - Group by column A
# - Aggregate column B (sum, avg, count)
# - Output as CSV or formatted table
```

---

## 11. Self-Assessment Checklist

- [ ] I understand CSV format and its quirks
- [ ] I use `csv.reader()` for list-based access
- [ ] I use `csv.DictReader()` for dict-based access
- [ ] I write CSV with `csv.writer()` or `csv.DictWriter()`
- [ ] I remember `newline=""` when opening files for writing
- [ ] I handle different delimiters correctly
- [ ] I understand encoding and BOM issues
- [ ] I can filter and transform CSV data
- [ ] I can process large CSV files efficiently
- [ ] I handle quotes and special characters automatically

---

## 12. Additional Resources

- [csv module documentation](https://docs.python.org/3/library/csv.html)
- [csv format specification](https://tools.ietf.org/html/rfc4180)
- Real Python: [Reading and Writing CSV Files](https://realpython.com/python-csv/)
- [Pandas for advanced CSV work](https://pandas.pydata.org/)

---

**Next Lesson**: [1.1.59 - Paths & pathlib](Lesson-1.1.59-Paths-pathlib.md)  
**Previous Lesson**: [1.1.57 - JSON Format & Serialization](Lesson-1.1.57-JSON-Format-Serialization.md)




