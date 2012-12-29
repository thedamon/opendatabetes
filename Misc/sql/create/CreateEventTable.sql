CREATE TABLE IF NOT EXISTS Event 
( 
PatientId INTEGER,
DateTime TEXT,
EventTypeCode TEXT,
EventFlagCode TEXT,
IsDay INTEGER,
PRIMARY KEY( PatientId, DateTime, EventTypeCode ) ON CONFLICT IGNORE
);