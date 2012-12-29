CREATE TABLE IF NOT EXISTS ReadingGlucoseBlood 
( 
PatientId INTEGER,
DateTime TEXT,
EventTypeCode TEXT,
Value REAL,
IsEntered INTEGER,
PRIMARY KEY( PatientId, DateTime, EventTypeCode ) ON CONFLICT IGNORE
CONSTRAINT "PrimaryKey" FOREIGN KEY ("PatientId", "EventTypeCode", "DateTime") REFERENCES "Event" ("PatientId", "EventTypeCode", "DateTime") ON DELETE CASCADE ON UPDATE CASCADE
);