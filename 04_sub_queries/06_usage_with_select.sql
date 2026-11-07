-- find the percentage of votes of each movie compared to the total no. of votes

USE sql_cx_live;
SELECT * FROM movies LIMIT 1;

SELECT name, ROUND((votes/(SELECT SUM(votes) FROM movies)) * 100, 3) AS percent FROM movies;



-- display all movie names, genre, score and avg(score)

SELECT name, genre, score,
(SELECT AVG(score) FROM movies m2 WHERE m2.genre = m1.genre) AS avg_genre_score 
FROM movies m1;