INSERT INTO Patient (PatientId, FirstName, LastName, BirthDate, CarbTypeIsWeight, IsMetricUnits) 
SELECT NULL, 'Damon', 'Muma', '1984-05-19', 1, 1
WHERE NOT EXISTS (SELECT * FROM Patient)