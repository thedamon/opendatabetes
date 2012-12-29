CREATE TABLE IF NOT EXISTS BasalTempPercent
( 
PatientId INTEGER,
DateTime TEXT,
EventTypeCode TEXT,
Percentage REAL,
EndDateTime TEXT,

PRIMARY KEY( PatientId, DateTime ) ON CONFLICT IGNORE
);
