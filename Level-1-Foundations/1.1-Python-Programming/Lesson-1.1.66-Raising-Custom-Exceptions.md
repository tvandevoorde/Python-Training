# Lesson 1.1.66: Raising Custom Exceptions

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.1.62-1.1.65

---

## Learning Objectives

1. **Create** custom exception classes
2. **Inherit** from appropriate exception base classes
3. **Raise** exceptions with meaningful messages
4. **Design** exceptions that communicate intent
5. **Use** custom exceptions in error handling
6. **Chain** exceptions appropriately
7. **Distinguish** between built-in and custom exceptions

---

## Creating Custom Exceptions

### Basic Custom Exception

```python
# Simple custom exception
class InvalidAgeError(Exception):
    """Raised when age is invalid."""
    pass

# Using it
def set_age(age):
    if age < 0 or age > 150:
        raise InvalidAgeError("Age must be between 0 and 150")
    return age

try:
    set_age(-5)
except InvalidAgeError as e:
    print(f"Error: {e}")  # Error: Age must be between 0 and 150
```

### Exception with Custom __init__

```python
class InsufficientFundsError(Exception):
    """Raised when account has insufficient funds."""
    
    def __init__(self, account_id, balance, requested):
        self.account_id = account_id
        self.balance = balance
        self.requested = requested
        self.shortage = requested - balance
        
        message = (f"Account {account_id}: "
                  f"requested {requested}, only have {balance}. "
                  f"Short by {self.shortage}")
        super().__init__(message)

# Usage
try:
    raise InsufficientFundsError("ACC-001", 50, 100)
except InsufficientFundsError as e:
    print(e)  # Full message
    print(f"  Account: {e.account_id}")
    print(f"  Shortage: {e.shortage}")
```

### Exception Inheritance Hierarchy

```python
# Create hierarchy of custom exceptions
class DatabaseError(Exception):
    """Base class for database errors."""
    pass

class ConnectionError(DatabaseError):
    """Database connection failed."""
    pass

class QueryError(DatabaseError):
    """Query execution failed."""
    pass

class TimeoutError(DatabaseError):
    """Query timeout."""
    pass

# Usage
def execute_query(query):
    try:
        # Attempt query...
        pass
    except ConnectionError:
        print("Cannot connect to database")
    except TimeoutError:
        print("Query took too long")
    except QueryError:
        print("Query execution failed")
    except DatabaseError:
        print("Unknown database error")
```

---

## Raising Exceptions

### Basic raise

```python
def validate_email(email):
    """Validate email format."""
    if '@' not in email:
        raise ValueError("Invalid email: missing @")
    if '.' not in email.split('@')[1]:
        raise ValueError("Invalid email: domain missing dot")
    return email

try:
    validate_email("invalid")
except ValueError as e:
    print(f"Email validation failed: {e}")
```

### Raising with from clause

```python
# Chain exceptions to preserve original error
def load_user_data(user_id):
    try:
        # Inner operation fails
        data = fetch_from_database(user_id)
    except DatabaseError as e:
        # Wrap with more meaningful exception
        raise UserNotFoundError(f"Cannot load user {user_id}") from e

try:
    load_user_data(999)
except UserNotFoundError as e:
    print(f"Error: {e}")
    print(f"Caused by: {e.__cause__}")
```

### Conditional raising

```python
def process_score(score):
    """Process score with multiple validations."""
    if not isinstance(score, (int, float)):
        raise TypeError(f"Score must be number, got {type(score)}")
    
    if score < 0:
        raise ValueError("Score cannot be negative")
    
    if score > 100:
        raise ValueError("Score cannot exceed 100")
    
    return score

try:
    process_score("invalid")  # TypeError
except TypeError as e:
    print(f"Type error: {e}")
```

---

## Exception Re-raising

### Re-raise without change

```python
def process_with_logging(data):
    """Process data, log error, then re-raise."""
    try:
        validate_data(data)
        return process(data)
    except ValueError as e:
        # Log the error
        log_error(f"Data validation failed: {e}")
        # Re-raise so caller knows it failed
        raise

try:
    process_with_logging(invalid_data)
except ValueError:
    print("Processing failed")
```

### Raise different exception

```python
def read_config(filename):
    """Read config, converting OSError to ConfigError."""
    try:
        with open(filename, 'r') as f:
            return json.load(f)
    except FileNotFoundError as e:
        raise ConfigError(f"Config file not found: {filename}") from e
    except json.JSONDecodeError as e:
        raise ConfigError(f"Invalid JSON in config: {e}") from e

try:
    config = read_config('app.json')
except ConfigError as e:
    print(f"Configuration error: {e}")
```

---

## Context-Specific Exceptions

### API Error Hierarchy

```python
class APIError(Exception):
    """Base class for API errors."""
    def __init__(self, status_code, message):
        self.status_code = status_code
        super().__init__(message)

class BadRequestError(APIError):
    """400 Bad Request."""
    pass

class NotFoundError(APIError):
    """404 Not Found."""
    pass

class TimeoutError(APIError):
    """504 Timeout."""
    pass

# Usage
def fetch_api(endpoint):
    try:
        # Make API call...
        pass
    except ConnectionError as e:
        raise TimeoutError(504, "API request timeout") from e
```

### Business Logic Exceptions

```python
class InsufficientPermissionError(Exception):
    """User lacks required permission."""
    def __init__(self, user_id, required_role):
        self.user_id = user_id
        self.required_role = required_role
        message = f"User {user_id} requires {required_role} role"
        super().__init__(message)

class DuplicateResourceError(Exception):
    """Resource already exists."""
    def __init__(self, resource_type, identifier):
        self.resource_type = resource_type
        self.identifier = identifier
        message = f"{resource_type} '{identifier}' already exists"
        super().__init__(message)

# Usage
def create_user(username):
    if user_exists(username):
        raise DuplicateResourceError("User", username)
```

---

## Graded Exercises

### Starter Level

1. Create 2-3 custom exception classes
2. Raise them in appropriate scenarios
3. Catch and handle in try-except block

### Intermediate Level

1. Create exception hierarchy (parent + child classes)
2. Add custom attributes to exceptions
3. Use from clause for exception chaining
4. Raise different exceptions based on conditions

### Advanced Level

1. Design comprehensive exception system for domain
2. Implement context-specific error messages
3. Chain exceptions appropriately
4. Create exception handling strategy across module

---

## Self-Assessment

- [ ] I can create basic custom exceptions
- [ ] I inherit from appropriate base classes
- [ ] I add custom attributes to exceptions
- [ ] I use meaningful error messages
- [ ] I use from clause for exception chaining
- [ ] I create exception hierarchies
- [ ] I raise appropriate exception in each scenario

---

**Next: [Lesson 1.1.67: Context Managers](Lesson-1.1.67-Context-Managers.md)**




