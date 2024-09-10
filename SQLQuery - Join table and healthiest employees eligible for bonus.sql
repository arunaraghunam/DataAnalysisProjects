-- Create a join table

SELECT a.* -- optimize to bring only columns we need 
FROM [dbo].[Absenteeism_at_work] a
LEFT JOIN [dbo].[compensation] c ON a.ID = c.ID
-- Reason for absence
LEFT JOIN Reasons r ON a.Reason_for_absence=r.Number;

-- List of 100 healthiest individuals that we can give $1000(HR dept to make decision)

SELECT * FROM [dbo].[Absenteeism_at_work]
WHERE Social_drinker = 0 -- not a drinker = healthy!
AND Social_smoker = 0 -- not smoker
AND Body_mass_index<25 -- healthy bmi
AND Absenteeism_time_in_hours<(SELECT AVG(Absenteeism_time_in_hours) FROM [dbo].[Absenteeism_at_work])