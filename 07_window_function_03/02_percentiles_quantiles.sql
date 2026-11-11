-- window funciton to calculate the percentiles and quantiles in data  

-- find the median marks of all students
SELECT * FROM marks;

SELECT *,
PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY marks) OVER() AS "median_marks_disc",
PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY marks) OVER() AS "median_marks_cont"
FROM marks;



-- find the median marks branch wise
SELECT *,
PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY marks) OVER(PARTITION BY branch) AS "median_marks_disc",
PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY marks) OVER(PARTITION BY branch) AS "median_marks_cont"
FROM marks;