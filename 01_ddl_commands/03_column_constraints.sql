-- NOT NULL constraint, value of that column cannot be null
DROP DATABASE IF EXISTS campusx;
CREATE TABLE user (
    user_id INTEGER NOT NULL,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    password VARCHAR(255)
);

INSERT INTO user (user_id, username, email, password)
VALUES
    (1, "manshu", "manshu@gmail.com", "1234"),
    (2, "anshu", "anshu@gmail.com", "1234");

SELECT *
FROM
    user;

-- creating row, having no value in NOT NULL column gives error in strict mode, and fills 0, "", 00:00:0000 in not strict mode
-- INSERT INTO user (email, password) VALUES ("", "");


-- UNIQUE constriant => values of that column should be unique
DROP TABLE user;
USE campusx;
CREATE TABLE users (
    user_id INTEGER NOT NULL,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

INSERT INTO users (user_id, name, email, password) VALUES (1, "manshu", "", "1234");
-- not able to insert same row again, due to duplicate email, empty string also inserted once

INSERT INTO users (user_id, name, email, password) VALUES (2, "ansh", NULL, "1234");
--  even not able to fill the NULL due to NOT NULL constraint
SELECT *
FROM
    users;


-- a different way of adding constraints, at the end of table
CREATE TABLE students(
    -- we can add primary key in the same way
    enroll VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    branch VARCHAR(255) NOT NULL,

    -- CONSTRAINT <var name of constraint> <constraint => < UNIQUE/ NOT NULL/ PRIMARY KEY/ FOREIGN KEY > (column names)
    -- a name is given to the constraint, if in future its needed to delete the constraint , we can delete easily
    -- here constraint iS applied on the combination, i.e enroll and branch combination should be unique
    CONSTRAINT student_enroll_unique UNIQUE (enroll, branch),
    

    -- here also the combination of both enroll and branch will work as PRIMARY KEY
    CONSTRAINT student_pk PRIMARY KEY (enroll, branch)
);


DROP TABLE students;


-- AUTO INCREMENT constraint, value of that column increases one by one automatically
CREATE DATABASE IF NOT EXISTS campusx;
USE campusx;
CREATE TABLE students(
    enroll INTEGER AUTO_INCREMENT,
    name  VARCHAR(255) NOT NULL,
    branch VARCHAR(255) NOT NULL,

    CONSTRAINT students_pk PRIMARY KEY (enroll)
    -- we can only use the (UNIQUE, PRIMARY KEY, FOREIGN KEY, CHECK) constraints in this way
    -- CONSTRAINT students_name_not_null NOT NULL (name) -- it gives an error
);
INSERT INTO students (name, branch)
VALUES ("samar", "cse");


SELECT * FROM students;

