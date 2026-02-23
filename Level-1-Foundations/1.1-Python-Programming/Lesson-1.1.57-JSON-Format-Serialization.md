# Lesson 1.1.57: JSON Format & Serialization

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.52 (File I/O Basics), Lesson 1.1.39 (Lists), Lesson 1.1.43 (Dictionaries)

---

## Learning Objectives

By the end of this lesson, you will:

1. Understand JSON format and structure
2. Convert Python objects to JSON
3. Parse JSON into Python objects
4. Handle complex data types in JSON
5. Work with JSON files from web APIs
6. Pretty-print and format JSON
7. Handle large JSON files efficiently
8. Validate and transform JSON data

---

## 1. What is JSON?

JSON (JavaScript Object Notation) is a text format for exchanging structured data.

```json
{
    "name": "Alice",
    "age": 30,
    "email": "alice@example.com",
    "hobbies": ["reading", "gaming", "coding"],
    "address": {
        "street": "123 Main St",
        "city": "New York"
    },
    "active": true,
    "balance": null
}
```

**Why JSON?**
- Human-readable and machine-parseable
- Supports complex structures (nested objects, arrays)
- Language-independent standard
- Native in web APIs and modern systems

---

## 2. JSON Data Types

| JSON Type | Python Type | Example |
|-----------|------------|---------|
| string | str | `"hello"` |
| number | int, float | `42`, `3.14` |
| boolean | bool | `true`, `false` |
| null | None | `null` |
| array | list | `[1, 2, 3]` |
| object | dict | `{"key": "value"}` |

---

## 3. Converting Python to JSON

### Dumps: Object to String

```python
import json

data = {
    "name": "Alice",
    "age": 30,
    "hobbies": ["reading", "gaming"]
}

# Convert to JSON string
json_string = json.dumps(data)
print(json_string)
# {"name": "Alice", "age": 30, "hobbies": ["reading", "gaming"]}
```

### Custom Serialization

```python
import json
from datetime import datetime

data = {
    "name": "Alice",
    "joined": datetime.now()
}

# ❌ ERROR: datetime not JSON serializable
# json.dumps(data)

# ✅ Solution 1: Convert before serializing
data["joined"] = str(datetime.now())
json_string = json.dumps(data)

# ✅ Solution 2: Custom encoder
class DateTimeEncoder(json.JSONEncoder):
    def default(self, obj):
        if isinstance(obj, datetime):
            return obj.isoformat()
        return super().default(obj)

json_string = json.dumps(data, cls=DateTimeEncoder)
```

---

## 4. Converting JSON to Python

### Loads: String to Object

```python
import json

json_string = '{"name": "Alice", "age": 30}'
data = json.loads(json_string)

print(type(data))  # <class 'dict'>
print(data["name"])  # "Alice"
```

---

## 5. File Operations: dump() and load()

### Write JSON to File

```python
import json

data = {
    "users": [
        {"id": 1, "name": "Alice", "active": True},
        {"id": 2, "name": "Bob", "active": False}
    ]
}

# Write to file
with open("users.json", "w") as f:
    json.dump(data, f)
```

### Read JSON from File

```python
import json

with open("users.json", "r") as f:
    data = json.load(f)

print(data["users"][0]["name"])  # "Alice"
```

---

## 6. Formatting Options

### Pretty Printing

```python
import json

data = {"name": "Alice", "age": 30, "hobbies": ["reading", "gaming"]}

# Default: compact
compact = json.dumps(data)
# {"name": "Alice", "age": 30, "hobbies": ["reading", "gaming"]}

# Pretty with indentation
pretty = json.dumps(data, indent=2)
print(pretty)
# {
#   "name": "Alice",
#   "age": 30,
#   "hobbies": [
#     "reading",
#     "gaming"
#   ]
# }

# Smart indentation
pretty = json.dumps(data, indent=4)
```

### Sorting Keys

```python
import json

data = {"zebra": 1, "apple": 2, "banana": 3}

# Sorted keys
sorted_json = json.dumps(data, sort_keys=True)
# {"apple": 2, "banana": 3, "zebra": 1}
```

---

## 7. Handling Special Cases

### None and Missing Values

```python
import json

data = {
    "name": "Alice",
    "middle_name": None,
    "email": None
}

# JSON null represents Python None
json_string = json.dumps(data)
print(json_string)
# {"name": "Alice", "middle_name": null, "email": null}

# Parse back
parsed = json.loads(json_string)
print(parsed["middle_name"] is None)  # True
```

