/* Ques 4: Arrange the new list in a descending order according to a column randomly. */

-- Load Data
pokemon_data = LOAD '/home/deepakray/Deepak/acadgild/Assignments/Session5Assignment3/Pokemon.csv' USING PigStorage(',') AS(Sno:int,Name:chararray,Type1:chararray,Type2:chararray,Total:int,HP:int,Attack:int,Defense:int,splatck:int,spldefenct:int,speed:int);

-- filter qualifying data
generate_random = foreach pokemon_data GENERATE RANDOM(),Name,Type1,Type2,Total,HP,Attack;

-- Sort qualifying data
sort_data = ORDER generate_random by $0 DESC ;

-- display results
dump sort_data ;






