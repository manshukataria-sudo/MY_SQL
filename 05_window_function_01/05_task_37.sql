USE campusx;

SELECT * FROM insurance_data;

-- Problem 1: What are the top 5 patients who claimed the highest insurance amounts ?
SELECT PatientID FROM insurance_data
WHERE claim = (
SELECT MAX(claim) FROM insurance_data);