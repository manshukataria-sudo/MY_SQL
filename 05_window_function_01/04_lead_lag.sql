-- LEAD(marks) => creates a column of marks of just +1 row of the current row
-- LAG(marks) => creates a column of marks of just previous row of the current row


SELECT * FROM marks;

SELECT *, 
LEAD(marks) OVER(),
LAG(marks) OVER()
FROM marks;


-- find the Month on Month revenue growth of zomato

USE zomato;


SELECT MONTH(date) AS month, SUM(amount) AS revenue,
ROUND(((SUM(amount) - LAG(SUM(amount)) OVER(ORDER BY MONTH(date)))/ LAG(SUM(amount)) OVER(ORDER BY MONTH(date))) * 100, 2) AS growth_rate
FROM orders
GROUP BY MONTH(date)