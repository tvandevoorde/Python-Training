# Lesson 1.1.31: Functions Capstone Project

**Estimated Time**: 8 hours | **Difficulty**: Intermediate-Advanced  
**Prerequisites**: Lesson 1.1.30 (Decorators) | **Topic**: Functions - Integration Project

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Integrate all function concepts into a cohesive project
- Design function-based applications
- Organize functions logically
- Write well-documented, reusable code
- Test comprehensive function libraries
- Build real-world applications

---

## Project Overview

**Build a Complete Function Library: Personal Finance Manager**

Your goal: Create a finance management system using functions, demonstrating mastery of all function concepts from Lessons 1.1.24-1.1.30.

**Requirements:**
- ✅ 300+ lines of functional code
- ✅ 15+ different functions exploring all concepts
- ✅ Pure functions where possible
- ✅ Proper error handling
- ✅ Comprehensive documentation
- ✅ Test suite with 10+ test cases
- ✅ Real-world applicability

---

## Implementation

### Part 1: Core Functions (Pure & Deterministic)

```python
"""
Finance Manager Library: Personal Financial Management

A complete Python application demonstrating:
- Function organization and design
- Parameters and return values
- Scope and closures
- Lambda and higher-order functions
- Pure vs impure functions
- Decorators for validation and logging
- Comprehensive testing
"""

from functools import wraps
from typing import Tuple, List, Dict, Optional
import json

# ========== PURE FUNCTIONS ==========

def add_income(total_income: float, amount: float) -> float:
    """Add income to total (pure)"""
    if amount < 0:
        raise ValueError("Income must be positive")
    return total_income + amount

def add_expense(total_expenses: float, amount: float) -> float:
    """Add expense to total (pure)"""
    if amount < 0:
        raise ValueError("Expense must be positive")
    return total_expenses + amount

def calculate_balance(income: float, expenses: float) -> float:
    """Calculate account balance (pure)"""
    return income - expenses

def calculate_savings_rate(income: float, savings: float) -> float:
    """Calculate savings percentage (pure)"""
    if income == 0:
        return 0.0
    return (savings / income) * 100

def apply_interest(balance: float, rate: float, years: int) -> float:
    """Calculate compound interest (pure)"""
    return balance * ((1 + rate) ** years)

def categorize_expense(description: str, amount: float) -> Tuple[str, float]:
    """Categorize expense based on description (pure)"""
    keywords = {
        'food': ['grocery', 'restaurant', 'food', 'lunch'],
        'transport': ['gas', 'uber', 'bus', 'train', 'parking'],
        'utilities': ['electric', 'water', 'internet', 'phone'],
        'entertainment': ['movie', 'game', 'concert', 'netflix'],
        'health': ['doctor', 'medicine', 'gym', 'health']
    }
    
    desc_lower = description.lower()
    for category, words in keywords.items():
        if any(word in desc_lower for word in words):
            return category, amount
    
    return 'other', amount

def budget_analysis(budget: float, spent: float) -> Dict[str, any]:
    """Analyze spending vs budget (pure)"""
    remaining = budget - spent
    percentage = (spent / budget * 100) if budget > 0 else 0
    
    return {
        'budget': budget,
        'spent': spent,
        'remaining': remaining,
        'percentage_used': round(percentage, 2),
        'status': 'over budget' if remaining < 0 else 'on track'
    }

# ========== HIGHER-ORDER FUNCTIONS & LAMBDAS ==========

def filter_large_expenses(expenses: List[float], threshold: float) -> List[float]:
    """Filter expenses above threshold using lambda"""
    return list(filter(lambda x: x > threshold, expenses))

def scale_amounts(amounts: List[float], multiplier: float) -> List[float]:
    """Scale all amounts by multiplier using lambda"""
    return list(map(lambda x: x * multiplier, amounts))

def sort_transactions(transactions: List[Dict], by: str = 'amount') -> List[Dict]:
    """Sort transactions by amount or date"""
    return sorted(
        transactions,
        key=lambda t: t.get(by, 0),
        reverse=True
    )

# ========== FUNCTIONS WITH CLOSURES ==========

def create_budget_tracker(initial_budget: float):
    """Factory: Create budget tracker with closure"""
    spent = 0
    
    def add_spending(amount: float) -> Dict:
        nonlocal spent
        spent += amount
        remaining = initial_budget - spent
        
        return {
            'total_budget': initial_budget,
            'total_spent': spent,
            'remaining': remaining,
            'percentage_used': (spent / initial_budget * 100) if initial_budget > 0 else 0
        }
    
    def get_status() -> Dict:
        return {
            'budget': initial_budget,
            'spent': spent,
            'remaining': initial_budget - spent
        }
    
    def reset():
        nonlocal spent
        spent = 0
    
    return {
        'add': add_spending,
        'status': get_status,
        'reset': reset
    }

def create_goal_tracker(goal_amount: float):
    """Factory: Track progress toward financial goal"""
    saved = 0
    
    def deposit(amount: float) -> Dict:
        nonlocal saved
        saved += amount
        remaining = goal_amount - saved
        
        return {
            'goal': goal_amount,
            'saved': saved,
            'remaining': max(0, remaining),
            'percentage_complete': min(100, (saved / goal_amount * 100)) if goal_amount > 0 else 0
        }
    
    def get_progress() -> float:
        return min(100, (saved / goal_amount * 100)) if goal_amount > 0 else 0
    
    return {
        'deposit': deposit,
        'progress': get_progress
    }

# ========== DECORATORS FOR VALIDATION ==========

def require_positive(func):
    """Decorator: Ensure arguments are positive"""
    @wraps(func)
    def wrapper(amount: float, *args, **kwargs):
        if amount < 0:
            raise ValueError(f"Amount must be positive, got {amount}")
        return func(amount, *args, **kwargs)
    return wrapper

def log_transaction(func):
    """Decorator: Log all transactions"""
    @wraps(func)
    def wrapper(*args, **kwargs):
        print(f"[LOG] Executing {func.__name__}")
        result = func(*args, **kwargs)
        print(f"[LOG] {func.__name__} completed: {result}")
        return result
    return wrapper

# ========== RECURSIVE FUNCTION ==========

def calculate_loan_payments(principal: float, rate: float, months: int, payment: float = 0) -> float:
    """Recursively calculate total paid with interest on loan"""
    if months == 0:
        return payment
    
    interest = principal * (rate / 12)
    principal_payment = min(payment, principal + interest)
    remaining = principal + interest - principal_payment
    
    return calculate_loan_payments(remaining, rate, months - 1, payment + principal_payment)

# ========== GENERATOR FOR EFFICIENT PROCESSING ==========

def expense_stream(expenses: List[Dict]):
    """Generate expenses one at a time (memory efficient)"""
    for expense in expenses:
        yield expense

def monthly_summary(transactions: List[Dict]):
    """Generate monthly summaries from transaction stream"""
    current_month = None
    month_data = []
    
    for transaction in sorted(transactions, key=lambda t: t.get('date', '')):
        date = transaction.get('date', '')
        month = date[:7] if date else None  # YYYY-MM
        
        if month != current_month and month_data:
            yield (current_month, month_data)
            month_data = []
        
        current_month = month
        month_data.append(transaction)
    
    if month_data:
        yield (current_month, month_data)

# ========== COMPREHENSIVE API ==========

class FinanceManager:
    """Main interface for finance management"""
    
    def __init__(self):
        self.income = 0.0
        self.expenses = 0.0
        self.transactions: List[Dict] = []
        self.budget = None
    
    def add_income_transaction(self, amount: float, source: str = "salary"):
        """Record income (side effect: modifies state)"""
        if amount < 0:
            raise ValueError("Income must be positive")
        
        self.income += amount
        self.transactions.append({
            'type': 'income',
            'amount': amount,
            'source': source,
            'date': self._get_date()
        })
        return self.get_balance()
    
    def add_expense_transaction(self, amount: float, description: str):
        """Record expense"""
        if amount < 0:
            raise ValueError("Expense must be positive")
        
        category, amount = categorize_expense(description, amount)
        self.expenses += amount
        self.transactions.append({
            'type': 'expense',
            'amount': amount,
            'description': description,
            'category': category,
            'date': self._get_date()
        })
        return self.get_balance()
    
    def get_balance(self) -> float:
        """Get current balance (pure logic)"""
        return calculate_balance(self.income, self.expenses)
    
    def get_summary(self) -> Dict:
        """Get complete financial summary"""
        balance = self.get_balance()
        savings_rate = calculate_savings_rate(self.income, balance)
        
        # Categorize expenses
        categories = {}
        for t in self.transactions:
            if t['type'] == 'expense':
                cat = t.get('category', 'other')
                categories[cat] = categories.get(cat, 0) + t['amount']
        
        return {
            'total_income': self.income,
            'total_expenses': self.expenses,
            'balance': balance,
            'savings_rate': savings_rate,
            'expenses_by_category': categories,
            'transaction_count': len(self.transactions)
        }
    
    def set_budget(self, amount: float):
        """Set monthly budget"""
        self.budget = amount
    
    def check_budget(self) -> Optional[Dict]:
        """Check status vs budget"""
        if self.budget is None:
            return None
        return budget_analysis(self.budget, self.expenses)
    
    def _get_date(self) -> str:
        """Get current date (simple stub)"""
        from datetime import date
        return str(date.today())

```

