-- practice on the ipl data SET

SELECT COUNT(*) FROM ipl;

SELECT * FROM ipl;


-- find the top scoring 5 batsmen in ipl dataset
SELECT batter, SUM(batsman_run) AS "total_runs" FROM ipl
GROUP BY batter
ORDER BY total_runs DESC LIMIT 10;



-- find the second highest 6 hitter in ipl   
SELECT batter, COUNT(*) AS "num_of_sixes" FROM ipl
WHERE batsman_run = 6
GROUP BY batter
ORDER BY num_of_sixes DESC LIMIT 1,1;


-- find virat kohli's runs against all teams
-- can't solve due to non presence of bowling team
-- SELECT * FROM ipl
-- WHERE batter = "V Kohli";

-- Royal Challengers Bangalore


-- find batsmen with centuries in IPL
-- use group by on the basis of ID and batter

SELECT batter, SUM(batsman_run) AS "runs" FROM ipl
GROUP BY batter, ID
HAVING SUM(batsman_run) >= 100;






-- find the top 5 batsmen with highest strike rate, who have played minimum 1000 balls

SELECT batter, (SUM(batsman_run)/ COUNT(*)) * 100 AS "strike_rate"  FROM ipl
GROUP BY batter
HAVING COUNT(*) >= 1000
ORDER BY strike_rate DESC LIMIT 5;