### Handling Missing Keys

```python
import json

json_data = '{"name": "Alice"}'
data = json.loads(json_data)

# Safe access
name = data.get("name")  # "Alice"
age = data.get("age")    # None
age = data.get("age", 0) # 0 (default)
```

---

## 8. Error Handling

### Invalid JSON

```python
import json

bad_json = "{'name': 'Alice'}"  # Single quotes, not double

try:
    data = json.loads(bad_json)
except json.JSONDecodeError as e:
    print(f"Invalid JSON: {e}")
```

### Validation Before Processing

```python
import json

def safe_load_json(filename):
    """Load JSON with error handling"""
    try:
        with open(filename, "r") as f:
            return json.load(f)
    except FileNotFoundError:
        print(f"File {filename} not found")
        return None
    except json.JSONDecodeError:
        print(f"Invalid JSON in {filename}")
        return None

data = safe_load_json("config.json")
```

---

## 9. Working with APIs

### Fetch and Parse JSON

```python
import json

# Simulating API response (in practice, use requests library)
api_response = '''
{
    "status": "success",
    "data": [
        {"id": 1, "title": "Post 1"},
        {"id": 2, "title": "Post 2"}
    ]
}
'''

response = json.loads(api_response)

if response["status"] == "success":
    for post in response["data"]:
        print(f"Post {post['id']}: {post['title']}")
```

---

## 10. Mini-Project: Config File Manager

Create a program to manage JSON configuration files:

```python
import json
import os

class ConfigManager:
    def __init__(self, filename):
        self.filename = filename
        self.data = self.load()
    
    def load(self):
        """Load config from file"""
        if os.path.exists(self.filename):
            with open(self.filename, "r") as f:
                return json.load(f)
        return {}
    
    def save(self):
        """Save config to file"""
        with open(self.filename, "w") as f:
            json.dump(self.data, f, indent=2)
    
    def get(self, key, default=None):
        """Get config value"""
        return self.data.get(key, default)
    
    def set(self, key, value):
        """Set config value"""
        self.data[key] = value
        self.save()

# Usage
config = ConfigManager("config.json")
config.set("debug", True)
config.set("api_key", "secret123")
config.set("timeout", 30)

print(config.get("debug"))  # True
```

**Extension**: Add nested key support (`get("database.host")`)

---

## 11. Graded Exercises

### Starter Level

**Exercise 1**: JSON Basics

```python
# 1. Create a Python dict
# 2. Convert to JSON string
# 3. Pretty-print it
# 4. Parse it back
```

**Exercise 2**: File Operations

```python
# 1. Create a data structure
# 2. Write to JSON file
# 3. Read back and verify
```

### Intermediate Level

**Exercise 3**: Data Transformation

```python
# 1. Read JSON file
# 2. Transform data (e.g., rename keys)
# 3. Write to new JSON file
```

**Exercise 4**: Validation

```python
# Create a function to validate JSON:
'''
def validate_json(filename, required_keys):
    # Check if JSON is valid
    # Check if all required keys exist
    # Return validation result
    ...
'''
```

### Advanced Level

**Exercise 5**: Merging JSONs

```python
# Create a function that:
# - Reads multiple JSON files
# - Merges them intelligently
# - Writes combined result
# - Handles key conflicts
```

**Exercise 6**: JSON Schema Validator

```python
# Validate JSON against schema:
# - Define expected structure
# - Validate real data
# - Report mismatches
```

---

## 11. Self-Assessment Checklist

- [ ] I understand JSON format and data types
- [ ] I can convert Python objects to JSON with `dumps()`
- [ ] I can parse JSON to Python objects with `loads()`
- [ ] I can read/write JSON files with `load()` and `dump()`
- [ ] I can pretty-print JSON for readability
- [ ] I understand how None maps to null
- [ ] I can handle JSON serialization errors
- [ ] I can validate and process JSON data
- [ ] I can work with nested JSON structures
- [ ] I can handle missing keys safely

---

## 12. Additional Resources

- [json module documentation](https://docs.python.org/3/library/json.html)
- [JSON specification](https://www.json.org/)
- Real Python: [Working with JSON](https://realpython.com/python-json/)
- [JSON Schema Validator](https://json-schema.org/)

---

**Next Lesson**: [1.1.58 - CSV Files & csv Module](Lesson-1.1.58-CSV-Files-csv-Module.md)  
**Previous Lesson**: [1.1.56 - Reading & Writing Binary Files](Lesson-1.1.56-Reading-Writing-Binary-Files.md)




