USE sql_cx_live;

SELECT * FROM movies LIMIT 1;

SELECT * FROM movies
ORDER BY score DESC LIMIT 1;

SELECT * FROM movies
WHERE score = (SELECT MAX(score) FROM movies);

SELECT * FROM movies
ORDER BY movies.gross-movies.budget DESC LIMIT 1;


SELECT * FROM movies 
WHERE gross - budget = (SELECT MAX(gross - budget) FROM movies);

SELECT * FROM movies
WHERE score > (SELECT AVG(score) FROM movies);


SELECT * FROM movies
WHERE year = 2000
ORDER BY score DESC LIMIT 1;

SELECT * FROM movies
WHERE year = 2000 AND rating = (SELECT MAX(score) FROM movies 
WHERE year = 2000);


SELECT * FROM movies
WHERE votes > (SELECT AVG(votes) FROM movies)
ORDER BY score DESC LIMIT 1;


SELECT * FROM movies
WHERE score = (SELECT MAX(score) FROM movies)
AND votes > (SELECT AVG(votes) FROM movies);



USE zomato;

SELECT * FROM users;
SELECT * FROM orders;


SELECT * FROM users
WHERE user_id IN 
(SELECT users.user_id FROM users
LEFT JOIN orders
ON orders.user_id = users.user_id
WHERE order_id IS NULL);



SELECT * FROM users
WHERE user_id NOT IN (SELECT DISTINCT user_id FROM orders);



USE sql_cx_live;
SELECT * FROM movies LIMIT 1;


SELECT * FROM movies
WHERE star IN(
SELECT star FROM movies
WHERE votes > 25000
GROUP BY star
HAVING AVG(score) >= 8) AND votes > 25000;























