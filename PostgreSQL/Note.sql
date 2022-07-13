Database Relationships

- One-to-One Relationships
- One-to-Many Relationships
- Many-to-Many Relationships

One-to-One Relationship: 
In this kind of relationship, Primary key value can appear a maximum of once or none in the foreign key column.
This kind of relationship is kind of rare
The Parent table always contain the Primary key while the Child Table always conatin the Foreign Keys


One-to-Many Relationships
This is the most common type of data relationship
The Primary key values can appear multiple time in Foreign key column
E.g Intergram user and instagram Photo; An instagram user (one) can have a many photo on thise account. 


Many-to-Many Relationships
This occur when two tables can have many instances of each other.
E.g Authors and Books; A author can write many books and a book canhave many authors
    Authou and Movies; Actor can perform in many Movies and a Movies can contai many Actors

for this can relationship, primary key and foreign is not used to linked table rather we need Junction table 
Junction table contain the foreign key of the two table to be linked together.


JOINS
This queries allows us to select data from multiple table, as long as there is related column between the tables. 
These column are usually Primary Key and Foreign Key column

Types of Joins:
- Inner Joins
- Left Joins
- Right Joins
- Full Joins

INNER JOINS
This is the most common type  of join. 
Effect: This will return rows of data with matching values in both tables
An inner join return three column: The matching id, Primary key values and Secondary key values.

LEFT JOINS/ LEFT OUT JOINS
The most second common type of join
Effect: This will return all the rows of data in the left table(Table1) and only matching rows of data in the right table(Table2)

RIGHT JOIN
This kind of join is not common in the sql
Effect: This will return all the rows of data in the right table(Table2) and only matching rows of data in the left table(Table1)

FULL JOIN 
Will only return all rows of data in both table 


---------------------------- INNER JOINS: PART 1 (long approah)

/*
SELECT table1.column1, table1.column2, table2.column1 FROM table1
INNER JOIN table2 ON table1.column3(i.e Primary_key) = table2.column3;
*/

SELECT * FROM directors;

-- The ideal is to create a row thta doesnt have a match in the other table{this is just to demonstrate he Inner join}

INSERT INTO directors (first_name, last_name, date_of_birth, nationality)
VALUES ('Chistopher', 'Nolan', '1970-07-30','British')


SELECT directors.director_id, directors.first_name, directors.last_name, movies.movie_name
FROM directors
INNER JOIN movies 
ON directors.director_id = movies.director_id;

-- USING WHERE CLAUSE

SELECT directors.director_id, directors.first_name, directors.last_name, movies.movie_name
FROM directors
INNER JOIN movies 
ON directors.director_id = movies.director_id
WHERE movies.movie_lang = 'Japanese';


-- USING ORDER BY

SELECT directors.director_id, directors.first_name, directors.last_name, movies.movie_name
FROM directors
INNER JOIN movies 
ON directors.director_id = movies.director_id
WHERE movies.movie_lang = 'Japanese'
ORDER BY movies.movie_length;


------------------------ INNER JOINS : PART 2 (Short Approach) setting alias

/*
SELECT t1.column1, t1.column2, t2.column1 FROM table1 t1
JOIN table2 t2 ON t1.column3 = t2.column3;
*/

SELECT t1.director_id, t1.first_name, t1.last_name, t2.movie_name
FROM directors t1
JOIN movies t2 
ON t1.director_id = t2.director_id
WHERE t2.movie_lang = 'Japanese'
ORDER BY t2.movie_length;



SELECT mo.movie_name, mr.domestic_takings, mr.international_takings 
FROM movies mo
JOIN movie_revenues mr
ON mo.movie_id = mr.movie_id
ORDER BY mr.domestic_takings;


----------------------- INNER JOINS: PART 3

-- Only when the columns have the same name

/*
SELECT t1.column1, t1.column2, t2.column1 From table1 t1
jOIN table2 t2 USING (column3)    --- This only applicable when the Primary and Secondary key bears the same mean
*/

