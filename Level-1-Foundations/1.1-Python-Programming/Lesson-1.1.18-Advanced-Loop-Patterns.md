# Lesson 1.1.18: Advanced Loop Patterns

**Estimated Time**: 8 hours | **Difficulty**: Intermediate-Advanced  
**Prerequisites**: Lesson 1.1.17 (Nested Loops & Patterns) | **Topic**: Loops - Specialized Techniques

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Apply advanced loop patterns (cross-product, transpose, merge)
- Work with parallel iteration
- Optimize complex loops
- Handle edge cases in loop operations
- Apply loops to real-world problems

---

## 1. Advanced Loop Patterns (90 min)

### 1.1 Cartesian Product (All Combinations)

```python
# Generate all combinations of two sequences
colors = ["red", "blue"]
sizes = ["S", "M", "L"]

print("=== CARTESIAN PRODUCT ===")
for color in colors:
    for size in sizes:
        print(f"{color:5} - {size}")

# Output:
# red   - S
# red   - M
# red   - L
# blue  - S
# blue  - M
# blue  - L

# Practical: Generate all possible combinations
print("\nChess positions (mini):")
ranks = ["1", "2"]
files = ["a", "b"]

positions = []
for rank in ranks:
    for file in files:
        positions.append(f"{file}{rank}")

print(positions)  # ['a1', 'b1', 'a2', 'b2']
```

### 1.2 Parallel Iteration (Process Multiple Lists)

```python
# Process two lists in parallel
names = ["Alice", "Bob", "Charlie"]
ages = [25, 30, 35]
cities = ["NYC", "LA", "Chicago"]

print("=== PARALLEL ITERATION ===")

# Method 1: Use indices
for i in range(len(names)):
    print(f"{names[i]} is {ages[i]} from {cities[i]}")

# Output:
# Alice is 25 from NYC
# Bob is 30 from LA
# Charlie is 35 from Chicago

# Method 2: zip() - will learn more later
for name, age, city in zip(names, ages, cities):
    print(f"{name} is {age} from {city}")
```

### 1.3 Matrix Transpose

```python
# Flip rows and columns
matrix = [
    [1, 2, 3],
    [4, 5, 6]
]

print("Original:")
for row in matrix:
    print(row)

# Transpose: swap rows and columns
transposed = []
for col in range(len(matrix[0])):  # Number of columns
    new_row = []
    for row in range(len(matrix)):  # Number of rows
        new_row.append(matrix[row][col])
    transposed.append(new_row)

print("\nTransposed:")
for row in transposed:
    print(row)

# Output:
# Transposed:
# [1, 4]
# [2, 5]
# [3, 6]
```

### 1.4 Spiral Pattern

```python
# Create spiral grid
size = 5
spiral = [[0] * size for _ in range(size)]

num = 1
top, bottom, left, right = 0, size - 1, 0, size - 1

while top <= bottom and left <= right:
    # Fill top row
    for col in range(left, right + 1):
        spiral[top][col] = num
        num += 1
    top += 1
    
    # Fill right column
    for row in range(top, bottom + 1):
        spiral[row][right] = num
        num += 1
    right -= 1
    
    # Fill bottom row (reversed)
    if top <= bottom:
        for col in range(right, left - 1, -1):
            spiral[bottom][col] = num
            num += 1
        bottom -= 1
    
    # Fill left column (upward)
    if left <= right:
        for row in range(bottom, top - 1, -1):
            spiral[row][left] = num
            num += 1
        left += 1

print("Spiral:")
for row in spiral:
    print(row)
```

---

## 2. Merging and Combining Data (90 min)

### 2.1 Merge Two Sorted Lists

```python
# Combine two sorted lists maintaining order
list1 = [1, 3, 5]
list2 = [2, 4, 6]

merged = []
i, j = 0, 0

while i < len(list1) and j < len(list2):
    if list1[i] <= list2[j]:
        merged.append(list1[i])
        i += 1
    else:
        merged.append(list2[j])
        j += 1

# Add remaining elements
while i < len(list1):
    merged.append(list1[i])
    i += 1

while j < len(list2):
    merged.append(list2[j])
    j += 1

print(f"Merged: {merged}")  # [1, 2, 3, 4, 5, 6]
```

### 2.2 Combine Lists into Pairs

```python
# Pair up elements from two lists
names = ["Alice", "Bob", "Charlie"]
emails = ["alice@mail.com", "bob@mail.com", "charlie@mail.com"]

pairs = []
for i in range(min(len(names), len(emails))):
    pairs.append((names[i], emails[i]))

print(pairs)
# [('Alice', 'alice@mail.com'), ('Bob', 'bob@mail.com'), ...]

# Print formatted
for name, email in pairs:
    print(f"{name:10} → {email}")
```

