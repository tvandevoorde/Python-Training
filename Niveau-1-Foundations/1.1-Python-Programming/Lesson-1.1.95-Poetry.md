# Lesson 1.1.95: Poetry for Modern Python

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
