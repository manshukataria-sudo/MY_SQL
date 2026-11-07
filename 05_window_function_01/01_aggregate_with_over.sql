USE campusx;


CREATE TABLE marks (
 student_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    branch VARCHAR(255),
    marks INTEGER
);

INSERT INTO marks (name,branch,marks)VALUES 
('Nitish','EEE',82),
('Rishabh','EEE',91),
('Anukant','EEE',69),
('Rupesh','EEE',55),
('Shubham','CSE',78),
('Ved','CSE',43),
('Deepak','CSE',98),
('Arpan','CSE',95),
('Vinay','ECE',95),
('Ankit','ECE',88),
('Anand','ECE',81),
('Rohit','ECE',95),
('Prashant','MECH',75),
('Amit','MECH',69),
('Sunny','MECH',39),
('Gautam','MECH',51);


SELECT * FROM marks;

-- got the single value of average
SELECT AVG(marks) FROM marks;

-- got new column of average marks for each row
SELECT AVG(marks) OVER() FROM marks;

-- got all the columns along with a new column of average marks
-- OVER() => considered the complete table a window, because no condition was specified it in
SELECT *, AVG(marks) OVER() FROM marks;

-- for the average marks of particular branch, we use the PARTITION BY branch
SELECT *, AVG(marks) OVER(PARTITION BY branch) FROM marks;

-- two new columns having values maximum marks and minimum marks, from complete data
SELECT *, 
MAX(marks) OVER(), 
MIN(marks) OVER(),
MAX(marks) OVER(PARTITION BY branch),
MIN(marks) OVER(PARTITION BY branch)
FROM marks;


-- find all the students who have marks higher than the average marks of their respective branch
SELECT * FROM (SELECT *, AVG(marks) OVER(PARTITION BY branch) AS branch_avg FROM marks) t1
WHERE t1.marks > t1.branch_avg;














