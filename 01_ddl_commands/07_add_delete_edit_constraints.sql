-- we can add, delete the constraints already made columns using the alter command

SELECT * FROM customer;

-- created new column
ALTER TABLE customer 
ADD COLUMN age INTEGER NOT NULL;

-- adding the constraint
ALTER TABLE customer
-- we can't add this constraint, as we already added the age column with not null and the age of preexisting rows is set to 0
ADD CONSTRAINT customer_age_check CHECK (age>13);

ALTER TABLE customer
ADD CONSTRAINT customer_age_check CHECK (age>=0);


-- cannot add negative age as the constraint CHECK was there
INSERT INTO customer (name, email, age)
VALUES ("samar", "samar@gmail.com", -5);


-- deleting the constraint, by DROP CONSTRAINT, by the name of constraint
ALTER TABLE customer 
DROP CONSTRAINT customer_age_check;


-- here filled the negative age as, the constraint was removed
INSERT INTO customer(name, email, age)
VALUES ("samar", "samar@gmail.com", -9);

-- to edit the constraint of a column, we have to first delete that constraint and then add the new constraint
























