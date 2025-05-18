-- Initial Query: Retrieve all bookings with user, property, and payment details
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM
    Booking b
JOIN
    User u ON b.user_id = u.user_id
JOIN
    Property p ON b.property_id = p.property_id
LEFT JOIN
    Payment pay ON pay.booking_id = b.booking_id;
WHERE
    b.status = 'confirmed'
    AND pay.amount > 0;


-- Performance Analysis:
-- Run the following (PostgreSQL syntax shown, MySQL similar):
-- EXPLAIN ANALYZE
-- SELECT ... (above query) ...

-- Potential Inefficiencies:
-- - If there are many bookings, joining all user, property, and payment records may create a large result set.
-- - If not all bookings have payments yet, LEFT JOIN ensures NULLs, but if payments are sparse, this is not a major issue.
-- - Indexes on Booking.user_id, Booking.property_id, Payment.booking_id improve join speed.
-- - Avoid SELECT * to reduce data transferred.

-- Refactored Query:
-- - Only select necessary fields (already done).
-- - Use covering indexes (ensure Booking.user_id, Booking.property_id, Payment.booking_id, Property.property_id are indexed).
-- - If you only want bookings with payments, use INNER JOIN on Payment.
-- - If you want to filter for recent bookings or limit rows, add WHERE/LIMIT.

-- Example: Only show bookings from the last year (improves performance if table is large)
SELECT
    b.booking_id,
    b.start_date,
    b.end_date,
    b.total_price,
    b.status,
    u.user_id,
    u.first_name,
    u.last_name,
    u.email,
    p.property_id,
    p.name AS property_name,
    p.location,
    pay.payment_id,
    pay.amount,
    pay.payment_date,
    pay.payment_method
FROM
    Booking b
JOIN
    User u ON b.user_id = u.user_id
JOIN
    Property p ON b.property_id = p.property_id
LEFT JOIN
    Payment pay ON pay.booking_id = b.booking_id
WHERE
    b.created_at >= (CURRENT_DATE - INTERVAL '1 year')
ORDER BY
    b.created_at DESC
LIMIT 100;

-- Index Recommendations (if not present):
-- CREATE INDEX idx_booking_user ON Booking(user_id);
-- CREATE INDEX idx_booking_property ON Booking(property_id);
-- CREATE INDEX idx_payment_booking ON Payment(booking_id);
-- CREATE INDEX idx_property_id ON Property(property_id);

-- Summary:
-- 1. Query selects only needed columns.
-- 2. WHERE clause restricts rows for recent data (optional but recommended for large tables).
-- 3. Indexes on join columns ensure optimal performance.
-- 4. LIMIT prevents excessive row returns in wide queries.