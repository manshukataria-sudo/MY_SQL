-- FIRST_VALUE, LAST_VALUE and NTH_VALUE
-- helps to extract values, from windows



-- find the student having the highest marks among all branches
SELECT *,
FIRST_VALUE(name) OVER(ORDER BY marks DESC)
FROM marks;