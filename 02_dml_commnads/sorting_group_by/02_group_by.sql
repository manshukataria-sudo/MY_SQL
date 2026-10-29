
-- GROUP BY group the rows of parent table into several, tables made on the basis of some conditon
-- we can perform various, aggregate functions on each table and get the result

-- Group the smartphones by brand, get count, average price, max rating, avg screen size and avg battery capacity of each brand

USE campusx;

SELECT brand_name, COUNT(*) AS "count", 
ROUND (AVG(price)) AS "avg_price", 
MAX(rating) AS "max_rating", 
ROUND(AVG(screen_size), 2) AS "avg_screen_size", 
ROUND(AVG(battery_capacity), 2) AS "avg_battery"
FROM smartphones
GROUP BY brand_name
ORDER BY count DESC LIMIT 15;


-- group smartphones weather they have nfc, and get average price and rating
SELECT * FROM smartphones
LIMIT 2;

SELECT has_nfc, ROUND(AVG(price)) AS "avg_price", ROUND(AVG(rating)) AS "avg_rating", COUNT(*) AS "num_phones" FROM smartphones
GROUP BY has_nfc;


-- group smartphones on the basis of extended_memory_available feature, and get the average price
SELECT extended_memory_available, ROUND(AVG(price)) AS "avg_price", COUNT(*) AS "num_phones" FROM smartphones
GROUP BY extended_memory_available;






-- group by on the basis of multiple columns, no. of groups are product of possible values of both columns


-- group smartphone by brand and processor brand, and get the count of model and avg primary camera resolution rear  
SELECT brand_name, processor_brand, 
COUNT(*) AS "num_phones", 
ROUND(AVG(primary_camera_rear)) AS "avg_primary_camera" 
FROM smartphones
GROUP BY brand_name, processor_brand;


-- find top 5 most costly phone brands
SELECT brand_name, ROUND(AVG(price)) AS "avg_price"
FROM smartphones
GROUP BY brand_name
ORDER BY avg_price DESC LIMIT 5;



-- which brand makes the smallest screen size smartphones
SELECT brand_name, ROUND(AVG(screen_size),2) AS "screen_size" FROM smartphones
GROUP BY brand_name
ORDER BY screen_size ASC LIMIT 5;


-- avg price of 5g phones and non 5g phones
SELECT has_5g, ROUND(AVG(price), 2) AS "avg_price" FROM smartphones
GROUP BY has_5g;


-- group smartphones by brand, find the brands with highest no. of models have both nfc and 5g

SELECT brand_name, COUNT(*) AS "num_phones" FROM smartphones
WHERE has_5g = "True" AND has_nfc = "True"
GROUP BY brand_name
ORDER BY num_phones DESC LIMIT 10;



-- find all samsung 5g enabled smartphones, find out the avg price of nfc and non-nfc phones
SELECT brand_name, has_nfc, ROUND(AVG(price), 2) AS "avg_price" FROM smartphones
WHERE brand_name = "samsung"
GROUP BY has_nfc;


-- find the name, price of the costliest phone
SELECT brand_name, price FROM smartphones
ORDER BY price DESC LIMIT 1;






