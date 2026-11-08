
SELECT * FROM marks;

-- rank each student on the basis of marks
SELECT *,
RANK() OVER(ORDER BY marks DESC)
FROM marks;


-- for ranking branch wise
-- if two students got same highest marks in same branch they both will get the same RANK 1, and the 2nd rank will be skipped
-- directly 3rd Rank will be alloted to the 2nd highest scorer
SELECT *,
RANK() OVER(PARTITION BY branch ORDER BY marks DESC)
FROM
marks;


-- DENSE_RANK() => it removes the above functionality of RANK(), i.e 2nd rank will be alloted after two 1 Rankers
SELECT *, 
DENSE_RANK() OVER(PARTITION BY branch ORDER BY marks DESC)
FROM
marks;


-- ROW_NUMBER() => it assigns a row_number to every row
SELECT *,
ROW_NUMBER() OVER(PARTITION BY branch)
FROM marks;


-- assign row_number consist of branch and student_no in branch
-- using the STRING's concatenate function CONCAT()
SELECT *,
CONCAT(branch, '-', ROW_NUMBER() OVER(PARTITION BY branch))
FROM marks;


-- find top 2 most paying customers of each month
USE zomato;
SELECT * FROM orders;


SELECT * FROM (SELECT user_id,
                SUM(amount) AS month_spent, 
                DATE_FORMAT(date, "%Y-%m") as month,
                RANK() OVER(PARTITION BY DATE_FORMAT(date, "%Y-%m") ORDER BY SUM(amount) DESC) AS month_rank
                FROM orders
                GROUP BY user_id, DATE_FORMAT(date, "%Y-%m")
                ORDER BY month) t1
WHERE t1.month_rank < 3;



-- create roll number from branch and marks
USE campusx;

SELECT * FROM marks;

SELECT *,
CONCAT(branch,'-', marks) AS roll_number
FROM marks;




