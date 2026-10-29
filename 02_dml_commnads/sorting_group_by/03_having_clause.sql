-- to apply constraints on table, we use WHERE 
-- to apply constraints on groups, made by GROUP BY, we use the HAVING clause

-- find the costliest brands, having at least 10 smartphones
SELECT brand_name, ROUND(AVG(price)) AS "avg_price" , COUNT(*) AS "count"
FROM smartphones
GROUP BY brand_name
HAVING count > 20
ORDER BY avg_price DESC;


-- find the avg rating of brands, having no. of phones more than 20
SELECT brand_name, ROUND(AVG(rating), 2) AS "avg_rating", COUNT(*) AS "count" FROM smartphones
GROUP BY brand_name
HAVING count > 20;


-- find the top 3 brands, with highest avg ram, that have a refresh rate of 90 Hz at least and fast charging available and don't consider brands having phones less than 10

SELECT brand_name, ROUND(AVG(ram_capacity),2) AS "avg_ram" FROM smartphones
WHERE refresh_rate >= 90 AND fast_charging_available = 1
GROUP BY brand_name
HAVING COUNT(*) >= 10
ORDER BY avg_ram DESC LIMIT 5;



SELECT * FROM smartphones LIMIT 2;



-- find the avg price of all the phone brands, avg_rating > 70 and num_phones > 10 among all the 5G enabled phones

SELECT brand_name, ROUND(AVG(price), 2) AS "avg_price" FROM smartphones
WHERE has_5g = "True"
GROUP BY brand_name
HAVING AVG(rating) > 70 AND COUNT(*) > 10;






















