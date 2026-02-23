# Lesson 1.1.102: CAPSTONE PROJECT Testing Best Practices

**Estimated Time**: 10 hours | **Difficulty**: Advanced  
**Prerequisites**: All Topic 10 lessons (1.1.98-1.1.101)

---

## Learning Objectives

1. **Build** comprehensive test suites
2. **Combine** all testing concepts
3. **Apply** best practices
4. **Test** real applications
5. **Achieve** professional testing

---

## Project Overview

Build and test an order management system with full test coverage.

---

## Core Implementation

### orders.py

```python
"""Order management system."""

class Order:
    """Represents a customer order."""
    
    def __init__(self, order_id: str, customer_name: str):
        self.order_id = order_id
        self.customer_name = customer_name
        self.items = []
        self.total = 0.0
        self.status = 'pending'
    
    def add_item(self, product: str, price: float, quantity: int = 1):
        """Add item to order."""
        if price <= 0:
            raise ValueError("Price must be positive")
        if quantity <= 0:
            raise ValueError("Quantity must be positive")
        
        self.items.append({
            'product': product,
            'price': price,
            'quantity': quantity
        })
        self._recalculate_total()
    
    def get_item_count(self) -> int:
        """Get total number of items."""
        return sum(item['quantity'] for item in self.items)
    
    def _recalculate_total(self):
        """Recalculate order total."""
        self.total = sum(
            item['price'] * item['quantity'] 
            for item in self.items
        )
    
    def apply_discount(self, percent: float):
        """Apply discount to order."""
        if not (0 <= percent <= 100):
            raise ValueError("Discount percent must be 0-100")
        discount_amount = self.total * (percent / 100)
        self.total -= discount_amount
    
    def process(self):
        """Process the order."""
        if not self.items:
            raise ValueError("Cannot process empty order")
        self.status = 'processed'
    
    def cancel(self):
        """Cancel the order."""
        if self.status == 'shipped':
            raise ValueError("Cannot cancel shipped order")
        self.status = 'cancelled'


class OrderManager:
    """Manages multiple orders."""
    
    def __init__(self):
        self.orders = {}
    
    def create_order(self, order_id: str, customer_name: str) -> Order:
        """Create new order."""
        if order_id in self.orders:
            raise ValueError(f"Order {order_id} already exists")
        order = Order(order_id, customer_name)
        self.orders[order_id] = order
        return order
    
    def get_order(self, order_id: str) -> Order:
        """Retrieve order by ID."""
        if order_id not in self.orders:
            raise KeyError(f"Order {order_id} not found")
        return self.orders[order_id]
    
    def get_pending_orders(self) -> list:
        """Get all pending orders."""
        return [o for o in self.orders.values() if o.status == 'pending']
    
    def total_revenue(self) -> float:
        """Calculate total revenue from processed orders."""
        return sum(
            order.total for order in self.orders.values()
            if order.status == 'processed'
        )
```

---

## Comprehensive Test Suite

### test_orders.py

