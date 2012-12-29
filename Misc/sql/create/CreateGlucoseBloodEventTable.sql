CREATE TABLE IF NOT EXISTS GlucoseBloodEvent
( 
PatientId INTEGER,
DateTime TEXT,
GlucoseEventTypeCode TEXT,
PRIMARY KEY( PatientId, DateTime ) ON CONFLICT IGNORE
);
