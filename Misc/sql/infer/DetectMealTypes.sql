UPDATE FoodIntake
 SET MealTypeCode = CASE

WHEN substr(DateTime, -8)
 BETWEEN (SELECT BreakfastStart FROM Patient WHERE PatientId = :PatientId)
 AND (SELECT LunchStart FROM Patient WHERE PatientId = :PatientId)
 AND CarbAmount >= 25
 AND MealTypeCode IS NULL
 THEN 'B'

WHEN substr(DateTime, -8)
 BETWEEN (SELECT LunchStart FROM Patient WHERE PatientId = :PatientId)
 AND (SELECT SupperStart FROM Patient WHERE PatientId = :PatientId)
AND CarbAmount >= 25
AND MealTypeCode IS NULL
 THEN 'L'

WHEN substr(DateTime, -8)
 BETWEEN (SELECT SupperStart FROM Patient WHERE PatientId = :PatientId)
 AND (SELECT NightStart FROM Patient WHERE PatientId = :PatientId)
AND CarbAmount >= 25
AND MealTypeCode IS NULL
 THEN 'S'

WHEN CarbAmount < 25 AND MealTypeCode IS NULL
THEN 'K'
ELSE MealTypeCode
END
