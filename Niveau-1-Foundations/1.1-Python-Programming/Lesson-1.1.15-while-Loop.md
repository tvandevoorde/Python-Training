# Lesson 1.1.14: `while` Loops - Repetition

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.1.13 (Comparison Operators) | **Topic**: Loops - Conditional Repetition

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Understand the purpose and structure of `while` loops
- Write loops that repeat while a condition is True
- Update loop variables to eventually stop the loop
- Identify and fix infinite loops
- Apply `while` loops to practical problems

---

## 1. Introduction to Loops (60 min)

### 1.1 Why Loops?

```python
# ❌ WITHOUT LOOPS: Repetitive code
name = input("Enter a name: ")
print(f"Hello, {name}!")
name = input("Enter a name: ")
print(f"Hello, {name}!")
name = input("Enter a name: ")
print(f"Hello, {name}!")
# ... repeat forever for each person?

# ✅ WITH LOOPS: Do it once, execute many times
while True:  # Repeat forever
    name = input("Enter a name: ")
    if name == "quit":
        break
    print(f"Hello, {name}!")

# Or collect exactly 3 names
count = 0
while count < 3:
    name = input("Enter a name: ")
    print(f"Hello, {name}!")
    count += 1
```

### 1.2 What is a Loop?

A loop executes a block of code **repeatedly** while a condition is True.

```python
# Structure of a while loop:
# while condition:
#     code block (executes while condition is True)
#     (must update something or loop never ends!)

# Simple example
count = 1
while count <= 5:
    print(f"Count: {count}")
    count += 1  # Update count each time

# Output:
# Count: 1
# Count: 2
# Count: 3
# Count: 4
# Count: 5
```

### 1.3 How While Loops Work - Step by Step

```python
print("=== STEP-BY-STEP EXECUTION ===")

count = 1

print(f"1. Check condition: count <= 3? {count <= 3} ← True, enter loop")
print(f"   Print: {count}")
count += 1

print(f"2. Check condition: count <= 3? {count <= 3} ← True, continue")
print(f"   Print: {count}")
count += 1

print(f"3. Check condition: count <= 3? {count <= 3} ← True, continue")
print(f"   Print: {count}")
count += 1

print(f"4. Check condition: count <= 3? {count <= 3} ← False, exit loop")

# Key: Condition is checked BEFORE each iteration
```

---

## 2. Writing `while` Loops (90 min)

### 2.1 Basic Pattern: Countdown

```python
# Count down from 5 to 1
count = 5

while count > 0:
    print(count)
    count -= 1  # Decrease count

print("Blast off!")

# Output:
# 5
# 4
# 3
# 2
# 1
# Blast off!
```

### 2.2 Accumulation Pattern

```python
# Add up numbers 1 + 2 + 3 + ... + 10
total = 0
number = 1

while number <= 10:
    total += number  # Add current number to total
    number += 1

print(f"Sum 1-10: {total}")  # Output: 55

# Same pattern for other operations:
product = 1
number = 1
while number <= 5:
    product *= number  # Multiply
    number += 1

print(f"5! (factorial): {product}")  # Output: 120
```

### 2.3 User Input Loop

```python
# Keep asking until user enters "quit"
response = ""  # Start with empty string

while response != "quit":
    response = input("Enter something (or 'quit'): ")
    
    if response != "quit":
        print(f"You entered: {response}")

print("Goodbye!")

# Key: Condition prevents one more iteration after "quit"
```

### 2.4 Flag-Based Loop

```python
# Use a boolean flag to control loop
is_playing = True  # Flag

while is_playing:
    move = input("Enter move (rock/paper/scissors) or 'quit': ")
    
    if move == "quit":
        is_playing = False  # Stop loop
    else:
        print(f"You chose: {move}")

print("Game ended")
```

---

## 3. Common Patterns (90 min)

### 3.1 Input Validation Loop

```python
# Keep asking until input is valid
age = -1  # Start with invalid value

while age < 0 or age > 150:
    try:
        age = int(input("Enter age (0-150): "))
        if age < 0 or age > 150:
            print("Please enter a valid age")
    except ValueError:
        print("Please enter a number")

print(f"Valid age: {age}")

# Pattern: Loop until input is valid
```

### 3.2 Attempt Limit Pattern

```python
# Allow user 3 attempts to guess correctly
secret = 42
attempts = 0
max_attempts = 3

while attempts < max_attempts:
    guess = int(input(f"Guess (attempt {attempts + 1}/{max_attempts}): "))
    attempts += 1
    
    if guess == secret:
        print("✓ Correct!")
        break  # Exit early when found
    elif guess < secret:
        print("Too low")
    else:
        print("Too high")

if guess != secret:
    print(f"✗ Out of attempts. Answer was {secret}")
```

### 3.3 Reading Until Sentinel

```python
# Read numbers until user enters -1 (sentinel)
total = 0
count = 0

print("Enter numbers (enter -1 to stop):")
number = int(input("Number: "))

while number != -1:  # -1 is sentinel (stop signal)
    total += number
    count += 1
    number = int(input("Number: "))

if count > 0:
    average = total / count
    print(f"Average: {average:.2f}")
else:
    print("No numbers entered")
```

