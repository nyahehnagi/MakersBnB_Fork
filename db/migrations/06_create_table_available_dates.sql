CREATE TABLE available_dates (
	available_date_id SERIAL PRIMARY KEY,
    space_id INT, 
    date_id INT,
	FOREIGN KEY (space_id) REFERENCES spaces (space_id),
	FOREIGN KEY (date_id) REFERENCES dates (date_id)
);