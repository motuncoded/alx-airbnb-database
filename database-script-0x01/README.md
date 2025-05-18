# ALX Airbnb Database

This repository contains the database design and schema for an Airbnb-style platform, following best practices in relational database design and normalization.

## Contents

- `ERD/requirements.md`: Database requirements and specifications.
- `ERD/normalization.md`: Explanation of normalization steps to achieve 3NF.
- `ERD/schema.sql`: SQL statements to create the database schema.
- `ERD/`: Directory containing ER diagrams and related database documentation.

## Database Overview

The database is designed to support a vacation rental platform similar to Airbnb. It includes the following main entities:

- **User**: Represents platform users (guests, hosts, admins).
- **Property**: Listings posted by hosts.
- **Booking**: Reservations made by users for properties.
- **Payment**: Payment records associated with bookings.
- **Review**: Reviews left by users for properties.
- **Message**: Direct messages exchanged between users.

## Entity Relationship Diagram (ERD)

See the `ERD/` directory for the ER diagram and supporting documentation.

## Normalization

The schema has been normalized to the Third Normal Form (3NF) to ensure data integrity and eliminate redundancy. See `ERD/normalization_steps.md` for details.

## Database Schema

The schema uses standard SQL and includes:

- Appropriate data types
- Primary and foreign keys
- Unique and not-null constraints
- Check constraints for ENUM-like fields
- Indexes on frequently queried fields

See `ERD/schema.sql` for the full implementation.

## Getting Started

1. Clone this repository.
2. Review the SQL schema in `ERD/schema.sql`.
3. Use the SQL file to create the database in your preferred RDBMS (e.g., PostgreSQL, MySQL).
4. Adapt the schema as necessary for your application’s requirements.

## License

This project is for educational purposes as part of the ALX program.

## Authors

- [motuncoded](https://github.com/motuncoded)

---