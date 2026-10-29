-- scalar functions are functions that returns a value(scalar) for every value of column

SELECT * FROM smartphones;

-- ABS() => gives the absolute value (modolus), of all values of column
SELECT ABS(100000-price) AS "neg_prices" FROM smartphones;


-- ROUND( column, n) => round off each value to upto n decimal_places
SELECT * FROM smartphones;

-- finding ppi of each device and then rounding off it
SELECT ROUND(SQRT((resolution_width * resolution_width) + (resolution_height*resolution_height))/screen_size, 2) AS "ppi" FROM smartphones;



-- CEIL () => it makes current value the just greater integer
-- FLOOR() => it makes current value the just smaller integer

-- apply CEIL on screen size
SELECT CEIL(screen_size) AS "ceiled_screen_size" FROM smartphones;

-- apply FLOOR on screen size
SELECT FLOOR(screen_size) AS "floored_screen_size" FROM smartphones;