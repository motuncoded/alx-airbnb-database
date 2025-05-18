# Database Seed Script

This directory contains SQL scripts to populate the Airbnb database with sample data for development and testing purposes.

## Files

- `seed.sql`: Inserts sample records into all tables (`User`, `Property`, `Booking`, `Payment`, `Review`, `Message`).

## Usage

1. Ensure the database schema is already created (see `../ERD/schema.sql`).
2. Run the seed script in your SQL client or via the command line:

   ```sh
   psql -d your_database -f seed.sql
   ```

   or for MySQL:

   ```sh
   mysql -u username -p your_database < seed.sql
   ```

3. The script will populate the tables with realistic sample data for testing queries and application features.

## Sample Data Notes

- Multiple users (guests and hosts), properties, bookings, payments, reviews, and messages are included.
- All foreign keys reference valid sample records.
- Data reflects typical Airbnb usage scenarios.

---