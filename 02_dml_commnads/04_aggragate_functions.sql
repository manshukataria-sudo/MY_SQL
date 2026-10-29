USE campusx;

-- MIN() / MAX()

-- find the phone with maximum price, minimum price
SELECT MAX(price) FROM smartphones;

-- with minimum price
SELECT MIN(price) FROM smartphones;


SELECT * FROM smartphones;

-- find the maximum ram_capacity

SELECT MAX(ram_capacity) FROM smartphones;

-- find the most costliest samsung phone
-- this query execution order
-- from smartphones table, where brand is "samsung" (row filteration), select the max_priced_phone
SELECT MAX(price) FROM smartphones
WHERE brand_name = "samsung";


-- AVG()
-- find the average rating of apple phones
SELECT AVG(rating) FROM smartphones
WHERE brand_name = "apple";


-- SUM ()
-- find the sum of price of all phones
SELECT SUM(price) FROM smartphones;

-- find the sum of price of all apple phones
SELECT SUM(price) FROM smartphones
WHERE brand_name = "apple";




-- COUNT ()
-- counts the no. of rows with specific condition
-- count the total no. of smartphones
SELECT COUNT(model) FROM smartphones;

-- count the total no. of oneplus phones
-- SELECT COUNT(model) FROM smartphones
SELECT COUNT(*) FROM smartphones
WHERE brand_name = "oneplus";





-- COUNT(DISTINCT <col_name>) => gives the count of unique values of the column
SELECT COUNT(DISTINCT brand_name) AS "Total Brands" FROM smartphones;


-- STD() => gives the standard deviation of the column
SELECT STD(screen_size) FROM smartphones;


-- VARIANCE () => gives the variance of the column
SELECT VARIANCE(screen_size) FROM smartphones;