SELECT mo.movie_name, mr.domestic_takings 
FROM movieS mo
JOIN movie_revenueS mr
USING (movie_id)      -- the primary and secondary keys is called movie_id, thats why USING is used instead of primarykey name = seconadrykey name
WHERE mo.age_certificate IN ('12','15','18')
ORDER BY mr.domestic_takings DESC;



-- CHALLENGE

-- CHALLENGE 1
SELECT * FROM movie_revenues;

SELECT di.first_name, di.last_name, mo.movie_name, mo.release_date
FROM directors di 
JOIN movies mo
ON di.director_id = mo.director_id
WHERE mo.movie_lang IN ('Chinese','Korean','Japanese')
ORDER BY mo.age_certificate DESC;            -- 10 MOVIES

-- CHALLENGE 2

SELECT mo.movie_name, mo.release_date, mr.international_takings 
FROM movies mo
JOIN movie_revenues mr
ON mo.movie_id = mr.movie_id
WHERE mo.movie_lang IN ('English')
ORDER BY mo.age_certificate DESC;     -- 38 Movies


SELECT mo.movie_name, mr.domestic_takings, mr.international_takings
FROM movies mo
JOIN movie_revenues mr
ON mo.movie_id = mr.movie_id
WHERE mr.domestic_takings IS NUll 
OR mr.international_takings IS NULL
ORDER BY mo.movie_name;                -- 16 Movies



----- LEFT JOIN 

/*

SELECT t1.column1, t1.column2, t2.column1 
FROM tablename t1
LEFT JOIN table2 t2
ON t1.column1 = t2.column2;

return all the data from table1 and only return match data from table2 
*/

-- NB: directors is table1 while movies table is table2
SELECT d.director_id, d.first_name, d.last_name, mo.movie_name 
FROM directors d
LEFT JOIN movies mo
ON d.director_id = mo.director_id;


-- NB: movies is table1 while directors  table is table2
SELECT d.director_id, d.first_name, d.last_name, mo.movie_name 
FROM movies mo
LEFT JOIN directors d
ON d.director_id = mo.director_id;

/* 
NB: For LEFT JOIN, it matter which table you have as 1 and 2 whereas in INNER JOIN
its doesnt matter which table is 1 and 2. 
*/


-- LEFT JOIN with  WHERE Clause 
SELECT d.director_id, d.first_name, d.last_name, mo.movie_name 
FROM directors d
LEFT JOIN movies mo
ON d.director_id = mo.director_id
WHERE d.nationality = 'British';


----------RIGHT JOIN 
/*
SELECT t1.column1, t1.column2, t2.column1 
FROM tablename t1
RIGTH JOIN table2 t2
ON t1.column1 = t2.column2;

return all the data from table2 and only return match data from table1 
*/

SELECT d.director_id, d.first_name, d.last_name, mo.movie_name
FROM directors d
RIGHT JOIN movies mo
ON d.director_id = mo.director_id;
--REmark: It return all the data from table2(movies) and matching data from table1(director)

-- WHERE CLAUSE
SELECT d.director_id, d.first_name, d.last_name, mo.movie_name
FROM directors d
RIGHT JOIN movies mo
ON d.director_id = mo.director_id
WHERE mo.age_certificate = '18';




----- FULL OUTER JOINS

/*
SELECT t1.column1, t1.column2, t2.column1 
FROM table1 t1
FULL JOIN table2 t1
ON t1.column3 = t2.column3;

return all the data from table1 and table2
*/

-- NB: directors is table1 while movies table is table2
SELECT d.director_id, d.first_name, d.last_name, mo.movie_name
FROM directors d
FULL JOIN movies mo
ON d.director_id = mo.director_id;

-- NB: movies is table1 while directors table is table2
SELECT d.director_id, d.first_name, d.last_name, mo.movie_name
FROM movies mo
FULL JOIN directors d
ON d.director_id = mo.director_id;
--Remark: It doesnt matter which table is 1 or 2, it will return data from both table. 


