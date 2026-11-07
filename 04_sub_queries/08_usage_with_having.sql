-- find genres having average score > avg score of all the movies

USE sql_cx_live;

SELECT genre, AVG(score) FROM movies
GROUP BY genre 
HAVING AVG(score) > (SELECT AVG(score) FROM movies);