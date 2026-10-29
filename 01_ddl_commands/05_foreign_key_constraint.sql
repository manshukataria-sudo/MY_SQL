USE campusx;

SELECT *
FROM
    ticket;

-- FOREIGN KEY : No, a foreign key does not always have to reference a primary key; it can reference any column that has a UNIQUE constraint in the target table
-- It creates relation between the tables,

CREATE TABLE customer (
    c_id INTEGER AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    CONSTRAINT customer_pk PRIMARY KEY (c_id)
);


-- here c_id column of customer table is assigned as foreign key, and the AUTO_INCREMENT column must be either unique key or primary key
CREATE TABLE orders (
    order_id INTEGER AUTO_INCREMENT,
    c_id INTEGER NOT NULL,
    date DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT order_pk PRIMARY KEY (order_id),
    CONSTRAINT orders_fk FOREIGN KEY (c_id)
        REFERENCES customer (c_id)
);

SELECT *
FROM
    orders;

-- now if we try delete the customer table, it returns error, because orders table is dependent on customer table, there is one c_id that prevents to delete it
DROP TABLE customer;




-- REFERENTIAL ACTIONS => if there is foreign key relation in two tables, the affect of deletion and updation in one table can affect on other table in various ways:
-- 1. RESTRICT => if any parent table's row is connected to any row of child table, that row cannot be deleted from the parent table 

INSERT INTO customer (name, email)
VALUES
    ("manshu", "manshu@gmail.com"),
    ("ansh", "ansh@gmail.com");

SELECT *
FROM
    customer;


INSERT INTO orders (c_id)
VALUES
    (1),
    (2);


SELECT *
FROM
    orders;

-- not able to DROP due to referenced by foreign key
DROP TABLE customer;
-- cannot delete the parent row, due to foreign key constraint
DELETE FROM customer
WHERE
    c_id = 2;

--  we can delete row, only if there is no order of that person in order table   
DELETE FROM orders
WHERE
    order_id = 2;

-- now we can delete the row from the customer(parent table)
DELETE FROM customer
WHERE
    c_id = 3;

SELECT *
FROM
    customer;

SELECT *
FROM
    orders;


-- CASCADE mode : it allows changes in customer table even if, its orders are present in order's table, and the changes will reflect in order's table also
 INSERT INTO customer (name, email) VALUES ("ankit", "ankit@gmail.com");


 INSERT INTO orders (c_id)
VALUES
    (3),
    (3),
    (3);


UPDATE customer
SET
    c_id = 10
WHERE
    c_id = 3;

-- we have to use USE CASCADE while creating table so that we can change, alter the data of parent table and that change also reflects in child table in which we have taken foreign key

DROP TABLE orders;

CREATE TABLE orders (
    order_id INTEGER AUTO_INCREMENT,
    c_id INTEGER,
    date_of_order DATETIME DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT orders_pk PRIMARY KEY (order_id),
    CONSTRAINT orders_fk FOREIGN KEY (c_id)
        REFERENCES customer (c_id)
        ON
        DELETE
        CASCADE
        ON
        UPDATE
        CASCADE
);

INSERT INTO orders (c_id) VALUES (3);

SELECT *
FROM
    orders;
-- due to delete cascade orders also deleted of c_id = 1;
DELETE FROM customer
WHERE
    c_id = 1;


-- due to ON UPDATE CASCADE, c_id will also be updated in orders table, if changes are made in customer table
SELECT *
FROM
    customer;

UPDATE customer
SET
    c_id = 10
WHERE
    c_id = 2;


-- 













    
