# Lesson 1.1.56: Reading & Writing Binary Files

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.52 (File I/O Basics)

---

## Learning Objectives

By the end of this lesson, you will:

1. Understand binary file formats and byte-level operations
2. Read and write binary data without text encoding
3. Work with `bytes` and `bytearray` objects
4. Create and manipulate serialized Python objects
5. Work with common binary formats (images, archives)
6. Understand endianness and byte ordering
7. Handle binary file structures programmatically
8. Work with binary protocols and data interchange

---

## 1. Binary vs. Text Files

### Text Files

```python
with open("data.txt", "r") as f:  # 'r' = text mode
    content = f.read()  # Returns str
    # Python automatically decodes bytes to Unicode
```

### Binary Files

```python
with open("data.bin", "rb") as f:  # 'rb' = binary mode
    content = f.read()  # Returns bytes
    # No automatic decoding - raw bytes only
```

**Key difference**: Text mode applies encoding/decoding; binary mode doesn't.

---

## 2. Understanding Bytes

### Creating Bytes

```python
# From string
text = "Hello"
b = text.encode("utf-8")  # b'Hello'

# Direct bytes literal
b = b"Hello"

# From list of integers
b = bytes([72, 101, 108, 108, 111])  # b'Hello'

# Zero bytes
b = bytes(10)  # b'\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00'
```

### Bytes to String

```python
# Decode bytes to string
b = b"Hello"
text = b.decode("utf-8")  # "Hello"
```

---

## 3. Bytearray: Mutable Bytes

```python
# bytes are immutable
b = b"Hello"
# b[0] = 72  # TypeError

# bytearray is mutable
ba = bytearray(b"Hello")
ba[0] = 72  # Works
print(ba)  # bytearray(b'Hello')

# Convert back to bytes
b = bytes(ba)
```

---

## 4. Reading Binary Files

### Reading All Bytes

```python
with open("image.jpg", "rb") as f:
    all_bytes = f.read()  # Returns all bytes
    print(type(all_bytes))  # <class 'bytes'>
    print(len(all_bytes))  # File size in bytes
```

### Reading Chunks

```python
def read_binary_file_chunked(filename, chunk_size=8192):
    """Read large binary file in chunks"""
    with open(filename, "rb") as f:
        while True:
            chunk = f.read(chunk_size)
            if not chunk:
                break
            process_chunk(chunk)

def process_chunk(chunk):
    print(f"Processing {len(chunk)} bytes")
```

### Reading Exact Number of Bytes

```python
with open("data.bin", "rb") as f:
    # Read file header (first 16 bytes)
    header = f.read(16)
    
    # Read exactly 256 bytes
    data_block = f.read(256)
```

---

## 5. Writing Binary Files

### Basic Binary Write

```python
data = b"Binary data"

with open("output.bin", "wb") as f:
    f.write(data)
```

### Writing Byte Values

```python
with open("data.bin", "wb") as f:
    # Write specific byte values
    f.write(bytes([0x48, 0x65, 0x6C, 0x6C, 0x6F]))  # "Hello"
    
    # Write zeros
    f.write(b"\x00" * 100)
```

### Append Binary Data

```python
with open("data.bin", "ab") as f:  # 'ab' = append binary
    f.write(b"More data")
```

---

## 6. Binary File Structures

### Understanding Hex Dumps

```python
def hex_dump(data, width=16):
    """Display binary data in hex format"""
    for i in range(0, len(data), width):
        chunk = data[i:i+width]
        hex_part = " ".join(f"{b:02x}" for b in chunk)
        ascii_part = "".join(chr(b) if 32 <= b < 127 else "." for b in chunk)
        print(f"{i:08x}: {hex_part:<{width*3}} {ascii_part}")

# Read binary file and display
with open("image.jpg", "rb") as f:
    data = f.read(256)
    hex_dump(data)
```

### Parsing Fixed-Size Records

```python
import struct

def read_records(filename, record_size=16):
    """Read fixed-size binary records"""
    records = []
    
    with open(filename, "rb") as f:
        while True:
            record = f.read(record_size)
            if not record:
                break
            records.append(record)
    
    return records
```

---

## 7. The `struct` Module: Binary Packing

### Pack Data

```python
import struct

# Pack multiple values into bytes
# Format: 'I' = unsigned int, 'f' = float, 's' = char array
data = struct.pack("If", 42, 3.14)  # Returns bytes

print(data)  # b'*\x00\x00\x00\xc3\xf5HA@' (or similar)
```

### Unpack Data

```python
import struct

binary_data = struct.pack("If", 42, 3.14)
number, decimal = struct.unpack("If", binary_data)

print(number, decimal)  # 42 3.14
```

**Common format codes:**
- `b`, `B`: signed/unsigned char
- `h`, `H`: signed/unsigned short
- `i`, `I`: signed/unsigned int
- `f`: float
- `d`: double
- `s`: char array
- `@`, `<`, `>`, `=`: byte order (native, little-endian, big-endian, standard)

