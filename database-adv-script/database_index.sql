CREATE INDEX idx_users_email ON users(email);
CREATE INDEX idx_users_created_at ON users(created_at);


CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);
CREATE INDEX idx_bookings_created_at ON bookings(created_at);

CREATE INDEX idx_properties_location ON properties(location);
CREATE INDEX idx_properties_price ON properties(price);


CREATE INDEX idx_bookings_user_property ON bookings(user_id, property_id);



EXPLAIN ANALYZE SELECT * FROM bookings WHERE user_id = 123;
EXPLAIN ANALYZE SELECT * FROM bookings WHERE property_id = 456 ORDER BY created_at DESC;