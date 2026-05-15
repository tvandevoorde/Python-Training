# Lesson 1.3.75: CAPSTONE PROJECT - Exploratory Data Analysis on Real Dataset

> Previous Lesson: [Lesson 1.3.74: Mini-Project - Local Analytics Database](Lesson-1.3.74-Mini-Project-Local-Analytics-Database.md)

**Estimated Time**: 8 hours | **Difficulty**: Advanced  
**Prerequisites**: Lessons 1.3.1 - 1.3.74 | **Topic**: Capstone - Data Science Tools

---

## Capstone Overview

Build a complete exploratory data analysis project using a real dataset.

### Deliverables
- Data loading and cleaning workflow
- Missing value and outlier handling
- 15+ visualizations (Matplotlib and Seaborn)
- Aggregation and summary tables
- SQLite-backed queries for at least one analysis view
- Reproducible notebook with markdown narrative
- Final insights report with recommended next actions

---

## Capstone Requirements

1. Data Acquisition and Context
- Choose a real public dataset and define the analysis goal.

2. Data Preparation
- Clean types, handle missing values, and document assumptions.

3. Exploratory Analysis
- Use descriptive statistics, distributions, and relationships.

4. Visualization Story
- Build clear visuals with titles, annotations, and conclusions.

5. SQL Integration
- Store core tables in SQLite and run summary queries.

6. Reproducibility
- Organize notebook sections and include a rerun checklist.

---

## Suggested Project Structure

```text
project/
  data/
  notebooks/
  src/
  outputs/
  README.md
```

---

## Assessment Rubric

- Technical correctness (30%)
- Data quality and validation (20%)
- Visualization quality and clarity (20%)
- Reproducibility and documentation (15%)
- Actionable insights (15%)

---

## Final Submission Checklist

- [ ] Notebook runs top-to-bottom without manual intervention
- [ ] All figures have labels and interpretation notes
- [ ] SQL queries are included and explained
- [ ] README explains setup and findings
- [ ] Reflection includes limitations and next experiments

---

**Capstone Complete.**

You have completed **LEVEL 1.3: Data Science Tools**.
```

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Explain the key idea behind CAPSTONE PROJECT - Exploratory Data Analysis on Real Dataset
- Implement a small practical example
- Identify one common failure mode and fix

---

## Introduction: Why This Matters

CAPSTONE PROJECT - Exploratory Data Analysis on Real Dataset matters because it solves a recurring engineering problem and creates a reliable foundation for later lessons.
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

1. Pick one baseline model and one fine-tuning method for CAPSTONE PROJECT - Exploratory Data Analysis on Real Dataset.
2. Freeze all non-essential parts first (PEFT mindset).
3. Track train/validation loss each epoch with fixed seeds.
4. Compare quality gain against compute cost before scaling.

```python
LESSON_ID = "1.3.75"
LESSON_TOPIC = "Capstone - Data Science Tools"

def choose_trainable_layers(method: str) -> list[str]:
    if method.lower() == "lora":
        return ["q_proj", "v_proj"]
    return ["all"]

print(choose_trainable_layers("lora"))
```

## Quick Practice

- Exercise: Modify the example to handle one edge case.
- Quiz: What would break if input validation was removed?

---

**Next Lesson**: [Sublevel Index](CURRICULUM-INDEX.md)

