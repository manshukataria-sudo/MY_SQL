
-- find the avg runs of virat kohli after each match
SELECT 
ROW_NUMBER() OVER(ORDER BY ID) AS "match_no",
batter, 
SUM(batsman_run) AS "runs", 
SUM(SUM(batsman_run)) OVER (ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "career_runs",
ROUND(AVG(SUM(batsman_run)) OVER (ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 2) AS "career_avg"
FROM ipl
WHERE batter = "V Kohli"
GROUP BY ID;