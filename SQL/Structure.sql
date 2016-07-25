DROP DATABASE IF EXISTS mybnb;
CREATE DATABASE mybnb;
USE mybnb;

DROP TABLE IF EXISTS address CASCADE;
CREATE TABLE address (
  latitude DECIMAL(10,5) NOT NULL,
  longitude DECIMAL(10,5) NOT NULL,
  country VARCHAR(24) NOT NULL,
  province VARCHAR(24) NOT NULL, 
  city VARCHAR(24) NOT NULL,
  street_address VARCHAR(256) NOT NULL,
  postal_code VARCHAR(7) NOT NULL,
  
  PRIMARY KEY (latitude, longitude), 
  UNIQUE (country, province, city, street_address, postal_code),
  
  INDEX (postal_code),
  INDEX (street_address),
  INDEX (country, province, city),
  
  -- Check co-ordinates
  CHECK (latitude >= -180 AND latitude <= 180),
  CHECK (longitude >= -180 AND longitude <= 180)
);

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  sin_id INTEGER NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  email VARCHAR(100) NOT NULL,
  latitude DECIMAL(10,5) NOT NULL,
  longitude DECIMAL(10,5) NOT NULL,
  birth_date DATE NOT NULL,
  occupation VARCHAR(50) NOT NULL,
  registered_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  login_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (sin_id),
  UNIQUE (email),
  FOREIGN KEY (latitude, longitude) REFERENCES address(latitude, longitude),

  -- Check if above 18
  CHECK (DATEDIFF(birthdate, CURDATE()) >= 18 * 365)
);

DROP TABLE IF EXISTS renter_payments CASCADE;
CREATE TABLE renter_payments (
  card_number BIGINT NOT NULL,
  renterID INTEGER NOT NULL,
  card_type ENUM('Visa', 'MasterCard', 'American Express') NOT NULL,
  expiry_date DATE NOT NULL,
  
  PRIMARY KEY (card_number),
  FOREIGN KEY (renterID) REFERENCES users(sin_id) ON DELETE CASCADE,
  
  -- Check if expiry date is valid
  CHECK (DATEDIFF(expiry_date, CURDATE()) > 0)
);

DROP TABLE IF EXISTS listings CASCADE;
CREATE TABLE listings (
  listingID INTEGER NOT NULL AUTO_INCREMENT,
  hostID INTEGER NOT NULL,
  list_type ENUM('Apartment', 'House', 'Townhouse', 'Villa', 'Tent',
				'Condominium', 'Bungalow', 'Cottage', 'Loft', 'Lighthouse',
				'Dormitory', 'Castle', 'Boat', 'RV', 'Other') NOT NULL DEFAULT 'Other',
  latitude DECIMAL(10,5) NOT NULL,
  longitude DECIMAL(10,5) NOT NULL,
  unit_number MEDIUMINT DEFAULT NULL,
  title VARCHAR(64) NOT NULL,
  description TEXT NOT NULL,
  num_bedrooms SMALLINT UNSIGNED NOT NULL,
  num_beds SMALLINT UNSIGNED NOT NULL,
  num_bathrooms SMALLINT UNSIGNED NOT NULL,
  max_guests SMALLINT UNSIGNED NOT NULL,
  is_available BOOLEAN NOT NULL DEFAULT TRUE,
  created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (listingID),
  FOREIGN KEY (hostID) REFERENCES users(sin_id) ON DELETE CASCADE,
  FOREIGN KEY (latitude, longitude) REFERENCES address(latitude, longitude),
  
  INDEX (is_available), 
  INDEX (list_type, max_guests),
  INDEX (num_bedrooms, num_beds, num_bathrooms),
  
  CHECK (is_available = TRUE OR is_available = FALSE),
  CHECK (max_guests > 0)
);

