# Lesson 1.1.86: Mini-Project Banking System

**Estimated Time**: 10 hours | **Difficulty**: Advanced  
**Prerequisites**: Lesson 1.1.85

---

## Learning Objectives

1. **Design** a banking system
2. **Combine** OOP concepts
3. **Implement** inheritance
4. **Use** composition
5. **Build** practical application

---

## Project Overview

Create a banking system with multiple account types, transactions, and reporting.

---

## Core Classes

### Account (Abstract Base)

```python
from abc import ABC, abstractmethod
from datetime import datetime
from typing import List

class Account(ABC):
    def __init__(self, holder_name: str, account_number: str):
        self.holder_name = holder_name
        self.account_number = account_number
        self._balance = 0.0
        self.transactions: List[dict] = []
    
    @abstractmethod
    def get_interest_rate(self) -> float:
        pass
    
    def deposit(self, amount: float) -> bool:
        if amount > 0:
            self._balance += amount
            self.transactions.append({
                'type': 'deposit',
                'amount': amount,
                'date': datetime.now(),
                'balance': self._balance
            })
            return True
        return False
    
    def withdraw(self, amount: float) -> bool:
        if 0 < amount <= self._balance:
            self._balance -= amount
            self.transactions.append({
                'type': 'withdrawal',
                'amount': amount,
                'date': datetime.now(),
                'balance': self._balance
            })
            return True
        return False
    
    @property
    def balance(self) -> float:
        return self._balance
    
    def get_statement(self) -> str:
        statement = f"=== Account Statement ===\n"
        statement += f"Holder: {self.holder_name}\n"
        statement += f"Account: {self.account_number}\n"
        statement += f"Balance: ${self._balance:.2f}\n"
        statement += f"Interest Rate: {self.get_interest_rate()}%\n"
        statement += f"Transactions: {len(self.transactions)}"
        return statement
```

### Checking Account

```python
class CheckingAccount(Account):
    def __init__(self, holder_name: str, account_number: str):
        super().__init__(holder_name, account_number)
        self.monthly_fee = 10.0
    
    def get_interest_rate(self) -> float:
        return 0.1
    
    def apply_monthly_fee(self) -> None:
        if self._balance >= self.monthly_fee:
            self._balance -= self.monthly_fee
            self.transactions.append({
                'type': 'fee',
                'amount': self.monthly_fee,
                'date': datetime.now(),
                'balance': self._balance
            })
```

### Savings Account

```python
class SavingsAccount(Account):
    def __init__(self, holder_name: str, account_number: str):
        super().__init__(holder_name, account_number)
        self.withdrawal_limit = 3
        self.withdrawals_this_month = 0
    
    def get_interest_rate(self) -> float:
        return 1.5
    
    def withdraw(self, amount: float) -> bool:
        if self.withdrawals_this_month >= self.withdrawal_limit:
            print("Withdrawal limit reached")
            return False
        
        if super().withdraw(amount):
            self.withdrawals_this_month += 1
            return True
        return False
    
    def apply_interest(self) -> None:
        interest = self._balance * (self.get_interest_rate() / 100)
        self._balance += interest
        self.transactions.append({
            'type': 'interest',
            'amount': interest,
            'date': datetime.now(),
            'balance': self._balance
        })
```

### Money Market Account

```python
class MoneyMarketAccount(Account):
    def __init__(self, holder_name: str, account_number: str):
        super().__init__(holder_name, account_number)
        self.minimum_balance = 1000.0
    
    def get_interest_rate(self) -> float:
        if self._balance >= self.minimum_balance:
            return 2.5
        return 0.5
    
    def withdraw(self, amount: float) -> bool:
        if self._balance - amount < self.minimum_balance:
            print("Insufficient balance for minimum requirement")
            return False
        return super().withdraw(amount)
```

---

## Bank Class

```python
class Bank:
    def __init__(self, name: str):
        self.name = name
        self.accounts: dict = {}
    
    def create_account(self, account_type: str, 
                      holder_name: str, 
                      account_number: str) -> Account:
        if account_number in self.accounts:
            raise ValueError("Account already exists")
        
        account_map = {
            'checking': CheckingAccount,
            'savings': SavingsAccount,
            'money_market': MoneyMarketAccount
        }
        
        account = account_map[account_type](holder_name, account_number)
        self.accounts[account_number] = account
        return account
    
    def get_account(self, account_number: str) -> Account:
        return self.accounts.get(account_number)
    
    def transfer(self, from_acc: str, to_acc: str, 
                 amount: float) -> bool:
        from_account = self.get_account(from_acc)
        to_account = self.get_account(to_acc)
        
        if from_account and to_account:
            if from_account.withdraw(amount):
                to_account.deposit(amount)
                return True
        return False
```

---

## Usage Example

```python
# Create bank
bank = Bank("Community Bank")

# Create accounts
checking = bank.create_account('checking', 'Alice', 'CHK001')
savings = bank.create_account('savings', 'Alice', 'SAV001')

# Operations
checking.deposit(1000)
savings.deposit(5000)

checking.withdraw(100)
savings.apply_interest()

# Transfer
bank.transfer('CHK001', 'SAV001', 200)

# View statements
print(checking.get_statement())
print(savings.get_statement())
```

---

## Exercise 1: Starter Level

Implement a loan tracking system alongside the bank.

---

## Exercise 2: Intermediate Level

Add transaction filtering (by date, type, amount).

---

## Exercise 3: Advanced Level

Add ATM simulation with PIN protection and rate limiting.

---

## Self-Assessment

- [ ] I design with multiple classes
- [ ] I use inheritance effectively
- [ ] I combine OOP concepts
- [ ] I build a complete system

---

**Next: [Lesson 1.1.87: MILESTONE TEST OOP Basics](Lesson-1.1.87-MILESTONE-TEST-OOP-Basics.md)**
