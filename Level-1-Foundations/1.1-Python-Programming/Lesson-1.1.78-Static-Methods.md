# Lesson 1.1.78: Static Methods

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.1.77

---

## Learning Objectives

1. **Create** static methods using @staticmethod
2. **Distinguish** static, class, and instance methods
3. **Implement** utility functions in classes
4. **Understand** when to use static methods
5. **Apply** static methods appropriately

---

## Static Methods

### @staticmethod Decorator

```python
class MathUtils:
    @staticmethod
    def add(a, b):
        """Static method - doesn't need self or cls."""
        return a + b
    
    @staticmethod
    def multiply(a, b):
        return a * b

# No instance needed
print(MathUtils.add(5, 3))  # 8

# Also works on instances
calc = MathUtils()
print(calc.multiply(4, 7))  # 28
```

### Comparison

```python
class Example:
    class_var = "shared"
    
    def instance_method(self):
        # Receives self - accesses instance data
        return f"Instance: {self.class_var}"
    
    @classmethod
    def class_method(cls):
        # Receives cls - accesses class data
        return f"Class: {cls.class_var}"
    
    @staticmethod
    def static_method():
        # No self or cls - pure utility
        return "Static: no access to instance or class data"
```

---

## Self-Assessment

- [ ] I use @staticmethod effectively
- [ ] I distinguish method types
- [ ] I choose appropriate method type
- [ ] I implement utility functions

---

**Next: [Lesson 1.1.79: Magic Methods](Lesson-1.1.79-Magic-Methods-Dunder.md)**