### 2.3 Build Lookup Dictionary

```python
# Create dictionary from parallel lists
names = ["Alice", "Bob", "Charlie"]
ages = [25, 30, 35]

# Using loop
person_ages = {}
for i in range(len(names)):
    person_ages[names[i]] = ages[i]

print(person_ages)
# {'Alice': 25, 'Bob': 30, 'Charlie': 35}

print(person_ages["Alice"])  # 25
```

### 2.4 Group Items by Criteria

```python
# Organize items into categories
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9]

evens = []
odds = []

for num in numbers:
    if num % 2 == 0:
        evens.append(num)
    else:
        odds.append(num)

print(f"Even: {evens}")  # [2, 4, 6, 8]
print(f"Odd: {odds}")    # [1, 3, 5, 7, 9]

# Another example: group by ranges
scores = [45, 60, 75, 85, 92, 58, 88]

groups = {
    "Fail": [],
    "Pass": [],
    "Good": [],
    "Excellent": []
}

for score in scores:
    if score < 50:
        groups["Fail"].append(score)
    elif score < 70:
        groups["Pass"].append(score)
    elif score < 90:
        groups["Good"].append(score)
    else:
        groups["Excellent"].append(score)

print(groups)
```

---

## 3. Working with Sequences (60 min)

### 3.1 Finding All Occurrences

```python
# Find ALL positions where value appears
numbers = [1, 5, 3, 5, 2, 5, 4]
target = 5

positions = []
for i in range(len(numbers)):
    if numbers[i] == target:
        positions.append(i)

print(f"{target} appears at positions: {positions}")  # [1, 3, 5]

# Count occurrences
count = 0
for num in numbers:
    if num == target:
        count += 1

print(f"Count: {count}")  # 3
```

### 3.2 Finding Duplicates

```python
# Find duplicate values in list
items = ["a", "b", "c", "b", "d", "a"]

duplicates = []
for item in items:
    # Check if already found
    if item in duplicates:
        continue
    
    # Count occurrences
    count = 0
    for other in items:
        if other == item:
            count += 1
    
    # Add if duplicate
    if count > 1:
        duplicates.append(item)

print(f"Duplicates: {duplicates}")  # ['a', 'b']
```

### 3.3 Finding Unique Elements

```python
# Get list of unique items
items = [1, 2, 2, 3, 1, 4, 2]
unique = []

for item in items:
    if item not in unique:
        unique.append(item)

print(f"Unique: {unique}")  # [1, 2, 3, 4]

# Preserve order but remove duplicates
words = ["cat", "dog", "cat", "bird", "dog"]
unique_words = []

for word in words:
    if word not in unique_words:
        unique_words.append(word)

print(f"Unique words: {unique_words}")  # ['cat', 'dog', 'bird']
```

### 3.4 Creating Frequency Count

```python
# Count how many times each item appears
items = ["a", "b", "a", "c", "b", "a"]

# Method 1: Build frequency dictionary
frequency = {}

for item in items:
    if item in frequency:
        frequency[item] += 1
    else:
        frequency[item] = 1

print(frequency)  # {'a': 3, 'b': 2, 'c': 1}

# Find most frequent
max_count = 0
most_frequent = None

for item, count in frequency.items():
    if count > max_count:
        max_count = count
        most_frequent = item

print(f"Most frequent: {most_frequent} (count: {max_count})")
```

---

## 4. Complex Loop Scenarios (60 min)

### 4.1 Nested Search

```python
# Search in 2D structure
data = [
    {"name": "Alice", "age": 25, "city": "NYC"},
    {"name": "Bob", "age": 30, "city": "LA"},
    {"name": "Charlie", "age": 35, "city": "NYC"}
]

# Find all people from NYC
nyc_people = []
for person in data:
    if person["city"] == "NYC":
        nyc_people.append(person["name"])

print(f"NYC residents: {nyc_people}")  # ['Alice', 'Charlie']

# Find person by name
search_name = "Bob"
found = None

for person in data:
    if person["name"] == search_name:
        found = person
        break

if found:
    print(f"Found: {found}")
```

### 4.2 Iterating with Conditions

```python
# Skip items or process conditionally
grades = [85, 45, 92, 38, 88, 76]
passing = []

for grade in grades:
    if grade < 50:
        continue  # Skip failing grades
    passing.append(grade)

print(f"Passing grades: {passing}")  # [85, 92, 88, 76]

# Process with multiple conditions
items = [5, 15, 3, 25, 8, 35]
result = []

for item in items:
    if item < 10:
        result.append(item * 2)  # Double small items
    elif item < 30:
        result.append(item)  # Keep medium items
    else:
        result.append(item // 2)  # Halve large items

print(result)  # [10, 15, 6, 25, 16, 17]
```

