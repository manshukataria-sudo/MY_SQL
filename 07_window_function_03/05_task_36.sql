-- https://www.kaggle.com/datasets/thedevastator/insurance-claim-analysis-demographic-and-health
-- data_set URL

SELECT * FROM insurance_data;

-- Problem 1: What are the top 5 patients who claimed the highest insurance amounts?
SELECT * FROM (
SELECT PatientID,
DENSE_RANK() OVER(ORDER BY claim DESC) AS "claim_rank"
FROM insurance_data) t1
WHERE claim_rank <= 5;



-- Problem 2: What is the average insurance claimed by patients based on the number of children they have?
SELECT DISTINCT children,
ROUND(AVG(claim) OVER(PARTITION BY children), 2) AS "avg_claim"
FROM insurance_data;


-- Problem 3: What is the highest and lowest claimed amount by patients in each region?
SELECT DISTINCT region,
MAX(claim) OVER(PARTITION BY region) AS "max_claim",
MIN(claim) OVER(PARTITION BY region) AS "min_claim"
FROM insurance_data;


-- Problem 4: What is the percentage of smokers in each age group?
SELECT *,
smokers/total_person * 100 AS "smoker_percent"
FROM (
SELECT age, COUNT(*) AS "total_person", 
COUNT( CASE WHEN smoker = "Yes" THEN 1 END) AS "smokers"
FROM insurance_data
GROUP BY age) t1;


-- Problem 5: What is the difference between the claimed amount of each patient and the first claimed amount of that patient?
SELECT *,
claim - first_claim AS "claim_diff" 
FROM(
SELECT PatientID,
claim,
FIRST_VALUE(claim) OVER(PARTITION BY PatientID) AS "first_claim"
FROM insurance_data) t1;


-- Problem 6: For each patient, calculate the difference between their claimed amount and the average claimed amount of patients with the same number of children.
SELECT *,
claim - avg_claim AS "claim_diff"
FROM(
SELECT PatientID,
claim,
AVG(claim) OVER(PARTITION BY children) AS "avg_claim"
FROM insurance_data) t1;



-- Problem 7: Show the patient with the highest BMI in each region and their respective rank.
SELECT * FROM(
SELECT PatientID,
bmi,
region,
DENSE_RANK() OVER(PARTITION BY region ORDER BY bmi DESC) AS "bmi_rank"
FROM insurance_data) t1
WHERE bmi_rank = 1;


-- Problem 8: Calculate the difference between the claimed amount of each patient and the claimed amount of the patient who has the highest BMI in their region.
SELECT *,
claim - bmis_claim AS "claim_diff"
FROM (
SELECT PatientID,
claim,
FIRST_VALUE(claim) OVER(PARTITION BY region ORDER BY bmi DESC) AS "bmis_claim"
FROM insurance_data) t1;



-- Problem 9: For each patient, calculate the difference in claim amount between the patient and the patient with the highest claim amount 
-- among patients with the same bmi and smoker status, within the same region. Return the result in descending order difference.
SELECT *,
claim - query AS "diff" 
FROM(
SELECT PatientID,
claim,
MAX(claim) OVER(PARTITION BY bmi, smoker, region) AS "query"
FROM insurance_data) t1
ORDER BY diff DESC;


-- Problem 10: For each patient, find the maximum BMI value among their next three records (ordered by age).
SELECT PatientID,
age,
bmi,
MAX(bmi) OVER(ORDER BY age ASC 
                ROWS BETWEEN 1 FOLLOWING AND 3 FOLLOWING) AS "next_max"
FROM insurance_data;



-- Problem 11: For each patient, find the rolling average of the last 2 claims.
SELECT PatientID,
claim,
AVG(claim) OVER(ROWS BETWEEN 2 PRECEDING AND 1 PRECEDING) AS "roll_avg"
FROM insurance_data;



-- Problem 12: Find the first claimed insurance value for male and female patients, within each region order the data by patient age in ascending order, 
-- and only include patients who are non-diabetic and have a bmi value between 25 and 30.
WITH cte AS (SELECT * FROM insurance_data
WHERE diabetic = "No" AND bmi BETWEEN 25 AND 30
)
SELECT PatientID,
FIRST_VALUE(claim) OVER(PARTITION BY gender, region ORDER BY age ASC) AS "query"
FROM cte;


