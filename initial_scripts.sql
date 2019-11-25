-- Criar banco de dados
CREATE DATABASE foodrecognitionwebapp;

-- CRIAR TABELAS

-- Tabela usuário
CREATE TABLE appuser(
    user_id INTEGER(11) NOT NULL,
    last_name VARCHAR(250) NOT NULL,
    birthdate DATE,
    userheight FLOAT(3,2),
    userweight FLOAT(4,1)
)ENGINE=INNODB;

ALTER TABLE appuser ADD CONSTRAINT appuser_pk
PRIMARY KEY ( user_id );

ALTER TABLE appuser
CHANGE user_id user_id INT(11)
AUTO_INCREMENT NOT NULL;

CREATE TABLE common(
    user_id INT(11) NOT NULL,
    instructor_id INT(11) NOT NULL
)ENGINE=INNODB;

ALTER TABLE common
ADD CONSTRAINT common_pk
PRIMARY KEY (user_id);

ALTER TABLE common
ADD CONSTRAINT common_user__userid_fk
FOREIGN KEY (user_id)
REFERENCES appuser(user_id);

ALTER TABLE common
ADD CONSTRAINT common_instructorid_user__userid_fk
FOREIGN KEY (instructor_id)
REFERENCES appuser(user_id);

CREATE TABLE instructor(
user_id INT(11) NOT NULL,
customer_id INT(11) NOT NULL
)ENGINE=INNODB;

ALTER TABLE instructor
ADD CONSTRAINT instructor_pk
PRIMARY KEY (user_id);

ALTER TABLE instructor
ADD CONSTRAINT instructor_user__userid_fk
FOREIGN KEY (user_id)
REFERENCES appuser(user_id);

ALTER TABLE instructor
ADD CONSTRAINT instructor_customerid_user__userid_fk
FOREIGN KEY (customer_id)
REFERENCES appuser(user_id);


-- Tabela food
CREATE TABLE food(
    food_id INT(11) NOT NULL,
    food_name VARCHAR(150) NOT NULL,
    kcal FLOAT(5,1),
    protein FLOAT(4,1),
    carbohydrate FLOAT(4,1),
    fiber FLOAT(4,1),
    img_path VARCHAR(50)
)ENGINE=INNODB;

ALTER TABLE food ADD CONSTRAINT food_pk
PRIMARY KEY (food_id);

ALTER TABLE food CHANGE food_id food_id
INT(11) AUTO_INCREMENT NOT NULL;

-- Tabela de refeições
CREATE TABLE meal(
    meal_id INT(11) NOT NULL,
    user_id INT(11) NOT NULL,
    meal_name VARCHAR(10),
    meal_dtime DATETIME
)ENGINE=INNODB;

ALTER TABLE meal ADD CONSTRAINT meal_pk
PRIMARY KEY (meal_id);

ALTER TABLE meal ADD CONSTRAINT meal_user_fk
FOREIGN KEY (user_id) REFERENCES appuser(user_id);

ALTER TABLE meal CHANGE meal_id meal_id
INT(11) AUTO_INCREMENT NOT NULL;


-- Tabela de comidas da refeição
CREATE TABLE meal_food(
    meal_id INTEGER NOT NULL,
    food_id INTEGER NOT NULL
)ENGINE=INNODB;

ALTER TABLE meal_food ADD CONSTRAINT meal_food_meal_fk
FOREIGN KEY(meal_id) REFERENCES meal(meal_id);

ALTER TABLE meal_food ADD CONSTRAINT meal_food_food_fk
FOREIGN KEY(food_id) REFERENCES food(food_id);

ALTER TABLE meal_food ADD CONSTRAINT meal_food_pk
PRIMARY KEY (meal_id, food_id);


-- Tabela dos tipos de amizades
CREATE TABLE relationship_type(
    rtype_id INT(11) NOT NULL,
    rtype_name VARCHAR(20) NOT NULL
)ENGINE=INNODB;

ALTER TABLE relationship_type
ADD CONSTRAINT relationship_type_pk
PRIMARY KEY(rtype_id);

ALTER TABLE relationship_type
CHANGE rtype_id rtype_id INT(11)
AUTO_INCREMENT NOT NULL;


-- Tabela das amizades dos usuários
CREATE TABLE relationship(
    relationship_id INT(11) NOT NULL,
    user_id1 INT(11) NOT NULL,
    user_id2 INT(11) NOT NULL,
    rtype_id INT(11) NOT NULL
)ENGINE=INNODB;

ALTER TABLE relationship
ADD CONSTRAINT relationship_pk
PRIMARY KEY (relationship_id);

ALTER TABLE relationship
CHANGE relationship_id relationship_id
INT(11) AUTO_INCREMENT NOT NULL;

ALTER TABLE relationship
ADD CONSTRAINT relationship_user_id1_fk
FOREIGN KEY (user_id1)
REFERENCES appuser(user_id);

ALTER TABLE relationship
ADD CONSTRAINT relationship_user_id2_fk
FOREIGN KEY (user_id2)
REFERENCES appuser(user_id);

ALTER TABLE relationship
ADD CONSTRAINT relationship_relationship_type_fk
FOREIGN KEY (rtype_id)
REFERENCES relationship_type(rtype_id);