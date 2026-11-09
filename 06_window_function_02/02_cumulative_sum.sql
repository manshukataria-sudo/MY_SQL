

-- virat kohli's runs after 50th match, 100th match etc 
-- cumulative sum => running sum
SELECT * FROM ipl;

SELECT * FROM (
SELECT
ROW_NUMBER() OVER(ORDER BY ID) AS "match_no",
batter, SUM(batsman_run) AS "runs",
SUM(SUM(batsman_run)) OVER(ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS "cum_sum"
FROM ipl
WHERE batter = "V Kohli"
GROUP BY ID) t1
WHERE match_no = 50 OR match_no = 100 OR match_no = 200;