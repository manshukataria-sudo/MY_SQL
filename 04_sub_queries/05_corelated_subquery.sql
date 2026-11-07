-- subquery that depends upon the outer query for it's execution

-- find all the movies that have a rating higher than the average rating of movies in the same genre (animation, etc)

USE sql_cx_live;

SELECT * FROM movies m1
WHERE score > (SELECT AVG(score) FROM movies m2 WHERE m2.genre = m1.genre);


-- find the favourite food of each customer
USE zomato;

SELECT * FROM order_details;
SELECT * FROM users;
SELECT * FROM food;
SELECT * FROM orders;


-- to make it less complex, We will be using the Common Table Expression (CTE)

-- this table stores, count of each food, food_name ordered by each customer
WITH fav_food AS (
    SELECT name, f_name, COUNT(*) AS count FROM users
    INNER JOIN orders
    ON users.user_id = orders.user_id
    INNER JOIN order_details
    ON orders.order_id = order_details.order_id
    INNER JOIN food
    ON order_details.f_id = food.f_id
    GROUP BY users.name, food.f_name
)
SELECT * FROM fav_food t1
WHERE count = (SELECT MAX(count) FROM fav_food t2 WHERE t1.name = t2.name);






















