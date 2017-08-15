/* Ques 3: Using random() generate random numbers for each Pokémon on the selected list. */

-- Load Data
pokemon_data = LOAD '/home/deepakray/Deepak/acadgild/Assignments/Session5Assignment3/Pokemon.csv' USING PigStorage(',') AS(Sno:int,Name:chararray,Type1:chararray,Type2:chararray,Total:int,HP:int,Attack:int,Defense:int,splatck:int,spldefenct:int,speed:int);

-- filter qualifying data
generate_random = foreach pokemon_data GENERATE RANDOM(),Name,Type1,Type2,Total,HP,Attack;

-- display results
dump generate_random ;






