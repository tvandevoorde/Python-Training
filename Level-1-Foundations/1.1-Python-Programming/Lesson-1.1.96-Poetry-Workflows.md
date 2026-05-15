# Lesson 1.1.96: Poetry Workflows

> Previous Lesson: [Lesson 1.1.95: Poetry for Modern Python](Lesson-1.1.95-Poetry.md)

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lesson 1.1.95

---

## Learning Objectives

1. **Establish** development workflows
2. **Configure** tools with Poetry
3. **Automate** testing and formatting
4. **Publish** packages
5. **Collaborate** effectively

---

## Introduction: Why This Matters

Poetry Workflows matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
In the bigger picture, this topic improves quality, speed, and confidence when building end-to-end AI systems.

---

## Development Workflow

### Standard Workflow

```bash
# 1. Create project
poetry new my_project
cd my_project

# 2. Enter shell
poetry shell

# 3. Add dependencies
poetry add requests
poetry add --group dev pytest black

# 4. Develop
python -m my_project

# 5. Test
poetry run pytest

# 6. Format
poetry run black .

# 7. Exit
exit
```

---

## Tool Configuration

### pyproject.toml Configuration

```toml
[tool.poetry.scripts]
my-app = "my_project.cli:main"

[tool.black]
line-length = 88
target-version = ['py39']

[tool.pytest.ini_options]
testpaths = ["tests"]
python_files = ["test_*.py"]

[tool.isort]
profile = "black"
```

---

## Development Workflow Example

**Project structure**:
```
my_project/
├── pyproject.toml
├── my_project/
│   ├── __init__.py
│   └── cli.py
└── tests/
    └── test_cli.py
```

**pyproject.toml**:
```toml
[tool.poetry]
name = "my-project"
version = "0.1.0"

[tool.poetry.dependencies]
python = "^3.9"

[tool.poetry.dev-dependencies]
pytest = "^7.0.0"
black = "^22.0.0"

[tool.poetry.scripts]
my-app = "my_project.cli:main"
```

**my_project/cli.py**:
```python
def main():
    print("Hello from Poetry!")

if __name__ == "__main__":
    main()
```

**Running**:
```bash
poetry install
poetry run my-app  # Hello from Poetry!
```

---

## Publishing to PyPI

### Prepare Package

```bash
# Update version
poetry version patch  # 0.1.0 -> 0.1.1
poetry version minor  # 0.1.0 -> 0.2.0
poetry version major  # 0.1.0 -> 1.0.0

# Build
poetry build
```

### Configure Credentials

```bash
# Add PyPI credentials
poetry config pypi-token.pypi <your-token>

# Or use .pypirc
poetry config repositories.pypi https://upload.pypi.org/legacy/
```

### Publish

```bash
# Publish to PyPI
poetry publish

# Publish to test PyPI first
poetry publish -r test-pypi
```

---

## Self-Assessment

- [ ] I establish development workflows
- [ ] I configure Poetry tools
- [ ] I automate testing
- [ ] I publish packages

---

**Next: [Lesson 1.1.97: MILESTONE TEST Virtual Environments](Lesson-1.1.97-MILESTONE-TEST-Virtual.md)**




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

1. Clarify one concrete goal for: Poetry Workflows.
2. Implement the smallest working version for: Poetry Workflows.
3. Handle one invalid-input case explicitly.
4. Refactor repeated logic into a named function.

```python
LESSON_ID = "1.1.96"
LESSON_TOPIC = "Poetry Workflows"

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

**Next Lesson**: [Lesson 1.1.97: MILESTONE TEST Virtual Environments](Lesson-1.1.97-MILESTONE-TEST-Virtual.md)

