-- find the running avg of 10 matches of Virat kohli

SELECT ROW_NUMBER() OVER(ORDER BY ID) AS "match_no",
batter,SUM(batsman_run) AS "runs",
AVG(SUM(batsman_run)) OVER(ROWS BETWEEN 9 PRECEDING AND CURRENT ROW) AS "rolling_avg",
ROUND(AVG(SUM(batsman_run)) OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW), 2) AS "career_avg"
FROM ipl
WHERE batter = "V Kohli"
GROUP BY ID;