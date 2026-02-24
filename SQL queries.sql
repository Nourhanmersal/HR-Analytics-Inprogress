Data_Cleaning
--checking for nulls (the below query has been repeated on all the other coloms to check for nulls and all returned with no data to display)
SELECT satisfaction_level
FROM `temp-table-ex-485819.HRDataset.HRdataset`
where satisfaction_level is null

-- Checking for duplicates (since we dont have a unique value, we cant say that the dulicates are inaccurate).
SELECT distinct satisfaction_level
FROM `temp-table-ex-485819.HRDataset.HRdataset`

--Data Typing (Ensure left, Work_accident, and promotion_last_5years are treated as boolean or has only two outcomes)
SELECT distinct Work_accident,
FROM `temp-table-ex-485819.HRDataset.HRdataset`

SELECT distinct promotion_last_5years,
FROM `temp-table-ex-485819.HRDataset.HRdataset`

SELECT distinct `left`
FROM `temp-table-ex-485819.HRDataset.HRdataset`

--Descriptive analysis (I have repeated the same query on last_evaluation, number_project, average_montly_hours, time_spend_company)
SELECT 
max(satisfaction_level) AS maximum_satisfaction_level,
min (satisfaction_level) AS minimum_satisfaction_level, 
round(AVG(satisfaction_level),2) AS average_statifaction,
round(STDDEV(satisfaction_level),2) AS STDDEVv,
round(AVG(satisfaction_level) + (3 * STDDEV(satisfaction_level)),2) as upper_limit,
round(AVG(satisfaction_level) - (3 * STDDEV(satisfaction_level)),2) as lower_limit
FROM `temp-table-ex-485819.HRDataset.HRdataset`

--Turnover rate
SELECT 
COUNT(*) AS total_employees,
SUM(`left`) AS total_left,
COUNT(*) - SUM(`left`) AS total_stayed,
round(((SUM(`left`)/COUNT(*))*100),2) AS turnover_rate
FROM `temp-table-ex-485819.HRDataset.HRdataset`

-- `Left` correlation with satisfaction level, last evaluation, number of projects, average monthly hours
SELECT 
  `left`,
  ROUND(AVG(satisfaction_level), 2) AS avg_satisfaction,
  ROUND(AVG(last_evaluation), 2) AS avg_evaluation,
  ROUND(AVG(average_montly_hours), 1) AS avg_hours,
  ROUND(AVG(number_project), 1) AS avg_projects
FROM `temp-table-ex-485819.HRDataset.HRdataset`
GROUP BY `left`
