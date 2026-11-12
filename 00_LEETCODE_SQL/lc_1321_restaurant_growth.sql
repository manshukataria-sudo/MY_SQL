-- https://leetcode.com/problems/restaurant-growth/

# Write your MySQL query statement below

SELECT visited_on, amount, average_amount FROM(
SELECT visited_on,
SUM(SUM(amount)) OVER(
                ORDER BY visited_on
                ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS "amount",
ROUND(AVG(SUM(amount)) OVER(
                ORDER BY visited_on
                ROWS BETWEEN 6 PRECEDING AND CURRENT ROW), 2) AS "average_amount",
ROW_NUMBER() OVER(ORDER BY visited_on) AS "day_num"
FROM Customer
GROUP BY visited_on) t1
WHERE t1.day_num >= 7;