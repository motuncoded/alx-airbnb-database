# Booking Table Partitioning Report

## Objective

Partition the large `Booking` table by `start_date` to optimize queries that filter by date ranges.

## Partitioning Implementation

- The `Booking` table is refactored as `Booking_Partitioned` and partitioned by range on the `start_date` column.
- Example partitions are created for years 2024 and 2025, plus a default partition for earlier dates.
- Indexes are added on frequently queried columns within each partition.

## Performance Testing

### Query Tested

```sql
SELECT * FROM Booking_Partitioned
WHERE start_date BETWEEN '2025-06-01' AND '2025-06-30';
```

### Observations

- **Before partitioning:**  
  The query performed a sequential scan on the entire `Booking` table, resulting in slower response times as the table grew in size.

- **After partitioning:**  
  The query planner only scans the relevant partition (e.g., `Booking_2025`) instead of the entire dataset.
  This significantly reduces I/O and improves query speed, especially for large tables.

- **EXPLAIN ANALYZE output:**  
  Shows partition pruning, scanning only the partition(s) that match the date range.

## Conclusion

Partitioning the `Booking` table by `start_date` improves query efficiency for date-based queries by limiting scans to relevant partitions. This approach is highly recommended for large, time-series-like tables in production environments.

---