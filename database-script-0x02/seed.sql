-- Sample data for User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at) VALUES
('11111111-1111-1111-1111-111111111111', 'Alice', 'Johnson', 'alice@example.com', 'hash_alice', '555-0001', 'guest', CURRENT_TIMESTAMP),
('22222222-2222-2222-2222-222222222222', 'Bob', 'Smith', 'bob@example.com', 'hash_bob', '555-0002', 'host', CURRENT_TIMESTAMP),
('33333333-3333-3333-3333-333333333333', 'Carol', 'Williams', 'carol@example.com', 'hash_carol', NULL, 'guest', CURRENT_TIMESTAMP),
('44444444-4444-4444-4444-444444444444', 'David', 'Brown', 'david@example.com', 'hash_david', '555-0004', 'host', CURRENT_TIMESTAMP);

-- Sample data for Property table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight, created_at, updated_at) VALUES
('aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'Sunny Apartment', 'A nice apartment downtown.', 'New York, NY', 120.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '22222222-2222-2222-2222-222222222222', 'Cozy Studio', 'A small, cozy studio for solo travelers.', 'Brooklyn, NY', 80.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
('aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '44444444-4444-4444-4444-444444444444', 'Beach House', 'House with a view of the sea.', 'Miami, FL', 200.00, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- Sample data for Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at) VALUES
('b1111111-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '2025-06-01', '2025-06-07', 720.00, 'confirmed', CURRENT_TIMESTAMP),
('b2222222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa2-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '33333333-3333-3333-3333-333333333333', '2025-07-10', '2025-07-15', 400.00, 'pending', CURRENT_TIMESTAMP),
('b3333333-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 'aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', '2025-08-01', '2025-08-05', 800.00, 'canceled', CURRENT_TIMESTAMP);

-- Sample data for Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method) VALUES
('p1111111-pppp-pppp-pppp-pppppppppppp', 'b1111111-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 720.00, CURRENT_TIMESTAMP, 'credit_card'),
('p2222222-pppp-pppp-pppp-pppppppppppp', 'b2222222-bbbb-bbbb-bbbb-bbbbbbbbbbbb', 400.00, CURRENT_TIMESTAMP, 'paypal');

-- Sample data for Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at) VALUES
('r1111111-rrrr-rrrr-rrrr-rrrrrrrrrrrr', 'aaaaaaa1-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 5, 'Fantastic stay, very clean and comfortable.', CURRENT_TIMESTAMP),
('r2222222-rrrr-rrrr-rrrr-rrrrrrrrrrrr', 'aaaaaaa3-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '33333333-3333-3333-3333-333333333333', 4, 'Great view, but a little noisy at night.', CURRENT_TIMESTAMP);

-- Sample data for Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at) VALUES
('m1111111-mmmm-mmmm-mmmm-mmmmmmmmmmmm', '11111111-1111-1111-1111-111111111111', '22222222-2222-2222-2222-222222222222', 'Is the apartment available for early check-in?', CURRENT_TIMESTAMP),
('m2222222-mmmm-mmmm-mmmm-mmmmmmmmmmmm', '22222222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', 'Yes, you can check in from 11am.', CURRENT_TIMESTAMP),
('m3333333-mmmm-mmmm-mmmm-mmmmmmmmmmmm', '33333333-3333-3333-3333-333333333333', '44444444-4444-4444-4444-444444444444', 'How far is the beach from the house?', CURRENT_TIMESTAMP);