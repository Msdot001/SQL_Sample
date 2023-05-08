Database Relationships

- One-to-One Relationships
- One-to-Many Relationships
- Many-to-Many Relationships

One-to-One Relationship: 
In this kind of relationship, Primary key value can appear a maximum of once or none in the foreign key column.
This kind of relationship is kind of rare
The Parent table always contain the Primary key while the Child Table always contain the Foreign Keys


One-to-Many Relationships
This is the most common type of data relationship
The Primary key values can appear multiple time in Foreign key column
E.g Instagram user and instagram Photo; An instagram user (one) can have a many photo on their account. 


Many-to-Many Relationships
This occur when two tables can have many instances of each other.
E.g Authors and Books; A author can write many books and a book can have many authors
    Authors and Movies; Actor can perform in many Movies and a Movies can contain many Actors

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

-- The ideal is to create a row that doesnt have a match in the other table{this is just to demonstrate the Inner join}

INSERT INTO directors (first_name, last_name, date_of_birth, nationality)
VALUES ('Chistop', 'Nolando', '1973-07-13','British')


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



---------UNION---------

/*
This return the value from two Select statement.

-NB: The datatype must be compatible for the selected column

SELECT column1,column2 FROM table1
UNION
SELECT column1,column2 FROM table2
*/

SELECT first_name, last_name FROM directors
UNION                            -- This will combine the compatible coolumns into one column
SELECT first_name, last_name FROM actors;

--- With WHERE clause

SELECT first_name, last_name FROM directors
WHERE nationality = 'British'
UNION                            -- This will combine the compatible coolumns into one column
SELECT first_name, last_name FROM actors
WHERE gender = 'M';

--- with ORDER BY : This can be used at the end og the second select statement 

SELECT first_name, last_name FROM directors
WHERE nationality = 'British'
UNION                            -- This will combine the compatible coolumns into one column
SELECT first_name, last_name FROM actors
WHERE gender = 'M'
ORDER BY first_name;			---- NB: Order by can only be used at the end of the second select statement



/*
Differwent between 'UNION' and 'UNION ALL' is that the former remove duplicate 
while the latter didnot remove duplicate
*/

-- UNION ALL
/*
SELECT column1,column2 FROM table1
UNION ALl
SELECT column1,column2 FROM table2
*/

SELECT first_name FROM directors
UNION                            -- Return 163 rows because there is no duplicate
SELECT first_name  FROM actors;


SELECT first_name FROM directors
UNION ALL                            -- Return 185 rows because there is duplicate
SELECT first_name  FROM actors;

-- with ORDER BY: This come after the last SELECT also

SELECT first_name FROM directors
UNION ALL                            
SELECT first_name  FROM actors
ORDER BY first_name;


-- CHALLENGE 1
SELECT first_name, last_name,date_of_birth FROM directors
UNION
SELECT first_name, last_name,date_of_birth FROM actors
ORDER BY date_of_birth;


-- CHALLENGE 2
SELECT first_name, last_name FROM directors
WHERE date_of_birth BETWEEN '1960-01-01' AND '1969-12-31'
UNION
SELECT first_name, last_name FROM actors
WHERE date_of_birth BETWEEN '1960-01-01' AND '1969-12-31'
ORDER BY last_name;


---------INTERSECT------
/*
return rows of data thta are found in both table

SELECT column1,column2 FROM table1
INTERSECT
SELECT column1,column2 FROM table2

*/


SELECT first_name FROM directors
INTERSECT                           -- Return 12 rows because those are the one taht can be dound in thetwo table
SELECT first_name  FROM actors;

-- with WHERE clause and ORDER clause 
SELECT first_name FROM directors
WHERE NATIONALITY = 'American'
INTERSECT                           
SELECT first_name  FROM actors
ORDER BY first_name;


---------EXCEPT------

/*
Return data in table 1 that are not match with table 2. 

SELECT column1,column2 FROM table1
EXCEPT
SELECT column1,column2 FROM table2     -- No data is return from table 2
*/


