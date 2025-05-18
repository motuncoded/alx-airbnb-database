# Database Sample Data & Performance Scripts

This directory contains SQL scripts for populating and testing the AirBnB-style database.

## Files

- `seed.sql`  
  Populates the database with realistic sample data for all tables:
  - **User**
  - **Property**
  - **Booking**
  - **Payment**
  - **Review**
  - **Message**

- `perfomance.sql`  
  Contains example complex queries (such as joining bookings, users, properties, and payments), their performance analysis, and refactored versions for improved efficiency.

## Usage

1. **Set up the schema**  
   Run the schema creation script from `../ERD/schema.sql` in your SQL client.

2. **Insert sample data**  
   Execute:
   ```sh
   psql -d your_database -f seed.sql
   ```
   or for MySQL:
   ```sh
   mysql -u username -p your_database < seed.sql
   ```

3. **Test performance**  
   - Use the queries in `perfomance.sql` to analyze and improve query speed.
   - Run `EXPLAIN` or `EXPLAIN ANALYZE` in your SQL client to view query plans.

## Notes

- Sample data includes multiple users, properties, bookings, messages, and payments for realistic testing.
- You can modify or extend the data as needed for your use case.
- Performance scripts include index recommendations and best practices.

---