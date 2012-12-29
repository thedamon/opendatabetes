CREATE TABLE IF NOT EXISTS FoodIntake 
( 
PatientId INTEGER REFERENCES Event( PatientId ) ON UPDATE CASCADE ON DELETE CASCADE,
DateTime TEXT REFERENCES Event (DateTime)  ON UPDATE CASCADE ON DELETE CASCADE,
EventTypeCode TEXT REFERENCES Event (EventTypeCode)  ON UPDATE CASCADE ON DELETE CASCADE,
MealTypeCode TEXT,
Description TEXT,
CarbAmount REAL,
IsEstimate INTEGER,
IsEntered INTEGER,
PRIMARY KEY( PatientId, DateTime, EventTypeCode ) ON CONFLICT IGNORE
);