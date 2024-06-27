USE BobbisRentals;

-- Import bobbis_rental_cars

-- You'll notice this table is the same as our 2NF normalised one!
SELECT * FROM bobbis_rental_cars;

CREATE TABLE normalised_bobbis_car_model (
	model varchar(50),
    manufacturer varchar(50),
    type_car varchar(50)
);

INSERT INTO normalised_bobbis_car_model
SELECT DISTINCT model, manufacturer, type_car FROM bobbis_rental_cars;

SELECT * FROM normalised_bobbis_car_model;

ALTER TABLE bobbis_rental_cars
DROP COLUMN manufacturer,
DROP COLUMN type_car;

-- To show all of the done tables
SELECT * FROM bobbis_customers;
SELECT * FROM normalized_bobbis_customers_rentals;
SELECT * FROM bobbis_rental_cars;
SELECT * FROM normalised_bobbis_car_model;

-- * The data isn't perfect! It can definetely be cleaned but for now, it is normalised!
-- PS - We don’t always need to get to 3NF! It is up to how you need your data! 