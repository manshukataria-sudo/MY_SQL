-- using window function calculating the percent change in views month wise
USE campusx;



-- find the percent change in views on youtube month wise
SELECT *,
(((total_views - prev_month_views)/prev_month_views) * 100) AS "percent_change"
FROM (
SELECT DATE_FORMAT(date, "%Y-%m") AS "month",
MONTHNAME(date) AS "month_name",
SUM(views) AS "total_views",
LAG(SUM(views)) OVER(ORDER BY DATE_FORMAT(date, "%Y-%m")) AS "prev_month_views"
FROM youtube_views
GROUP BY DATE_FORMAT(date, "%Y-%m"), MONTHNAME(date)) t1;



-- find the views of the day that is at back 7 days from current day
SELECT *,
LAG(views, 7) OVER(ORDER BY date)
FROM youtube_views;