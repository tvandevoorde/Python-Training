# Lesson 1.1.74: MILESTONE TEST – Error Handling

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.1.62-1.1.73 (Complete Error Handling topic)

---

## Overview

This milestone assessment has three components:

1. **Written Exam** (2 hours): Concepts and analysis
2. **Coding Challenge** (4 hours): Implement error handling system
3. **Project Review** (2 hours): Present and defend solution

**Passing Score**: 80+ points out of 100

---

## Component 1: Written Exam (2 hours / 30 points)

### Multiple Choice (10 points)

**Q1**: What is the purpose of the `else` clause in try-except?
A) Run when an exception occurs  
B) Run only if no exception occurs  
C) Always run regardless  
D) Clean up resources  

**Answer**: B

**Q2**: How should except blocks be ordered?
A) General to specific  
B) Specific to general  
C) Doesn't matter  
D) Alphabetically  

**Answer**: B

**Q3**: What does `finally` always do?
A) Only runs if exception occurs  
B) Only runs if no exception  
C) Always runs  
D) Suppresses exceptions  

**Answer**: C

**Q4**: How do you chain exceptions?
A) `raise Exception`  
B) `raise Exception from e`  
C) `except Exception: pass`  
D) Both A and B  

**Answer**: B

**Q5**: What is a context manager?
A) Manages exceptions  
B) Manages code blocks with setup/teardown  
C) Replaces try-except  
D) Debugs code  

**Answer**: B

### Short Answer (10 points)

**Q6**: Explain the difference between raising and handling exceptions.

**Expected Answer**:
- Raising: Signaling an error occurred with `raise`
- Handling: Catching and responding to exceptions with try-except
- Code can both raise exceptions and handle them

**Q7**: When would you use a context manager instead of try-finally?

**Expected Answer**:
- Context manager: Cleaner syntax with `with` statement
- try-finally: More control over multiple operations
- Context manager preferred for resource management
- Example: `with open()` vs manual open/close

**Q8**: Describe defensive programming.

**Expected Answer**:
- Validate inputs before processing
- Check preconditions early
- Use assertions for invariants
- Fail fast with clear error messages
- Handle edge cases systematically

**Q9**: What is exception chaining useful for?

**Expected Answer**:
- Preserves original exception while raising new one
- Provides context without losing debug info
- Use `from` clause to chain
- Shows cause-effect relationship

**Q10**: Design an error handling strategy for database operations.

**Expected Answer**:
- Try-except-else-finally structure
- Specific exception handling per error type
- Connection cleanup in finally
- Logging of errors
- Retry logic for transient errors

---

## Component 2: Coding Challenge (4 hours / 50 points)

### Challenge: Build an API Client with Error Handling

**Requirements**:

1. **HTTP Client with Error Handling** (15 points)
   - Make HTTP requests safely
   - Handle connection errors
   - Handle timeout errors
   - Provide retry logic

2. **Response Validation** (15 points)
   - Validate HTTP status codes
   - Parse JSON safely
   - Handle malformed responses
   - Meaningful error messages

3. **Error Recovery** (12 points)
   - Implement circuit breaker
   - Fallback strategies
   - Partial failure handling
   - Logging of all operations

4. **Code Quality** (8 points)
   - Type hints
   - Docstrings
   - Custom exceptions
   - Test coverage

### Starter Code

```python
"""
API Client with Comprehensive Error Handling
"""

import requests
import logging
from typing import Dict, Any, Optional
from enum import Enum
from datetime import datetime, timedelta

logger = logging.getLogger(__name__)

class APIError(Exception):
    """Base API error."""
    pass

class ConnectionError(APIError):
    """Connection failed."""
    pass

class ValidationError(APIError):
    """Response validation failed."""
    pass

class APIClient:
    """Client for making API requests with error handling."""
    
    def __init__(self, base_url: str, timeout: int = 10):
        """TODO: Initialize client."""
        pass
    
    def get(self, endpoint: str, params: Dict = None) -> Dict[str, Any]:
        """TODO: Make GET request with error handling."""
        pass
    
    def post(self, endpoint: str, data: Dict = None) -> Dict[str, Any]:
        """TODO: Make POST request with error handling."""
        pass
    
    def _validate_response(self, response) -> Dict:
        """TODO: Validate and parse response."""
        pass
    
    def _handle_error(self, error):
        """TODO: Handle and log errors."""
        pass

if __name__ == "__main__":
    # TODO: Test your API client
    pass
```

### Evaluation Criteria

| Criterion | Points | Details |
|-----------|--------|---------|
| HTTP client | 15 | Proper requests, error handling |
| Validation | 15 | Input/output validation, error messages |
| Recovery | 12 | Retry, fallback, logging |
| Quality | 8 | Type hints, docs, testing |

