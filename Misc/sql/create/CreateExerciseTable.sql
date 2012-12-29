CREATE TABLE IF NOT EXISTS Exercise 
( 
PatientId INTEGER,
DateTime TEXT,
EventTypeCode TEXT,
Description TEXT,
Intensity INTEGER,
EndDateTime TEXT,
PRIMARY KEY( PatientId, DateTime ) ON CONFLICT IGNORE
);