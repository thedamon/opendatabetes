CREATE TABLE IF NOT EXISTS FoodIntake 
( 
PatientId INTEGER ,
DateTime TEXT,
EventTypeCode TEXT,
MealTypeCode TEXT,
Description TEXT,
CarbAmount REAL,
TreatmentAmount REAL DEFAULT 0,
IsEstimate TEXT,
IsEntered TEXT,
PRIMARY KEY( PatientId, DateTime ) ON CONFLICT IGNORE
);
