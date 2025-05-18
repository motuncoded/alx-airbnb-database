# SQL Joins Mastery

## Objective
Master SQL joins by writing complex queries using different types of joins.

## Instructions

1. **INNER JOIN:**  
   Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.

2. **LEFT JOIN:**  
   Write a query using a LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.

3. **FULL OUTER JOIN:**  
   Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.

4. **NON-CORRELATED SUBQUERY:**  
   Write a query using a non-correlated subquery to find all properties with an average review rating greater than 4.

---

## Example Queries

### 1. INNER JOIN – Bookings and Users

```sql
SELECT
    bookings.*,
    users.*
FROM
    bookings
INNER JOIN
    users
ON
    bookings.user_id = users.id;
```

### 2. LEFT JOIN – Properties and Reviews

```sql
SELECT
    properties.*,
    reviews.*
FROM
    properties
LEFT JOIN
    reviews
ON
    properties.id = reviews.property_id;
```

### 3. FULL OUTER JOIN – Users and Bookings

```sql
SELECT
    users.*,
    bookings.*
FROM
    users
FULL OUTER JOIN
    bookings
ON
    users.id = bookings.user_id;
```

> **Note:** If your SQL database does not support `FULL OUTER JOIN` (e.g., MySQL), use:
> 
> ```sql
> SELECT users.*, bookings.*
> FROM users
> LEFT JOIN bookings ON users.id = bookings.user_id
> UNION
> SELECT users.*, bookings.*
> FROM bookings
> LEFT JOIN users ON bookings.user_id = users.id;
> ```



### 4. Non-correlated Subquery – Properties with Average Rating > 4.0

```sql
SELECT *
FROM properties
WHERE id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);
```

### 5. Correlated Subquery – Users with More Than 3 Bookings

```sql
SELECT *
FROM users u
WHERE (
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.id
) > 3;
```
---


## Requirements

- Basic knowledge of SQL syntax
- Access to a SQL database (e.g., PostgreSQL, MySQL, SQL Server)

---

## License

MIT