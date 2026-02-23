# Lesson 1.1.73: Mini-Project – Robust File Processor

**Estimated Time**: 8 hours | **Difficulty**: Intermediate  
**Prerequisites**: Lessons 1.1.52-1.1.72 (File I/O + Error Handling)

---

## Learning Objectives

By the end of this lesson, you will be able to:

1. **Design** resilient file processing systems
2. **Combine** error handling principles into production code
3. **Implement** comprehensive input validation
4. **Use** logging and debugging effectively
5. **Create** robust multi-step operations
6. **Handle** partial failures gracefully
7. **Test** error scenarios systematically

---

## Project Overview

Build a **File Processor** that:
- Reads multiple file formats (CSV, JSON, TXT)
- Validates and transforms data
- Handles errors gracefully
- Logs operations completely
- Supports retry and recovery
- Provides detailed reports

### Project Structure

```
file_processor/
├── processor.py      # Main processor logic
├── validators.py     # Data validation
├── transformers.py   # Data transformation
├── logger.py         # Logging configuration
└── test_processor.py # Comprehensive tests
```

---

## Core Components

### File Reader with Error Handling

```python
# processor.py
import os
import json
import csv
from pathlib import Path
from typing import Dict, List, Any
import logging

logger = logging.getLogger(__name__)

class FileProcessor:
    """Process various file formats with robust error handling."""
    
    SUPPORTED_FORMATS = {'.csv', '.json', '.txt'}
    
    def __init__(self, input_dir, output_dir, log_file=None):
        self.input_dir = Path(input_dir)
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(exist_ok=True)
        
        self.stats = {
            'processed': 0,
            'failed': 0,
            'skipped': 0,
            'errors': []
        }
        
        logger.info(f"Processor initialized: {input_dir} → {output_dir}")
    
    def process_file(self, filename: str) -> bool:
        """Process single file with comprehensive error handling."""
        filepath = self.input_dir / filename
        
        try:
            # Validation
            if not self._validate_file(filepath):
                self.stats['skipped'] += 1
                return False
            
            # Read
            data = self._read_file(filepath)
            logger.info(f"Read {len(data)} records from {filename}")
            
            # Transform
            transformed = self._transform_data(data)
            logger.info(f"Transformed {len(transformed)} records")
            
            # Write
            output_file = self._write_results(filename, transformed)
            logger.info(f"Wrote results to {output_file}")
            
            self.stats['processed'] += 1
            return True
        
        except FileNotFoundError as e:
            msg = f"File not found: {filename}"
            logger.error(msg)
            self.stats['errors'].append(msg)
            self.stats['failed'] += 1
            return False
        
        except ValueError as e:
            msg = f"Data validation error in {filename}: {e}"
            logger.error(msg)
            self.stats['errors'].append(msg)
            self.stats['failed'] += 1
            return False
        
        except Exception as e:
            msg = f"Unexpected error processing {filename}: {type(e).__name__}: {e}"
            logger.exception(msg)
            self.stats['errors'].append(msg)
            self.stats['failed'] += 1
            return False
    
    def _validate_file(self, filepath: Path) -> bool:
        """Validate file before processing."""
        if not filepath.exists():
            raise FileNotFoundError(f"File does not exist: {filepath}")
        
        if filepath.suffix not in self.SUPPORTED_FORMATS:
            raise ValueError(f"Unsupported format: {filepath.suffix}")
        
        if filepath.stat().st_size == 0:
            logger.warning(f"File is empty: {filepath}")
            return False
        
        return True
    
    def _read_file(self, filepath: Path) -> List[Dict[str, Any]]:
        """Read file based on format."""
        if filepath.suffix == '.json':
            return self._read_json(filepath)
        elif filepath.suffix == '.csv':
            return self._read_csv(filepath)
        elif filepath.suffix == '.txt':
            return self._read_txt(filepath)
    
    def _read_json(self, filepath: Path) -> List[Dict]:
        """Read JSON file with error handling."""
        try:
            with open(filepath, 'r', encoding='utf-8') as f:
                data = json.load(f)
            
            if not isinstance(data, list):
                raise ValueError("JSON must be an array of objects")
            
            return data
        
        except json.JSONDecodeError as e:
            raise ValueError(f"Invalid JSON: {e}")
        except Exception as e:
            raise
    
    def _read_csv(self, filepath: Path) -> List[Dict]:
        """Read CSV file with error handling."""
        try:
            data = []
            with open(filepath, 'r', encoding='utf-8') as f:
                reader = csv.DictReader(f)
                for row in reader:
                    if row:
                        data.append(row)
            
            return data
        except UnicodeDecodeError:
            # Try alternative encoding
            with open(filepath, 'r', encoding='latin-1') as f:
                reader = csv.DictReader(f)
                data = [row for row in reader if row]
            return data
    
    def _read_txt(self, filepath: Path) -> List[Dict]:
        """Read text file as records."""
        with open(filepath, 'r', encoding='utf-8') as f:
            lines = [line.strip() for line in f if line.strip()]
        
        return [{'content': line} for line in lines]
    
    def _transform_data(self, data: List[Dict]) -> List[Dict]:
        """Transform data with validation."""
        transformed = []
        
        for i, record in enumerate(data):
            try:
                # Validate record
                if not isinstance(record, dict):
                    raise ValueError(f"Record {i} is not a dictionary")
                
                # Transform
                transformed_record = {k: str(v).strip() for k, v in record.items()}
                transformed.append(transformed_record)
            
            except ValueError as e:
                logger.warning(f"Skipping record {i}: {e}")
                continue
        
        return transformed
    
    def _write_results(self, filename: str, data: List[Dict]) -> Path:
        """Write results to output file."""
        output_file = self.output_dir / f"processed_{filename}"
        
        if not data:
            raise ValueError("No data to write")
        
        try:
            if filename.endswith('.json'):
                with open(output_file, 'w') as f:
                    json.dump(data, f, indent=2)
            else:
                # Write as CSV
                output_file = output_file.with_suffix('.csv')
                with open(output_file, 'w', newline='') as f:
                    writer = csv.DictWriter(f, fieldnames=data[0].keys())
                    writer.writeheader()
                    writer.writerows(data)
        
        except Exception as e:
            raise IOError(f"Failed to write output: {e}")
        
        return output_file
    
    def process_all(self) -> Dict[str, Any]:
        """Process all files in input directory."""
        if not self.input_dir.exists():
            logger.error(f"Input directory not found: {self.input_dir}")
            return self.stats
        
        files = [f.name for f in self.input_dir.iterdir() if f.is_file()]
        logger.info(f"Found {len(files)} files to process")
        
        for filename in files:
            self.process_file(filename)
        
        logger.info(f"Processing complete: {self.stats}")
        return self.stats
```

