USE sql_cx_live;



-- subquery => query inside the query
-- to find the movie with highest rating in movie table
SELECT * FROM movies
WHERE score = 9.3;

-- it is a hardcoded example, to make it dynamic, use the subquery
SELECT * FROM movies
WHERE score = (SELECT MAX(score) FROM movies);


SELECT * FROM movies;