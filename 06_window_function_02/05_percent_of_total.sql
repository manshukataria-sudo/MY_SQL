USE zomato;

-- find the percent, of particular food's contribution in total revenue of restaurant id = 1


SELECT *,
ROUND(amount/SUM(amount) OVER() * 100, 2) AS "percent_of_total"
FROM (SELECT f_name, SUM(amount) AS "amount" FROM orders
INNER JOIN order_details
ON orders.order_id = order_details.order_id
INNER JOIN food
ON order_details.f_id = food.f_id
WHERE r_id = 1
GROUP BY f_name) t1
ORDER BY percent_of_total DESC;