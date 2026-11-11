-- NTILES(n) divides the complete data into n buckets and adds a column of bucket id in front of every row


USE campusx;
SELECT * FROM marks;

-- creating 3 buckets on the basis of marks
SELECT *,
NTILE(3) OVER(ORDER BY marks) AS "bucked_id"
FROM marks;

-- 
SELECT * FROM smartphones;

-- divide the smartphnoes into three categories budget, mid-range and top-ties on the basis of price

SELECT brand_name, model, price,
CASE 
    WHEN bucket_id = 1 THEN "budget_smartphone" 
    WHEN bucket_id = 2 THEN "mid_range" 
    ELSE "top_tier" END 
    AS "mobile_category" FROM (
(SELECT brand_name, model, price ,
NTILE(3) OVER(ORDER BY price) AS "bucket_id"
FROM smartphones)
) t1;