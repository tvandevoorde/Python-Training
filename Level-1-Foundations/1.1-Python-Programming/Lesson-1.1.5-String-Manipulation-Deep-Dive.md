# Lesson 1.1.5: String Manipulation Deep Dive

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.1.1 - 1.1.4 | **Topic**: Variables, Types, Operators

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Index and slice strings
- Use common string methods
- Manipulate text data effectively
- Understand string immutability
- Build programs that process text

---

## 1. String Indexing & Slicing (90 min)

### 1.1 Indexing Individual Characters

```python
text = "Python"
print(text[0])      # "P" (first character)
print(text[1])      # "y"
print(text[2])      # "t"
print(text[-1])     # "n" (last character)
print(text[-2])     # "o" (second to last)

# Index out of range causes error
# print(text[10])   # IndexError!
```

### 1.2 Slicing Ranges

```python
text = "Hello"
print(text[0:2])    # "He" (positions 0,1 - not 2!)
print(text[1:4])    # "ell"
print(text[2:])     # "llo" (from position 2 to end)
print(text[:3])     # "Hel" (from start to position 3)
print(text[::2])    # "Hlo" (every 2nd character)
print(text[::-1])   # "olleH" (reversed!)

# Slicing beyond range is safe
print(text[0:100])  # "Hello" (doesn't error)
```

### 1.3 String Length

```python
text = "Hello"
print(len(text))    # 5

# Empty string
print(len(""))      # 0

# Strings with spaces
print(len("Hello World"))  # 11 (includes space)
```

---

## 2. Common String Methods (120 min)

### 2.1 Case Conversion

```python
text = "Hello World"

print(text.upper())     # "HELLO WORLD"
print(text.lower())     # "hello world"
print(text.title())     # "Hello World" (capitalize each word)
print(text.capitalize())  # "Hello world" (only first char)
print(text.swapcase())  # "hELLO wORLD"

# Real use: Check password contains uppercase
password = "mypassword"
has_upper = any(c.isupper() for c in password)
print(has_upper)  # False
```

### 2.2 Searching and Replacing

```python
text = "The quick brown fox"

# Find position of substring
print(text.find("quick"))    # 4 (position)
print(text.find("slow"))     # -1 (not found)

# Check if contains
print("fox" in text)         # True
print("slow" in text)        # False

# Replace substring
new_text = text.replace("brown", "red")
print(new_text)             # "The quick red fox"

# Replace limited times
text = "aaa"
print(text.replace("a", "b", 2))  # "bba" (only first 2)
```

### 2.3 Trimming and Padding

```python
text = "  Hello  "

print(text.strip())      # "Hello" (remove leading/trailing spaces)
print(text.lstrip())     # "Hello  " (left strip)
print(text.rstrip())     # "  Hello" (right strip)

# Remove specific characters
path = "/home/user/"
print(path.lstrip("/"))  # "home/user/"

# Padding with characters
text = "Python"
print(text.ljust(10))    # "Python    " (left-justified)
print(text.rjust(10))    # "    Python" (right-justified)
print(text.center(10))   # "  Python  " (centered)
print(text.zfill(10))    # "0000Python" (pad with zeros)
```

### 2.4 Splitting and Joining

```python
# Split into list
text = "Hello World Python"
words = text.split()           # ["Hello", "World", "Python"]
print(words[0])               # "Hello"

# Split on specific character
csv = "Alice,Bob,Charlie"
names = csv.split(",")         # ["Alice", "Bob", "Charlie"]

# Join list back to string
items = ["apple", "banana", "cherry"]
result = ", ".join(items)      # "apple, banana, cherry"

# Split only first N
text = "a:b:c:d"
parts = text.split(":", 2)     # ["a", "b", "c:d"]

# Split lines
multiline = "Line1\nLine2\nLine3"
lines = multiline.split("\n")  # ["Line1", "Line2", "Line3"]
```

### 2.5 Checking Properties

```python
text = "Hello123"

print(text.isalpha())        # False (has numbers)
print(text.isdigit())        # False (has letters)
print(text.isalnum())        # True (letters and numbers)
print(text.islower())        # False (has uppercase)
print(text.isupper())        # False (has lowercase)
print(text.isspace())        # False (has content)

# Check if starts/ends with
print(text.startswith("He"))  # True
print(text.endswith("3"))     # True

# Count occurrences
text = "mississippi"
print(text.count("s"))        # 4
```

---

## 3. String Immutability (60 min)

Strings cannot be changed after creation:

```python
text = "Hello"
# text[0] = "B"  # ERROR! Strings are immutable

# Instead, create new string
new_text = "B" + text[1:]
print(new_text)  # "Bello"

# Methods return new strings
text = "hello"
upper = text.upper()  # Creates new string
print(text)           # Still "hello" (original unchanged)
print(upper)          # "HELLO"
```

