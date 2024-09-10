-- Compensation rate increase for non-smokers/budget $983,221 so .68 increase per hour

SELECT COUNT(*) as nonsmokers FROM Absenteeism_at_work
WHERE Social_smoker=0
