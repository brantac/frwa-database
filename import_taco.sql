-- Importing TACO
LOAD DATA LOCAL INFILE "\/mnt\/f\/Programacao\/food_recognition_aplication\/database\/taco.csv"
INTO TABLE food
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(food_id,food_name,kcal,protein,carbohydrate,fiber);