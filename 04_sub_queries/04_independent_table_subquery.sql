-- independent subquery => subquery that don't depends upon the outer query
-- table subquery => subquery that returns multiple rows and columns i.e table  

SELECT * FROM movies;

-- find the movies with highest profit in each year
SELECT * FROM movies
WHERE (year, gross - budget) IN (SELECT year, MAX(gross - budget) FROM movies
                                 GROUP BY year);


-- find the highest rated movie of each genre, with cutoff 25000 votes

SELECT * FROM movies 
WHERE (genre, score) IN (SELECT genre, MAX(score) FROM movies
WHERE votes > 25000
GROUP BY genre)
AND votes > 25000;


-- find the highest grossing movies of top 5 actor/director combo in terms of total gross income
-- here we can't write subquery as we are using the LIMIT, so using the CTE (common table expression)


WITH top_combos AS (
SELECT director, star, MAX(gross) FROM movies
GROUP BY director, star
ORDER BY MAX(gross) DESC LIMIT 5
)
SELECT * FROM movies
WHERE (director, star, gross) IN (SELECT * FROM top_combos)







































