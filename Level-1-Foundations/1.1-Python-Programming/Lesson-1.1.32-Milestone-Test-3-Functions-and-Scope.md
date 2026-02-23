# Lesson 1.1.32: Milestone Test 3 - Functions & Scope

**Estimated Time**: 8 hours (90 min test + review) | **Difficulty**: Comprehensive  
**Prerequisites**: Lessons 1.1.24-1.1.31 | **Topic**: Assessment - Functions Mastery

---

## Test Instructions

**Total Points**: 40  
**Passing Score**: 32+ points (80%)  
**Time Limit**: 90 minutes

**Question Types**:
- True/False (1 pt each)
- Short Answer (2-3 pts each)
- Code Writing (4-6 pts each)

---

## Section A: True/False (10 points, 1 point each)

**1. A function without an explicit `return` statement returns `None`.**
   - A) True
   - B) False
   
   **Answer**: True

**2. The `global` keyword is required to read a global variable.**
   - A) True
   - B) False
   
   **Answer**: False (only needed to modify)

**3. Lambda functions can contain multiple statements separated by semicolons.**
   - A) True
   - B) False
   
   **Answer**: False (single expression only)

**4. In Python, `local` scope is searched before `enclosing` scope in the LEGB rule.**
   - A) True
   - B) False
   
   **Answer**: False (Local checked, then Enclosing, then Global, then Built-in)

**5. The `@property` decorator turns a method into an attribute-like accessor.**
   - A) True
   - B) False
   
   **Answer**: True

**6. Pure functions can modify global variables based on the function's input.**
   - A) True
   - B) False
   
   **Answer**: False (no side effects)

**7. `yield` pauses function execution and returns a value each time it's called.**
   - A) True
   - B) False
   
   **Answer**: True

**8. Decorators are applied from the outside in (top to bottom).**
   - A) True
   - B) False
   
   **Answer**: False (bottom to top)

**9. A recursive function must have at least one base case.**
   - A) True
   - B) False
   
   **Answer**: True

**10. List comprehensions are always more efficient than generator expressions.**
   - A) True
   - B) False
   
   **Answer**: False (generators are more memory efficient)

---

## Section B: Short Answer (12 points, 2-3 points each)

**11. Explain the difference between a regular function and a generator function. (2 pts)**

Expected Answer:
- Regular functions return all values at once
- Generator functions yield values one at  a time using lazy evaluation
- Generators are more memory efficient for large datasets

---

**12. What does LEGB stand for and briefly explain each level. (3 pts)**

Expected Answer:
- **L**ocal: Inside current function
- **E**nclosing: Inside outer function (nested)
- **G**lobal: Module level
- **B**uilt-in: Python built-in scope

---

**13. Write a one-line lambda function that returns the square of a number. (2 pts)**

Expected Answer:
```python
square = lambda x: x ** 2
```

---

**14. Explain the difference between `*args` and `**kwargs`. (3 pts)**

Expected Answer:
- `*args`: Variable number of positional arguments as tuple
- `**kwargs`: Variable number of keyword arguments as dictionary
- `*args` comes before `**kwargs` in parameter list

---

**15. What is a closure and provide a one-sentence example. (2 pts)**

Expected Answer:
- A closure is a function that "remembers" variables from its enclosing scope
- Example: function that returns another function capturing outer variables

---

**16. What is the purpose of `@wraps` from functools? (2 pts)**

Expected Answer:
- Preserves original function metadata (`__name__`, `__doc__`)
- Prevents wrapped function from losing its identity

---

## Section C: Code Reading (8 points, 2-4 points each)

**17. What does this function print? Explain why. (2 pts)**

```python
x = 10

def modify_x():
    x = 20

modify_x()
print(x)
```

Expected Answer:
- Prints: `10`
- Reason: Function modifies local `x`, not global `x`

---

**18. What is the output of this code? (2 pts)**

```python
def outer():
    x = 1
    
    def inner():
        nonlocal x
        x = 2
    
    inner()
    return x

print(outer())
```

Expected Answer:
- Output: `2`
- Reason: `nonlocal` allows inner function to modify enclosing scope variable

---

**19. Trace this decoratorand determine output. (4 pts)**

