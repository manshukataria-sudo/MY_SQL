USE campusx;

SELECT * FROM smartphones;


-- average battery capacity and camera of phones price > 100000
SELECT AVG(battery_capacity) AS "avg_battery_capacity" ,AVG(primary_camera_rear) AS "avg_camera_rear" FROM smartphones
WHERE price > 100000;


-- count the no. of 5G phones
SELECT COUNT(has_5g) FROM smartphones
WHERE has_5g = "True";


-- average internal memory, which have refresh rate >= 120 and front facing camera >= 20

SELECT AVG(internal_memory) FROM smartphones
WHERE refresh_rate >= 120 AND primary_camera_front >= 20;