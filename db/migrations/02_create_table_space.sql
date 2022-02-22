
CREATE TABLE spaces(
    space_id SERIAL PRIMARY KEY,
    name VARCHAR(60) NOT NULL,
    description VARCHAR(260) NOT NULL,
    price DECIMAL(12, 2) NOT NULL,
    hire_customer_id INTEGER,
    owner_customer_id INTEGER NOT NULL
);

ALTER TABLE spaces ADD CONSTRAINT fk_owner_customer_id FOREIGN KEY (owner_customer_id) REFERENCES customers(customer_id);

