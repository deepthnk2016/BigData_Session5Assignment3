/* Ques 1: Find the list of players that have been selected in the qualifying round (DEFENCE>55). */

pokemon_data = LOAD '/home/deepakray/Deepak/acadgild/Assignments/Session5Assignment3/Pokemon.csv' USING PigStorage(',') AS(Sno:int,Name:chararray,Type1:chararray,Type2:chararray,Total:int,HP:int,Attack:int,Defense:int,splatck:int,spldefenct:int,speed:int);

qualifying_data = FILTER pokemon_data by Defense>55 ;

dump qualifying_data;



