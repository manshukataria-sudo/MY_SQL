# Write your MySQL query statement below

-- https://leetcode.com/problems/managers-with-at-least-5-direct-reports/description/?envType=study-plan-v2&envId=top-sql-50

SELECT t2.name FROM Employee t1
LEFT JOIN Employee t2
ON t1.managerId = t2.id
GROUP BY t2.id, t2.name, t2.department
HAVING COUNT(*) >= 5 AND (t2.name IS NOT NULL OR t2.department IS NOT NULL);