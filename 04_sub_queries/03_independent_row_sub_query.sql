USE zomato;



-- independent query => subquery that doesn't depend upon the outer query
-- row sub_query => subquery that returns one column and multiple rows


-- find all the users who never ordered
SELECT * FROM users;

SELECT * FROM users
LEFT JOIN orders
ON users.user_id = orders.user_id
WHERE order_id IS NULL;


-- here subquery is returning a single column and multiple rows, i.e of user_id
SELECT * FROM users
WHERE user_id NOT IN (SELECT DISTINCT user_id FROM orders);




-- find all the movies made by top 3 directors (in terms of total gross income)
USE sql_cx_live;
SELECT * FROM movies;


-- this is a solution but LIMIT don't works in subquery
SELECT * FROM movies
WHERE director IN (SELECT director FROM movies
GROUP BY director
ORDER BY SUM(gross) DESC LIMIT 3);

-- therefore using the common table expression(CTE)
WITH top_directors AS (SELECT director FROM movies
                        GROUP BY director
                        ORDER BY SUM(gross) DESC LIMIT 3)
SELECT * FROM movies
WHERE director IN (SELECT * FROM top_directors);




-- find all the movies of all actors whose filmography avg rating > 8.5 (take 25000 votes as cutoff)
-- i.e actors having avg rating of all movies greater than 8.5
SELECT * FROM movies;

USE sql_cx_live;


SELECT * FROM movies
WHERE star IN (SELECT star FROM movies
                WHERE votes > 25000
                GROUP BY star
                HAVING AVG(score) > 8.5)
                AND votes > 25000;

























