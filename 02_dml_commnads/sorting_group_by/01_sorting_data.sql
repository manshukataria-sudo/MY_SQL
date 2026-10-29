USE campusx;

-- find top 5 samsung phones with biggest screen size
-- using ORDER BY, DESC, LIMIT
SELECT model, screen_size FROM smartphones
WHERE brand_name = "samsung"
ORDER BY screen_size DESC 
LIMIT 5;


-- find phones having maximum total no. of cameras front and rear 
SELECT model, num_rear_cameras + num_front_cameras AS "total_cameras" FROM smartphones
ORDER BY total_cameras DESC;

SELECT * FROM smartphones LIMIT 0;

-- sort data on the basis of ppi in descending order
SELECT model, ROUND(SQRT(resolution_width * resolution_width + resolution_height * resolution_height)/screen_size,2) AS "ppi" FROM smartphones
ORDER BY ppi DESC;


-- find the phone with second highest battery capacity, freshers specials

UPDATE smartphones
SET battery_capacity = NULL 
WHERE battery_capacity = "";
ALTER TABLE smartphones
MODIFY COLUMN battery_capacity INTEGER;

-- SELECT * FROM (
-- (SELECT model, battery_capacity FROM smartphones
-- ORDER BY battery_capacity DESC
-- LIMIT 2)
-- )
-- ORDER BY battery_capacity ASC
-- LIMIT 1;



-- LIMITS X, Y => x = offset, count of rows to skip from index (0 to x-1) and then print the next Y count rows
SELECT model, battery_capacity FROM smartphones
ORDER BY battery_capacity DESC LIMIT 1,1; 


-- find the fifth phone with largest battery
SELECT model, battery_capacity FROM smartphones
ORDER BY battery_capacity DESC
LIMIT 4, 1;



-- find the 4th and 5th phone
SELECT model, battery_capacity FROM smartphones
ORDER BY battery_capacity DESC
LIMIT 3,2;


-- find phone with second lowest battery capacity
SELECT model, battery_capacity FROM smartphones
WHERE battery_capacity IS NOT NULL
ORDER BY battery_capacity ASC
LIMIT 1,1;


-- find the name and rating of worst rated apple phones
SELECT model, rating FROM smartphones
WHERE brand_name = "apple"
ORDER BY rating ASC;



-- we can sort data on the basis of 2 columns, 
-- sort on the basis of brand and price i.e all apple phones will come first having prices in sorted order

SELECT brand_name, model, price FROM smartphones
ORDER BY brand_name ASC, price ASC;

ALTER TABLE smartphones
MODIFY COLUMN price INTEGER;


-- sort phones on the basis of name asc and then rating in desc  
SELECT brand_name, model, rating FROM smartphones
ORDER BY brand_name ASC, rating DESC; 

