---

## Setup & Testing

### Logger Configuration

```python
# logger.py
import logging
from logging.handlers import RotatingFileHandler

def setup_logging(log_file='processor.log'):
    logger = logging.getLogger(__name__)
    logger.setLevel(logging.DEBUG)
    
    # File handler
    fh = RotatingFileHandler(log_file, maxBytes=1e6, backupCount=3)
    fh.setLevel(logging.DEBUG)
    
    # Console handler
    ch = logging.StreamHandler()
    ch.setLevel(logging.INFO)
    
    # Formatter
    formatter = logging.Formatter(
        '%(asctime)s - %(name)s - %(levelname)s - %(message)s'
    )
    fh.setFormatter(formatter)
    ch.setFormatter(formatter)
    
    logger.addHandler(fh)
    logger.addHandler(ch)
    
    return logger
```

### Unit Tests

```python
# test_processor.py
import pytest
from pathlib import Path
import json
import tempfile
from processor import FileProcessor

@pytest.fixture
def temp_dirs():
    with tempfile.TemporaryDirectory() as input_dir:
        with tempfile.TemporaryDirectory() as output_dir:
            yield Path(input_dir), Path(output_dir)

def test_process_json_file(temp_dirs):
    input_dir, output_dir = temp_dirs
    
    # Create test file
    test_file = input_dir / 'test.json'
    data = [{'name': 'Alice', 'age': '30'}, {'name': 'Bob', 'age': '25'}]
    with open(test_file, 'w') as f:
        json.dump(data,f)
    
    # Process
    processor = FileProcessor(input_dir, output_dir)
    result = processor.process_file('test.json')
    
    assert result is True
    assert processor.stats['processed'] == 1
    assert (output_dir / 'processed_test.csv').exists()

def test_missing_file(temp_dirs):
    input_dir, output_dir = temp_dirs
    processor = FileProcessor(input_dir, output_dir)
    
    result = processor.process_file('nonexistent.json')
    
    assert result is False
    assert processor.stats['failed'] == 1

def test_invalid_format(temp_dirs):
    input_dir, output_dir = temp_dirs
    
    bad_file = input_dir / 'invalid.xyz'
    bad_file.write_text('content')
    
    processor = FileProcessor(input_dir, output_dir)
    result = processor.process_file('invalid.xyz')
    
    assert result is False
```

---

## Graded Exercises

### Starter Level

1. Create processor for single file format
2. Implement basic error handling
3. Write 5+ test cases

### Intermediate Level

1. Support multiple file formats
2. Implement comprehensive validation
3. Add logging throughout
4. Write 15+ test cases
5. Handle partial failures

### Advanced Level

1. Complete project as specified
2. Implement all features
3. Add retry and recovery logic
4. Achieve 80%+ test coverage
5. Create CLI interface

---

## Self-Assessment

- [ ] I handle multiple error scenarios gracefully
- [ ] I validate all inputs comprehensively
- [ ] I log operations appropriately
- [ ] I test all error paths
- [ ] I combine error handling principles effectively
- [ ] I write production-quality error handling code
- [ ] I can explain all error handling decisions

---

**Next: [Lesson 1.1.74: MILESTONE TEST - Error Handling](Lesson-1.1.74-MILESTONE-TEST-Error-Handling.md)**




