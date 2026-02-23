# Lesson 1.1.49: Mini-Project: Data Organizer

**Estimated Time**: 8 hours | **Difficulty**: Advanced  
**Prerequisites**: Lessons 1.1.39-1.1.48 (All Data Structures concepts)

---

## Learning Objectives

By the end of this lesson, you will be able to:
- Combine multiple data structures effectively
- Solve real-world problems with collections
- Apply sorting and filtering techniques
- Build a functional data management system
- Optimize data structure choices
- Implement complex features

---

## 1. Project Overview (30 min)

### 1.1 The Problem

Build a comprehensive **Data Organizer** application that:
- Stores contact information
- Organizes contacts by category
- Enables fast searching and filtering
- Maintains sorted lists
- Generates reports

### 1.2 Data Structure Design

```python
# Contact structure
contact = {
    "id": 1,
    "name": "Alice Smith",
    "email": "alice@example.com",
    "phone": "555-1234",
    "category": "work",
    "tags": {"colleague", "team-lead"},
    "created": "2024-01-15"
}

# Organizer architecture
app = {
    "contacts": {},          # id -> contact
    "email_index": {},       # email -> id (fast lookup)
    "category_index": {},    # category -> set of ids
    "tag_index": {},         # tag -> set of ids
    "name_index": {}         # name -> id (for sorting)
}
```

---

## 2. Part 1: Building the Contact Class (2 hours)

### 2.1 Basic Contact Class

```python
from datetime import datetime
from typing import set, dict, list

class Contact:
    """Represents a single contact"""
    
    # Class variable for auto-incrementing ID
    _id_counter = 1
    
    def __init__(self, name: str, email: str, phone: str,
                 category: str = "personal", tags: set = None):
        self.id = Contact._id_counter
        Contact._id_counter += 1
        self.name = name
        self.email = email
        self.phone = phone
        self.category = category
        self.tags = tags or set()
        self.created = datetime.now()
    
    def add_tag(self, tag: str):
        """Add tag to contact"""
        self.tags.add(tag.lower())
    
    def remove_tag(self, tag: str):
        """Remove tag from contact"""
        self.tags.discard(tag.lower())
    
    def has_tag(self, tag: str) -> bool:
        """Check if contact has tag"""
        return tag.lower() in self.tags
    
    def __repr__(self):
        return f"Contact({self.name}, {self.email})"
    
    def to_dict(self):
        """Convert to dictionary"""
        return {
            "id": self.id,
            "name": self.name,
            "email": self.email,
            "phone": self.phone,
            "category": self.category,
            "tags": list(self.tags),
            "created": self.created.isoformat()
        }

# Test Contact class
contact1 = Contact("Alice Smith", "alice@example.com", "555-1234", "work")
contact1.add_tag("team-lead")
contact1.add_tag("colleague")

print(contact1)  # Contact(Alice Smith, alice@example.com)
print(contact1.tags)  # {'team-lead', 'colleague'}
```

---

## 3. Part 2: Building the Organizer (3 hours)

### 3.1 Core Organizer Class

```python
class ContactOrganizer:
    """Manages contact database with multiple indices"""
    
    def __init__(self):
        self.contacts = {}           # id -> Contact
        self.email_index = {}        # email -> id
        self.category_index = {}     # category -> set of ids
        self.tag_index = {}          # tag -> set of ids
    
    def add_contact(self, contact: Contact) -> bool:
        """Add contact to organizer"""
        # Check if email already exists
        if contact.email in self.email_index:
            return False
        
        # Add contact
        contact_id = contact.id
        self.contacts[contact_id] = contact
        self.email_index[contact.email] = contact_id
        
        # Update category index
        if contact.category not in self.category_index:
            self.category_index[contact.category] = set()
        self.category_index[contact.category].add(contact_id)
        
        # Update tag index
        for tag in contact.tags:
            if tag not in self.tag_index:
                self.tag_index[tag] = set()
            self.tag_index[tag].add(contact_id)
        
        return True
    
    def remove_contact(self, contact_id: int) -> bool:
        """Remove contact by ID"""
        if contact_id not in self.contacts:
            return False
        
        contact = self.contacts[contact_id]
        
        # Remove from indices
        del self.email_index[contact.email]
        self.category_index[contact.category].discard(contact_id)
        for tag in contact.tags:
            self.tag_index[tag].discard(contact_id)
        
        # Remove contact
        del self.contacts[contact_id]
        return True
    
    def find_by_id(self, contact_id: int) -> Contact:
        """Find contact by ID - O(1)"""
        return self.contacts.get(contact_id)
    
    def find_by_email(self, email: str) -> Contact:
        """Find contact by email - O(1)"""
        contact_id = self.email_index.get(email)
        return self.contacts.get(contact_id) if contact_id else None
    
    def find_by_category(self, category: str) -> list:
        """Find all contacts in category - O(n)"""
        ids = self.category_index.get(category, set())
        return [self.contacts[id] for id in ids]
    
    def find_by_tag(self, tag: str) -> list:
        """Find all contacts with tag - O(n)"""
        ids = self.tag_index.get(tag.lower(), set())
        return [self.contacts[id] for id in ids]
    
    def find_by_name(self, pattern: str) -> list:
        """Find contacts matching name pattern"""
        pattern_lower = pattern.lower()
        return [c for c in self.contacts.values()
                if pattern_lower in c.name.lower()]
    
    def get_all_contacts(self) -> list:
        """Return all contacts"""
        return list(self.contacts.values())

# Test Organizer
organizer = ContactOrganizer()

# Add contacts
alice = Contact("Alice Smith", "alice@example.com", "555-1111", "work")
alice.add_tag("team-lead")
alice.add_tag("colleague")

bob = Contact("Bob Johnson", "bob@example.com", "555-2222", "work")
bob.add_tag("colleague")

carol = Contact("Carol White", "carol@example.com", "555-3333", "personal")

organizer.add_contact(alice)
organizer.add_contact(bob)
organizer.add_contact(carol)

# Fast lookups
print(organizer.find_by_email("alice@example.com"))  # O(1)
print(organizer.find_by_category("work"))            # O(1) + O(n)
print(organizer.find_by_tag("colleague"))            # O(1) + O(n)
```

