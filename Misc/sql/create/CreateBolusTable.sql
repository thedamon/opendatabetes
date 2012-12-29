CREATE TABLE IF NOT EXISTS Bolus 
( 
PatientId INTEGER,
DateTime TEXT,
EventTypeCode TEXT,BolusTypeCode TEXT,
BolusTotal REAL,
FoodTotal REAL,
CorrectionTotal REAL,
IsManual INTEGER,
Flag TEXT,
PRIMARY KEY( PatientId, DateTime ) ON CONFLICT IGNORE
);