SELECT d.director_id, d.first_name, d.last_name, mo.movie_name
FROM movies mo
FULL JOIN directors d
ON d.director_id = mo.director_id
WHERE mo.movie_lang IN ('German', 'Korean')
ORDER BY d.last_name;


------ CHALLENGE 1
SELECT d.first_name, d.last_name, mo.movie_name, mo.age_certificate
FROM directors d
LEFT JOIN movies mo
ON d.director_id = mo.director_id
WHERE d.nationality = 'British';      ---- 8 directors

------ CHALLENGE 2

SELECT *  FROM movies;
SELECT *  FROM directors;

SELECT d.first_name, d.last_name,COUNT(mo.movie_name)
FROM directors d
LEFT JOIN movies mo 
ON mo.director_id = d.director_id
GROUP BY (d.first_name,d.last_name);



-- JOIN MORE THAN TWO TABLE

/*
SELECT t1.column, t2.column, t3.column FROM table t1
JOIN table2 t2 ON t1.column = t2.column
JOIN table3 t3 ON t2.column = t3.column
*/

SELECT d.first_name, d.last_name, mo.movie_name, mr.international_takings, mr.domestic_takings
FROM directors d 
JOIN movies mo ON d.director_id = mo.director_id
JOIN movie_revenues mr ON mr.movie_id = mo.movie_id;

-- Join two table together first before Joining it to the third table
SELECT ac.first_name, ac.last_name, mo.movie_name FROM actors ac 
JOIN movies_actors ma ON ac.actor_id = ma.actor_id
JOIN movies mo ON mo.movie_id = ma.movie_id;

-- with WHERE CLAUSE
SELECT ac.first_name, ac.last_name, mo.movie_name FROM actors ac 
JOIN movies_actors ma ON ac.actor_id = ma.actor_id
JOIN movies mo ON mo.movie_id = ma.movie_id
WHERE mo.movie_lang ='English';


-- with ORDER BY CLAUSE
SELECT ac.first_name, ac.last_name, mo.movie_name FROM actors ac 
JOIN movies_actors ma ON ac.actor_id = ma.actor_id
JOIN movies mo ON mo.movie_id = ma.movie_id
WHERE mo.movie_lang ='English'
ORDER BY mo.movie_name;


--Joining 4 different table together 

SELECT d.first_name, d.last_name, mo.movie_name, ac.first_name, ac.last_name,
mr.international_takings, mr.domestic_takings
FROM directors d 
JOIN movies mo ON d.director_id = mo.director_id
JOIN movies_actors ma ON mo.movie_id = ma.movie_id      -- Kindly be kindly with join
JOIN actors ac ON ac.actor_id = ma.actor_id        -- join actors table to movie table by first craeting actors_movies
JOIN movie_revenues mr ON mr.movie_id = mo.movie_id;


-- CHALLENGE

-- CHALLENGE 1

SELECT ac.first_name, ac.last_name,d.first_name, d.last_name, mo.movie_name
FROM directors d
JOIN movies mo ON d.director_id = mo.director_id
JOIN movies_actors am ON mo.movie_id = am.movie_id
JOIN actors ac ON ac.actor_id = am.actor_id
WHERE d.first_name = 'Wes' AND d.last_name = 'Anderson';  ---20 different actors


-- CHALLENGE 1
SELECT * FROM directors;
SELECT * FROM movie_revenues;

SELECT d.first_name, d.last_name, SUM(mr.domestic_takings) AS total_dom_takings FROM directors d
JOIN movies mo ON mo.director_id = d.director_id
JOIN movie_revenues mr ON mo.movie_id = mr.movie_id
WHERE mr.domestic_takings IS NOT NULL
GROUP BY d.first_name, d.last_name
ORDER BY (total_dom_takings) DESC
LIMIT 1;
