
USE campusx;

SELECT * FROM insurance_data;

-- Problem 7
-- How many patients have claimed more than the average claim amount for patients who are smokers and have at least one child, and belong to the southeast region?


SELECT COUNT(*) FROM insurance_data
WHERE claim > (SELECT AVG(claim) FROM insurance_data
WHERE smoker = "Yes" AND children > 0 AND region = "southeast");


-- Problem 8
-- How many patients have claimed more than the average claim amount for patients who are not smokers and have a BMI greater than the average BMI for patients who have at least one child?

SELECT COUNT(*) FROM insurance_data
WHERE claim > (SELECT AVG(claim) FROM insurance_data
WHERE smoker = "No" AND bmi > (SELECT AVG(bmi) FROM insurance_data
WHERE children >= 1));


-- Problem 9
-- How many patients have claimed more than the average claim amount for patients who have a BMI greater than the average BMI for patients who are diabetic, 
-- have at least one child, and are from the southwest region?

SELECT COUNT(*) FROM insurance_data
WHERE claim > (SELECT AVG(claim) FROM insurance_data 
                WHERE bmi > (SELECT AVG(bmi) FROM insurance_data
                WHERE diabetic = "Yes" AND children >= 1 AND region = "southwest"));


-- Problem 10:
-- What is the difference in the average claim amount between patients who are smokers and patients who are non-smokers, and have the same BMI and number of children?


WITH info AS (SELECT smoker, bmi, children, AVG(claim) AS avg_claim FROM insurance_data
GROUP BY smoker, bmi, children)
SELECT bmi, children, avg_claim - (SELECT avg_claim FROM info t2 WHERE t1.bmi = t2.bmi AND t1.children = t2.children AND smoker = "No") FROM info t1
WHERE smoker = "Yes";





















