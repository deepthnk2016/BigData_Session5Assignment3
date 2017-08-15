/* Store the data on a local drive to announce for the final match. By the name player1 and player2 (only show the NAME and HP). */

-- Load Data
pokemon_data = LOAD '/home/deepakray/Deepak/acadgild/Assignments/Session5Assignment3/Pokemon.csv' USING PigStorage(',') AS(Sno:int,Name:chararray,Type1:chararray,Type2:chararray,Total:int,HP:int,Attack:int,Defense:int,splatck:int,spldefence:int,speed:int);

qualifying_data = FILTER pokemon_data by Defense>55 ;

-- generate random for relation 1
random_include1 = foreach qualifying_data GENERATE RANDOM(),Name,Type1,Type2,Total,HP,Attack,Defense,splatck,spldefence,speed;

-- sort by random function relation 1
random1_desending = ORDER random_include1 BY $0 DESC;

-- generate random for relation 2
random_include2 = foreach qualifying_data GENERATE RANDOM(),Name,Type1,Type2,Total,HP,Attack,Defense,splatck,spldefence,speed;

-- sort by random function relation 2
random2_desending = ORDER random_include2 BY $0 DESC;

-- top 5 from relation 1
limit_data_random1_desending = LIMIT random1_desending 5 ;

-- top 5 from relation 2
limit_data_random2_desending = LIMIT random2_desending 5 ;

-- filter name from relation 1
filter_only_name1 = foreach limit_data_random1_desending Generate ($1,HP);

-- filter name from relation 2
filter_only_name2 = foreach limit_data_random2_desending Generate ($1,HP);

-- store relation 1 data to local file
STORE limit_data_random1_desending INTO '/home/deepakray/Deepak/acadgild/Assignments/Session5Assignment3/player1.txt';

-- store relation 2 data to local file
STORE limit_data_random2_desending INTO '/home/deepakray/Deepak/acadgild/Assignments/Session5Assignment3/player2.txt';

-- display results
--dump sort_data ;