### Part 2: Testing Suite

```python
# ========== TESTS ==========

def test_core_functions():
    """Test pure calculation functions"""
    assert add_income(100, 50) == 150
    assert add_expense(0, 25) == 25
    assert calculate_balance(500, 100) == 400
    assert calculate_savings_rate(1000, 200) == 20.0
    print("✓ Core functions pass")

def test_pure_functions():
    """Test pure function guarantees"""
    # Same input = same output
    assert add_income(100, 50) == add_income(100, 50)
    assert calculate_balance(500, 100) == calculate_balance(500, 100)
    print("✓ Pure function guarantees pass")

def test_error_handling():
    """Test error cases"""
    try:
        add_income(100, -50)
        assert False, "Should raise ValueError"
    except ValueError:
        pass
    
    try:
        categorize_expense("", 0)  # Valid, returns ('other', 0)
    except:
        assert False, "Should not raise"
    
    print("✓ Error handling passes")

def test_higher_order_functions():
    """Test lambda and filter functions"""
    expenses = [10, 25, 50, 75, 100]
    large = filter_large_expenses(expenses, 40)
    assert large == [50, 75, 100]
    
    scaled = scale_amounts([10, 20, 30], 2)
    assert scaled == [20, 40, 60]
    
    print("✓ Higher-order functions pass")

def test_closures():
    """Test closure functions"""
    tracker = create_budget_tracker(1000)
    
    result1 = tracker['add'](250)
    assert result1['total_spent'] == 250
    
    result2 = tracker['add'](250)
    assert result2['total_spent'] == 500
    
    status = tracker['status']()
    assert status['spent'] == 500
    
    print("✓ Closures pass")

def test_goal_tracker():
    """Test goal tracking with closures"""
    goal = create_goal_tracker(1000)
    
    goal['deposit'](250)
    goal['deposit'](250)
    
    progress = goal['progress']()
    assert progress == 50.0  # 500/1000 = 50%
    
    print("✓ Goal tracker passes")

def test_finance_manager():
    """Test complete FinanceManager"""
    fm = FinanceManager()
    
    # Add income
    fm.add_income_transaction(5000, "salary")
    assert fm.get_balance() == 5000
    
    # Add expenses
    fm.add_expense_transaction(100, "grocery shopping")
    fm.add_expense_transaction(50, "gas for car")
    fm.add_expense_transaction(30, "netflix monthly")
    
    assert fm.get_balance() == 4820
    
    # Get summary
    summary = fm.get_summary()
    assert summary['total_income'] == 5000
    assert summary['total_expenses'] == 180
    assert summary['balance'] == 4820
    
    # Check categories
    assert 'food' in summary['expenses_by_category']
    assert 'transport' in summary['expenses_by_category']
    
    print("✓ FinanceManager passes")

def test_sorting():
    """Test transaction sorting"""
    transactions = [
        {'amount': 100, 'description': 'groceries'},
        {'amount': 50, 'description': 'gas'},
        {'amount': 75, 'description': 'dining'}
    ]
    
    sorted_trans = sort_transactions(transactions, 'amount')
    amounts = [t['amount'] for t in sorted_trans]
    assert amounts == [100, 75, 50]  # Descending
    
    print("✓ Sorting passes")

def run_all_tests():
    """Run complete test suite"""
    test_core_functions()
    test_pure_functions()
    test_error_handling()
    test_higher_order_functions()
    test_closures()
    test_goal_tracker()
    test_finance_manager()
    test_sorting()
    
    print("\n✅ ALL TESTS PASS! Functions capstone complete.")

# Run tests
if __name__ == "__main__":
    run_all_tests()
```

