-- set operations are same as in mathematics
-- UNION, UNION ALL(don't remove the duplicate rows) , INTERSECT, EXCEPT (MINUS)  

-- UNION => keeps every row from both tables only once
SELECT * FROM sql_cx_live.person1
UNION
SELECT * FROM sql_cx_live.person2; 


-- UNION ALL => keeps every row from both tables, and don't remove the duplicates
SELECT * FROM sql_cx_live.person1
UNION ALL
SELECT * FROM sql_cx_live.person2; 


-- INTERSECT => keeps only the common rows from both the tables
SELECT * FROM sql_cx_live.person1
INTERSECT
SELECT * FROM sql_cx_live.person2;


-- EXCEPT => keeps only rows from first table which are not present in second table
SELECT * FROM sql_cx_live.person1
EXCEPT
SELECT * FROM sql_cx_live.person2; 











 