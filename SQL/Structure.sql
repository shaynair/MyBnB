DROP DATABASE IF EXISTS mybnb;
CREATE DATABASE mybnb;
USE mybnb;

DROP TABLE IF EXISTS address CASCADE;
CREATE TABLE address (
  latitude REAL NOT NULL,
  longitude REAL NOT NULL,
  country VARCHAR(50) NOT NULL,
  province VARCHAR(50) NOT NULL, 
  city VARCHAR(50) NOT NULL,
  street_address VARCHAR(100) NOT NULL,
  postal_code VARCHAR(6) NOT NULL,
  
  PRIMARY KEY (latitude, longitude), 
  UNIQUE (street_address, postal_code),
  
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
  latitude REAL NOT NULL,
  longitude REAL NOT NULL,
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
  
  PRIMARY KEY (card_number, card_type),
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
  latitude REAL NOT NULL,
  longitude REAL NOT NULL,
  title VARCHAR(64) NOT NULL,
  description TEXT NOT NULL,
  rules TEXT NOT NULL,
  num_bedrooms SMALLINT UNSIGNED NOT NULL,
  num_beds SMALLINT UNSIGNED NOT NULL,
  num_bathrooms SMALLINT UNSIGNED NOT NULL,
  max_guests SMALLINT UNSIGNED NOT NULL,
  created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (listingID),
  UNIQUE (hostID, title),
  FOREIGN KEY (hostID) REFERENCES users(sin_id) ON DELETE CASCADE,
  FOREIGN KEY (latitude, longitude) REFERENCES address(latitude, longitude),
  
  INDEX (list_type, max_guests),
  INDEX (num_bedrooms, num_beds, num_bathrooms),
  
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
		'Iron', 'Hair Dryer', 'Laptop-friendly Workspace') NOT NULL,
  
  PRIMARY KEY (listingID, amenity),
  FOREIGN KEY (listingID) REFERENCES listings(listingID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS safety_features CASCADE;
CREATE TABLE safety_features (
  listingID INTEGER NOT NULL,
  feature ENUM('Carbon Monoxide Detector', 'First Aid Kit', 
				'Smoke Detector') NOT NULL,
  
  PRIMARY KEY (listingID, feature),
  FOREIGN KEY (listingID) REFERENCES listings(listingID) ON DELETE CASCADE
);

DROP TABLE IF EXISTS availability CASCADE;
CREATE TABLE availability (
  availabilityID INTEGER NOT NULL AUTO_INCREMENT,
  listingID INTEGER NOT NULL,
  starts_on DATETIME NOT NULL,
  ends_on DATETIME NOT NULL,
  rent_type ENUM('Full Location', 'Private Room', 'Shared Room') NOT NULL,
  price REAL NOT NULL,
  num_guests SMALLINT UNSIGNED NOT NULL,
  
  PRIMARY KEY (availabilityID),
  FOREIGN KEY (listingID) REFERENCES listings(listingID) ON DELETE CASCADE,
  
  INDEX (rent_type, price),
  
  CHECK (price > 0),
  CHECK (DATEDIFF(starts_on, ends_on) > 0),
  CHECK (num_guests > 0)
);

DROP TABLE IF EXISTS bookings CASCADE;
CREATE TABLE bookings (
  availabilityID INTEGER NOT NULL,
  renterID INTEGER NOT NULL,
  status ENUM('Available', 'Canceled by Renter', 'Canceled by Host') NOT NULL DEFAULT 'Available',
  updated_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (availabilityID),
  FOREIGN KEY (availabilityID) REFERENCES availability(availabilityID) ON DELETE CASCADE,
  FOREIGN KEY (renterID) REFERENCES users(sin_id) ON DELETE CASCADE,
  
  INDEX (status)
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


CREATE OR REPLACE VIEW unbooked_availabilities AS
	(SELECT a.listingID, a.starts_on, a.ends_on, a.rent_type, a.price
		FROM availability a
		WHERE NOT EXISTS(
			SELECT b.renterID FROM bookings b 
			WHERE b.availabilityID = a.availabilityID
				AND b.status = 'Available'
		)
	);

CREATE OR REPLACE VIEW available_bookings AS
	(SELECT a.listingID, a.starts_on, a.ends_on, a.rent_type, a.price, 
			b.renterID, b.updated_on AS booking_time
		FROM bookings b
		LEFT JOIN availability a USING (availabilityID)
		WHERE b.status = 'Available'
	);
		
CREATE OR REPLACE VIEW canceled_bookings AS
	(SELECT a.listingID, a.starts_on, a.ends_on, a.rent_type, a.price, b.status, 
			b.renterID, b.updated_on AS canceled_time, b.renterID AS cancelerID
		FROM bookings b
		LEFT JOIN availability a USING (availabilityID)
		WHERE b.status = 'Canceled by Renter')
	UNION
	(SELECT a.listingID, a.starts_on, a.ends_on, a.rent_type, a.price, b.status,
			b.renterID, b.updated_on AS canceled_time, l.hostID AS cancelerID
		FROM bookings b
		LEFT JOIN availability a USING (availabilityID)
		LEFT JOIN listings l USING (listingID)
		WHERE b.status = 'Canceled by Host');

		
CREATE OR REPLACE VIEW listing_information AS
	(SELECT l.listingID, l.title, l.description, l.rules, l.max_guests,
			l.created_on, l.hostID, l.list_type, AVG(r.rating) AS average_rating,
			a.country, a.province, a.city, a.street_address, a.postal_code
			FROM listings l
			LEFT JOIN address a USING (latitude, longitude)
			LEFT JOIN listing_ratings r USING (listingID)
	);

CREATE OR REPLACE VIEW user_information AS
	(SELECT u.sin_id, u.first_name, u.last_name, u.birth_date,
			u.occupation, u.registered_on, DATEDIFF(u.login_on, NOW()) AS last_login,
			a.country, a.province, a.city, a.street_address, a.postal_code,
			AVG(p.rating) AS average_rating
			FROM users u
			LEFT JOIN address a USING (latitude, longitude)
			LEFT JOIN profile_ratings p ON p.userID = u.sin_id
	);
		
-- Reports 

-- Get the total number of listings per country
CREATE OR REPLACE VIEW listings_per_country AS
	(SELECT a.country, COUNT(l.listingID) AS num_listings
		FROM address a 
		LEFT JOIN listings l USING (latitude, longitude)
		GROUP BY a.country
	);

-- Get the total number of listings per country and city
CREATE OR REPLACE VIEW listings_per_city AS
	(SELECT a.country, a.city, COUNT(l.listingID) AS num_listings
		FROM address a 
		LEFT JOIN listings l USING (latitude, longitude)
		GROUP BY a.country, a.city
	);

-- Get the total number of listings per country and city and postal code
CREATE OR REPLACE VIEW listings_per_postal_code AS
	(SELECT a.country, a.city, a.postal_code, COUNT(l.listingID) AS num_listings
		FROM address a 
		LEFT JOIN listings l USING (latitude, longitude)
		GROUP BY a.country, a.city, a.postal_code
	);

-- Get the total number of listings per host in a country
CREATE OR REPLACE VIEW listings_per_host_in_country AS
	(SELECT u.sin_id AS hostID, a.country, COUNT(l.listingID) AS num_listings
		FROM users u
		LEFT JOIN listings l ON l.hostID = u.sin_id
		LEFT JOIN address a ON l.latitude = a.latitude AND l.longitude = a.longitude
		GROUP BY u.sin_id, a.country
	);
		
-- Get the total number of listings per host in a city
CREATE OR REPLACE VIEW listings_per_host_in_city AS
	(SELECT u.sin_id AS hostID, a.country, a.city, COUNT(l.listingID) AS num_listings
		FROM users u
		LEFT JOIN listings l ON l.hostID = u.sin_id
		LEFT JOIN address a ON l.latitude = a.latitude AND l.longitude = a.longitude
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
	(SELECT c.cancelerID, COUNT(*) AS num_cancellations
		FROM canceled_bookings c
		WHERE c.canceled_time >= DATE_ADD(CURDATE(), INTERVAL -1 YEAR)
			AND c.status = 'Canceled by Host'
		GROUP BY c.cancelerID
	);
		
-- Get the total number of cancellations per renter within a year
CREATE OR REPLACE VIEW cancellations_per_renter AS
	(SELECT c.cancelerID, COUNT(*) AS num_cancellations
		FROM canceled_bookings c
		WHERE c.canceled_time >= DATE_ADD(CURDATE(), INTERVAL -1 YEAR)
			AND c.status = 'Canceled by Renter'
		GROUP BY c.cancelerID
	);
		
-- Get the total number of cancellations per user within a year
CREATE OR REPLACE VIEW cancellations_per_renter AS
	(SELECT c.cancelerID, COUNT(*) AS num_cancellations
		FROM canceled_bookings c
		WHERE c.canceled_time >= DATE_ADD(CURDATE(), INTERVAL -1 YEAR)
		GROUP BY c.cancelerID
	);
	
-- For getting bookings by city or by renter. Select the time period and use GROUP BY.
CREATE OR REPLACE VIEW booking_locations AS
	(SELECT a.listingID, a.starts_on, a.ends_on, a.renterID,
			l.country, l.province, l.city, l.street_address, l.postal_code
		FROM available_bookings a
		LEFT JOIN listing_information l USING (listingID)
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