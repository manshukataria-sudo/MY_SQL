# Write your MySQL query statement below
-- mujhe nahin pata kaise solve hua but ho gaya


-- https://leetcode.com/problems/movie-rating/?envType=study-plan-v2&envId=top-sql-50

WITH user_votes AS (
    SELECT Users.name, COUNT(*) AS votes FROM Users
    INNER JOIN MovieRating
    ON Users.user_id = MovieRating.user_id
    GROUP BY Users.user_id
),
movie_votes AS (
    SELECT Movies.title, AVG(rating) AS avg_rating FROM Movies
    INNER JOIN MovieRating
    ON Movies.movie_id = MovieRating.movie_id
    WHERE DATE_FORMAT(MovieRating.created_at, "%Y-%m") = "2020-02"
    GROUP BY Movies.movie_id
)


SELECT * FROM (SELECT name AS results FROM user_votes
WHERE votes = (SELECT MAX(votes) FROM user_votes)
ORDER BY name LIMIT 1) t1

UNION ALL
-- because person and movie have same name at test case 19
SELECT * FROM (SELECT title AS result FROM movie_votes
WHERE avg_rating = (SELECT MAX(avg_rating) FROM movie_votes)
ORDER BY title LIMIT 1) t2