```python
def repeat_twice(func):
    def wrapper(*args, **kwargs):
        result = func(*args, **kwargs)
        return result + result
    return wrapper

@repeat_twice
def greet(name):
    return f"Hello, {name}!"

print(greet("Alice"))
```

Expected Answer:
- Output: `Hello, Alice!Hello, Alice!`
- Reasoning:
  1. `greet("Alice")` returns `"Hello, Alice!"`
  2. `repeat_twice` concatenates result with itself
  3. Final output is double

---

**20. What does this generator yield? (4 pts)**

```python
def countdown(n):
    while n > 0:
        yield n
        n -= 1

gen = countdown(3)
print(list(gen))
```

Expected Answer:
- Output: `[3, 2, 1]`
- Explanation:
  - Generator yields 3, then 2, then 1
  - `list()` consumes all yields into list

---

## Section D: Code Writing (10 points)

**21. Write a function that processes a list of numbers and returns those divisible by 3 using `filter()` and `lambda`. (2 pts)**

```python
def get_divisible_by_3(numbers):
    # Your code here
    pass

# Test
result = get_divisible_by_3([1, 3, 6, 9, 12, 14])
assert result == [3, 6, 9, 12]
```

Expected Answer:
```python
def get_divisible_by_3(numbers):
    return list(filter(lambda x: x % 3 == 0, numbers))
```

Grading:
- Correct use of filter: 1 pt
- Correct lambda expression: 1 pt

---

**22. Write a decorator that validates all arguments are positive before calling the function. (3 pts)**

```python
def validate_positive(func):
    # Your code here
    pass

@validate_positive
def multiply(a, b):
    return a * b

# Test
print(multiply(5, 3))  # 15
try:
    multiply(-5, 3)  # Should raise ValueError
except ValueError:
    print("Error caught!")
```

Expected Answer:
```python
def validate_positive(func):
    from functools import wraps
    @wraps(func)
    def wrapper(*args, **kwargs):
        for arg in args:
            if isinstance(arg, (int, float)) and arg < 0:
                raise ValueError(f"Arguments must be positive")
        return func(*args, **kwargs)
    return wrapper
```

Grading:
- Decorator structure: 1 pt
- Validation logic: 1 pt
- Proper error raising: 1 pt

---

**23. Create a function that returns a closure for accumulating values. (3 pts)**

```python
def create_accumulator():
    # Your code here
    pass

acc = create_accumulator()
print(acc(5))   # 5
print(acc(3))   # 8
print(acc(2))   # 10
```

Expected Answer:
```python
def create_accumulator():
    total = 0
    
    def add(value):
        nonlocal total
        total += value
        return total
    
    return add
```

Grading:
- Closure structure: 1 pt
- Use of nonlocal: 1 pt
- Correct accumulation logic: 1 pt

---

**24. Write a simple recursive function to calculate factorial. (2 pts)**

```python
def factorial(n):
    # Your code here
    pass

# Test
assert factorial(0) == 1
assert factorial(5) == 120
```

Expected Answer:
```python
def factorial(n):
    if n <= 1:
        return 1
    return n * factorial(n - 1)
```

Grading:
- Correct base case: 1 pt
- Correct recursive logic: 1 pt

---

## Answer Key & Scoring

### Section A (True/False)
All answers provided above. 10 points total.

### Section B (Short Answer)
- Q11: 2 pts (describe differences)
- Q12: 3 pts (all 4 levels explained)
- Q13: 2 pts (correct lambda)
- Q14: 3 pts (explanation of both)
- Q15: 2 pts (definition + example)
- Q16: 2 pts (explain @wraps purpose)

**Total Section B**: 14 points (curved to 12 in test = 0.857 factor)

### Section C (Code Reading)
- Q17: 2 pts (correct output + explanation)
- Q18: 2 pts (correct output + explanation)
- Q19: 4 pts (trace + explanation)
- Q20: 4 pts (output + full explanation)

**Total Section C**: 12 points (scaled to 8 = 0.667 factor)

### Section D (Code Writing)
- Q21: 2 pts
- Q22: 3 pts
- Q23: 3 pts
- Q24: 2 pts

**Total Section D**: 10 points

---

## Scoring Breakdown

