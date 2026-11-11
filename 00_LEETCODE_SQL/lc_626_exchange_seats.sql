-- https://leetcode.com/problems/exchange-seats/

SELECT id,
CASE
    WHEN id % 2 = 0 THEN LAG(student) OVER(ORDER BY id)
    ELSE IFNULL(LEAD(student) OVER(ORDER BY id), (SELECT student FROM Seat t2 WHERE t2.id = t1.id)) END
AS "student"
FROM Seat t1;