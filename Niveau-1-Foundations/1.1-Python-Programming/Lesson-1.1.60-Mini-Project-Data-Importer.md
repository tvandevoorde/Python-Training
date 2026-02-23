# Lesson 1.1.60: Mini-Project: Data Importer

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: All Topic 5 lessons (1.1.52-1.1.59)

---

## Learning Objectives

By the end of this lesson, you will:

1. Integrate all File I/O concepts into a real project
2. Handle multiple file formats (CSV, JSON)
3. Validate and clean data from different sources
4. Transform data for consistency
5. Combine data from multiple files
6. Generate reports and outputs
7. Implement error handling for real-world scenarios
8. Write production-quality file handling code

---

## Project Overview

Build a **Data Importer** that reads data from various files, validates and cleans it, combines it, and outputs results.

### Requirements

Your program must:
1. Read data from CSV files
2. Read data from JSON files
3. Validate data (required fields, correct types)
4. Clean data (remove duplicates, normalize formats)
5. Combine multiple data sources
6. Generate formatted output
7. Create a summary report
8. Handle errors gracefully

---

## 1. Project Structure

```
data_importer/
├── data_importer.py       # Main program
├── input/                 # Input directories
│   ├── users.csv
│   ├── accounts.json
│   └── transactions.csv
├── output/                # Output directory
│   ├── combined.json
│   ├── report.txt
│   └── errors.log
└── tests/
    └── test_importer.py
```

---

## 2. Sample Input Files

### users.csv

```csv
id,name,email,country,created_date
1,Alice Johnson,alice@example.com,USA,2023-01-15
2,Bob Smith,bob@example.com,UK,2023-02-20
3,Charlie Brown,charlie@example.com,Canada,2023-03-10
4,Diana Prince,diana@example.com,USA,2023-03-25
5,Alice Johnson,alice.johnson@example.com,USA,2023-04-01
```

### accounts.json

```json
{
  "accounts": [
    {
      "id": 1,
      "user_id": 1,
      "account_type": "premium",
      "balance": 2500.50
    },
    {
      "id": 2,
      "user_id": 2,
      "account_type": "standard",
      "balance": 1200.00
    },
    {
      "id": 3,
      "user_id": 3,
      "account_type": "premium",
      "balance": 5000.00
    }
  ]
}
```

### transactions.csv

```csv
id,account_id,amount,type,date
1,1,100.00,deposit,2024-01-01
2,1,-50.00,withdrawal,2024-01-05
3,2,200.00,deposit,2024-01-03
4,1,75.50,transfer,2024-01-10
5,3,-150.00,withdrawal,2024-01-08
```

---

## 3. Implementation Plan

### Step 1: Data Structures

```python
from dataclasses import dataclass
from typing import List, Optional

@dataclass
class User:
    id: int
    name: str
    email: str
    country: str
    created_date: str
    
    def __hash__(self):
        return hash(self.email)

@dataclass
class Account:
    id: int
    user_id: int
    account_type: str
    balance: float

@dataclass
class Transaction:
    id: int
    account_id: int
    amount: float
    type: str
    date: str
```

### Step 2: File Readers

```python
import json
import csv
from pathlib import Path

class FileReader:
    @staticmethod
    def read_csv(filepath):
        """Read CSV file"""
        data = []
        try:
            with open(filepath, "r", encoding="utf-8") as f:
                reader = csv.DictReader(f)
                for row in reader:
                    data.append(row)
            return data
        except Exception as e:
            print(f"Error reading {filepath}: {e}")
            return []
    
    @staticmethod
    def read_json(filepath):
        """Read JSON file"""
        try:
            with open(filepath, "r", encoding="utf-8") as f:
                data = json.load(f)
            return data
        except Exception as e:
            print(f"Error reading {filepath}: {e}")
            return None
```

### Step 3: Data Validation

```python
class DataValidator:
    @staticmethod
    def validate_user(row):
        """Validate user row"""
        required = ["id", "name", "email", "country"]
        return all(key in row and row[key] for key in required)
    
    @staticmethod
    def validate_account(account):
        """Validate account"""
        required = ["id", "user_id", "account_type", "balance"]
        return all(key in account and account[key] for key in required)
    
    @staticmethod
    def validate_transaction(row):
        """Validate transaction"""
        required = ["id", "account_id", "amount", "type", "date"]
        return all(key in row and row[key] for key in required)
```

