SELECT * FROM ipl;

-- find the top 5 batsmen of each team 

SELECT * FROM (
SELECT `BattingTeam`,batter, SUM(batsman_run) AS total_runs,
DENSE_RANK() OVER(PARTITION BY BattingTeam ORDER BY SUM(batsman_run) DESC) AS player_rank_in_team
FROM ipl
GROUP BY batter, BattingTeam) t1
WHERE t1.player_rank_in_team < 6
ORDER BY t1.BattingTeam, t1.player_rank_in_team;