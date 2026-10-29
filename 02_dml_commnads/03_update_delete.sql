USE campusx;

-- fetch all the phones having processor_brand = "mediatek"
SELECT * FROM smartphones
WHERE processor_brand = "mediatek";


-- change processor_brand to "dimensity" where processor_brand is "mediatek"

-- using UPDATE
-- always use WHERE clause to specify the row, otherwise all the rows will be changed
UPDATE smartphones
SET processor_brand = "dimensity"
WHERE processor_brand = "mediatek";


SELECT * FROM users;

-- update user's table change password to 12345 and email to manshu@yahoo.com  
UPDATE users
SET email = "manshu@yahoo.com", password = "12345"
WHERE user_id = 1;

SELECT * FROM users;


-- DELETE is used to delete the rows selectively

-- delete all phones with price > 200000
SELECT * FROM smartphones
WHERE price > 200000;


DELETE FROM smartphones
WHERE price > 200000;



-- delete all samsung phones having primary_camera_rear > 150
SELECT * FROM smartphones
WHERE brand_name = "samsung" AND primary_camera_rear > 150;


DELETE FROM smartphones
WHERE brand_name = "samsung" AND primary_camera_rear > 150;



















