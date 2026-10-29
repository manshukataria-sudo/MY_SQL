USE campusx;

SELECT * FROM sleep_efficiency LIMIT 5;

SELECT * FROM sleep_efficiency;

ALTER TABLE sleep_efficiency
MODIFY COLUMN Bedtime DATE;

ALTER TABLE sleep_efficiency
RENAME COLUMN `Wakeup time` TO `wakeup_time`;


-- Find out the duration of top 15 male candidates who's sleep duration are equal to 7.5 or greater than 7.5.
SELECT * FROM sleep_efficiency
WHERE Gender = "Male" AND `Sleep duration` >= 7.5
ORDER BY `Sleep duration` DESC LIMIT 15;


-- Show avg deep sleep time for both gender. Round result at 2 decimal places.
SELECT Gender, ROUND(AVG(`Deep sleep percentage`/100 * `Sleep duration`), 2) AS "avg_deep_sleep" FROM sleep_efficiency
GROUP BY Gender;



-- Find out the lowest 10th to 30th light sleep percentage records where deep sleep percentage values are 
-- between 25 to 45. Display age, light sleep percentage and deep sleep percentage columns only.


SELECT AGE, `Light sleep percentage`, `Deep sleep percentage` FROM sleep_efficiency
WHERE `Deep sleep percentage` BETWEEN 25 AND 45
ORDER BY `Light sleep percentage` ASC LIMIT 10, 20;



-- Group by on exercise frequency and smoking status and show average deep sleep time, average light sleep time and avg rem sleep time.
-- Note the differences in deep sleep time for smoking and non smoking status
SELECT `Smoking status`, `Exercise frequency`, 
AVG(`Deep sleep percentage`/100 * `Sleep duration`) AS "avg_deep_sleep", 
AVG(`Light sleep percentage`/100 * `Sleep duration`) AS "avg_light_sleep",
AVG(`REM sleep percentage`/100 * `Sleep duration`) AS "avg_rem_sleep"
FROM sleep_efficiency
GROUP BY `Smoking status`, `Exercise frequency`;



-- Group By on Awekning and show AVG Caffeine consumption, AVG Deep sleep time and AVG Alcohol consumption 
-- only for people who do exercise atleast 3 days a week. Show result in descending order awekenings


SELECT Awakenings, 
AVG(`Caffeine consumption`) AS "avg_caffeine",
AVG(`Deep sleep percentage`/ 100 * `Sleep duration`) AS "avg_deep_sleep",
AVG(`Alcohol consumption`) AS "avg_alcohol"
FROM sleep_efficiency
WHERE `Exercise frequency` >= 3
GROUP BY Awakenings
ORDER BY Awakenings DESC;





-- Display those power stations which have average 'Monitored Cap.(MW)' (display the values) between 1000 and 2000 
-- and the number of occurance of the power stations (also display these values) are greater than 200. Also sort the result in ascending order.

SELECT * FROM power_generation LIMIT 3;

SELECT 
`Power Station`,
AVG(`Monitored Cap.(MW)`) AS "avg_monitored_cap" ,
COUNT(*) AS "num_count"
FROM power_generation
GROUP BY `Power Station`
HAVING 
AVG(`Monitored Cap.(MW)`) BETWEEN 1000 AND 2000 AND COUNT(*) > 200
ORDER BY `Power Station` ASC;




-- Display top 10 lowest "value" State names of which the Year either belong to 2013 or 2017 or 2021 and type is 'Public In-State'. 
-- Also the number of occurance should be between 6 to 10. Display the average value upto 2 decimal places, state names and the occurance of the states.

SELECT * FROM nces LIMIT 3;


SELECT ROUND(AVG(`Value`),2) AS "avg_val", State, COUNT(*) AS "occurence"
FROM nces
WHERE Year IN (2013, 2017, 2021) AND Type = "Public In-State"
GROUP BY State
HAVING COUNT(*) BETWEEN 6 AND 10
ORDER BY "avg_val" ASC 
LIMIT 10;





-- Best state in terms of low education cost (Tution Fees) in 'Public' type university.

SELECT State FROM nces
WHERE Type = "Public In-State"
GROUP BY State
ORDER BY AVG(Value) ASC LIMIT 1;


-- 2nd Costliest state for Private education in year 2021. Consider, Tution and Room fee both.

SELECT State FROM nces
WHERE Type = "Private" AND Year = 2021
GROUP BY State
ORDER BY AVG(Value) DESC LIMIT 1,1;


-- Display total and average values of Discount_offered for all the combinations of 'Mode_of_Shipment' (display this feature) a
-- nd 'Warehouse_block' (display this feature also) for all male ('M') and 'High' Product_importance. 
-- Also sort the values in descending order of Mode_of_Shipment and ascending order of Warehouse_block.











