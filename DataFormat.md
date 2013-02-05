Data Format
===========

This is a preliminary summary of the data that needs to be tracked, for now with notes.

##Events
 - Blood Sugar
 	- Reading - *mmol/L, mg/DL*[^a]
 	- Time[^b]
 	- Source - *CGMS, which meter, etc.*
 	- (Status) - *normal (default), flagged*[^c]
 - Bolus
 	- Time
 	- Amount
 	- Insulin type
	- Type of bolus - *dual wave, square wave, or normal with subfields/attributes for time of extended bolus in minutes and percentage of bolus delivered immediately if dual wave*
	- Type of bolus - meal bolus or correction bolus[^d]
 - Meal
 	- Time
 	- Total Carbs
 	- (Components)
 		- carbs
 		- description
 	- (IsEstimate)[^e]
 	- (Description)
	- IDREF to Bolus Event[^f]
 - Basal
 	- Time (start)
 	- Rate
 	- Insulin type
 	- (Temporary) - *boolean*
 	- (Pattern) - *FK Settings* ?[^g]
 - HBA1C, Weight, BP, ?[^h]
 - Exercise
	- Time (start) and Time (end)
	- (Activity) - *running, cycling, walking, etc.*
	- (Intensity) - *Light, Moderate, Vigorous* [^k]
	- (OtherStats) - *heartrate, calories burned, miles run, etc.*
	- (PumpDisconnected) - *boolean*[^i]
- Sleep[^j]
	- Time (start) and Time (end)
	- (SleepQuality)


##Insulin Pump Settings
 - //Todo

##Patient Info
 - //Todo

[^a]: Units should be specified in the Patient Info or other metadata header perhaps?

[^b]: I'd suggest [ISO 8601](http://en.wikipedia.org/wiki/ISO_8601#Time_offsets_from_UTC "Wikipedia: ISO 8601 Time notation") with offsets from UTC/Z(ulu): YYYY-MM-DDTHH:MM:SS+HH:MM
(Python has good support for this. 'T' is the delimiter character between date and time, and timezone offsets are in the +HH:MM suffix, or Z for UTC/Z(ulu).)

[^c]: The purpose of flagging is to indicate that a blood sugar reading is the result of extenuating circumstances and would not usefully count toward most trend analyses. Things like a high blood sugar because of a forgotten bolus, pump malfunction etc. A large number of these could indicate that specific steps should be taken to try and improve habits.

[^d]: In my own self-tracking, I also tag correction boluses with either #my_bad or #WTF. I find it useful to keep track of my total #WTF boluses...when their number or percentage of my TDD starts to climb, I know something needs to be adjusted, whereas the #my_bad corrections aren't really relevant since they're usually connected to carb count mishaps.

[^e]: In my own self-tracking, I tag carbs with three separate indicators of my confidence level in the carb count: #no_clue (usually when I'm eating out), #guesstimating, and #nutrition_facts for when I read it off the label. Overall, I'd argue for making this something more flexible, like an attribute or a tag field, rather than a boolean. I also have an #eating_out tag, for example.

[^f]: This is in my Platonic ideal of diabetes data formats, to have meals connected by reference to their associated bolus events (and vice versa, meal boluses connected to meals and correction boluses to high BG readings), but current data exports from our pumps, meters, etc. don't provide an easy way to do this.

[^g]: I don't know what FK settings is... - Foreign Keys. Tracking pump settings is where it gets tricky because they're all potentially different.

[^h]: HbA1C should have a flag for whether it's one of those instant tests by meter, or a mail-away test, or an actual lab test.

[^i]: I often disconnect my pump for exercise, and that's probably a good thing to track.  --I think in terms of data, this would be technically separate from Exercise. Maybe even just a basal of 0%

[^j]: I think this could be useful for tracking noctural hypoglycemia. --Agreed!

[^k]: This is a fairly standard measurement of exercise intensity, I think. http://www.mayoclinic.com/health/exercise-intensity/SM00113

I'm not sure if it is appropriate to have indexes in a microformat, but I think we want some way that comments can map to one or more events without being a property of the event.