### Step 4: Data Cleaning

```python
class DataCleaner:
    @staticmethod
    def normalize_email(email):
        """Normalize email"""
        return email.lower().strip()
    
    @staticmethod
    def normalize_name(name):
        """Normalize name"""
        return name.strip().title()
    
    @staticmethod
    def deduplicate_users(users):
        """Remove duplicate users (keep first occurrence)"""
        seen_emails = set()
        unique_users = []
        
        for user in users:
            email = DataCleaner.normalize_email(user["email"])
            if email not in seen_emails:
                seen_emails.add(email)
                user["email"] = email
                user["name"] = DataCleaner.normalize_name(user["name"])
                unique_users.append(user)
        
        return unique_users
```

### Step 5: Data Integration

```python
class DataImporter:
    def __init__(self, input_dir, output_dir):
        self.input_dir = Path(input_dir)
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(exist_ok=True)
        
        self.users = []
        self.accounts = []
        self.transactions = []
        self.errors = []
    
    def import_all(self):
        """Import all data"""
        self.import_users()
        self.import_accounts()
        self.import_transactions()
    
    def import_users(self):
        """Import users from CSV"""
        filepath = self.input_dir / "users.csv"
        
        try:
            raw_data = FileReader.read_csv(filepath)
            validated = [r for r in raw_data if DataValidator.validate_user(r)]
            self.users = DataCleaner.deduplicate_users(validated)
            print(f"Imported {len(self.users)} users")
        except Exception as e:
            self.errors.append(f"User import error: {e}")
    
    def import_accounts(self):
        """Import accounts from JSON"""
        filepath = self.input_dir / "accounts.json"
        
        try:
            raw_data = FileReader.read_json(filepath)
            if raw_data and "accounts" in raw_data:
                for account in raw_data["accounts"]:
                    if DataValidator.validate_account(account):
                        # Convert balance to float
                        account["balance"] = float(account["balance"])
                        self.accounts.append(account)
            print(f"Imported {len(self.accounts)} accounts")
        except Exception as e:
            self.errors.append(f"Account import error: {e}")
    
    def import_transactions(self):
        """Import transactions from CSV"""
        filepath = self.input_dir / "transactions.csv"
        
        try:
            raw_data = FileReader.read_csv(filepath)
            for row in raw_data:
                if DataValidator.validate_transaction(row):
                    row["amount"] = float(row["amount"])
                    self.transactions.append(row)
            print(f"Imported {len(self.transactions)} transactions")
        except Exception as e:
            self.errors.append(f"Transaction import error: {e}")
    
    def combine_user_accounts(self):
        """Combine user and account data"""
        combined = []
        
        for user in self.users:
            user_accounts = [a for a in self.accounts if a["user_id"] == user["id"]]
            combined.append({
                "user": user,
                "accounts": user_accounts
            })
        
        return combined
    
    def export_to_json(self):
        """Export combined data to JSON"""
        combined = self.combine_user_accounts()
        
        output_file = self.output_dir / "combined.json"
        
        with open(output_file, "w", encoding="utf-8") as f:
            json.dump(combined, f, indent=2)
        
        print(f"Exported to {output_file}")
    
    def generate_report(self):
        """Generate summary report"""
        output_file = self.output_dir / "report.txt"
        
        with open(output_file, "w") as f:
            f.write("DATA IMPORT REPORT\n")
            f.write("=" * 50 + "\n\n")
            
            f.write(f"Users imported: {len(self.users)}\n")
            f.write(f"Accounts imported: {len(self.accounts)}\n")
            f.write(f"Transactions imported: {len(self.transactions)}\n\n")
            
            # Summary statistics
            if self.accounts:
                total_balance = sum(float(a["balance"]) for a in self.accounts)
                f.write(f"Total account balance: ${total_balance:,.2f}\n\n")
            
            if self.transactions:
                total_deposits = sum(float(t["amount"]) for t in self.transactions if t["type"] == "deposit")
                total_withdrawals = sum(abs(float(t["amount"])) for t in self.transactions if t["type"] == "withdrawal")
                f.write(f"Total deposits: ${total_deposits:,.2f}\n")
                f.write(f"Total withdrawals: ${total_withdrawals:,.2f}\n\n")
            
            # Errors
            if self.errors:
                f.write("ERRORS ENCOUNTERED:\n")
                for error in self.errors:
                    f.write(f"  - {error}\n")
        
        print(f"Report generated: {output_file}")
```

