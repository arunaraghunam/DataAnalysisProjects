-- Optimize this query to bring only columns we need 
SELECT a.ID, r.Reason,
Month_of_absence,
Body_mass_index,
CASE WHEN Body_mass_index < 18.5 THEN 'Underweight'
WHEN Body_mass_index BETWEEN 18.5 AND 24.9 THEN 'Healthy Weight'
WHEN Body_mass_index BETWEEN 25 AND 29.9 THEN 'Overweight'
WHEN Body_mass_index > 30 THEN 'Obese'
ELSE 'unknown'
END AS BMI_Category,
CASE WHEN Month_of_absence IN(12,1,2) THEN 'Winter'
WHEN Month_of_absence IN(3,4,5) THEN 'Spring' 
WHEN Month_of_absence IN(6,7,8) THEN 'Summer'
WHEN Month_of_absence IN(9,10,11) THEN 'Fall'
ELSE 'Unknown'
END AS Season_Names,
Month_of_absence,
Day_of_the_week,
Transportation_expense,
Education,
Son,
Social_drinker,
Social_smoker,
Pet,
Disciplinary_failure,
Age,
Work_load_Average_day,
Absenteeism_time_in_hours
FROM [dbo].[Absenteeism_at_work] a
LEFT JOIN [dbo].[compensation] c ON a.ID = c.ID
-- Reason for absence
LEFT JOIN Reasons r ON a.Reason_for_absence=r.Number;
