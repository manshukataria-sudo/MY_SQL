-- ALTER TABLE command is used to alter the structure of TABLE
-- we can add columns, remove columns, and modify the columns

SELECT *
FROM
    customer;

-- adding password column in the customer table      
-- ADD COLUMN
-- empty stirngs are filled in the previously added columns without password

ALTER TABLE customer ADD COLUMN password VARCHAR(255) NOT NULL;

-- adding column at a specific position
-- using AFTER
ALTER TABLE customer ADD COLUMN surname VARCHAR(255) NOT NULL AFTER name;



-- adding multiple columns in one command, at specific positions
ALTER TABLE customer
ADD COLUMN pan_no VARCHAR(255) AFTER surname,
ADD COLUMN joining_date DATETIME DEFAULT CURRENT_TIMESTAMP AFTER password;

SELECT * FROM customer;




-- deleting column from the table  
-- deleting the surname column
ALTER TABLE customer DROP COLUMN surname;



-- deleting the multiple columns
ALTER TABLE customer 
DROP COLUMN pan_no,
DROP COLUMN password;


-- modify the multiple columns, i.e we can change the datatype of column and add constraints, but the data of that column should also satisfy the constraints
-- here we changed the data type of the columns
ALTER TABLE customer
MODIFY COLUMN surname INTEGER,
MODIFY COLUMN password VARCHAR(255);




