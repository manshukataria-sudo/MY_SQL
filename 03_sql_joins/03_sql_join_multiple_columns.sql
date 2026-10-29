-- when to get the information we have to calculate the join on multiple columns
-- example => class and students table, in it we have to find the class teacher of each student at the time of enrollment
-- we need join on combination of class_id and enrollment_year of student table
USE sql_cx_live;


SELECT * FROM students t1
LEFT JOIN class t2
ON t1.class_id = t2.class_id AND t1.enrollment_year = t2.class_year; 


-- join on more than 2 tables, here we are joining three tables to get the info which order is placed by which user's name

USE flipkart;

SELECT * FROM flipkart.users t1
INNER JOIN flipkart.orders t2
ON t1.user_id = t2.user_id
INNER JOIN flipkart.order_details t3
ON t3.order_id = t2.order_id;





-- to get the particular columns from the joined table we do 

SELECT t1.user_id, t1.name, t2.order_date, t3.order_id FROM flipkart.users t1
INNER JOIN flipkart.orders t2
ON t1.user_id = t2.user_id
INNER JOIN flipkart.order_details t3
ON t3.order_id = t2.order_id;



SELECT t2.order_id, t1.name, t1.city FROM flipkart.users t1
INNER JOIN orders t2
ON t1.user_id = t2.user_id;




SELECT t1.order_id, t2.category FROM order_details t1
INNER JOIN category t2
ON t1.category_id = t2.category_id;


-- filtering rows => we can use WHERE clause for filtering the rows after joining the tables,
-- because WHERE is executed after joining the tables

-- find all the orders placed from PUNE city
  
  
SELECT * FROM users t1
INNER JOIN orders t2
ON t1.user_id = t2.user_id
WHERE t1.city = "Pune";


-- find all orders under chair category
SELECT t1.order_id, t2.vertical FROM order_details t1
INNER JOIN category t2
ON t1.category_id = t2.category_id
WHERE t2.vertical = "Chairs";







