USE BobbisRentals;

SELECT * FROM bobbis_customer_rentals;

CREATE TABLE normalized_bobbis_cars (
	car_id int,
    car_license varchar(6),
    model varchar(50),
    manufacturer varchar(50),
    type_car varchar(50),
    car_condition varchar(50),
    color varchar(50)
);

INSERT INTO normalized_bobbis_cars
SELECT DISTINCT car_id, car_license, model, manufacturer, type_car, car_condition, color FROM bobbis_customer_rentals;

SELECT * FROM normalized_bobbis_cars; 

ALTER TABLE bobbis_customer_rentals
DROP COLUMN car_license,
DROP COLUMN model,
DROP COLUMN manufacturer,
DROP COLUMN type_car,
DROP COLUMN car_condition,
DROP COLUMN color;

SELECT * FROM bobbis_customer_rentals;
SELECT * FROM normalized_bobbis_cars;

-- ** ADDITIONAL - Setting up PKs and FK **

-- Make customer_id PK
ALTER TABLE bobbis_customer_rentals
ADD PRIMARY KEY (customer_id);

-- Make car_id PK
Alter TABLE normalized_bobbis_cars
ADD PRIMARY KEY (car_id);

-- Make car_id in bobbis_customer_rentals FK
ALTER TABLE bobbis_customer_rentals
ADD FOREIGN KEY (car_id) REFERENCES normalized_bobbis_cars(car_id);

-- Have a look at the EER diagram to see what this looks like now!