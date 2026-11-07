-- using the subquery with INSERT

USE zomato;
CREATE TABLE loyal_user(
    user_id INTEGER,
    name VARCHAR(255),
    money INTEGER
);

SELECT * FROM loyal_user;

-- populate a already created loyal_users table with records of only those customers who have 
-- ordered food more than 3 times


-- adding in new table , don't write VALUES while inserting, the Resulted table is inserted directly
INSERT INTO loyal_user (user_id, name)
SELECT users.user_id, users.name FROM users    -- loyal_user
INNER JOIN orders
ON users.user_id = orders.user_id
GROUP BY users.user_id, users.name
HAVING count(*) > 3;





-- Using Subquery with UPDATE
-- update the money column wtih amount 10% of the customer's spending in loyal_user table  
SELECT 0.1 * SUM(amount) FROM orders
GROUP BY user_id;


UPDATE loyal_user
SET money = (SELECT 0.1 * SUM(amount) FROM orders
            WHERE loyal_user.user_id = orders.user_id);

SELECT * FROM loyal_user;


-- usage with DELETE
-- delete all the customers who never ordered

-- customers who never ordered
SELECT user_id FROM users
WHERE user_id NOT IN (SELECT DISTINCT user_id FROM orders);

-- deleting
DELETE FROM users t2
WHERE t2.user_id IN (SELECT t1.user_id FROM users t1
WHERE t1.user_id NOT IN (SELECT DISTINCT orders.user_id FROM orders));






