CREATE TABLE bookings (
	booking_id SERIAL PRIMARY KEY,
    customer_id INT, 
    space_id INT,
    date_of_stay DATE,
	FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
	FOREIGN KEY (space_id) REFERENCES spaces (space_id)
);