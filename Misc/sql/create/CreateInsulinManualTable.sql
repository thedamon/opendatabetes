CREATE TABLE IF NOT EXISTS InsulinManual 
( 
PatientId INTEGER,
DateTime TEXT,
EventTypeCode TEXT,
InsulinTypeCode TEXT,
InsulinTotal REAL,
FoodTotal REAL,
CorrectionTotal REAL,
IsBolus INTEGER,
PRIMARY KEY( PatientId, DateTime, InsulinTypeCode ) ON CONFLICT IGNORE
);