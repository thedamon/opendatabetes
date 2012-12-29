CREATE TABLE IF NOT EXISTS ActiveInsulin 
( 
PatientId INTEGER,
DateTime TEXT,
EventTypeCode TEXT,
Amount REAL,
PRIMARY KEY( PatientId, DateTime ) ON CONFLICT IGNORE
);