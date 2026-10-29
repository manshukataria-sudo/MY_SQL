-- cross join => cartesian product, table1 X table2
SELECT * FROM sql_cx_live.users t1
CROSS JOIN sql_cx_live.groups t2;


-- inner join => combine only those rows, where foreign key is present in both tables, use ON for providing the condition
-- otherwise it will be treated as cross join 

SELECT * FROM sql_cx_live.users t1
INNER JOIN sql_cx_live.membership t2
ON t1.user_id = t2.user_id;


-- left join => keeps the all rows of left table, if no value is present in right table,
-- it fills the null

SELECT * FROM sql_cx_live.membership t1
LEFT JOIN sql_cx_live.users t2
ON t1.user_id = t2.user_id;



-- right join => shows all the rows of right table, fills null in the columns of left table, if no value present
SELECT * FROM sql_cx_live.membership t1
RIGHT JOIN sql_cx_live.users t2
ON t1.user_id = t2.user_id;



-- full outer join => directly not possible, we use
-- LEFT JOIN UNION RIGHT JOIN between the tables to get the FULL OUTER JOIN
SELECT * FROM sql_cx_live.membership t1
LEFT JOIN sql_cx_live.users t2
ON t1.user_id = t2.user_id
UNION
SELECT * FROM sql_cx_live.membership t1
RIGHT JOIN sql_cx_live.users t2
ON t1.user_id = t2.user_id;




-- self join => use in case of self referencing foreign key to get the info
SELECT * FROM sql_cx_live.users;

SELECT * FROM sql_cx_live.users t1
INNER JOIN sql_cx_live.users t2
ON t1.emergency_contact = t2.user_id;















 