---

## 4. Practical Text Processing (60 min)

### 4.1 Email Validation

```python
email = "alice@example.com"

# Basic checks
is_valid = "@" in email and "." in email
print(is_valid)  # True

# More thorough
if "@" not in email:
    print("Missing @")
elif email.count("@") > 1:
    print("Multiple @")
elif not email[0].isalpha():
    print("Must start with letter")
else:
    print("Valid email format")
```

### 4.2 Data Parsing

```python
# Parse CSV line
line = "Alice,30,Engineer"
fields = line.split(",")
name = fields[0]
age = int(fields[1])
job = fields[2]

print(f"{name} is {age} and works as {job}")
```

### 4.3 Text Analysis

```python
text = "The quick brown fox jumps"

words = text.split()
print(f"Word count: {len(words)}")  # 5

char_count = len(text.replace(" ", ""))
print(f"Character count: {char_count}")  # 21

# Most common letter
from collections import Counter
letters = [c.lower() for c in text if c.isalpha()]
most_common = Counter(letters).most_common(1)[0]
print(f"Most common: {most_common[0]} ({most_common[1]} times)")
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.5.1**: String indexing
```python
text = "Python"
print(text[0])      # "P"
print(text[-1])     # "n"
print(text[1:4])    # "yth"
```

**Exercise 1.1.5.2**: String methods
```python
text = "  Hello World  "
print(text.strip())     # "Hello World"
print(text.upper())     # "  HELLO WORLD  "
print(text.lower())     # "  hello world  "
```

**Exercise 1.1.5.3**: Finding substrings
```python
text = "Hello World"
print("World" in text)      # True
print(text.find("World"))   # 6
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.5.4**: Parse and extract
```python
csv_line = "John,25,Engineer"
parts = csv_line.split(",")
name = parts[0]
print(f"Name: {name}")
```

**Exercise 1.1.5.5**: String replacement
```python
sentence = "The cat sat on the mat"
new_sentence = sentence.replace("cat", "dog").replace("mat", "floor")
print(new_sentence)  # "The dog sat on the floor"
```

**Exercise 1.1.5.6**: Word count
```python
text = "The quick brown fox jumps over the lazy dog"
words = text.split()
print(f"Word count: {len(words)}")  # 9
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.5.7**: Reverse and check
```python
text = "racecar"
reversed_text = text[::-1]
is_palindrome = text == reversed_text
print(f"'{text}' is palindrome: {is_palindrome}")  # True
```

**Exercise 1.1.5.8**: Email validation
```python
email = input("Email: ")
is_valid = "@" in email and email.count("@") == 1
is_valid = is_valid and "." in email.split("@")[1]
print(f"Valid: {is_valid}")
```

**Exercise 1.1.5.9**: Sentence analyzer
```python
sentence = "Hello World from Python!"
words = sentence.split()
avg_length = sum(len(w) for w in words) / len(words)
print(f"Average word length: {avg_length:.1f}")  # 6.0
```

---

## Mini-Project: Text Cleaner

Create a program that cleans and analyzes text:

```python
# text_cleaner.py

text = input("Enter text: ")

# Clean
cleaned = text.strip().lower()
print(f"Cleaned: {cleaned}")

# Analysis
print(f"Length: {len(cleaned)}")
print(f"Word count: {len(cleaned.split())}")
print(f"Unique letters: {len(set(cleaned.replace(' ', '')))}")

# Find longest word
words = cleaned.split()
longest = max(words, key=len)
print(f"Longest word: {longest} ({len(longest)} chars)")
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **Strings can be modified after creation.**
   - Answer: False (strings are immutable)

2. **`text[::2]` returns every 2nd character.**
   - Answer: True

3. **`"abc".count("c")` returns 1.**
   - Answer: True

4. **Slicing beyond string length causes an error.**
   - Answer: False (returns what's available)

---

### Coding Challenge

5. **Write a program that asks for a name and displays it centered in a box:**

   Solution:
   ```python
   name = input("Name: ")
   width = len(name) + 4
   print("*" * width)
   print(f"* {name} *")
   print("*" * width)
   ```

---

## Key Takeaways

✅ **Indexing**: Access characters by position  
✅ **Slicing**: Extract substrings  
✅ **Immutability**: Strings can't be changed, only new strings created  
✅ **Methods**: `.upper()`, `.lower()`, `.split()`, `.replace()`, etc.  
✅ **In operator**: Check if substring exists in string  

---

## Next Lesson Preview

**Lesson 1.1.6**: Special Numbers & Math
- Working with infinity and NaN
- Math module functions

---

## Homework

1. **Complete all exercises**
2. **Build Mini-Project**
3. **Challenge**: Create a word frequency counter

**Expected time**: 2-3 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.6** when you're ready.




