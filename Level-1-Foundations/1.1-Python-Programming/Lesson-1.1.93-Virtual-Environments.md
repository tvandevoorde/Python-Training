# Lesson 1.1.93: Virtual Environments with `venv`

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.1.92

---

## Learning Objectives

1. **Create** virtual environments
2. **Activate** and deactivate environments
3. **Isolate** project dependencies
4. **Manage** Python versions
5. **Share** projects reproducibly

---

## What is a Virtual Environment?

A virtual environment isolates project dependencies from your system Python:

```
System Python Package Store
├── requests 2.28
├── numpy 1.24
└── ...

Project A Virtual Env
├── requests 2.25 (isolated)
├── django 3.2
└── ...

Project B Virtual Env
├── requests 2.28 (isolated)
├── flask 2.0
└── ...
```

---

## Creating a Virtual Environment

### On Windows

```powershell
# Create environment
python -m venv myenv

# Activate
myenv\Scripts\activate

# Deactivate
deactivate
```

### On macOS/Linux

```bash
# Create environment
python3 -m venv myenv

# Activate
source myenv/bin/activate

# Deactivate
deactivate
```

---

## Using Virtual Environments

### Typical Workflow

```bash
# Create
python -m venv venv

# Activate
source venv/bin/activate  # Mac/Linux
# OR
venv\Scripts\activate     # Windows

# Install packages
pip install requests

# Work on project
python app.py

# Deactivate
deactivate
```

### Shell Indicator

When activated, your prompt shows the environment:

```
(venv) user@computer:project$
```

---

## Checking Environment Info

```bash
# Which Python
which python

# Installed packages
pip list

# Environment path
python -c "import sys; print(sys.prefix)"
```

---

## Self-Assessment

- [ ] I create virtual environments
- [ ] I activate/deactivate correctly
- [ ] I understand isolation
- [ ] I use best practices

---

**Next: [Lesson 1.1.94: pip & Package Management](Lesson-1.1.94-pip-Package-Management.md)**




