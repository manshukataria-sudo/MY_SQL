-- FIRST_VALUE, LAST_VALUE and NTH_VALUE
-- helps to extract values, from windows



-- find the student having the highest marks among all branches
USE campusx;
SELECT *,
FIRST_VALUE(name) OVER(ORDER BY marks DESC) AS topper
FROM marks;



-- find the student having lowest marks among all branches
-- it doesn't gives correct answer, due to the concept of FRAMES
-- Default Frame : ROWS BETWEEN UNBOUNDED PRECEDING(first row of partition/window) AND CURRENT ROW
-- it's choosing the last row from the frame which is the current row
SELECT *,
LAST_VALUE(marks) OVER(ORDER BY marks DESC)
FROM marks;



-- Hence, we have to use the Frame:
-- ROWS BETWEEN UNBOUNDED PRECEDING (first_row) AND UNBOUNDED FOLLOWING (last_row)
SELECT *,
LAST_VALUE(marks) OVER(ORDER BY marks DESC 
                        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS lowest_marks
FROM marks;

-- for branch wise lowest marks
SELECT *,
LAST_VALUE(marks) OVER(PARTITION BY branch
                        ORDER BY marks DESC
                        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as branch_lowest
FROM marks; 




-- NTH_VALUE(name, n) => adds a column of nth name from the frame, at the front of every row
-- find the second branch topper of every branch
SELECT *,
NTH_VALUE(name, 2) OVER(PARTITION BY branch
                        ORDER BY marks DESC
                        ROWS BETWEEN UNBOUNDED PRECEDING AND 1 FOLLOWING) AS 2nd_branch_topper
FROM marks;




-- Questions 
-- find the name, branch, marks of each branch having lowest marks
-- with new syntax of using the window function, here window function is used inside subquery i.e why it is defined inside the subquery
SELECT name, branch, marks
FROM ( SELECT *,
        LAST_VALUE(name) OVER xyz AS topper_name,
        LAST_VALUE(marks) OVER xyz AS topper_marks
        FROM marks
            WINDOW xyz AS (
                PARTITION BY branch
                ORDER BY marks DESC
                ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING
            )
        )
t1 WHERE t1.topper_name = t1.name AND t1.topper_marks = t1.marks












