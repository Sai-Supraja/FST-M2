inputFile1= LOAD '/Users/saisupraja/Desktop/FSTM2/BigData/Pig/Project/inputs/episodeIV_dialogues.txt' USING PigStorage('\t') AS (Name:chararray, Dialogue:chararray);
inputFile2= LOAD '/Users/saisupraja/Desktop/FSTM2/BigData/Pig/Project/inputs/episodeV_dialogues.txt' USING PigStorage('\t') AS (Name:chararray, Dialogue:chararray);
inputFile3= LOAD '/Users/saisupraja/Desktop/FSTM2/BigData/Pig/Project/inputs/episodeVI_dialogues.txt' USING PigStorage('\t') AS (Name:chararray, Dialogue:chararray);
files_consolidate= Union inputFile1, inputFile2, inputFile3;
GroupByName = Group files_consolidate BY Name;
CountByName = FOREACH GroupByName GENERATE $0 AS Name, COUNT($1) AS No_Of_Lines;

orderbydesc= order CountByName by No_Of_Lines desc;
STORE orderbydesc INTO '/root/PigDialogueOutput' USING PigStorage('\t');
