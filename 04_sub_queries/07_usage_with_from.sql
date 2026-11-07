
-- display average rating of all the restaurants

USE zomato;

SELECT * FROM orders;
SELECT * FROM restaurants;


SELECT restaurants.r_name, avg(orders.restaurant_rating) FROM orders
INNER JOIN restaurants
ON orders.r_id = restaurants.r_id
GROUP BY restaurants.r_name;


-- with subquery
SELECT r_name, avg_rating FROM (SELECT r_id, AVG(restaurant_rating) AS avg_rating FROM orders
GROUP BY r_id) t1 INNER JOIN restaurants
ON t1.r_id = restaurants.r_id;
