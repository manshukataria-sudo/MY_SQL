USE campusx;

-- to fetch all the columns from the table
SELECT * FROM smartphones;


-- to fetch the particular columns of a table  
SELECT model, price, rating FROM smartphones;


SELECT model, battery_capacity, os FROM smartphones;

-- we can fetch column by any order
SELECT os, battery_capacity, model FROM smartphones;


-- we can use AS to get the column name as named,
SELECT os AS "operating system", model, battery_capacity AS "batter_capacity (mAH)" FROM smartphones;


-- we can use mathematical formula on previous, columns to derive the new columns
-- fetching the model's name along with the pixels per inch via using maths on previous columns
SELECT model,
SQRT(resolution_width*resolution_width + resolution_height*resolution_height)/screen_size AS "ppi" FROM smartphones;


-- fetching model and rating of model on the scale of 10, as it is out of 100
SELECT model, rating/10 AS "rating on scale 10" FROM smartphones;


-- we can add new column just for display, with any name
SELECT model, "smartphone" AS "type" FROM smartphones;


-- we can use the DISTINCT function to fetch the unique values of a column
SELECT DISTINCT brand_name AS "All Brands" FROM smartphones;



-- fetching the distinct brands of processors
SELECT DISTINCT processor_brand AS "processors" FROM smartphones; 

-- fetch the unique values of operating system
SELECT DISTINCT os AS "operating_systems" FROM smartphones;

-- we can fetch the unique combos of table columns
-- here fetching the unique combos of brand_name and processor_brand
SELECT DISTINCT brand_name, processor_brand FROM smartphones;















