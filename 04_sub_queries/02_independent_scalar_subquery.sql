-- independent scalar subqueries are the subqueries 
-- that returns a single value
-- it's execution doesn't depend upon outer query

-- find the movies with highest profit
SELECT * FROM movies LIMIT 1;

SELECT name, gross - budget AS "PROFIT" FROM movies
ORDER BY PROFIT DESC LIMIT 1;


SELECT * FROM movies
WHERE gross - budget = (SELECT MAX(gross-budget) FROM movies);



-- find the no. of movies with rating above than average rating of all movies
SELECT COUNT(name) AS above_avg_movies FROM movies
WHERE score > (SELECT AVG(score) FROM movies);

-- find the highest rated movie of year 2000
SELECT * FROM movies
WHERE year = 2000
ORDER BY score DESC LIMIT 1;



SELECT * FROM movies
WHERE year = 2000 AND score = (SELECT MAX(score) FROM movies
WHERE year = 2000);



-- find the highest rated movie among all the movies whose no. of votes are > the dataset avg votes


SELECT * FROM movies
WHERE score = (SELECT MAX(score) FROM movies
WHERE votes > (SELECT AVG(votes) FROM movies));

