### 4.3 Stateful Loops

```python
# Maintain state across iterations
numbers = [1, 2, 3, 4, 5]
running_total = 0
running_product = 1

print("Number | Total | Product")
print("-" * 25)

for num in numbers:
    running_total += num
    running_product *= num
    print(f"{num:6} | {running_total:5} | {running_product:7}")

# Output:
# Number | Total | Product
# ------+-------+--------
#      1 |     1 |       1
#      2 |     3 |       2
#      3 |     6 |       6
#      4 |    10 |      24
#      5 |    15 |     120
```

### 4.4 Alternating Operations

```python
# Alternate between operations
values = []
sign = 1  # Alternates between 1 and -1

for i in range(1, 6):
    values.append(i * sign)
    sign *= -1  # Flip sign

print(values)  # [1, -2, 3, -4, 5]

# Alternating action
actions = []

for i in range(6):
    if i % 2 == 0:
        actions.append(f"Action A: {i}")
    else:
        actions.append(f"Action B: {i}")

for action in actions:
    print(action)
```

---

## 5. Real-World Applications (60 min)

### 5.1 Data Processing

```python
# Process customer transactions
transactions = [
    {"date": "2024-01-15", "amount": 150, "type": "purchase"},
    {"date": "2024-01-16", "amount": 50, "type": "refund"},
    {"date": "2024-01-17", "amount": 200, "type": "purchase"},
]

total_purchases = 0
total_refunds = 0

for transaction in transactions:
    if transaction["type"] == "purchase":
        total_purchases += transaction["amount"]
    elif transaction["type"] == "refund":
        total_refunds += transaction["amount"]

print(f"Purchases: ${total_purchases}")  # $350
print(f"Refunds: ${total_refunds}")      # $50
print(f"Net: ${total_purchases - total_refunds}")  # $300
```

### 5.2 Text Processing

```python
# Count word frequency in text
text = "the quick brown fox jumps over the lazy dog"
words = text.split()

word_count = {}

for word in words:
    if word in word_count:
        word_count[word] += 1
    else:
        word_count[word] = 1

# Find most common word
max_count = 0
most_common = None

for word, count in word_count.items():
    if count > max_count:
        max_count = count
        most_common = word

print(f"Most common word: '{most_common}' appears {max_count} time(s)")
```

### 5.3 Inventory Management

```python
# Manage inventory counts
inventory = {
    "widget": 15,
    "gadget": 8,
    "doohickey": 3
}

# Process sales
sales = [
    ("widget", 2),
    ("gadget", 1),
    ("widget", 3),
    ("doohickey", 1)
]

for item, quantity in sales:
    if item in inventory:
        inventory[item] -= quantity
        if inventory[item] < 0:
            inventory[item] = 0

print("Updated inventory:")
for item, count in inventory.items():
    status = "LOW" if count < 5 else "OK"
    print(f"{item:12} → {count:3} [{status}]")
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.18.1**: Cartesian Product
```python
options_a = ["X", "Y"]
options_b = [1, 2]

for a in options_a:
    for b in options_b:
        print(f"{a}{b}", end=" ")

# What prints?
```

**Exercise 1.1.18.2**: Find Duplicates
```python
items = [1, 2, 2, 3]
duplicates = []

for item in items:
    if item not in duplicates and items.count(item) > 1:
        duplicates.append(item)

# What is in duplicates?
```

**Exercise 1.1.18.3**: Merge Lists
```python
list1 = [1, 3]
list2 = [2, 4]
merged = []

# How would you merge them using loops?
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.18.4**: Group by Type
```python
items = [1, 'a', 2, 'b', 3, 'c']
numbers = []
letters = []

for item in items:
    if isinstance(item, int):
        numbers.append(item)
    else:
        letters.append(item)

print(f"Numbers: {numbers}, Letters: {letters}")
```

**Exercise 1.1.18.5**: Parallel Processing
```python
names = ["Alice", "Bob"]
scores = [92, 85]

for i in range(??):
    print(f"{names[i]}: {scores[i]}")
```

**Exercise 1.1.18.6**: Create Pairs
```python
list1 = ['a', 'b', 'c']
list2 = [1, 2, 3]
pairs = []

for i in range(len(list1)):
    pairs.append((list1[i], list2[i]))

print(pairs)
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.18.7**: Frequency Count
```python
text = "mississippi"
frequency = {}

for char in text:
    if char in frequency:
        frequency[char] += 1
    else:
        frequency[char] = 1

print(frequency)
```

**Exercise 1.1.18.8**: Find Unique
```python
values = [1, 2, 3, 2, 1, 4]
unique = []

for value in values:
    if value not in unique:
        unique.append(value)

