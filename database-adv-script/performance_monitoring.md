# Database Performance Monitoring and Refinement

## Objective

Continuously monitor and refine database performance by analyzing query execution plans and making schema adjustments.

---

## 1. Monitor Query Performance

Use SQL commands such as `EXPLAIN`, `EXPLAIN ANALYZE`, or `SHOW PROFILE` (depending on your SQL dialect) to review query execution plans.

### Example: Analyze Frequently Used Queries

#### a. Query: Fetch Bookings for a User

```sql
EXPLAIN ANALYZE
SELECT * FROM bookings WHERE user_id = 123;
```

#### b. Query: Properties with Average Rating > 4.0

```sql
EXPLAIN ANALYZE
SELECT * FROM properties
WHERE id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);
```

#### c. Query: All Properties and Reviews (LEFT JOIN)

```sql
EXPLAIN ANALYZE
SELECT properties.*, reviews.*
FROM properties
LEFT JOIN reviews ON properties.id = reviews.property_id;
```

---

## 2. Identify Bottlenecks

After running `EXPLAIN ANALYZE`:

- Look for **full table scans**, **high cost**, or **large number of rows examined**.
- Common bottlenecks:  
  - Missing indexes on columns used in `WHERE`, `JOIN`, or `ORDER BY`.
  - Inefficient joins or subqueries.
  - Unnecessary SELECT * (fetching more columns than needed).

---

## 3. Suggested Improvements

### a. Indexes

Create indexes on high-usage columns to speed up lookups and joins.

```sql
-- Bookings table
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Reviews table
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- Properties table (if filtering by location or ordering by price)
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(price);
```

### b. Schema Adjustments

- Consider normalizing or denormalizing tables based on query patterns.
- Use covering indexes for frequently queried columns.

---

## 4. Implement Changes

Apply the suggested indexes and adjustments using `CREATE INDEX` or `ALTER TABLE` commands.

---

## 5. Report Improvements

After implementing changes, rerun `EXPLAIN ANALYZE` on your queries to observe improvements.

**Example Before and After:**

| Query                                    | Before (ms) | After (ms) |
|-------------------------------------------|-------------|------------|
| SELECT * FROM bookings WHERE user_id = ?  |   120       |   5        |
| LEFT JOIN properties and reviews          |   200       |   30       |

Improvements observed:
- Query execution time reduced significantly.
- Fewer rows examined due to targeted indexes.
- Query plan now shows use of indexes instead of full table scans.

---

## Continuous Monitoring

- Regularly monitor slow query logs and execution plans.
- Adjust indexes and schema as data grows and query patterns change.
- Remove unused indexes to avoid unnecessary overhead.

---

**Tip:** Document all changes and their impact for future reference and team knowledge sharing.