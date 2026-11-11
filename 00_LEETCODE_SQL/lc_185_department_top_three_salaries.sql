-- https://leetcode.com/problems/department-top-three-salaries/?envType=study-plan-v2&envId=top-sql-50


SELECT Department, Employee, Salary
FROM 
(SELECT t2.name AS "Department", t1.name AS "Employee", t1.salary AS "Salary",
DENSE_RANK() OVER(PARTITION BY departmentId ORDER BY salary DESC) AS "rank"
FROM Employee t1
INNER JOIN Department t2
ON t1.departmentId = t2.id) t3
WHERE t3.rank < 4;