print(f"Unique: {unique}")
```

**Exercise 1.1.18.9**: Complex Merge
```python
# Merge while removing duplicates
list1 = [1, 2, 3]
list2 = [2, 3, 4]
merged = []

for item in list1 + list2:
    if item not in merged:
        merged.append(item)

print(merged)
```

---

## Mini-Project: Student Grade Analysis System

Comprehensive grade analysis using advanced loops.

```python
print("="*60)
print("STUDENT GRADE ANALYSIS SYSTEM")
print("="*60)

# Student data
students_data = [
    {"name": "Alice", "grades": [92, 88, 95]},
    {"name": "Bob", "grades": [78, 85, 82]},
    {"name": "Charlie", "grades": [95, 92, 88]},
    {"name": "Diana", "grades": [88, 90, 94]}
]

# Calculate statistics
print("\n=== INDIVIDUAL AVERAGES ===")

all_grades = []
averages = {}

for student in students_data:
    name = student["name"]
    grades = student["grades"]
    
    average = sum(grades) / len(grades)
    averages[name] = average
    all_grades.extend(grades)
    
    print(f"{name:10}: {average:.1f}")

# Class statistics
print("\n=== CLASS STATISTICS ===")

class_avg = sum(all_grades) / len(all_grades)
highest_avg = max(averages.values())
lowest_avg = min(averages.values())

print(f"Class Average: {class_avg:.1f}")
print(f"Highest: {highest_avg:.1f}")
print(f"Lowest: {lowest_avg:.1f}")

# Grade distribution
print("\n=== GRADE DISTRIBUTION ===")

grade_counts = {}

for grade in all_grades:
    if grade >= 90:
        category = "A (90+)"
    elif grade >= 80:
        category = "B (80-89)"
    else:
        category = "C (Below 80)"
    
    if category not in grade_counts:
        grade_counts[category] = 0
    grade_counts[category] += 1

for category, count in sorted(grade_counts.items()):
    percentage = (count / len(all_grades)) * 100
    print(f"{category:15} → {count:2} grades ({percentage:5.1f}%)")

print("\n✓ Analysis complete!")
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **Cartesian product multiplies sequence sizes.**
   - Answer: True (all combinations)

2. **Parallel iteration requires lists of same length.**
   - Answer: False (can handle different lengths with zip or max)

3. **Transpose converts rows to columns and vice versa.**
   - Answer: True

4. **Finding duplicates requires checking each item multiple times.**
   - Answer: True (count or nested check)

---

### Conceptual Questions

5. **What does merging sorted lists preserve?**
   - Expected: Order (ascending or descending)

6. **Why group items by criteria?**
   - Expected: Organize data, simplify analysis, categorize results

7. **What's advantage of maintaining frequency count?**
   - Expected: Quick lookup of item frequency, find patterns

---

### Coding Challenge

8. **Create temperature record analysis:**
   - 3 cities, each with 5 temperature readings
   - Find highest and lowest for each city
   - Find overall average

   ```python
   cities = {
       "NYC": [42, 45, 48, 50, 46],
       "LA": [65, 68, 70, 72, 70],
       "Chicago": [35, 38, 40, 42, 39]
   }
   
   all_temps = []
   
   for city, temps in cities.items():
       highest = max(temps)
       lowest = min(temps)
       avg = sum(temps) / len(temps)
       all_temps.extend(temps)
       
       print(f"{city:10} → High: {highest}°, Low: {lowest}°, Avg: {avg:.1f}°")
   
   overall_avg = sum(all_temps) / len(all_temps)
   print(f"\nOverall Average: {overall_avg:.1f}°")
   ```

---

## Key Takeaways

✅ **Cartesian product: nested loops for all combinations** - Generate options  
✅ **Parallel iteration: process multiple sequences together** - Coordinated data  
✅ **Merging: combine sorted lists maintaining order** - Efficient combination  
✅ **Frequency count: track item occurrences** - Pattern analysis  
✅ **Real-world: apply patterns to actual problems** - Data processing

---

## Additional Resources

- [Python Loop Patterns](https://realpython.com/loops-in-python/)
- [Working with Collections](https://docs.python.org/3/tutorial/datastructures.html)
- [Algorithm Examples](https://www.geeksforgeeks.org/python-loops/)

---

## Next Lesson Preview

**Lesson 1.1.19**: Loop Debugging & Optimization
- Debugging infinite loops
- Profiling loop performance
- Common loop mistakes

---

## Homework

- [ ] Complete Exercises 1.1.18.1 - 1.1.18.9
- [ ] Build and test the Grade Analysis System
- [ ] Add filtering by grade range
- [ ] Challenge: Add ranking system
- [ ] Quiz: Answer all assessment questions

**Expected time**: 3-4 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.19** when you're ready.




