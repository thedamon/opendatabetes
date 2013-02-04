Data Format
===========

This is a preliminary summary of the data that needs to be tracked, for now with notes.

##Events
 - Blood Sugar
 	- Reading - *mmol/L, mg/DL??*
 	- Time - *format? - I'd vote for whatever works best with d3.js, but.. timezones?*
 	- Source - *CGMS, which meter, etc*
 	- (Status) - *normal(default), flagged[^1]*
 - Bolus
 	- Time
 	- Amount
 	- Insulin type
 - Meal
 	- Time
 	- Total Carbs
 	- (Components)
 		- carbs
 		- description
 	- (IsEstimate)
 	- (Description)
 - Basal
 	- Time (start)
 	- Rate
 	- Insulin type
 	- (Temporary) - *boolean*
 	- (Pattern) - *FK Settings* ?
 - HBA1C, Weight, BP, ?


##Insulin Pump Settings
 - //Todo

##Patient Info
 - //Todo

[^1] The purpose of flagging is to indicate that a blood sugar reading is the result of extenuating circumstances and would not usefully count toward most trend analyses. Things like a high blood sugar because of a forgotten bolus, pump malfunction etc. A large number of these could indicate that specific steps should be taken to try and improve habits.

I'm not sure if it is appropriate to have indexes in a microformat, but I think we want some way that comments can map to one or more events without being a property of the event.