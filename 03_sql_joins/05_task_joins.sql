-- task joins in campusx

-- Q-3 Find top-5 most sold products.
SELECT * FROM sales;
SELECT * FROM products;


-- Interview takeaway: With ONLY_FULL_GROUP_BY enabled, MySQL permits selecting non-aggregated columns 
-- that are functionally dependent on the grouped columns, such as a product name determined by its primary key.
-- Otherwise we to get the product name we also have to add GROUP BY name
SELECT products.Name , SUM(quantity) AS "count" FROM products 
INNER JOIN sales
ON products.ProductID = sales.ProductID
GROUP BY products.ProductID
ORDER BY count DESC LIMIT 5;


ALTER TABLE sales 
MODIFY COLUMN Quantity INTEGER;


SELECT p.ProductID, p.Name, SUM(s.Quantity) AS TotalSold
FROM products p
INNER JOIN sales s
    ON p.ProductID = s.ProductID
GROUP BY p.ProductID
ORDER BY TotalSold DESC
LIMIT 5;



SHOW CREATE TABLE products;


ALTER TABLE products 
MODIFY COLUMN ProductID INTEGER PRIMARY KEY;




USE practice;


-- Q-4: Find sales man who sold most no of products.

SELECT * FROM sales;
SELECT * FROM employees;
SELECT * FROM customers;

SELECT FirstName, SUM(Quantity) AS "total_quant" FROM employees
INNER JOIN sales
ON employees.EmployeeID = sales.SalesPersonID
GROUP BY employees.FirstName
ORDER BY total_quant DESC LIMIT 1;



-- Q-5: Sales man name who has most no of unique customer.
SELECT employees.FirstName, COUNT(DISTINCT CustomerID) AS "dist_cust" FROM employees
INNER JOIN sales
ON employees.EmployeeID = sales.SalesPersonID
GROUP BY employees.FirstName
ORDER BY dist_cust DESC LIMIT 1;



-- Q-6: Sales man who has generated most revenue. Show top 5.
SELECT * FROM sales;
SELECT * FROM employees;
SELECT * FROM customers;
SELECT * FROM products;


SELECT FirstName, ROUND(SUM(Price * Quantity), 2) AS "revenue" FROM products
INNER JOIN sales
ON products.ProductID = sales.ProductID
INNER JOIN employees
ON sales.SalesPersonID = employees.EmployeeID
GROUP BY employees.FirstName
ORDER BY revenue DESC LIMIT 5;



-- Q-7: List all customers who have made more than 10 purchases.
SELECT customers.CustomerID, customers.FirstName, COUNT(*) AS "purchases" FROM sales
INNER JOIN customers
ON sales.CustomerID = customers.CustomerID
GROUP BY customers.CustomerID, FirstName
HAVING purchases > 10;




-- Q-8 : List all salespeople who have made sales to more than 5 customers.
SELECT EmployeeID, FirstName, COUNT(DISTINCT CustomerID) FROM sales
INNER JOIN employees
ON sales.SalesPersonID = employees.EmployeeID
GROUP BY employees.EmployeeID, employees.FirstName
HAVING COUNT(DISTINCT CustomerID) > 5;





-- Q-9: List all pairs of customers who have made purchases with the same salesperson.
SELECT * FROM sales 
INNER JOIN 





