## Entities and Attributes
This document outlines the entities and their attributes for the database schema of a property booking application. The schema is designed to support the core functionalities of user management, property listings, bookings, payments, reviews, and messaging.

### 1. **User**
- user_id (PK)
- first_name
- last_name
- email (UNIQUE, Indexed)
- password_hash
- phone_number
- role (ENUM: guest, host, admin)
- created_at

### 2. Property
- property_id (PK)
- host_id (FK → User.user_id)
- name
- description
- location
- pricepernight
- created_at
- updated_at

### 3. Booking
- booking_id (PK)
- property_id (FK → Property.property_id)
- user_id (FK → User.user_id)
- start_date
- end_date
- total_price
- status (ENUM: pending, confirmed, canceled)
- created_at

### 4. Payment
- payment_id (PK)
- booking_id (FK → Booking.booking_id)
- amount
- payment_date
- payment_method (ENUM: credit_card, paypal, stripe)

### 5. Review
- review_id (PK)
- property_id (FK → Property.property_id)
- user_id (FK → User.user_id)
- rating (1–5)
- comment
- created_at

### 6. Message
- message_id (PK)
- sender_id (FK → User.user_id)
- recipient_id (FK → User.user_id)
- message_body
- sent_at



## Relationships
This section describes the relationships between the entities in the database schema.

- User ↔ Booking: 1-to-Many (A user can have many bookings, a booking belongs to one user)
- User ↔ Property (host_id): 1-to-Many (A host can have many properties, a property belongs to one host)
- Property ↔ Booking: 1-to-Many (A property can have many bookings, a booking is for one property)
- Booking ↔ Payment: 1-to-1 (Each payment is for one booking, each booking can have one payment)
- Property ↔ Review: 1-to-Many (A property can have many reviews, a review is for one property)
- User ↔ Review: 1-to-Many (A user can write many reviews, a review is written by one user)
- User ↔ Message (sender/recipient): Many-to-Many (A user can send/receive many messages from/to other users)

---
<br/>

![ER Diagram](/requirement.png)
