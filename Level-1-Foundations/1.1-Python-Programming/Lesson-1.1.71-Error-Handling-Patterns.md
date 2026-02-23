# Lesson 1.1.71: Error Handling Patterns

**Estimated Time**: 8 hours | **Difficulty**: Advanced  
**Prerequisites**: Lessons 1.1.62-1.1.70

---

## Learning Objectives

1. **Implement** common error handling patterns
2. **Use** retry logic for transient errors
3. **Create** fallback strategies
4. **Handle** timeout scenarios
5. **Manage** cascading errors
6. **Design** resilient systems
7. **Apply** patterns to production code

---

## Retry Pattern

### Simple Retry

```python
def retry_with_backoff(func, max_attempts=3, initial_delay=1):
    """Retry function with exponential backoff."""
    import time
    
    delay =initial_delay
    for attempt in range(1, max_attempts + 1):
        try:
            return func()
        except (ConnectionError, TimeoutError) as e:
            if attempt == max_attempts:
                raise
            print(f"Attempt {attempt} failed: {e}. Retrying in {delay}s...")
            time.sleep(delay)
            delay *= 2  # Exponential backoff

# Usage
def call_api():
    import random
    if random.random() < 0.5:
        raise ConnectionError("API unavailable")
    return "Success"

result = retry_with_backoff(call_api)
```

---

## Fallback Pattern

### Default Value Fallback

```python
def get_config_safe(key, default_value=None):
    """Get config with fallback."""
    try:
        return get_config(key)
    except (FileNotFoundError, KeyError):
        return default_value
```

### Chain Fallbacks

```python
def get_data(source="primary"):
    """Try primary, fallback to secondary."""
    try:
        return fetch_from_primary_db()
    except DatabaseError:
        print("Primary failed, trying secondary...")
        try:
            return fetch_from_secondary_db()
        except DatabaseError:
            print("Secondary failed, using cache...")
            return get_cached_data()
```

---

## Timeout Pattern

### Timeout Handling

```python
import signal

class TimeoutError(Exception):
    pass

def timeout_handler(signum, frame):
    raise TimeoutError("Operation timed out")

def execute_with_timeout(func, timeout_seconds=5):
    """Execute function with timeout."""
    # Set signal handler
    signal.signal(signal.SIGALRM, timeout_handler)
    signal.alarm(timeout_seconds)
    
    try:
        result = func()
        signal.alarm(0)  # Cancel alarm
        return result
    except TimeoutError as e:
        print(f"Operation exceeded {timeout_seconds}s timeout")
        raise
```

---

## Graceful Degradation

### Feature Degradation

```python
def process_with_fallback(data, use_ml=True):
    """Use ML if available, fallback to simple method."""
    try:
        if use_ml:
            # Try advanced processing
            return ml_process(data)
        else:
            return simple_process(data)
    except ImportError:
        # ML library not installed
        print("ML unavailable, using simple processing")
        return simple_process(data)
    except Exception as e:
        # Any other error
        print(f"Processing failed: {e}, returning raw data")
        return data
```

---

## Circuit Breaker Pattern

### Basic Circuit Breaker

```python
from enum import Enum
from datetime import datetime, timedelta

class CircuitState(Enum):
    CLOSED = "closed"      # Normal operation
    OPEN = "open"          # Failing, reject requests
    HALF_OPEN = "half_open"  # Testing if recovered

class CircuitBreaker:
    """Prevent cascading failures."""
    
    def __init__(self, failure_threshold=5, reset_timeout=60):
        self.failure_count = 0
        self.failure_threshold = failure_threshold
        self.reset_timeout = reset_timeout
        self.state = CircuitState.CLOSED
        self.last_failure_time = None
    
    def call(self, func, *args, **kwargs):
        if self.state == CircuitState.OPEN:
            # Check if should reset
            if (datetime.now() - self.last_failure_time).seconds > self.reset_timeout:
                self.state = CircuitState.HALF_OPEN
            else:
                raise Exception("Circuit breaker is OPEN")
        
        try:
            result = func(*args, **kwargs)
            self.on_success()
            return result
        except Exception as e:
            self.on_failure()
            raise
    
    def on_success(self):
        self.failure_count = 0
        self.state = CircuitState.CLOSED
    
    def on_failure(self):
        self.failure_count += 1
        self.last_failure_time = datetime.now()
        if self.failure_count >= self.failure_threshold:
            self.state = CircuitState.OPEN

# Usage
breaker = CircuitBreaker(failure_threshold=3)

def api_call():
    # Simulated API call
    raise ConnectionError("API down")

for i in range(5):
    try:
        breaker.call(api_call)
    except Exception as e:
        print(f"Request {i}: {breaker.state.value}")
```

---

## Bulkhead Pattern

### Isolate Failures

```python
from concurrent.futures import ThreadPoolExecutor, TimeoutError as FutureTimeout

class BulkheadExecutor:
    """Limit concurrent operations to prevent resource exhaustion."""
    
    def __init__(self, max_workers=5):
        self.executor = ThreadPoolExecutor(max_workers=max_workers)
    
    def execute(self, func, *args, timeout=10):
        future = self.executor.submit(func, *args)
        try:
            return future.result(timeout=timeout)
        except FutureTimeout:
            raise TimeoutError(f"Operation exceeded {timeout}s")
        except Exception as e:
            raise

# Usage
executor = BulkheadExecutor(max_workers=3)

def process_item(item_id):
    # Long operation
    import time
    time.sleep(2)
    return f"Processed {item_id}"

results = []
for i in range(10):
    try:
        result = executor.execute(process_item, i, timeout=5)
        results.append(result)
    except (TimeoutError, Exception) as e:
        results.append(f"Failed: {e}")
```

---

## Graded Exercises

### Starter Level

1. Implement simple retry logic
2. Create fallback strategy
3. Handle timeout scenario

### Intermediate Level

1. Implement retry with exponential backoff
2. Create circuit breaker class
3. Combine multiple error handling patterns
4.Test with simulated failures

### Advanced Level

1. Implement comprehensive patterns (retry + fallback + circuit breaker)
2. Create resilient API client
3. Demonstrate graceful degradation
4. Test cascading failure scenarios

---

## Self-Assessment

- [ ] I implement retry with exponential backoff
- [ ] I use appropriate fallback strategies
- [ ] I handle timeout scenarios
- [ ] I understand circuit breaker pattern
- [ ] I implement graceful degradation
- [ ] I combine multiple patterns effectively
- [ ] I design resilient systems

---

**Next: [Lesson 1.1.72: Unit Testing with Pytest](Lesson-1.1.72-Unit-Testing-with-Pytest.md)**




