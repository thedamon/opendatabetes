CREATE TABLE IF NOT EXISTS Note 
( 
PatientId INTEGER,
DateTime TEXT,
EventTypeCode TEXT,
NoteText TEXT,
PRIMARY KEY( PatientId, DateTime ) ON CONFLICT IGNORE
);