---

## 4. Part 3: Advanced Features (2 hours)

### 4.1 Sorting and Filtering

```python
class ContactOrganizer:
    # ... previous code ...
    
    def sort_contacts(self, contacts: list, by: str = "name",
                      reverse: bool = False) -> list:
        """Sort contacts by field"""
        if by == "name":
            key = lambda c: c.name.lower()
        elif by == "category":
            key = lambda c: (c.category, c.name)
        elif by == "created":
            key = lambda c: c.created
        else:
            key = lambda c: c.name
        
        return sorted(contacts, key=key, reverse=reverse)
    
    def get_all_categories(self) -> set:
        """Get all unique categories"""
        return set(self.category_index.keys())
    
    def get_all_tags(self) -> set:
        """Get all unique tags"""
        return set(self.tag_index.keys())
    
    def filter_by_multiple_tags(self, tags: set,
                                match_all: bool = True) -> list:
        """Find contacts with tags (match all or any)"""
        if match_all:
            # Contact must have ALL tags
            result = set(self.contacts.keys())
            for tag in tags:
                result &= self.tag_index.get(tag, set())
        else:
            # Contact must have ANY tag
            result = set()
            for tag in tags:
                result |= self.tag_index.get(tag, set())
        
        return [self.contacts[id] for id in result]
    
    def generate_report(self, sort_by: str = "name") -> str:
        """Generate text report of all contacts"""
        report = "=" * 60 + "\n"
        report += "CONTACT REPORT\n"
        report += "=" * 60 + "\n\n"
        
        by_category = {}
        for contact in self.contacts.values():
            cat = contact.category
            if cat not in by_category:
                by_category[cat] = []
            by_category[cat].append(contact)
        
        # Sort within each category
        for category in sorted(by_category.keys()):
            contacts = self.sort_contacts(by_category[category], by=sort_by)
            report += f"\n{category.upper()}\n"
            report += "-" * 40 + "\n"
            
            for contact in contacts:
                report += f"Name:      {contact.name}\n"
                report += f"Email:     {contact.email}\n"
                report += f"Phone:     {contact.phone}\n"
                if contact.tags:
                    report += f"Tags:      {', '.join(sorted(contact.tags))}\n"
                report += "\n"
        
        return report

# Generate report
print(organizer.generate_report())
```

---

## 5. Part 4: Statistics and Analytics (1 hour)

### 5.1 Statistics Methods

```python
class ContactOrganizer:
    # ... previous code ...
    
    def get_statistics(self) -> dict:
        """Generate statistics about contacts"""
        stats = {
            "total_contacts": len(self.contacts),
            "categories": len(self.category_index),
            "tags": len(self.tag_index),
            "by_category": {},
            "popular_tags": []
        }
        
        # Count by category
        for category, ids in self.category_index.items():
            stats["by_category"][category] = len(ids)
        
        # Popular tags (sorted by frequency)
        tag_counts = [(tag, len(ids))
                      for tag, ids in self.tag_index.items()]
        stats["popular_tags"] = sorted(tag_counts, key=lambda x: x[1],
                                       reverse=True)
        
        return stats
    
    def export_to_csv(self, filename: str):
        """Export contacts to CSV file"""
        import csv
        with open(filename, 'w', newline='') as f:
            writer = csv.DictWriter(f, fieldnames=['name', 'email', 'phone',
                                                     'category', 'tags'])
            writer.writeheader()
            for contact in self.sort_contacts(self.get_all_contacts()):
                writer.writerow({
                    'name': contact.name,
                    'email': contact.email,
                    'phone': contact.phone,
                    'category': contact.category,
                    'tags': ', '.join(sorted(contact.tags))
                })

# Get statistics
stats = organizer.get_statistics()
print(f"Total contacts: {stats['total_contacts']}")
print(f"By category: {stats['by_category']}")
print(f"Popular tags: {stats['popular_tags']}")
```

