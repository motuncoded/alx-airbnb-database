-- Indexes for User, Booking, and Property tables to improve query performance

-- User table indexes
CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_created_at ON users(created_at);

-- Booking table indexes
CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);

-- Property table indexes
CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(price);

-- Composite index example (if queries often filter by both user_id and property_id together)
CREATE INDEX idx_bookings_user_property ON bookings(user_id, property_id);

-- Example usage of EXPLAIN to measure performance:
-- Before and after adding indexes, run:
-- EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 123;
-- EXPLAIN ANALYZE SELECT * FROM bookings WHERE property_id = 456 ORDER BY created_at DESC;