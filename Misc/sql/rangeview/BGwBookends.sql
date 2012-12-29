SELECT DateTime, value FROM ReadingGlucoseBlood WHERE DateTime >= ':Date :StartTime' AND DateTime < datetime(':Date :StartTime', '+24 hours') 
UNION ALL
SELECT * FROM (
SELECT DateTime, value FROM ReadingGlucoseBlood WHERE DateTime < ':Date :StartTime'
ORDER BY DateTime DESC LIMIT 1
) X
UNION ALL
SELECT * FROM (
SELECT DateTime, value FROM ReadingGlucoseBlood WHERE DateTime >= datetime(':Date :StartTime', '+24 hours')
ORDER BY DateTime ASC LIMIT 1
) Y
ORDER BY DateTime ASC