CREATE TABLE IF NOT EXISTS Prime 
( 
PatientId INTEGER,
DateTime TEXT,
EventTypeCode TEXT,
Amount REAL,
IsManual INTEGER,
PRIMARY KEY( PatientId, DateTime ) ON CONFLICT IGNORE
);