CREATE TABLE IF NOT EXISTS Bolus 
( 
PatientId INTEGER,
DateTime TEXT,
EventTypeCode TEXT,BolusTypeCode TEXT,
BolusTotal REAL,
FoodTotal REAL,
CorrectionTotal REAL,
IsManual INTEGER,
PRIMARY KEY( PatientId, DateTime, EventTypeCode ) ON CONFLICT IGNORE,
CONSTRAINT "PrimaryKey" FOREIGN KEY ("PatientId", "EventTypeCode", "DateTime") REFERENCES "Event" ("PatientId", "EventTypeCode", "DateTime") ON DELETE CASCADE ON UPDATE CASCADE 
);