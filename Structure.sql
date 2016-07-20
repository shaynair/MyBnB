CREATE DATABASE IF NOT EXISTS mybnb;
USE mybnb;

DROP TABLE IF EXISTS address CASCADE;
CREATE TABLE address (
  latitude FLOAT NOT NULL,
  longitude FLOAT NOT NULL,
  country VARCHAR(50) NOT NULL,
  province VARCHAR(50) NOT NULL, 
  city VARCHAR(50) NOT NULL,
  street_address VARCHAR(100) NOT NULL,
  postal_code VARCHAR(6) NOT NULL,
  
  PRIMARY KEY (latitude, longitude), 
  UNIQUE KEY (street_address, postal_code),
  
  -- Check co-ordinates
  CHECK (latitude >= 0 AND latitude <= 360),
  CHECK (longitude >= 0 AND longitude <= 360)
);

DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
  sin_id INTEGER NOT NULL,
  first_name VARCHAR(50) NOT NULL,
  last_name VARCHAR(50) NOT NULL,
  latitude FLOAT NOT NULL,
  longitude FLOAT NOT NULL,
  birth_date DATE NOT NULL,
  occupation VARCHAR(50) NOT NULL,
  registered_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  login_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  gender ENUM('M', 'F', 'Unspecified') NOT NULL DEFAULT 'Unspecified',
  
  PRIMARY KEY (sin_id),
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
				'Dormitory', 'Castle', 'Boat', 'RV', 'Other') 
				NOT NULL DEFAULT 'Other',
  latitude FLOAT NOT NULL,
  longitude FLOAT NOT NULL,
  title VARCHAR(64) NOT NULL,
  description TEXT NOT NULL,
  rules TEXT NOT NULL,
  num_bedrooms SMALLINT UNSIGNED NOT NULL,
  num_beds SMALLINT UNSIGNED NOT NULL,
  num_bathrooms SMALLINT UNSIGNED NOT NULL,
  max_guests SMALLINT UNSIGNED NOT NULL,
  created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (listingID),
  FOREIGN KEY (hostID) REFERENCES users(sin_id) ON DELETE CASCADE,
  FOREIGN KEY (latitude, longitude) REFERENCES address(latitude, longitude),
  
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
  listingID INTEGER NOT NULL,
  starts_on DATETIME NOT NULL,
  ends_on DATETIME NOT NULL,
  rent_type ENUM('Full Location', 'Private Room', 'Shared Room') NOT NULL,
  is_available ENUM('Yes', 'No') NOT NULL DEFAULT 'Yes',
  price REAL NOT NULL,
  
  PRIMARY KEY (listingID, starts_on, ends_on),
  FOREIGN KEY (listingID) REFERENCES listings(listingID) ON DELETE CASCADE,
  
  CHECK(price > 0),
  CHECK (DATEDIFF(starts_on, ends_on) > 0)
);

DROP TABLE IF EXISTS bookings CASCADE;
CREATE TABLE bookings (
  renterID INTEGER NOT NULL,
  listingID INTEGER NOT NULL,
  status ENUM('Available', 'Canceled') NOT NULL DEFAULT 'Available',
  starts_on DATETIME NOT NULL,
  ends_on DATETIME NOT NULL,
  num_guests SMALLINT UNSIGNED NOT NULL,
  created_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (listingID, renterID),
  FOREIGN KEY (listingID, starts_on, ends_on) REFERENCES availability(listingID, starts_on, ends_on) ON DELETE CASCADE,
  FOREIGN KEY (renterID) REFERENCES users(sin_id) ON DELETE CASCADE,
  
  CHECK (num_guests > 0),
  CHECK (DATEDIFF(starts_on, ends_on) > 0)
);

DROP TABLE IF EXISTS canceled_bookings CASCADE;
CREATE TABLE canceled_bookings (
  renterID INTEGER NOT NULL,
  listingID INTEGER NOT NULL,
  cancelerID INTEGER NOT NULL,
  canceled_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (listingID, renterID),
  FOREIGN KEY (listingID, renterID) REFERENCES bookings(listingID, renterID) ON DELETE CASCADE,
  FOREIGN KEY (cancelerID) REFERENCES users(sin_id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS profile_ratings CASCADE;
CREATE TABLE profile_ratings (
  userID INTEGER NOT NULL,
  raterID INTEGER NOT NULL,
  rating SMALLINT UNSIGNED NOT NULL,
  
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
  
  PRIMARY KEY (listingID, raterID),
  FOREIGN KEY (listingID, raterID) REFERENCES bookings(listingID, renterID) ON DELETE CASCADE,

  CHECK(rating > 0 AND rating < 6)
);

DROP TABLE IF EXISTS listing_comments CASCADE;
CREATE TABLE listing_comments (
  listingID INTEGER NOT NULL,
  commenterID INTEGER NOT NULL,
  content TEXT NOT NULL,
  commented_on TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  
  PRIMARY KEY (listingID, commenterID),
  FOREIGN KEY (listingID, commenterID) REFERENCES bookings(listingID, renterID) ON DELETE CASCADE
);


-- Assertions (Not supported in MySQL)
/*
-- We can't have two availabilities overlap.
CREATE ASSERTION availability_check
	(NOT EXISTS(SELECT listingID
			FROM availability a
			JOIN availability b USING (listingID)
			WHERE a.is_available = b.is_available
				AND a.startdatetime >= b.startdatetime
				AND a.startdatetime <= b.enddatetime
			GROUP BY listingID
			HAVING COUNT(*) >= 1));

-- We can't have a host book their own listing.
CREATE ASSERTION bookings_renter_host_check
	CHECK (NOT EXISTS(SELECT listingID
			FROM bookings b
			JOIN listings l USING (listingID)
			WHERE b.renterID = l.hostID));
			
-- We can't have a booking have over the max guests allowed.
CREATE ASSERTION bookings_guest_check
	CHECK (NOT EXISTS(SELECT listingID
			FROM bookings b
			JOIN listings l USING (listingID)
			WHERE b.num_guests > l.max_guests));

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