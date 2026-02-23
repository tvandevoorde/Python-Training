# Lesson 1.1.94: pip & Package Management

**Estimated Time**: 8 hours | **Difficulty**: Beginner  
**Prerequisites**: Lesson 1.1.93

---

## Learning Objectives

1. **Use** pip to install packages
2. **Manage** dependencies with requirements.txt
3. **Update** and remove packages
4. **Resolve** dependency issues
5. **Share** dependencies

---

## Installing Packages

### Basic Installation

```bash
# Install latest version
pip install requests

# Install specific version
pip install requests==2.28.0

# Install with version constraint
pip install "requests>=2.25,<3.0"

# Install multiple packages
pip install requests numpy pandas
```

---

## Requirements Files

### Creating requirements.txt

```bash
# Generate from current environment
pip freeze > requirements.txt
```

**Example requirements.txt**:
```
requests==2.28.0
numpy==1.24.0
pandas==1.5.0
```

### Installing from requirements

```bash
# Install all dependencies
pip install -r requirements.txt

# Install for development
pip install -r requirements-dev.txt
```

---

## Managing Packages

### View and Search

```bash
# List installed packages
pip list

# Show specific package info
pip show requests

# Search for packages (less common now)
pip search flask
```

### Update and Remove

```bash
# Update a package
pip install --upgrade requests

# Upgrade pip itself
pip install --upgrade pip

# Remove package
pip uninstall requests

# Remove all (with confirmation prompt)
pip uninstall -r requirements.txt
```

---

## Requirements File Organization

### Project Structure

```
project/
├── venv/
├── requirements.txt           # Production deps
├── requirements-dev.txt       # Development deps
└── app.py
```

**requirements.txt** (production):
```
requests==2.28.0
flask==2.2.0
sqlalchemy==2.0.0
```

**requirements-dev.txt** (development):
```
-r requirements.txt    # Include production deps
pytest==7.0.0
black==22.0.0
flake8==4.0.0
```

---

## Self-Assessment

- [ ] I install packages with pip
- [ ] I use requirements.txt
- [ ] I update packages
- [ ] I organize dependencies

---

**Next: [Lesson 1.1.95: Poetry for Modern Python](Lesson-1.1.95-Poetry.md)**




