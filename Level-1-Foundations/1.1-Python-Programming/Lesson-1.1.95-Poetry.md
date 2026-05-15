# Lesson 1.1.95: Poetry for Modern Python

> Previous Lesson: [Lesson 1.1.94: pip & Package Management](Lesson-1.1.94-pip-Package-Management.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.94

---

## Learning Objectives

1. **Install** and configure Poetry
2. **Create** Poetry projects
3. **Define** dependencies declaratively
4. **Build** and publish packages
5. **Manage** Python versions

---

## Introduction: Why This Matters

Poetry for Modern Python matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## What is Poetry?

Poetry is a modern Python dependency and packaging tool. It replaces pip and virtualenv with a unified approach.

**Installation**:
```bash
# macOS/Linux
curl -sSL https://install.python-poetry.org | python3 -

# Windows (PowerShell)
(Invoke-WebRequest -Uri https://install.python-poetry.org -UseBasicParsing).Content | python -

# Verify
poetry --version
```

---

## Creating a Poetry Project

### New Project

```bash
# Create new project
poetry new my_project
cd my_project
```

**Generated structure**:
```
my_project/
├── pyproject.toml
├── README.md
├── my_project/
│   └── __init__.py
└── tests/
    └── __init__.py
```

### From Existing Project

```bash
# Initialize in existing directory
poetry init

# Answer questions about project
```

---

## pyproject.toml

**Example**:
```toml
[tool.poetry]
name = "my-project"
version = "0.1.0"
description = "A sample project"
authors = ["Your Name <you@example.com>"]

[tool.poetry.dependencies]
python = "^3.9"
requests = "^2.28.0"
numpy = "^1.24.0"

[tool.poetry.dev-dependencies]
pytest = "^7.0.0"
black = "^22.0.0"

[build-system]
requires = ["poetry-core"]
build-backend = "poetry.core.masonry.api"
```

---

## Managing Dependencies

### Adding Packages

```bash
# Add production dependency
poetry add requests

# Add development dependency
poetry add --group dev pytest

# Add with version constraint
poetry add "requests>=2.25,<3.0"

# Add from git
poetry add git+https://github.com/user/package.git
```

### Viewing and Updating

```bash
# Show dependencies
poetry show

# Show outdated packages
poetry show --outdated

# Update dependencies
poetry update

# Update specific package
poetry update requests
```

---

## Working with Poetry

### Virtual Environment

```bash
# Enter poetry shell
poetry shell

# Run command in environment
poetry run python app.py

# Exit poetry shell
exit
```

### Building and Publishing

```bash
# Build package
poetry build

# Publish to PyPI
poetry publish
```

---

## Poetry Lock File

Poetry creates `poetry.lock` that locks exact versions:

```bash
# Install from lock file
poetry install

# Update dependencies (creates new lock)
poetry update
```

---

## Self-Assessment

- [ ] I install and use Poetry
- [ ] I create Poetry projects
- [ ] I define dependencies
- [ ] I manage versions effectively

---

**Next: [Lesson 1.1.96: Poetry Workflows](Lesson-1.1.96-Poetry-Workflows.md)**




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

1. Clarify one concrete goal for: Poetry for Modern Python.
2. Implement the smallest working version for: Poetry for Modern Python.
3. Handle one invalid-input case explicitly.
4. Refactor repeated logic into a named function.

```python
LESSON_ID = "1.1.95"
LESSON_TOPIC = "Poetry for Modern Python"

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

**Next Lesson**: [Lesson 1.1.96: Poetry Workflows](Lesson-1.1.96-Poetry-Workflows.md)

