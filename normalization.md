# Normalization Steps to Achieve 3NF for AirBnB Database


## Introduction

This document outlines the normalization process applied to the AirBnB database schema. The goal is to ensure the schema adheres to the Third Normal Form (3NF), eliminating redundancies and ensuring data integrity.

---

## 1. First Normal Form (1NF)

**Requirements:**
- Each table must have a primary key.
- Each attribute must contain atomic (indivisible) values.
- No repeating groups or arrays.

**Analysis:**
- All entities (User, Property, Booking, Payment, Review, Message) have unique primary keys.
- All attributes are atomic (e.g., `first_name`, `pricepernight`, `role`).
- No repeating groups or arrays are present.

**Conclusion:**  
The schema satisfies 1NF.

---

## 2. Second Normal Form (2NF)

**Requirements:**
- The table must be in 1NF.
- All non-key attributes must be fully functionally dependent on the whole of every candidate key.

**Analysis:**
- All tables have single-attribute primary keys (UUIDs).
- All non-key attributes depend entirely on their table's primary key (e.g., `email` depends on `user_id`, not part of a composite key).

**Conclusion:**  
The schema satisfies 2NF.

---

## 3. Third Normal Form (3NF)

**Requirements:**
- The table must be in 2NF.
- There must be no transitive dependencies (non-key attributes depend only on the primary key).

**Analysis & Adjustments:**

### User Table
- All attributes depend on `user_id`.
- No transitive dependencies.
- **No changes needed.**

### Property Table
- All attributes depend on `property_id`.
- `host_id` is a foreign key referencing `User(user_id)`, representing the host.
- No transitive dependencies.
- **No changes needed.**

### Booking Table
- All attributes depend on `booking_id`.
- `property_id` and `user_id` are foreign keys, referencing related entities.
- No transitive dependencies.
- **No changes needed.**

### Payment Table
- All attributes depend on `payment_id`.
- `booking_id` is a foreign key.
- No transitive dependencies.
- **No changes needed.**

### Review Table
- All attributes depend on `review_id`.
- `property_id` and `user_id` are foreign keys.
- No transitive dependencies.
- **No changes needed.**

### Message Table
- All attributes depend on `message_id`.
- `sender_id` and `recipient_id` are foreign keys.
- No transitive dependencies.
- **No changes needed.**

---

## Summary of Findings

- **No partial dependencies** exist, as all tables use single-attribute primary keys.
- **No transitive dependencies** are present; all non-key attributes depend only on the primary key of their respective tables.
- **No repeating groups** or non-atomic values exist.

---

## Conclusion

**The provided AirBnB database schema is already in Third Normal Form (3NF).**  
No further normalization steps are necessary. The current design ensures minimal redundancy, maintains data integrity, and supports efficient data operations.

---