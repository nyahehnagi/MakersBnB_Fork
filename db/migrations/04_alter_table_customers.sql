
ALTER TABLE customers ADD COLUMN email VARCHAR(60) UNIQUE NOT NULL;
ALTER TABLE customers ADD COLUMN password VARCHAR(100)  NOT NULL;