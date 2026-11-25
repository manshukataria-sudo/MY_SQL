# Write your MySQL query statement below

-- https://leetcode.com/problems/last-person-to-fit-in-the-bus/?envType=study-plan-v2&envId=top-sql-50
WITH cte AS (
    SELECT *,
    SUM(weight) OVER(ORDER BY turn 
    ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'total_weight'
    FROM Queue
)
SELECT person_name FROM cte
WHERE total_weight = (SELECT MAX(total_weight) FROM cte WHERE total_weight <= 1000);