### 3.4 Running Total / Average

```python
# Calculate running average of test scores
print("=== Grade Tracker ===")
print("Enter test scores (or -1 to finish):")

total_score = 0
test_count = 0

while True:
    score = float(input("Score: "))
    
    if score == -1:  # Exit condition
        break
    
    if 0 <= score <= 100:
        total_score += score
        test_count += 1
        current_average = total_score / test_count
        print(f"  Current average: {current_average:.1f}")
    else:
        print("  Invalid score (0-100), try again")

if test_count > 0:
    final_average = total_score / test_count
    print(f"\nFinal average: {final_average:.1f}")
    
    if final_average >= 90:
        print("Grade: A")
    elif final_average >= 80:
        print("Grade: B")
    elif final_average >= 70:
        print("Grade: C")
    else:
        print("Grade: F")
```

---

## 4. Infinite Loops & Debugging (60 min)

### 4.1 Understanding Infinite Loops

```python
# ❌ INFINITE LOOP - will never stop!
count = 1
while count <= 5:
    print(count)
    # Oops! Forgot to increment count
    # count += 1

# ❌ INFINITE LOOP - condition always True
while True:
    name = input("Enter name: ")
    # Forgot to check for exit condition

# ✅ CORRECT - eventually stops
count = 1
while count <= 5:
    print(count)
    count += 1  # Increment to eventually reach 6
```

### 4.2 Debugging Infinite Loop

```python
# If loop seems infinite, check:

# 1. Is the loop variable being updated?
count = 0
while count < 5:
    print(count)
    # count += 1  # ← Forgot this!

# 2. Is condition reachable?
score = 5
while score > 10:  # score is 5, never > 10
    print(score)
    score += 1

# 3. Add debug prints
x = 0
while x < 5:
    print(f"DEBUG: x = {x}")  # Can see if updating
    x += 1
```

### 4.3 Breaking Infinite Loops

```python
# If you encounter infinite loop:
# Use Ctrl+C to interrupt

while True:
    user_input = input("Enter something: ")
    print(f"You said: {user_input}")
    
    if user_input.lower() == "exit":
        print("Goodbye!")
        break  # Exit loop

# Or force quit with Ctrl+C in most environments
```

---

## 5. Nested Loops - Loops Within Loops (60 min)

### 5.1 Simple Nested Loop

```python
# Outer loop runs 3 times
# Inner loop runs 3 times for each outer
# Total: 3 × 3 = 9 prints

row = 1
while row <= 3:
    col = 1
    while col <= 3:
        print(f"({row},{col})", end=" ")
        col += 1
    print()  # New line after each row
    row += 1

# Output:
# (1,1) (1,2) (1,3)
# (2,1) (2,2) (2,3)
# (3,1) (3,2) (3,3)
```

### 5.2 Multiplication Table

```python
# Print 3×3 multiplication table
print("Multiplication Table (1-3):")
row = 1
while row <= 3:
    col = 1
    while col <= 3:
        result = row * col
        print(f"{result:3}", end=" ")  # Right-aligned in 3 spaces
        col += 1
    print()  # New line
    row += 1

# Output:
#   1   2   3 
#   2   4   6 
#   3   6   9
```

---

## Exercises

### Difficulty 1: Starter 🟩

**Exercise 1.1.14.1**: Simple Counter
```python
count = 1
while count <= 3:
    print(count)
    count += 1

# What does this print?
```

**Exercise 1.1.14.2**: Counting Down
```python
count = 3
while count > 0:
    print(count)
    count -= 1

# What does this print?
```

**Exercise 1.1.14.3**: Sum Numbers
```python
total = 0
num = 1
while num <= 5:
    total += num
    num += 1

print(total)  # What prints?
```

---

### Difficulty 2: Intermediate 🟨

**Exercise 1.1.14.4**: Input Validation
```python
# Keep asking for age until valid (0-120)
age = -1
while ???:
    age = int(input("Age: "))

print(f"Age: {age}")
```

**Exercise 1.1.14.5**: Multiplication Table
```python
# Print 2×4 multiplication table
row = 1
while row <= 2:
    col = 1
    while col <= 4:
        print(f"{row * col:3}", end=" ")
        col += 1
    print()
    row += 1
```

**Exercise 1.1.14.6**: Quit Loop
```python
while True:
    command = input("Enter command (or 'quit'): ")
    
    if ???:  # Fill in condition to exit
        break
    
    print(f"You said: {command}")
```

---

### Difficulty 3: Advanced 🟥

**Exercise 1.1.14.7**: Game Turns
```python
# Turn-based game: 5 rounds
round_num = 1
player_score = 0

while round_num <= 5:
    print(f"\nRound {round_num}")
    move = input("Your move: ")
    
    if move == "attack":
        player_score += 10
    elif move == "defend":
        pass  # No points
    
    print(f"Score: {player_score}")
    round_num += 1

print(f"\nFinal score: {player_score}")
```

