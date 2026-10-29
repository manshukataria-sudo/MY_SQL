CREATE DATABASE IF NOT EXISTS practice;

USE practice;

DROP DATABASE IF EXISTS practice;

CREATE TABLE IF NOT EXISTS user (
    user_id VARCHAR(255),
    name VARCHAR(255),
    password VARCHAR(255),
    last_seen DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO user(user_id, name, password)
VALUES ("manshu@123", "manshu", "1234"),
("ansh@123", "ansh", "1234");


SELECT * FROM user;

TRUNCATE user;

DROP TABLE IF EXISTS user;


CREATE TABLE IF NOT EXISTS students (
    enroll VARCHAR(255),
    name VARCHAR(255) NOT NULL,
    username VARCHAR(255) UNIQUE,
    branch VARCHAR(255) NOT NULL,
    date_of_joining DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT students_pk PRIMARY KEY (enroll)
);

INSERT INTO students (enroll, name, username, branch)
VALUES ("cs045", "sameeksha","sam@123", "cse");


SELECT * FROM students;

DROP TABLE students;


CREATE TABLE IF NOT EXISTS user(
    username VARCHAR(255),
    pan_no VARCHAR(255),

    date_of_joining DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT user_pk PRIMARY KEY (username, pan_no)
);


INSERT INTO user(username, pan_no)
VALUES("anshu", "123");


SELECT * FROM user;


DROP TABLE IF EXISTS user;
DROP TABLE IF EXISTS students;

CREATE TABLE IF NOT EXISTS students(
    enroll VARCHAR(255),
    name VARCHAR(255) NOT NULL,
    branch VARCHAR(255) NOT NULL,
    age INTEGER,
    date_of_joining DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT students_pk PRIMARY KEY (enroll),

    CONSTRAINT students_age_check CHECK (age >= 6 AND age <= 25)
);



SELECT * FROM students;

INSERT INTO students (enroll, name, branch, age)
VALUES ("11", "manshu", "cse", 15);



CREATE TABLE IF NOT EXISTS customers(
    c_id VARCHAR(255),
    name VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    CONSTRAINT customer_c_id_unique PRIMARY KEY (c_id)
);

DROP TABLE customers;


CREATE TABLE IF NOT EXISTS orders(
    order_id VARCHAR(255),
    data_of_order DATETIME DEFAULT CURRENT_TIMESTAMP,
    c_id VARCHAR(255),

    CONSTRAINT orders_pk PRIMARY KEY (order_id), 
    CONSTRAINT orders_fk FOREIGN KEY (c_id) REFERENCES customers(c_id)
    ON UPDATE SET NULL
    ON DELETE SET NULL
);


INSERT INTO customers(c_id, name, password)
VALUES ("12", "manshu", "1234");

SELECT * FROM customers;

INSERT INTO orders(order_id, c_id)
VALUES (3, "12");

SELECT * FROM orders;

DROP TABLE IF EXISTS orders;

UPDATE customers SET c_id = 10 WHERE c_id = 12;
DELETE FROM customers WHERE c_id=10;




CREATE TABLE IF NOT EXISTS customers(
    c_id VARCHAR(255),
    name VARCHAR(255),
    password VARCHAR(255),
    pan_no VARCHAR(255),
    date_of_joining DATETIME DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT customers_pk PRIMARY KEY (c_id)
);

ALTER TABLE customers
ADD COLUMN aadhar_no VARCHAR(255) AFTER pan_no,
ADD COLUMN dob DATE AFTER aadhar_no;


SELECT * FROM customers;

ALTER TABLE customers
MODIFY COLUMN c_id INTEGER;


INSERT INTO customers (c_id, name, password, pan_no, aadhar_no)
VALUES (3, "manshu", "1", "1", 1);

ALTER TABLE customers
MODIFY COLUMN aadhar_no INTEGER UNIQUE;

ALTER TABLE customers
RENAME COLUMN aadhar_no TO aadhar_card_no;

SELECT * FROM customers;


ALTER TABLE customers
RENAME employees;

SELECT * FROM employees;


ALTER TABLE employees
DROP CONSTRAINT employees_pk; 


ALTER TABLE employees
ADD CONSTRAINT employees_pan_no_unique CHECK (pan_no >= 1);


INSERT INTO employees(c_id, name, password, pan_no, aadhar_card_no)
VALUES (11, "ansh", 3, "-23", 11);


ALTER TABLE employees
DROP CONSTRAINT employees_pan_no_unique;


USE practice;
SELECT * FROM students;


CREATE TABLE bottles(
    brand VARCHAR(255),
    volume INTEGER CHECK (volume<1)
);

INSERT INTO bottles(brand, volume)
VALUES ("milton", -9);

SELECT * FROM bottles;

