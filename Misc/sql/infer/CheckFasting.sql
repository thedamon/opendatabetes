SELECT * FROM ReadingGlucoseBlood 
WHERE NOT EXISTS(SELECT 1 FROM FoodIntake 
                 WHERE FoodIntake.DateTime BETWEEN datetime(ReadingGlucoseBlood.DateTime,'-7 hours') AND ReadingGlucoseBlood.DateTime)
                 
                 /*Need to determine way to exclude records at beginning*/