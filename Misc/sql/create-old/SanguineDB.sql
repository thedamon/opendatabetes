CREATE TABLE IF NOT EXISTS Patient 
( 
PatientId INTEGER PRIMARY KEY AUTOINCREMENT, 
FirstName TEXT, 
LastName TEXT,
CentralPatientId INTEGER,
BirthDate TEXT,
CarbTypeIsWeight INTEGER,
IsImperialUnits INTEGER
);

CREATE TABLE IF NOT EXISTS Event 
( 
PatientId INTEGER REFERENCES Event( PatientId ),
DateTime TEXT,
EventTypeCode TEXT,
EventFlagCode TEXT,
IsDay INTEGER,
PRIMARY KEY( PatientId, DateTime, EventTypeCode )
);

CREATE TABLE IF NOT EXISTS ReadingGlucoseBlood 
( 
PatientId INTEGER REFERENCES Event( PatientId ),
DateTime TEXT REFERENCES Event (DateTime),
EventTypeCode TEXT REFERENCES Event (EventTypeCode),
Value REAL,
IsEntered INTEGER,
PRIMARY KEY( PatientId, DateTime, EventTypeCode )
);

CREATE TABLE IF NOT EXISTS Bolus 
( 
PatientId INTEGER REFERENCES Event( PatientId ),
DateTime TEXT REFERENCES Event (DateTime),
EventTypeCode TEXT REFERENCES Event (EventTypeCode),
BolusTypeCode TEXT,
BolusTotal REAL,
FoodTotal REAL,
CorrectionTotal REAL,
IsManual INTEGER,
PRIMARY KEY( PatientId, DateTime, EventTypeCode )
);

CREATE TABLE IF NOT EXISTS FoodIntake 
( 
PatientId INTEGER REFERENCES Event( PatientId ),
DateTime TEXT REFERENCES Event (DateTime),
EventTypeCode TEXT REFERENCES Event (EventTypeCode),
MealTypeCode TEXT,
Description TEXT,
CarbAmount REAL,
IsEstimate INTEGER,
IsEntered INTEGER,
PRIMARY KEY( PatientId, DateTime, EventTypeCode )
);

CREATE TABLE IF NOT EXISTS Exercise 
( 
PatientId INTEGER REFERENCES Event( PatientId ),
DateTime TEXT REFERENCES Event (DateTime),
EventTypeCode TEXT REFERENCES Event (EventTypeCode),
Description TEXT,
Intensity INTEGER,
PRIMARY KEY( PatientId, DateTime, EventTypeCode )
)