```
Section A (T/F):       10 pts (must get 80%+)
Section B (Short):     12 pts (must get 70%+)
Section C (Reading):    8 pts (must get 75%+)
Section D (Writing):   10 pts (must get 70%+)
                       --------
TOTAL:                 40 pts
```

**Passing**: 32+ points (80%)  
**Excellent**: 36+ points (90%)  
**Perfect**: 40 points (100%)

---

## Performance Benchmarks

| Score | Grade | Status |
|-------|-------|--------|
| 36-40 | A | Master - Ready for Data Structures |
| 32-35 | B | Pass - Minor review suggested |
| 28-31 | C | Borderline - Significant review needed |
| <28 | F | Fail - Retake required |

---

## Topics Covered

This assessment validates mastery of:

✅ **Functions Basics** (1.1.24)
- Function definition
- Parameters and return values
- Simple function calls

✅ **Function Arguments** (1.1.25)
- Positional vs keyword arguments
- Default parameters
- *args and **kwargs

✅ **Scope & Namespaces** (1.1.26)
- LEGB rule
- Local vs global
- nonlocal keyword

✅ **Return Values** (1.1.27)
- Single and multiple returns
- Tuple unpacking
- Early returns

✅ **Lambda Functions** (1.1.28)
- Lambda syntax
- map(), filter(), sorted()
- When to use lambdas

✅ **Pure Functions** (1.1.29)
- Pure vs impure
- Side effects
- Testing pure functions

✅ **Recursion** (1.1.27)
- Base case and recursive case
- Simple recursion patterns

✅ **Generators** (1.1.29)
- yield keyword
- Lazy evaluation
- Generator functions

✅ **Decorators** (1.1.30)
- Decorator syntax
- @wraps
- Simple decorators

✅ **Integration** (1.1.31)
- Combining all concepts
- Real-world applications

---

## Study Tips

**Before the test:**
- ✅ Review all 8 function lessons
- ✅ Practice writing functions at each difficulty level
- ✅ Trace through code mentally (don't just read)
- ✅ Test your code - don't just theorize
- ✅ Study error cases and edge conditions

**During the test:**
- ✅ Read questions carefully
- ✅ Show your work for code writing
- ✅ Trace decorators/recursion step-by-step
- ✅ Test your code mentally if possible
- ✅ Alert: Time management for section D

**Common mistakes to avoid:**
- ❌ Forgetting global/nonlocal keywords
- ❌ Misunderstanding decorator order (bottom-up!)
- ❌ Missing base cases in recursion
- ❌ Confusing *args and **kwargs
- ❌ Pure function side effects

---

## Retake Policy

**If you score below 32 (80%):**

1. Review mistakes with lesson material
2. Retake specific questions (sections A-C)
3. Practice more code writing (section D)
4. Retake full test when ready
5. Must achieve 32+ to continue

**Support:**
- Re-read lesson docstrings and examples
- Reference answer key above
- Try variations of practice questions
- Focus on concepts, not memorization

---

## Next Steps

**If you PASS (32+ points):**
- ✅ Congratulations! Topic 3 mastered
- ✅ Ready for Topic 4: Data Structures
- ✅ Proceed to Lesson 1.1.33

**If you NEED REVIEW (<32 points):**
- 📖 Review Topic 3 lessons
- 🔧 Practice with additional exercises
- 🧪 Implement more projects
- 🔄 Retake this assessment

---

**Good luck!** 🎓

---

## Self-Assessment Checklist

Before taking the test, verify you can:

- [ ] Write and call functions with various parameters
- [ ] Explain and use the LEGB rule
- [ ] Modify global/nonlocal variables correctly
- [ ] Use lambda functions appropriately
- [ ] Apply decorators to functions
- [ ] Write pure functions without side effects
- [ ] Create simple recursive functions
- [ ] Write and use generator functions
- [ ] Understand stack frames and call stacks
- [ ] Debug function-related errors
- [ ] Read and trace complex function code
- [ ] Write production-quality function code

If you checked all boxes → You're ready! 💪

---

**Lesson Complete!** 🎉

**Topic 3 (Functions & Scope) is now COMPLETE!**

Proceed to **Lesson 1.1.33: Topic 4 - Data Structures** when ready.




