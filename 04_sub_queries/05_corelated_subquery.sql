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