---

## Deliverables Checklist

- ✅ **Code Organization**: Logical function grouping (pure, HOF, closures, etc.)
- ✅ **Documentation**: Docstrings for all functions
- ✅ **Type Hints**: Function signatures with types
- ✅ **Error Handling**: Validation and exception handling
- ✅ **Testing**: Comprehensive test suite
- ✅ **Pure Functions**: Demonstrated where appropriate
- ✅ **Decorators**: Used for validation/logging
- ✅ **Closures**: Factory functions with state
- ✅ **Higher-Order Functions**: map/filter/lambda usage
- ✅ **Generators**: Efficient iteration
- ✅ **Real-World Apply**: Practical finance application

---

## Bonus Challenges

**Challenge 1: Add Recursion**
Write recursive function for calculating loan payment schedules

**Challenge 2: Add Generators**
Implement transaction streaming for large datasets

**Challenge 3: Add Decorators**
Create `@require_positive` and `@log_transaction` decorators

**Challenge 4: Add Persistence**
Save/load finances to JSON file

**Challenge 5: Add Analytics**
Calculate trends, projections, and recommendations

---

## Learning Validation

By completing this project, you've demonstrated:

✅ Function definition and calls  
✅ Parameters and return values  
✅ Scope and variables  
✅ Lambda and higher-order functions  
✅ Pure vs impure functions  
✅ Closures and factories  
✅ Recursion  
✅ Generators  
✅ Decorators  
✅ Error handling  
✅ Testing and validation  
✅ Real-world application design

---

## Next Steps

- **Refine**: Add more features (saving to file, visualizations)
- **Extend**: Add more financial models (investment returns, taxes)
- **Share**: Upload to GitHub as portfolio piece
- **Continue**: Move to Lesson 1.1.32 (Milestone Test)

---

**Project Complete!** 🎉

Proceed to **Lesson 1.1.32: Milestone Test 3** when ready.
