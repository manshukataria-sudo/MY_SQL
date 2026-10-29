CREATE DATABASE IF NOT EXISTS campusx;

-- creating table 
-- col_name datatype
-- selecting campusx database for our tasks
USE campusx;

CREATE TABLE users (
    user_id INTEGER,
    name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
);  

INSERT INTO users (user_id, name, email, password)
VALUES (1, "manshu", "manshu@gmail.com", "manshu"),
		(2, "anshu", "anshu@gmail.com", "anshu");

SELECT * FROM users;


-- to remove all the rows from the table use TRUNCATE TABLE <name>
TRUNCATE TABLE users;


-- to delete the complete table use "DROP TABLE IF EXISTS <name>
DROP TABLE IF EXISTS users;

