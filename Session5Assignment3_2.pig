/* Ques 2: State the number of players taking part in the competition after getting selected in the qualifying round. */

-- Load Data
pokemon_data = LOAD '/home/deepakray/Deepak/acadgild/Assignments/Session5Assignment3/Pokemon.csv' USING PigStorage(',') AS(Sno:int,Name:chararray,Type1:chararray,Type2:chararray,Total:int,HP:int,Attack:int,Defense:int,splatck:int,spldefenct:int,speed:int);

-- filter qualifying data
qualifying_data = FILTER pokemon_data by Defense>55 ;

-- group the qualifying data
group_qualifying_data = GROUP qualifying_data ALL ;

-- get count
count_qualifying_data = foreach group_qualifying_data GENERATE COUNT(qualifying_data) ;

-- display results
dump count_qualifying_data ;






