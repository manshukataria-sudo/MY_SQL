# Write your MySQL query statement below

-- https://leetcode.com/problems/product-price-at-a-given-date/?envType=study-plan-v2&envId=top-sql-50


WITH latest_info AS (
    SELECT product_id,
    MAX(change_date) AS "change_date"
    FROM Products t3
    WHERE change_date <= "2019-08-16"
    GROUP BY t3.product_id
)
SELECT product_id,
new_price AS "price"
FROM Products
WHERE (product_id, change_date) IN (SELECT DISTINCT t1.product_id, t2.change_date FROM Products t1
                                    LEFT JOIN latest_info t2
                                    ON t1.product_id = t2.product_id)

UNION 

SELECT product_id, 10 AS "price" FROM Products
GROUP BY product_id
HAVING MIN(change_date) > "2019-08-16";