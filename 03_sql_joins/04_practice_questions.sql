-- find all profitable orders 
SELECT t1.order_id, SUM(t2.profit) AS "profit" FROM orders t1
INNER JOIN order_details t2
ON t1.order_id = t2.order_id
GROUP BY order_id
HAVING SUM(profit) > 0;


-- find the name of customers who have placed max number of orders
SELECT t1.name, COUNT(*) AS "freq" FROM users t1
INNER JOIN orders t2
ON t1.user_id = t2.user_id
GROUP BY t1.name
ORDER BY freq DESC LIMIT 1;



-- which is the most profitable category (vertical)
SELECT vertical, SUM(profit) AS "profit" FROM order_details t1
INNER JOIN category t2
ON t1.category_id = t2.category_id
GROUP BY vertical
ORDER BY profit DESC LIMIT 1;





-- which is the most profitable state
SELECT state, SUM(profit) AS "profit" FROM users t1
INNER JOIN orders t2
ON t1.user_id = t2.user_id
INNER JOIN order_details t3
ON t2.order_id = t3.order_id
GROUP BY state
ORDER BY profit DESC LIMIT 1;



-- find all the categories with profit than 5000 
SELECT vertical, SUM(profit) AS "profit" FROM order_details t1
INNER JOIN category t2
ON t1.category_id = t2.category_id
GROUP BY vertical
HAVING profit > 5000;