### Step 6: Main Program

```python
def main():
    importer = DataImporter("./input", "./output")
    
    # Import all data
    importer.import_all()
    
    # Export and report
    importer.export_to_json()
    importer.generate_report()
    
    print("Data import complete!")

if __name__ == "__main__":
    main()
```

---

## 4. Testing

```python
import unittest
from pathlib import Path
import json

class TestDataImporter(unittest.TestCase):
    def setUp(self):
        self.importer = DataImporter("./test_data", "./test_output")
    
    def test_user_import(self):
        self.importer.import_users()
        self.assertGreater(len(self.importer.users), 0)
    
    def test_account_import(self):
        self.importer.import_accounts()
        self.assertGreater(len(self.importer.accounts), 0)
    
    def test_data_validation(self):
        test_user = {"id": "1", "name": "Test", "email": "test@example.com", "country": "USA"}
        self.assertTrue(DataValidator.validate_user(test_user))
    
    def test_export(self):
        self.importer.import_all()
        self.importer.export_to_json()
        
        output_file = self.importer.output_dir / "combined.json"
        self.assertTrue(output_file.exists())

if __name__ == "__main__":
    unittest.main()
```

---

## 5. Extensions (Choose 2-3)

### Extension A: Database Storage

Modify program to store combined data in a SQLite database.

### Extension B: Data Transformation

Add data transformation rules (format dates, standardize currencies).

### Extension C: Incremental Updates

Only import/update data that has changed since last run.

### Extension D: Web API Output

Export data as REST endpoints (using Flask).

### Extension E: Advanced Filtering

Allow filtering data by date range, account type, etc.

---

## 6. Project Checklist

- [ ] Program imports CSV files correctly
- [ ] Program imports JSON files correctly
- [ ] Data validation works properly
- [ ] Duplicates are removed correctly
- [ ] Data is combined successfully
- [ ] JSON export is valid and formatted
- [ ] Report is generated with statistics
- [ ] Error handling covers common issues
- [ ] Code is well-organized and commented
- [ ] Unit tests pass
- [ ] Program handles edge cases
- [ ] Performance is acceptable for large files

---

## 7. Graded Submission

### Code Quality

- [ ] Well-structured with logical functions
- [ ] Proper error handling
- [ ] Clear variable and function names
- [ ] Comments explaining complex logic
- [ ] No hardcoded values beyond demo data

### Functionality

- [ ] All 3 file types import correctly
- [ ] Data validation comprehensive
- [ ] Duplicate detection works
- [ ] Output files created properly
- [ ] Report contains meaningful statistics

### Testing

- [ ] Unit tests for each component
- [ ] Tests cover edge cases
- [ ] All tests pass
- [ ] Error scenarios handled

### Documentation

- [ ] README explaining usage
- [ ] Comments in code
- [ ] Sample data files included
- [ ] Instructions for running

---

## 8. Performance Considerations

For large files (100K+ rows):

```python
# Use generators instead of lists
def read_csv_generator(filepath):
    with open(filepath, "r") as f:
        reader = csv.DictReader(f)
        for row in reader:
            yield row

# Process in batches
def process_in_batches(filename, batch_size=1000):
    batch = []
    for row in read_csv_generator(filename):
        batch.append(row)
        if len(batch) >= batch_size:
            process_batch(batch)
            batch = []
    if batch:
        process_batch(batch)
```

---

## 9. Deliverables

Submit:
1. Complete Python program (`data_importer.py`)
2. Sample data files (CSV and JSON)
3. Unit tests
4. README with usage instructions
5. Sample output files

---

**Next Lesson**: [1.1.61 - MILESTONE TEST: File I/O](Lesson-1.1.61-MILESTONE-TEST-File-IO.md)  
**Previous Lesson**: [1.1.59 - Paths & pathlib](Lesson-1.1.59-Paths-pathlib.md)