SELECT first_name FROM directors
EXCEPT                     
SELECT first_name  FROM actors;



-- with WHERE clause and ORDER clause 
SELECT first_name FROM directors
WHERE NATIONALITY = 'American'
EXCEPT                          
SELECT first_name  FROM actors
ORDER BY first_name;


-- CHALLENGE 1
SELECT first_name, last_name, date_of_birth FROM directors
INTERSECT 
SELECT first_name, last_name, date_of_birth FROM actors;


-- CHALLENGE 2

SELECT first_name FROM actors
WHERE gender = 'M'
EXCEPT
SELECT first_name FROM directors
WHERE nationality = 'British';

--------- SUBQUERIES EXPLAINED

/*
These are nested queries. 

They are select query within another selected queries.

SELECT movie_name, movie_length FROM movies     -- outer query
WHERE movie_length >
	(SELECT AVG(movie_length) FROM movies);     -- inner query
	
The inner query is selected first. 

Types of Subqueries:

i. Uncorrelated subqueries
ii. Correlated subsuqueries
*/

/*
				Uncorrelated subquerie
: occur when the inner query can be implement 
independent of the ourt queries

The inner query can be run independently 

*/

SELECT movie_name, movie_length FROM movies
WHERE movie_length > 
(SELECT AVG(movie_length) FROM movies);      --- this is run first, then pass the result to the outer subquery

-- The above query is equivalent to 

SELECT movie_name, movie_length FROM movies
WHERE movie_length > 126.13; 

--Remark: Under this subquery, The inner query is independent on the outside subquery

SELECT AVG(movie_length) FROM movies;    	--- Output 126.13


SELECT first_name, last_name FROM directors
WHERE date_of_birth >
(SELECT date_of_birth FROM directors
WHERE first_name = 'James' 
AND last_name = 'Cameron');


*
PART 2: Uncorrelated subquerie : Passing multiple value from inner query to the outer subquery

--Remark: You use "IN" instead of >, <, = used in single value uncorrelated subquery
*/

SELECT movie_name FROM movies
WHERE movie_id IN
(SELECT movie_id FROM movie_revenues
WHERE international_takings > domestic_takings);

-- Using with JOIN

SELECT mo.movie_id, mo.movie_name, d.first_name, d.last_name
FROM movies mo JOIN directors d ON d.director_id = mo.director_id
WHERE movie_id IN
(SELECT movie_id FROM movie_revenues
WHERE internaTional_takings > domestic_takings);

-- challenge 1

SELECT first_name, last_name FROM actors
WHERE date_of_birth <                   -- older than 
(SELECT date_of_birth FROM actors
WHERE first_name = 'Marlon' 
AND last_name = 'Brando');

-- challenge 2
SELECT movie_name FROM movies
WHERE movie_id IN
(SELECT movie_id FROM movie_revenues 
WHERE domestic_takings > 300);

-- challenge 3
SELECT MIN(movie_length), max(movie_length) FROM movies
WHERE movie_id IN
(SELECT movie_id FROM movie_revenues     ----  movie_id with less than average domestic takings
WHERE domestic_takings >
(SELECT AVG(domestic_takings) FROM movie_revenues));     --- average domestic takings


/*
			Correlated subqueries
The inner query cannot run without outer query beacuse the inner query is 
reference a table from the outer table
-- Inner subqueries (didnt have d1 defined in it thus depend in d1 from outer subquery
*/

--first name, last name, date of birth of actor from each nationality 
SELECT d1.first_name, d1.last_name, d1.date_of_birth FROM directors d1
WHERE date_of_birth = 
(SELECT MIN(date_of_birth) FROM directors d2 WHERE d2.nationality = d1.nationality);


-- Maximum movie length for each movie lang



SELECT mo1.movie_name, movie_lang, mo1.movie_length FROM movies mo1
WHERE mo1.movie_length =
(SELECT MAX(movie_length) FROM movies mo2
WHERE mo2.movie_lang = mo1.movie_lang);
