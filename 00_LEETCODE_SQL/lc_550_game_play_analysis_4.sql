--https://leetcode.com/problems/game-play-analysis-iv/description/?envType=study-plan-v2&envId=top-sql-50

WITH info AS (SELECT *,
DENSE_RANK() OVER(PARTITION BY player_id ORDER BY event_date) AS "login_num"
FROM Activity 
)
SELECT ROUND(COUNT(DISTINCT t1.player_id)/(SELECT COUNT(DISTINCT player_id) FROM Activity),2)
AS "fraction"
FROM info t1
INNER JOIN info t2
ON t1.player_id = t2.player_id AND t1.login_num + 1 = t2.login_num AND t1.event_date + INTERVAL 1 DAY = t2.event_date
WHERE t1.login_num = 1;
