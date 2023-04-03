-- Database: owners_pet

-- DROP DATABASE IF EXISTS owners_pet;

CREATE DATABASE owners_pet
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

COMMENT ON DATABASE owners_pet
    IS 'Challenge';
	
	
--create owners table
DROP TABLE owners CASCADE;


CREATE TABLE owners(
	
	owner_id SERIAL PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	city VARCHAR(30),
	state CHAR(2),
	email VARCHAR(50) UNIQUE
);

SELECT * FROM owners;

-- create pets table with foreign key(owner_id)
DROP TABLE pets;

CREATE TABLE pets(

	pet_id SERIAL PRIMARY KEY,
	species VARCHAR(30),
	full_name VARCHAR(30),
	age INT,
	owner_id INT REFERENCES owners(owner_id)
);

SELECT * FROM pets;


INSERT INTO owners (first_name, last_name, city, state,email) VALUES
	('Samuel','Smith','Boston','MA','samsmith@gmail.com'),
	('Emma','Johnson','Seattle','WA','emjohnson@gmail.com'),
	('John','Oliver','New York','NY','johnoliver@gmail.com'),
	('Simon','Smith','Dallas','TX','oliviabrown@gmail.com'),
	('null','Maxwell','null','CA','lordmaxwell@gmail.com');
	
INSERT INTO pets (species, full_name, age, owner_id) VALUES
	('Dog','Rex',6,1),
	('Rabbit','Fluffy',2,5),
	('Cat','Tom',8,2),
	('Mouse','Jerry',2,2),
	('Dog','Biggles',4,1),
	('Tortise','Squirtle',42,3);

UPDATE pets
SET age = 3
WHERE full_name = 'Fluffy';

DELETE FROM owners
WHERE last_name='Maxwell';