```python
"""Tests for order management system."""

import pytest
from orders import Order, OrderManager


class TestOrder:
    """Test Order class."""
    
    @pytest.fixture
    def order(self):
        """Create fresh order for each test."""
        return Order('ORD001', 'Alice')
    
    def test_order_creation(self, order):
        """Test order is created correctly."""
        assert order.order_id == 'ORD001'
        assert order.customer_name == 'Alice'
        assert order.total == 0.0
        assert order.status == 'pending'
        assert order.items == []
    
    def test_add_single_item(self, order):
        """Test adding item to order."""
        order.add_item('Widget', 10.0)
        assert len(order.items) == 1
        assert order.total == 10.0
    
    def test_add_multiple_items(self, order):
        """Test adding multiple items."""
        order.add_item('Widget', 10.0)
        order.add_item('Gadget', 20.0, quantity=2)
        assert order.get_item_count() == 3
        assert order.total == 50.0
    
    def test_add_item_invalid_price(self, order):
        """Test adding item with invalid price."""
        with pytest.raises(ValueError):
            order.add_item('Product', -10.0)
    
    def test_add_item_invalid_quantity(self, order):
        """Test adding item with invalid quantity."""
        with pytest.raises(ValueError):
            order.add_item('Product', 10.0, quantity=0)
    
    def test_apply_discount(self, order):
        """Test applying discount."""
        order.add_item('Item', 100.0)
        order.apply_discount(10)
        assert order.total == 90.0
    
    def test_apply_invalid_discount(self, order):
        """Test invalid discount value."""
        with pytest.raises(ValueError):
            order.apply_discount(150)
    
    def test_process_order(self, order):
        """Test processing order."""
        order.add_item('Item', 10.0)
        order.process()
        assert order.status == 'processed'
    
    def test_process_empty_order(self, order):
        """Test processing empty order fails."""
        with pytest.raises(ValueError):
            order.process()
    
    def test_cancel_pending_order(self, order):
        """Test canceling pending order."""
        order.cancel()
        assert order.status == 'cancelled'
    
    def test_cancel_shipped_order(self, order):
        """Test cannot cancel shipped order."""
        order.status = 'shipped'
        with pytest.raises(ValueError):
            order.cancel()
    
    @pytest.mark.parametrize('discount', [0, 10, 50, 100])
    def test_discount_ranges(self, order, discount):
        """Test various discount percentages."""
        order.add_item('Item', 100.0)
        order.apply_discount(discount)
        expected = 100.0 * (1 - discount / 100)
        assert order.total == expected


class TestOrderManager:
    """Test OrderManager class."""
    
    @pytest.fixture
    def manager(self):
        """Create fresh manager for each test."""
        return OrderManager()
    
    def test_create_order(self, manager):
        """Test creating order."""
        order = manager.create_order('ORD001', 'Alice')
        assert order.order_id == 'ORD001'
        assert 'ORD001' in manager.orders
    
    def test_create_duplicate_order(self, manager):
        """Test cannot create duplicate."""
        manager.create_order('ORD001', 'Alice')
        with pytest.raises(ValueError):
            manager.create_order('ORD001', 'Bob')
    
    def test_get_order(self, manager):
        """Test retrieving order."""
        manager.create_order('ORD001', 'Alice')
        order = manager.get_order('ORD001')
        assert order.customer_name == 'Alice'
    
    def test_get_nonexistent_order(self, manager):
        """Test getting nonexistent order."""
        with pytest.raises(KeyError):
            manager.get_order('INVALID')
    
    def test_get_pending_orders(self, manager):
        """Test filtering pending orders."""
        order1 = manager.create_order('ORD001', 'Alice')
        order2 = manager.create_order('ORD002', 'Bob')
        order1.process()
        
        pending = manager.get_pending_orders()
        assert len(pending) == 1
        assert pending[0].order_id == 'ORD002'
    
    def test_total_revenue(self, manager):
        """Test calculating revenue."""
        order1 = manager.create_order('ORD001', 'Alice')
        order1.add_item('Item', 100.0)
        order1.process()
        
        order2 = manager.create_order('ORD002', 'Bob')
        order2.add_item('Item', 50.0)
        order2.process()
        
        order3 = manager.create_order('ORD003', 'Carol')
        order3.add_item('Item', 75.0)  # Not processed
        
        assert manager.total_revenue() == 150.0


class TestIntegration:
    """Integration tests."""
    
    def test_complete_workflow(self):
        """Test complete order workflow."""
        manager = OrderManager()
        
        # Customer 1 places order
        order1 = manager.create_order('ORD001', 'Alice')
        order1.add_item('Laptop', 999.99)
        order1.add_item('Mouse', 29.99)
        assert order1.total == 1029.98
        
        # Apply discount
        order1.apply_discount(10)
        assert order1.total == pytest.approx(926.982)
        
        # Process order
        order1.process()
        assert order1.status == 'processed'
        
        # Customer 2 places order
        order2 = manager.create_order('ORD002', 'Bob')
        order2.add_item('Keyboard', 79.99)
        
        # Check stats
        pending = manager.get_pending_orders()
        assert len(pending) == 1
        assert manager.total_revenue() == order1.total
```

---

## Running Tests

```bash
# Install dependencies
pip install pytest pytest-cov

# Run all tests
pytest test_orders.py

# Run with coverage
pytest --cov=orders test_orders.py

# Run specific test
pytest test_orders.py::TestOrder::test_add_single_item

# Verbose output
pytest -v test_orders.py
```

---

## Testing Checklist

- [ ] Unit tests for all functions
- [ ] Edge cases covered
- [ ] Error conditions tested
- [ ] Integration tests included
- [ ] 80%+ code coverage
- [ ] Tests are independent
- [ ] Fixtures used properly
- [ ] Descriptive test names
- [ ] Assertions specific
- [ ] Documentation clear

---

## Best Practices Summary

1. **Test Organization**: Group related tests in classes
2. **Fixtures**: Use fixtures for setup and teardown
3. **Naming**: Descriptive test names (test_*)
4. **Coverage**: Aim for 80%+ code coverage
5. **Independence**: Tests should not depend on each other
6. **Edge Cases**: Test boundaries and error conditions
7. **Documentation**: Clear assertions and comments
8. **Parametrization**: Use parametrize for multiple cases
9. **Mocking**: Mock external dependencies
10. **Continuous**: Run tests automatically

---

## Self-Assessment

- [ ] I build comprehensive test suites
- [ ] I combine testing concepts
- [ ] I apply best practices
- [ ] I achieve high code coverage
- [ ] I test real applications

---

**Course Complete!** 102/102 lessons ✓

---

## Reflection: Your Python Journey

You have completed comprehensive Python training covering:

**Fundamentals** → Variables, Types, Control Flow, Functions  
**Data Structures** → Lists, Dicts, Sets, Files  
**Advanced** → Error Handling, OOP, Modules  
**Professional** → Testing, Environments, Best Practices  

**Next Steps**:
- Practice projects with real data
- Contribute to open source
- Specialize in web, data science, or DevOps
- Build your portfolio

**Congratulations!** 🎉
