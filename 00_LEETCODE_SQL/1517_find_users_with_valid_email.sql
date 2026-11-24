-- https://leetcode.com/problems/find-users-with-valid-e-mails/?envType=study-plan-v2&envId=top-sql-50


# Write your MySQL query statement below
SELECT * FROM Users
WHERE REGEXP_LIKE(mail, '^[a-zA-Z][a-zA-Z0-9_.-]*@leetcode[.]com$', 'c');