---

## Component 3: Project Review (2 hours / 20 points)

### Presentation (10 points)

1. **Architecture** (3 min): Explain error handling design
2. **Demo** (3 min): Show successful and error scenarios
3. **Code** (2 min): Highlight key implementation decisions

### Interview Questions (10 points)

1. "Why did you structure error handling this way?"
2. "How would you handle cascading failures?"
3. "What patterns did you use and why?"
4. "How do you test error scenarios?"
5. "How would you extend this to multiple API endpoints?"

---

## Study Guide

### Core Concepts

- [ ] Exception basics (try-except-else-finally)
- [ ] Built-in exceptions and their uses
- [ ] Creating custom exceptions
- [ ] Exception chaining
- [ ] Context managers
- [ ] Defensive programming
- [ ] Logging and debugging
- [ ] Error handling patterns
- [ ] Testing error cases

### Practice Problems

1. Write try-except that handles 5+ exception types
2. Create custom exception hierarchy
3. Implement context manager class
4. Design error handling for database operations
5. Create error handling for file processing
6. Implement retry logic with backoff
7. Design circuit breaker pattern
8. Write comprehensive tests for error handling

---

## Sample Test Cases

### API Client Tests

```python
import pytest
from unittest.mock import patch, Mock
from api_client import APIClient, ConnectionError, ValidationError

@pytest.fixture
def client():
    return APIClient('https://api.example.com')

def test_successful_request(client):
    with patch('requests.get') as mock_get:
        mock_response = Mock()
        mock_response.status_code = 200
        mock_response.json.return_value = {'data': 'value'}
        mock_get.return_value = mock_response
        
        result = client.get('/endpoint')
        assert result == {'data': 'value'}

def test_connection_error(client):
    with patch('requests.get') as mock_get:
        mock_get.side_effect = requests.ConnectionError()
        
        with pytest.raises(ConnectionError):
            client.get('/endpoint')

def test_validation_error(client):
    with patch('requests.get') as mock_get:
        mock_response = Mock()
        mock_response.status_code = 400
        mock_response.json.side_effect = ValueError()
        mock_get.return_value = mock_response
        
        with pytest.raises(ValidationError):
            client.get('/endpoint')

def test_retry_on_timeout(client):
    with patch('requests.get') as mock_get:
        mock_get.side_effect = [
            requests.Timeout(),
            requests.Timeout(),
            Mock(status_code=200, json=lambda: {'data': 'value'})
        ]
        
        result = client.get('/endpoint')
        assert result == {'data': 'value'}
        assert mock_get.call_count == 3
```

---

## Grading Scale

| Score | Grade | Status |
|-------|-------|--------|
| 90-100 | A | Mastery - Advanced patterns |
| 80-89 | B | Proficient - All core skills |
| 70-79 | C | Developing - Some gaps |
| <80 | F | Reassessment needed |

---

## Remediation Path

If you score below 80:

1. **Week 1**: Review specific concepts (lessons 1.1.62-)
2. **Week 2**: Implement additional practice problems
3. **Week 3**: Retake assessment

Topics to focus based on weak areas:
- Low on exam → Review written materials
- Low on code → Practice implementation
- Low on interview → Review patterns and design

---

## Resources for Review

- Python Built-in Exceptions
- Real Python - Exception Handling
- Context Managers Guide
- Error Handling Patterns Blog
- pytest Documentation

---

## Final Checklist

Before submitting:

- [ ] I understand exception hierarchy
- [ ] I can implement try-except-else-finally
- [ ] I create and use custom exceptions
- [ ] I implement context managers
- [ ] I write defensive code
- [ ] I use logging effectively
- [ ] I test error scenarios
- [ ] I combine multiple patterns
- [ ] My code handles edge cases
- [ ] I can explain all error handling decisions

---

## Moving Forward

After completing this milestone, you have mastered error handling! 

**Progress**: 74/102 lessons (73% of LEVEL 1.1)  
**Next Topic**: 1.1.75 - Classes & Objects (OOP Basics)

You're ready for object-oriented programming, which builds on error handling and functions you've learned.

---

**Congratulations on reaching 73% completion!** 🎉

Your error handling skills are now production-ready. Continue to [Topic 7: OOP Basics](Lesson-1.1.75-Classes-Objects.md).

---

**Previous: [Lesson 1.1.73 - Mini-Project](Lesson-1.1.73-Mini-Project-Robust-File-Processor.md)**

**Next: [Lesson 1.1.75 - Classes & Objects](Lesson-1.1.75-Classes-Objects.md)**




