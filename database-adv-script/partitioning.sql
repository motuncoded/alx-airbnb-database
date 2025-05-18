-- Partition the Booking table by start_date (PostgreSQL syntax)

-- 1. Create the partitioned parent table
CREATE TABLE Booking_Partitioned (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL,
    status VARCHAR(10) NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_booking_property FOREIGN KEY (property_id) REFERENCES Property(property_id),
    CONSTRAINT fk_booking_user FOREIGN KEY (user_id) REFERENCES User(user_id)
) PARTITION BY RANGE (start_date);

-- 2. Create child partitions (example: yearly partitioning for 2024, 2025, default)
CREATE TABLE Booking_2024 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

CREATE TABLE Booking_2025 PARTITION OF Booking_Partitioned
    FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');

CREATE TABLE Booking_default PARTITION OF Booking_Partitioned
    FOR VALUES FROM (MINVALUE) TO ('2024-01-01');

-- 3. (Optional) Move existing data from Booking to Booking_Partitioned using INSERT INTO ... SELECT ...

-- 4. (Optional) Drop or archive the old Booking table after migration and verification.

-- 5. Indexes on partitioned tables (for best performance)
CREATE INDEX idx_booking_2024_property ON Booking_2024(property_id);
CREATE INDEX idx_booking_2025_property ON Booking_2025(property_id);
CREATE INDEX idx_booking_2024_user ON Booking_2024(user_id);
CREATE INDEX idx_booking_2025_user ON Booking_2025(user_id);

-- 6. Example query to test performance (fetch bookings in 2025)
EXPLAIN ANALYZE
SELECT * FROM Booking_Partitioned
WHERE start_date BETWEEN '2025-06-01' AND '2025-06-30';

-- Only the relevant partition (Booking_2025) will be scanned, improving performance.