---

## 6. Part 5: Complete Application (1 hour)

### 6.1 Main Application Loop

```python
def main():
    """Main application"""
    organizer = ContactOrganizer()
    
    # Sample data
    sample_contacts = [
        ("Alice Smith", "alice@example.com", "555-1111", "work", {"team-lead", "colleague"}),
        ("Bob Johnson", "bob@example.com", "555-2222", "work", {"colleague"}),
        ("Carol White", "carol@example.com", "555-3333", "personal", {"friend"}),
        ("David Brown", "david@example.com", "555-4444", "work", {"colleague", "mentor"}),
        ("Eve Davis", "eve@example.com", "555-5555", "personal", {"friend", "family"}),
    ]
    
    # Populate
    for name, email, phone, category, tags in sample_contacts:
        contact = Contact(name, email, phone, category, tags)
        organizer.add_contact(contact)
    
    # Interactive menu
    while True:
        print("\n" + "="*50)
        print("CONTACT ORGANIZER")
        print("="*50)
        print("1. List all contacts")
        print("2. Search by email")
        print("3. Search by category")
        print("4. Search by tag")
        print("5. Add contact")
        print("6. Generate report")
        print("7. View statistics")
        print("8. Exit")
        
        choice = input("\nEnter choice (1-8): ").strip()
        
        if choice == "1":
            contacts = organizer.sort_contacts(organizer.get_all_contacts())
            for contact in contacts:
                print(f"{contact.name:<20} {contact.email:<25} {contact.phone}")
        
        elif choice == "2":
            email = input("Enter email: ").strip()
            contact = organizer.find_by_email(email)
            if contact:
                print(f"Found: {contact.name}, {contact.phone}")
            else:
                print("Not found")
        
        elif choice == "3":
            category = input("Enter category: ").strip()
            contacts = organizer.find_by_category(category)
            for contact in sorted(contacts, key=lambda c: c.name):
                print(f"  {contact.name}")
        
        elif choice == "4":
            tag = input("Enter tag: ").strip()
            contacts = organizer.find_by_tag(tag)
            for contact in sorted(contacts, key=lambda c: c.name):
                print(f"  {contact.name}")
        
        elif choice == "5":
            name = input("Name: ").strip()
            email = input("Email: ").strip()
            phone = input("Phone: ").strip()
            category = input("Category: ").strip() or "personal"
            contact = Contact(name, email, phone, category)
            if organizer.add_contact(contact):
                print("Contact added!")
            else:
                print("Email already exists!")
        
        elif choice == "6":
            print(organizer.generate_report())
        
        elif choice == "7":
            stats = organizer.get_statistics()
            print(f"Total contacts: {stats['total_contacts']}")
            print(f"Categories: {stats['by_category']}")
            print(f"Top tags: {stats['popular_tags'][:5]}")
        
        elif choice == "8":
            break
        
        else:
            print("Invalid choice")

if __name__ == "__main__":
    main()
```

---

## 7. Project Extensions

### Extension Ideas:
1. **Persistence**: Save/load contacts from JSON file
2. **Advanced Search**: Full-text search across all fields
3. **Duplicate Detection**: Find similar contacts
4. **Merge Contacts**: Combine duplicate records
5. **Contact Groups**: Create dynamic groups
6. **Export Formats**: CSV, JSON, vCard
7. **Undo/Redo**: Track changes
8. **Backup**: Automatic backups

---

## 8. Self-Assessment Checklist

- [ ] I can design data structures for real problems
- [ ] I understand index trade-offs
- [ ] I can implement fast lookup systems
- [ ] I can combine multiple structures
- [ ] I can generate reports

---

## 9. Submission Guidelines

**Your submission should include:**
1. Fully functional `ContactOrganizer` class
2. `Contact` data class
3. All required methods implemented
4. At least 3 additional features (sorting, filtering, reporting)
5. Clean, well-documented code
6. Test data and sample usage

**Evaluation Criteria:**
- Functionality: Does it work? (30%)
- Code Quality: Is it clean and efficient? (25%)
- Features: How many extensions? (20%)
- Documentation: Is it clear? (15%)
- Error Handling: Does it handle edge cases? (10%)

---

**Next Lesson:** Lesson 1.1.50 - MILESTONE TEST: Data Structures




