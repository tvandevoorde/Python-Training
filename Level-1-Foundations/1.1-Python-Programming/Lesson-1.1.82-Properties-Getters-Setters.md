# Lesson 1.1.82: Properties & Getters/Setters

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.81

---

## Learning Objectives

1. **Use** @property decorator
2. **Implement** getters and setters
3. **Create** computed properties
4. **Validate** on property access
5. **Design** properties appropriately

---

## Properties

### @property Decorator

```python
class Temperature:
    def __init__(self, celsius):
        self._celsius = celsius
    
    @property
    def fahrenheit(self):
        return self._celsius * 9/5 + 32
    
    @property
    def celsius(self):
        return self._celsius
    
    @celsius.setter
    def celsius(self, value):
        if value < -273.15:
            raise ValueError("Invalid temperature")
        self._celsius = value

temp = Temperature(25)
print(temp.fahrenheit)      # 77.0
temp.celsius = 30           # Uses setter
print(temp.celsius)         # 30
```

---

## Self-Assessment

- [ ] I use @property decorator
- [ ] I implement getters and setters
- [ ] I create computed properties
- [ ] I validate on access
- [ ] I design properties effectively

---

**Next: [Lesson 1.1.83: Multiple Inheritance](Lesson-1.1.83-Multiple-Inheritance.md)**




