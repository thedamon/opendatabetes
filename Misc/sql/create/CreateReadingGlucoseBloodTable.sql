CREATE TABLE IF NOT EXISTS ReadingGlucoseBlood 
( 
PatientId INTEGER,
DateTime TEXT,
EventTypeCode TEXT,
Value REAL,
IsEntered INTEGER,
PRIMARY KEY( PatientId, DateTime ) ON CONFLICT IGNORE
);