USE campusx;

-- WHERE clause is used to filter the rows, based on conditions
-- and we can fetch the filtered rows using, SELECT keyword

-- fetch all the phones having brand_name is "samsung"
SELECT * FROM smartphones 
WHERE brand_name = "samsung";

-- fetch all the phones having price more than 50,000
SELECT * FROM smartphones
WHERE price > 50000;

-- find all the phones in price range of 10,000 and 20,000
SELECT * FROM smartphones
WHERE price > 10000 AND price < 20000;

-- BETWEEN clause, can be used for the above task
SELECT * FROM smartphones
WHERE price BETWEEN 10000 AND 20000;


-- find phones with price < 25000 and rating > 80
SELECT * FROM smartphones
WHERE price < 25000 AND rating > 80;

-- find phones with price < 15000 and rating > 80 and processor_brand = snapdragon
SELECT * FROM smartphones
WHERE rating > 80 AND price < 15000 AND processor_brand = "snapdragon";


-- find all samsung phones with ram > 8Gb
SELECT * FROM smartphones
WHERE brand_name = "samsung" AND ram_capacity > 8;


-- find all samsung phones with processor_brand = snapdragon
SELECT * FROM smartphones
WHERE brand_name = "samsung" AND processor_brand = "snapdragon";



SELECT * FROM smartphones;

-- find all the brand_name which sells smartphones price > 50000
SELECT DISTINCT brand_name FROM smartphones
WHERE price > 50000;



-- fetch all phones having processor_brand "snapdragon" or "exynos" or "bionic"

SELECT model, processor_brand FROM smartphones
WHERE processor_brand = "snapdragon" OR
processor_brand = "exynos" OR
processor_brand = "bionic";

-- using the IN ans NOT IN 
SELECT * FROM smartphones
WHERE processor_brand IN ('snapdragon', 'exynos', 'bionic');


-- fetch all the phones not having processor_brand "snapdragon", "exynos", "bionic"
SELECT * FROM smartphones
WHERE processor_brand NOT IN ('snapdragon', 'exynos', 'bionic');