---

## 8. Pickle: Serializing Python Objects

### Serialize Objects

```python
import pickle

data = {
    "name": "Alice",
    "age": 30,
    "scores": [85, 90, 92]
}

# Serialize to bytes
serialized = pickle.dumps(data)
print(type(serialized))  # <class 'bytes'>

# Write to file
with open("data.pkl", "wb") as f:
    f.write(serialized)
```

### Deserialize Objects

```python
import pickle

# Read from file
with open("data.pkl", "rb") as f:
    serialized = f.read()

# Deserialize back to Python object
data = pickle.loads(serialized)
print(data)  # {'name': 'Alice', 'age': 30, 'scores': [85, 90, 92]}
```

### Direct File I/O

```python
import pickle

data = {"key": "value"}

# Write directly to file
with open("data.pkl", "wb") as f:
    pickle.dump(data, f)

# Read directly from file
with open("data.pkl", "rb") as f:
    data = pickle.load(f)
```

**⚠️ WARNING**: Only unpickle data from trusted sources (security risk)

---

## 9. Mini-Project: Image Header Reader

Create a program that reads image file headers:

```python
def read_jpg_header(filename):
    """Read JPEG file header"""
    with open(filename, "rb") as f:
        # JPEG starts with FFD8
        marker = f.read(2)
        if marker != b'\xff\xd8':
            return None
        
        # Read JFIF/Exif segment
        segment_marker = f.read(2)
        length = int.from_bytes(f.read(2), byteorder='big')
        segment_data = f.read(length - 2)
        
        return {
            "file": filename,
            "marker": marker.hex(),
            "segment_marker": segment_marker.hex(),
            "length": length
        }

def read_png_header(filename):
    """Read PNG file header"""
    with open(filename, "rb") as f:
        # PNG starts with specific 8-byte signature
        signature = f.read(8)
        if signature != b'\x89PNG\r\n\x1a\n':
            return None
        
        # Read first chunk (IHDR)
        chunk_length = int.from_bytes(f.read(4), byteorder='big')
        chunk_type = f.read(4)
        
        return {
            "file": filename,
            "signature": signature.hex(),
            "chunk_type": chunk_type.decode('ascii'),
            "chunk_length": chunk_length
        }

jpg_info = read_jpg_header("photo.jpg")
png_info = read_png_header("image.png")
print(jpg_info, png_info)
```

**Extension**: Add width/height extraction

---

## 10. Graded Exercises

### Starter Level

**Exercise 1**: Byte Manipulation

```python
# 1. Create bytes from string
# 2. Display as hex
# 3. Convert back to string
```

**Exercise 2**: File Copy

```python
# Copy a binary file:
'''
def copy_binary_file(source, destination):
    # Read source in chunks
    # Write to destination
    # Handle large files efficiently
    ...
'''
```

### Intermediate Level

**Exercise 3**: Simple Serialization

```python
# Create a function:
'''
def save_data(obj, filename):
    # Serialize and write to file
    ...

def load_data(filename):
    # Read and deserialize
    ...
'''
```

**Exercise 4**: Byte Structure Parser

```python
# Parse a binary file with structure:
# - 4-byte header
# - 2-byte version
# - Variable-length data
# Extract and display each part
```

### Advanced Level

**Exercise 5**: Custom Binary Format

```python
# Create custom serialization format:
# - Define format specification
# - Write objects to binary
# - Read and reconstruct
```

**Exercise 6**: ZIP File Analysis

```python
# Read ZIP file headers without library:
# - Find central directory
# - List file entries
# - Extract metadata
```

---

## 11. Self-Assessment Checklist

- [ ] I understand the difference between binary and text modes
- [ ] I can create and manipulate `bytes` objects
- [ ] I can read binary files in chunks
- [ ] I can write binary data correctly
- [ ] I understand hex dump representation
- [ ] I can use `struct` module for binary packing/unpacking
- [ ] I understand byte ordering (endianness)
- [ ] I can pickle and unpickle Python objects
- [ ] I can parse simple binary file formats
- [ ] I can copy binary files without corruption

---

## 12. Additional Resources

- [struct module documentation](https://docs.python.org/3/library/struct.html)
- [pickle module documentation](https://docs.python.org/3/library/pickle.html)
- [bytes and bytearray](https://docs.python.org/3/library/stdtypes.html#binary-sequence-types)
- Real Python: [Working with Binary Files](https://realpython.com/python-binary-io/)

---

**Next Lesson**: [1.1.57 - JSON Format & Serialization](Lesson-1.1.57-JSON-Format-Serialization.md)  
**Previous Lesson**: [1.1.55 - Working with Text Files](Lesson-1.1.55-Working-with-Text-Files.md)