**Exercise 1.1.14.8**: User Menu Loop
```python
# Menu-driven program  
playing = True

while playing:
    print("\n1. Play")
    print("2. Rules")
    print("3. Quit")
    
    choice = input("Choose: ")
    
    if choice == "1":
        print("Starting game...")
    elif choice == "2":
        print("Rules...")
    elif choice == "3":
        playing = False
    else:
        print("Invalid choice")
```

**Exercise 1.1.14.9**: Processing List Items
```python
# Process numbers entered by user
numbers = []
print("Enter numbers (enter 'done' to finish):")

while True:
    user_input = input("Number: ")
    
    if user_input.lower() == "done":
        break
    
    try:
        num = float(user_input)
        numbers.append(num)
    except ValueError:
        print("Invalid number")

print(f"You entered: {numbers}")
print(f"Sum: {sum(numbers)}")
print(f"Average: {sum(numbers)/len(numbers) if numbers else 0}")
```

---

## Mini-Project: Simple Number Guessing Game

Build a game where user guesses a secret number.

```python
import random

print("="*40)
print("NUMBER GUESSING GAME")
print("="*40)

# Set difficulty
difficulty = input("Difficulty (easy/medium/hard)? ").lower()

if difficulty == "hard":
    max_num = 1000
    max_tries = 5
elif difficulty == "medium":
    max_num = 100
    max_tries = 7
else:  # easy
    max_num = 50
    max_tries = 10

# Generate random number
secret = random.randint(1, max_num)

print(f"\nGuess a number 1-{max_num}")
print(f"You have {max_tries} attempts\n")

guesses = []
tries = 0
found = False

while tries < max_tries and not found:
    try:
        guess = int(input(f"Attempt {tries + 1}/{max_tries}: "))
        guesses.append(guess)
        tries += 1
        
        if guess == secret:
            found = True
            print(f"\n✓ CORRECT! Found it in {tries} attempts!")
        elif guess < secret:
            print(f"  Too low. Range: {guess}-{max_num}")
        else:  # guess > secret
            print(f"  Too high. Range: 1-{guess}")
    
    except ValueError:
        print("  Please enter a valid number")

if not found:
    print(f"\n✗ Out of attempts! Answer was {secret}")
    print(f"Guesses: {guesses}")

print("\n" + "="*40)
print("Thanks for playing!")
```

---

## Quiz & Assessment

### Quick Check (True/False)

1. **A `while` loop continues repeating while the condition is True.**
   - Answer: True

2. **You must update the loop variable or the loop might never end.**
   - Answer: True

3. **After a loop ends, the loop variable no longer exists.**
   - Answer: False (variable still exists with final value)

4. **`while True:` with a `break` statement is a valid loop pattern.**
   - Answer: True

---

### Conceptual Questions

5. **What's the difference between a `while` loop and an `if` statement?**
   - Expected: `if` runs code once if condition is true; `while` repeats while condition is true

6. **Why is it important to update the loop variable?**
   - Expected: To eventually make condition false and exit loop; otherwise infinite loop

7. **Give an example of when you'd use `while True:` with `break`.**
   - Expected: Menu loops, sentinel-based input, until user exits, etc.

---

### Coding Challenge

8. **Create a password attempt program:**
   - Allows user 3 attempts to enter correct password
   - Shows remaining attempts
   - Exits early if correct password entered

   ```python
   correct_password = "admin123"
   attempts = 0
   max_attempts = 3
   password_correct = False
   
   while attempts < max_attempts and not password_correct:
       password = input(f"Enter password (attempt {attempts + 1}/{max_attempts}): ")
       attempts += 1
       
       if password == correct_password:
           password_correct = True
           print("✓ Access granted!")
       else:
           remaining = max_attempts - attempts
           if remaining > 0:
               print(f"✗ Wrong password. {remaining} attempts left")
           else:
               print("✗ Account locked - too many attempts")
   ```

---

## Key Takeaways

✅ **`while` loops repeat code while a condition is True** - Condition checked before each iteration  
✅ **Must update loop variable** - Otherwise infinite loop  
✅ **Loop pattern: initialize, while condition, update** - Essential structure  
✅ **Sentinel values stop input loops** - Like -1 or "quit"  
✅ **Nested loops multiply iterations** - Careful with performance

---

## Additional Resources

- [Python `while` Loop Documentation](https://docs.python.org/3/reference/compound_statements.html#while)
- [Loop Best Practices](https://docs.python.org/3/tutorial/controlflow.html#break-and-continue)
- [Debugging Infinite Loops](https://www.digitalocean.com/community/tutorials/python-while-loop)

---

## Next Lesson Preview

**Lesson 1.1.15**: Loop Control - `break` and `continue`
- Exiting loops early with `break`
- Skipping to next iteration with `continue`
- Controlling nested loops

---

## Homework

- [ ] Complete Exercises 1.1.14.1 - 1.1.14.9
- [ ] Build and test the Number Guessing Game
- [ ] Add difficulty selection with different ranges
- [ ] Challenge: Add hint system (hot/cold)
- [ ] Quiz: Answer all assessment questions

**Expected time**: 2-3 hours

---

**Lesson Complete!** 🎉

Proceed to **Lesson 1.1.15** when you're ready.
