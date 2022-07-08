/*
Aggregate functions: They perform a calculations on a column data and returns one row of data poas a result.

Example include: COUNT, SUM, MIN, MAX AND AVG


SELECT SUM(columnname) FROM tablename;

This can only be used on integer and numeric data type
*/

SELECT SUM(domestic_takings) FROM movie_revenues;  -- sum of individual values in the domestic taking

-- SUM  Statement with WHERE clause

SELECT SUM(domestic_takings) FROM movie_revenues
WHERE domestic_takings > 100.0; 


-- Aggregate Functions: MIN and MAX

/*
SELECT MAX(columnname) FROM tablename;
SELECT MIN(columnname) FROM tablename;
*/

SELECT MIN(movie_length) FROM movies;
SELECT MAX(movie_length) FROM movies;

SELECT MAX(movie_length) FROM movies
WHERE movie_lang = 'English';

SELECT MAX(release_date) FROM movies;
SELECT MIN(release_date) FROM movies;



-- Aggregate Functions: AVG

/*
SELECT AVG(columnname) FROM tablename;
*/

SELECT AVG (movie_length) FROM movies;

SELECT AVG (movie_length) FROM movies
WHERE age_certificate = '12';


-- Average Function Challenge

-- Challenge 1
SELECT COUNT(*) FROM actors
WHERE date_of_birth > '1970-01-01';                     -- 55 actors 

-- Challenge 2

SELECT MIN(domestic_takings) FROM movie_revenues;	    -- 0.30
SELECT MAX(domestic_takings) FROM movie_revenues;		-- 659.20


-- Challenge 3

SELECT SUM (movie_length) FROM movies
WHERE age_certificate = '15'; 						    --2184

-- Challenge 4
SELECT  COUNT(*) FROM directors
WHERE nationality = 'Japanese';							-- 3

-- Challenge 5

SELECT AVG(movie_length) FROM movies
WHERE movie_lang = 'Chinese';						   -- 121.80				



-- Grouping data : This group the column into distinct and perform the aggregate function on each group 

/*
SELECT column1, AGGFUN(column2) FROM tablename
GROUP BY column1 
*/

SELECT movie_lang, COUNT(movie_lang) FROM movies
GROUP BY movie_lang;

SELECT movie_lang, AVG(movie_length) FROM movies
GROUP BY movie_lang;

-- GROUP BY  with multiple columns
SELECT movie_lang, age_certificate, AVG(movie_length) FROM movies
GROUP BY movie_lang, age_certificate;