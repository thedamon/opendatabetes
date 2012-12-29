CREATE TABLE IF NOT EXISTS Exercise 
( 
PatientId INTEGER,
DateTime TEXT,
EventTypeCode TEXT,
Description TEXT,
Intensity INTEGER,
PRIMARY KEY( PatientId, DateTime, EventTypeCode ) ON CONFLICT IGNORE,
CONSTRAINT "PrimaryKey" FOREIGN KEY ("PatientId", "EventTypeCode", "DateTime") REFERENCES "Event" ("PatientId", "EventTypeCode", "DateTime") ON DELETE CASCADE ON UPDATE CASCADE

);