-- partition on the basis of multiple columns

SELECT * FROM flights;


-- find the cheapest Airline between two cities
SELECT * FROM 
(SELECT Airline, Source, Destination,
AVG(price) AS "avg_fare",
DENSE_RANK() OVER(PARTITION BY Source, Destination ORDER BY AVG(price)) AS "rank"
FROM flights
GROUP BY Airline, Source, Destination) t1
WHERE t1.`rank` = 1;