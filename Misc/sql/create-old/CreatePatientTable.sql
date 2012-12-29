CREATE TABLE IF NOT EXISTS Patient 
( 
PatientId INTEGER PRIMARY KEY AUTOINCREMENT, 
FirstName TEXT, 
LastName TEXT,
CentralPatientId INTEGER,
BirthDate TEXT,
CarbTypeIsWeight INTEGER,
IsMetricUnits INTEGER,
DiabetesType INTEGER,
DiagnosisDate TEXT,
BolusInsulin TEXT,
BasalInsulin TEXT,
HypoThresh REAL DEFAULT 4,
HyperThresh REAL DEFAULT 12,
DayStart TEXT DEFAULT '04:30',
BreakfastStart TEXT DEFAULT '05:00',
LunchStart TEXT DEFAULT '11:00',
SupperStart TEXT DEFAULT '16:00',
NightStart TEXT DEFAULT '22:00',
MealLength TEXT DEFAULT '1:30',
MinMealSize REAL DEFAULT 25
);