DROP TABLE IF EXISTS amenities CASCADE;
CREATE TABLE amenities (
  listingID INTEGER NOT NULL,
  amenity ENUM('Kitchen', 'Internet', 'TV', 'Essentials', 'Heating', 
		'Air Conditioning', 'Washer', 'Dryer', 'Free Parking', 'Wireless', 
		'Breakfast', 'Pets', 'Family Friendly', 'Suitable for Events',
		'Smoking', 'Wheelchair Accessible', 'Elevator', 'Fireplace', 'Buzzer', 
		'Doorman', 'Pool', 'Hot Tub', 'Gym', '24 Hours Check-In', 'Hangers', 
		'Iron', 'Hair Dryer', 'Laptop-friendly Workspace',
		'Carbon Monoxide Detector', 'First Aid Kit', 'Smoke Detector') NOT NULL,
  
  PRIMARY KEY (listingID, amenity),
  FOREIGN KEY (listingID) REFERENCES listings(listingID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS availability CASCADE;
CREATE TABLE availability (
  availabilityID INTEGER NOT NULL AUTO_INCREMENT,
  listingID INTEGER NOT NULL,
  starts_on DATE NOT NULL,
  ends_on DATE NOT NULL,
  rent_type ENUM('Full Location', 'Private Room', 'Shared Room') NOT NULL,
  daily_price REAL NOT NULL,
  guests SMALLINT UNSIGNED NOT NULL,
  is_available BOOLEAN NOT NULL DEFAULT TRUE,
  
  PRIMARY KEY (availabilityID),
  FOREIGN KEY (listingID) REFERENCES listings(listingID) ON DELETE CASCADE,
  
  INDEX (is_available), 
  INDEX (starts_on, ends_on),
  INDEX (rent_type, daily_price),
  
  CHECK (price > 0),
  CHECK (guests > 0),
  CHECK (is_available = TRUE OR is_available = FALSE)
);

DROP TABLE IF EXISTS bookings CASCADE;
CREATE TABLE bookings (
  bookingID INTEGER NOT NULL AUTO_INCREMENT,
  availabilityID INTEGER NOT NULL,
  renterID INTEGER NOT NULL,
  starts DATE NOT NULL,
  ends DATE NOT NULL,
  status ENUM('Available', 'Canceled by Renter', 'Canceled by Host') NOT NULL DEFAULT 'Available',
  num_guests SMALLINT UNSIGNED NOT NULL,
  card_number BIGINT NOT NULL,
  updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (bookingID),
  FOREIGN KEY (card_number) REFERENCES renter_payments(card_number),
  FOREIGN KEY (availabilityID) REFERENCES availability(availabilityID) ON DELETE CASCADE,
  FOREIGN KEY (renterID) REFERENCES users(sin_id) ON DELETE CASCADE,
  
  INDEX (starts, ends),
  INDEX (status),
  
  CHECK (num_guests > 0)
);

DROP TABLE IF EXISTS profile_ratings CASCADE;
CREATE TABLE profile_ratings (
  userID INTEGER NOT NULL,
  raterID INTEGER NOT NULL,
  rating SMALLINT UNSIGNED NOT NULL,
  rated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (userID, raterID),
  FOREIGN KEY (userID) REFERENCES users(sin_id) ON DELETE CASCADE,
  FOREIGN KEY (raterID) REFERENCES users(sin_id) ON DELETE CASCADE,
  
  CHECK(userID != raterID),
  CHECK(rating > 0 AND rating < 6)
);

DROP TABLE IF EXISTS profile_comments CASCADE;
CREATE TABLE profile_comments (
  userID INTEGER NOT NULL,
  commenterID INTEGER NOT NULL,
  content TEXT NOT NULL,
  commented_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (userID, commenterID),
  FOREIGN KEY (userID) REFERENCES users(sin_id) ON DELETE CASCADE,
  FOREIGN KEY (commenterID) REFERENCES users(sin_id) ON DELETE CASCADE,
  
  CHECK(userID != raterID)
);

DROP TABLE IF EXISTS listing_ratings CASCADE;
CREATE TABLE listing_ratings (
  listingID INTEGER NOT NULL,
  raterID INTEGER NOT NULL,
  rating SMALLINT UNSIGNED NOT NULL,
  rated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (listingID, raterID),
  FOREIGN KEY (raterID) REFERENCES users(sin_id) ON DELETE CASCADE,
  FOREIGN KEY (listingID) REFERENCES listings(listingID) ON DELETE CASCADE,
  
  CHECK(rating > 0 AND rating < 6)
);

DROP TABLE IF EXISTS listing_comments CASCADE;
CREATE TABLE listing_comments (
  listingID INTEGER NOT NULL,
  commenterID INTEGER NOT NULL,
  content TEXT NOT NULL,
  commented_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (listingID, commenterID),
  FOREIGN KEY (commenterID) REFERENCES users(sin_id) ON DELETE CASCADE,
  FOREIGN KEY (listingID) REFERENCES listings(listingID) ON DELETE CASCADE
);

CREATE OR REPLACE VIEW user_information AS
	(SELECT u.sin_id, u.first_name, u.last_name, u.email, u.birth_date,
			u.occupation, u.registered_on, DATEDIFF(u.login_on, NOW()) AS last_login,
			a.*, AVG(p.rating) AS average_user_rating
			FROM users u
			LEFT JOIN address a USING (latitude, longitude)
			LEFT JOIN profile_ratings p ON p.userID = u.sin_id
			GROUP BY u.sin_id
	);
	
-- Note: Make sure to use 'WHERE is_available = TRUE'
CREATE OR REPLACE VIEW listing_information AS
	(SELECT l.listingID, l.title, l.description, l.max_guests, l.is_available,
			l.created_on, l.hostID, l.list_type, AVG(r.rating) AS average_listing_rating,
			l.unit_number, a.*
			FROM listings l
			LEFT JOIN address a USING (latitude, longitude)
			LEFT JOIN listing_ratings r USING (listingID)
			GROUP BY l.listingID
	);
	

CREATE OR REPLACE VIEW unbooked_availabilities AS
	(SELECT l.*, a.starts_on, a.ends_on, a.rent_type, 
			a.daily_price, a.guests
		FROM availability a
		LEFT JOIN listing_information l USING (listingID)
		WHERE l.is_available = TRUE
			AND NOT EXISTS(
				SELECT b.renterID FROM bookings b 
				WHERE b.availabilityID = a.availabilityID
					AND b.status = 'Available'
			)
	);
	
-- For getting bookings by city or by renter: SELECT the time period and use GROUP BY.
-- Make sure to use status = 'Available'
CREATE OR REPLACE VIEW booking_information AS
	(SELECT a.availabilityID, b.starts, b.ends, b.status, a.rent_type, b.num_guests, 
			a.daily_price * (DATEDIFF(b.starts, b.ends) + 1) AS total_price, a.guests, 
			b.renterID, b.bookingID, b.updated_on AS booking_time, c.card_number, c.card_type, c.expiry_date, 
			l.*, u.sin_id, u.first_name, u.last_name, u.email, u.birth_date,
			u.occupation, u.average_user_rating, a.starts_on, a.ends_on 
		FROM bookings b
		LEFT JOIN availability a USING (availabilityID)
		LEFT JOIN listing_information l USING (listingID)
		LEFT JOIN renter_payments c USING (card_number)
		LEFT JOIN user_information u ON b.renterID = u.sin_id
		WHERE l.is_available = TRUE AND a.is_available = TRUE
	);
		
-- Reports 

-- Get the total number of listings per country
CREATE OR REPLACE VIEW listings_per_country AS
	(SELECT a.country, COUNT(l.listingID) AS num_listings
		FROM address a 
		LEFT JOIN listings l USING (latitude, longitude)
		WHERE l.is_available = TRUE
		GROUP BY a.country
	);

-- Get the total number of listings per country and city
CREATE OR REPLACE VIEW listings_per_city AS
	(SELECT a.country, a.city, COUNT(l.listingID) AS num_listings
		FROM address a 
		LEFT JOIN listings l USING (latitude, longitude)
		WHERE l.is_available = 'Yes'
		GROUP BY a.country, a.city
	);

-- Get the total number of listings per country and city and postal code
CREATE OR REPLACE VIEW listings_per_postal_code AS
	(SELECT a.country, a.city, a.postal_code, COUNT(l.listingID) AS num_listings
		FROM address a 
		LEFT JOIN listings l USING (latitude, longitude)
		WHERE l.is_available = 'Yes'
		GROUP BY a.country, a.city, a.postal_code
	);

-- Get the total number of listings per host in a country
CREATE OR REPLACE VIEW listings_per_host_in_country AS
	(SELECT u.sin_id AS hostID, a.country, COUNT(l.listingID) AS num_listings
		FROM users u
		LEFT JOIN listings l ON l.hostID = u.sin_id
		LEFT JOIN address a ON l.latitude = a.latitude AND l.longitude = a.longitude
		WHERE l.is_available = TRUE
		GROUP BY u.sin_id, a.country
	);
		
-- Get the total number of listings per host in a city
CREATE OR REPLACE VIEW listings_per_host_in_city AS
	(SELECT u.sin_id AS hostID, a.country, a.city, COUNT(l.listingID) AS num_listings
		FROM users u
		LEFT JOIN listings l ON l.hostID = u.sin_id
		LEFT JOIN address a ON l.latitude = a.latitude AND l.longitude = a.longitude
		WHERE l.is_available = TRUE
		GROUP BY u.sin_id, a.country, a.city
	);
		
-- Get the percentage of a host's listings in a country and city
CREATE OR REPLACE VIEW host_market_share AS
	(SELECT h.hostID, h.country, h.city, 
			h.num_listings / c.num_listings * 100 AS market_share
		FROM listings_per_host_in_city h
		LEFT JOIN listings_per_city c ON c.city = h.city AND c.country = h.country
	);

-- Get the total number of cancellations per host within a year
CREATE OR REPLACE VIEW cancellations_per_host AS
	(SELECT c.hostID, COUNT(*) AS num_cancellations
		FROM booking_information c
		WHERE c.booking_time >= DATE_ADD(CURDATE(), INTERVAL -1 YEAR)
			AND c.status = 'Canceled by Host'
		GROUP BY c.hostID
	);
		
-- Get the total number of cancellations per renter within a year
CREATE OR REPLACE VIEW cancellations_per_renter AS
	(SELECT c.renterID, COUNT(*) AS num_cancellations
		FROM booking_information c
		WHERE c.booking_time >= DATE_ADD(CURDATE(), INTERVAL -1 YEAR)
			AND c.status = 'Canceled by Renter'
		GROUP BY c.renterID
	);
		
-- Get the total number of cancellations per user within a year
CREATE OR REPLACE VIEW cancellations_per_renter AS
	(SELECT c.renterID, COUNT(*) AS num_cancellations
		FROM booking_information c
		WHERE c.booking_time >= DATE_ADD(CURDATE(), INTERVAL -1 YEAR)
			AND (c.status = 'Canceled by Renter' OR c.status = 'Canceled by Host')
		GROUP BY c.renterID
	);
		
-- Assertions (Not supported in MySQL)
/*
-- We can't have a host book their own listing.
CREATE ASSERTION bookings_renter_host_check
	CHECK (NOT EXISTS(SELECT listingID
			FROM bookings b
			JOIN listings l USING (listingID)
			WHERE b.renterID = l.hostID));
			
-- We can't have a booking have over the max guests allowed.
CREATE ASSERTION bookings_guest_check
	CHECK (NOT EXISTS(SELECT listingID
			FROM availability a
			JOIN listings l USING (listingID)
			WHERE a.num_guests > l.max_guests));

-- We can only cancel by the host or a renter.
CREATE ASSERTION canceled_bookings_check
	CHECK (NOT EXISTS(SELECT cancelerID
			FROM canceled_bookings b
			JOIN listings l USING (listingID)
			WHERE b.cancelerID != b.renterID
				AND b.cancelerID != l.hostID));

-- Ratings must come from a guest.
-- NOTE: additional constraint, must have rented within past 2 months
CREATE ASSERTION profile_ratings_check
	CHECK (NOT EXISTS(SELECT r.raterID
			FROM profile_ratings r
			WHERE r.raterID NOT IN (
				SELECT b.renterID
				FROM bookings b
				JOIN listings l USING (listingID)
				WHERE l.hostID = r.userID
			)));

-- Comments must come from a guest.
-- NOTE: additional constraint, must have rented within past 2 months
CREATE ASSERTION profile_comments_check
	CHECK (NOT EXISTS(SELECT c.commenterID
			FROM profile_comments c
			WHERE c.commenterID NOT IN (
				SELECT b.renterID
				FROM bookings b
				JOIN listings l USING (listingID)
				WHERE l.hostID = c.userID
			)));
			

-- NOTE: additional constraint, must have rented within past 2 months for listing_comments and listing_ratings
*/