# Lesson 1.1.97: MILESTONE TEST Virtual Environments

> Previous Lesson: [Lesson 1.1.96: Poetry Workflows](Lesson-1.1.96-Poetry-Workflows.md)

**Estimated Time**: 6 hours | **Difficulty**: Assessment  
**Prerequisites**: All Topic 9 lessons (1.1.93-1.1.96)

---

## Assessment Overview

This milestone test covers virtual environments, pip, Poetry, and dependency management.

**Format**: 50 points total
- Written Questions: 15 points
- Practical Tasks: 20 points
- Project Setup: 15 points

---

## Section 1: Written Questions (15 points)

### Question 1 (3 points)
**Why are virtual environments important?**

*Expected Answer*:
- Isolate project dependencies
- Avoid version conflicts between projects
- Allow different Python versions per project

### Question 2 (3 points)
**What is the difference between `pip` and `Poetry`?**

*Expected Answer*:
- pip: Package installer, manual dependency management
- Poetry: Modern tool with lock files, deterministic builds
- Poetry preferred for modern projects

### Question 3 (3 points)
**What does `pip freeze > requirements.txt` do?**

*Expected Answer*:
- Captures all installed packages with exact versions
- Creates reproducible environment
- Can be used to install same versions elsewhere

### Question 4 (3 points)
**How do you activate and deactivate a virtual environment?**

*Expected Answer*:
- Activate: `source venv/bin/activate` (Mac/Linux) or `venv\Scripts\activate` (Windows)
- Deactivate: `deactivate` command
- Shows environment name in shell prompt

### Question 5 (3 points)
**What is `pyproject.toml` and what does it contain?**

*Expected Answer*:
- Project configuration file for Poetry
- Contains project metadata, dependencies, tool configuration
- More modern than requirements.txt

---

## Section 2: Practical Tasks (20 points)

### Task 1: Create Virtual Environment (5 points)

```bash
# Create venv
python -m venv my_venv

# Activate (verify by checking prompt)
source my_venv/bin/activate  # Mac/Linux
# OR
my_venv\Scripts\activate     # Windows

# Verify Python
which python
python --version

# Deactivate
deactivate
```

**Grading**:
- [ ] Environment created (2 pts)
- [ ] Activated correctly (2 pts)
- [ ] Can verify Python version (1 pt)

### Task 2: Manage with pip (5 points)

```bash
# Create requirements.txt
pip install requests
pip install numpy
pip freeze > requirements.txt

# Create new environment
python -m venv test_venv
source test_venv/bin/activate  # Mac/Linux

# Install from requirements
pip install -r requirements.txt

# Verify packages installed
pip list

# Deactivate
deactivate
```

**Grading**:
- [ ] Created requirements.txt (1 pt)
- [ ] New environment works (2 pts)
- [ ] Packages install correctly (2 pts)

### Task 3: Create Poetry Project (5 points)

```bash
# Create project
poetry new my_poetry_project
cd my_poetry_project

# Add dependencies
poetry add requests
poetry add --group dev pytest

# Run in Poetry environment
poetry run python -c "import requests; print(requests.__version__)"

# Show lock file created
cat poetry.lock
```

**Grading**:
- [ ] Project created (1 pt)
- [ ] Dependencies added (2 pts)
- [ ] Lock file generated (1 pt)
- [ ] Code runs in environment (1 pt)

### Task 4: Requirements Organization (5 points)

**Create structure**:
```
my_project/
├── venv/
├── requirements.txt
├── requirements-dev.txt
└── app.py
```

**requirements.txt** (production):
```
requests==2.28.1
flask==2.2.1
```

**requirements-dev.txt**:
```
-r requirements.txt
pytest==7.1.2
black==22.6.0
```

**Grading**:
- [ ] File structure correct (2 pts)
- [ ] requirements.txt complete (1 pt)
- [ ] requirements-dev.txt includes production (1 pt)
- [ ] Organization clear (1 pt)

---

## Section 3: Project Setup (15 points)

### Create Full Project Setup

**Objective**: Create a complete project with both pip and Poetry examples.

**Directory structure**:
```
project/
├── pip_example/
│   ├── venv/
│   ├── requirements.txt
│   └── app.py
└── poetry_example/
    ├── pyproject.toml
    ├── my_poetry_app/
    │   └── __init__.py
    └── tests/
        └── test_app.py
```

**pip_example/app.py**:
```python
import requests

def fetch_data(url):
    """Fetch data from URL."""
    response = requests.get(url)
    return response.json()

if __name__ == "__main__":
    data = fetch_data("https://api.github.com")
    print(data)
```

**pip_example/requirements.txt**:
```
requests==2.28.1
```

**poetry_example/pyproject.toml**:
```toml
[tool.poetry]
name = "my-poetry-app"
version = "0.1.0"
description = "Example Poetry project"

[tool.poetry.dependencies]
python = "^3.9"
requests = "^2.28.0"

[tool.poetry.dev-dependencies]
pytest = "^7.0.0"
```

**Demonstration**:
```bash
# Test pip version
cd pip_example
python -m venv venv
source venv/bin/activate  # Mac/Linux
pip install -r requirements.txt
python app.py
deactivate
cd ..

# Test Poetry version
cd poetry_example
poetry install
poetry run python my_poetry_app/__init__.py
exit
```

**Grading**:
- [ ] Both project structures created (3 pts)
- [ ] pip example works (4 pts)
- [ ] Poetry example works (4 pts)
- [ ] Documentation clear (4 pts)

---

## Self-Assessment

- [ ] I create and use virtual environments
- [ ] I manage dependencies with pip
- [ ] I use Poetry for projects
- [ ] I organize projects professionally

---

**Course Progress**: 97/102 lessons complete (95%)

---

**Next: [Lesson 1.1.98: Testing Basics with pytest](Lesson-1.1.98-Testing-Basics.md)**




---

## Learning Objectives

By the end of this lesson, you will be able to:
- Explain the key idea behind MILESTONE TEST Virtual Environments
- Implement a small practical example
- Identify one common failure mode and fix

---

## Introduction: Why This Matters

MILESTONE TEST Virtual Environments matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Core Teaching Content

Focus on one clear concept and connect it to a real workflow scenario.

```python
def run_example(value: int) -> int:
    return value * 2

print(run_example(3))
```

---

## Best Practices (Step-by-Step)

1. Clarify one concrete goal for: MILESTONE TEST Virtual Environments.
2. Implement the smallest working version for: MILESTONE TEST Virtual Environments.
3. Handle one invalid-input case explicitly.
4. Refactor repeated logic into a named function.

```python
LESSON_ID = "1.1.97"
LESSON_TOPIC = "MILESTONE TEST Virtual Environments"

def normalize_name(value: str) -> str:
    text = value.strip()
    if not text:
        raise ValueError("name must not be empty")
    return text.title()

print(normalize_name("  python learner "))
```

## Quick Practice

- Exercise: Modify the example to handle one edge case.
- Quiz: What would break if input validation was removed?

---

**Next Lesson**: [Lesson 1.1.98: Introduction to Testing](Lesson-1.1.98-Introduction-to-Testing.md)

