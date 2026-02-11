SQL is a collection of orgainised information or data that is stored in a table for which are access by DBMS

DBMS also called Data System Management System  are software system that allow user to store, organise and manage 
data in the database.

Example of DBMS include PostgreSQL, MySQL, Microsoft SQL Server and Oracle. 

DBMS provide wide range of service such as Data Storage, Data Retrieval, Data Security, Data integrity and Data backup and recovery.

PostgreSQL
- It an relational database management system. (relational because data is store in table(role and column). 
- Each column has specific unique Primary key 
- Table are linked together with Foreign Key 


Concepts to Write  Advanced  SQL  Queries

1. JOINs

JOINs are among the essential SQL features, often used to  combine tables based on relationships between them.

Normally, JOINs do not increase the volume of records, only the breadth  of  information.

2. DISTINCT

DISTINCT clause is the easiest way to remove duplicate values from a column.

3. Set Operators

They allow you to vertically  combine  multiple SELECT statements into one result, find common rows between datasets, or  rows that appear in one dataset but not the other.

Common  set  operators  
- UNION  and
- UNION  ALL

The big difference is that UNION removes duplicate rows, UNION ALL doesn’t. (Both UNIONs increase the overall number of rows in the table)

4. INTERSECT

This returns the intersection of specified datasets  and also remove duplicates

5. EXCEPT

This returns rows from the first dataset that do not appear in subsequent datasets.

6. Subqueries and Comon Table Exoressions

They are called nested Subqueries

7. Window  Functions

They are called analytical functions, that allows you to perform calculations across a set of rows in a result set. 
Two importance queries are important for window function; "PARTITION By" and "ORDER BY"

Usage: 

- Include using SELECT clause of your SQL statement along with a PARTITION BY clause, which divides the result set into groups then 
- An ORDER BY clause, which specifies the order in which the rows are processed within each group.


There are many different window functions, seperated into three category;

- Aggregate window functions
- Navigation functions
- Ranking window functions

i. Aggregate window functions

This type of SQL window function perform a calculation over a specific set of rows in a result set, rather than over the entire result set. 
Example: SUM(), AVG(), COUNT(), MAX(), MIN()


ii. Navigation  Window  Functions

This type of SQL window function allow you to access data from rows that are either before or after the current row in the result set.
Example: LAG(column, offset), LEAD(column, offset), FIRST_VALUE(column) and LAST_VALUE(column).


iii. Ranking window functions

These type of SQL window function that assign a rank or row number to each row in a result set, based on a specified criteria.
They are often used to rank data, identify top or bottom performers, and to calculate percentiles.

Example: ROW_NUMBER(), RANK(), DENSE_RANK(), PERCENT_RANK(), CUME_DIST()


8. Date-Time Manipulation

This involves performing operations on date and time values in SQL

9. CASE WHEN

This is a conditional statement in SQL that allows you to perform different actions based on specified conditions.
Commonly used to create new columns based on certain criteria, or to perform calculations or comparisons based on conditional logic.

The syntax for the CASE WHEN statement

/*
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ...
    ELSE resultN
END

*/
SELECT DATE_PART ('month', book_date) AS month, SUM(total_amount) AS bookings,
	CASE 
		WHEN SUM(total_amount) > 6958118400.00 THEN 'the most'
		WHEN SUM(total_amount)< 6958118400.00 THEN 'the least'
		ELSE 'the medium' 
	END AS booking_qt
FROM bookings
GROUP BY month;

												
SELECT *,
	CASE 
		WHEN age >= 50 THEN 'old'
		WHEN age isnull THEN 'unknown'
		ELSE 'young' 
	END AS is_old
FROM pilots;
												

/* NULLIF() is used to return a null values */
												
SELECT count(*) FROM flights;	
												
/* To return the values of Null values in a columns */
SELECT COUNT(NULLIF(actual_departure,null)) AS NULL_Depart, COUNT(NULLIF(actual_arrival,null)) AS NULL_Arrival
FROM flights;
												
/* To return the values of Non-Null values in a columns */												
SELECT COUNT(*) - COUNT(NULLIF(actual_departure,null)) AS no1, COUNT(*)-COUNT(NULLIF(actual_arrival,null)) AS no2
FROM flights;												

												
/* The COALESCE function is a SQL function that returns the first non-null expression from a list of expressions.  */
SELECT status, COALESCE(actual_departure, current_timestamp) AS kdepaet,  COALESCE(actual_arrival,current_timestamp) AS karrival 
FROM flights;
												
/* CHALLENCE */
SELECT (model->> 'en') AS model, range,
	CASE
		WHEN range > 5000 THEN 'Long'
		WHEN range < 2000 THEN 'Short'
		WHEN range < 5000 AND range > 2000   THEN 'Middle'
	END AS modelRange												
FROM aircrafts;												
												
							
/* Overview of Time Functions in PostgreSQL */
SELECT * FROM bookings;
												
/* EXTRACT, date_part */ 	
SELECT EXTRACT(field FROM source)
												
SELECT book_ref, SUM(total_amount) AS sales, 
EXTRACT (DOY FROM book_date) AS day_of_year
FROM bookings
GROUP BY book_ref;												
												
												
SELECT book_ref, SUM(total_amount) AS sales, 
EXTRACT (MONTH FROM book_date) AS month
FROM bookings
GROUP BY book_ref;												
																	
												
SELECT book_ref, SUM(total_amount) AS sales, 
EXTRACT (WEEK FROM book_date) AS week
FROM bookings
GROUP BY book_ref;
												
												
/* DATE_PART; the field parameter needs to be a string value, not a name. */
												
SELECT book_ref,book_date, DATE_PART('YEAR', book_date) AS year 
FROM bookings;												
												
SELECT book_ref,book_date, DATE_PART('Month', book_date) AS month 
FROM bookings;													
												
SELECT book_ref,book_date, DATE_PART('day', book_date) AS day 
FROM bookings;													
												
SELECT book_ref,book_date, DATE_PART('hour', book_date) AS hours 
FROM bookings;													
												
SELECT book_ref,book_date, DATE_PART('minute', book_date) AS minute 
FROM bookings;													
																
/* Current Date/Time */
												
SELECT CURRENT_DATE AS DATE;
SELECT CURRENT_TIMESTAMP AS time;												
												
/* Delaying Execution makes the current session's process sleep until the given number of seconds have elapsed.  */
												
pg_sleep ( double precision )
pg_sleep_for ( interval )												
												

/* JOIN */												
SELECT * FROM aircrafts;
SELECT * FROM seats;	
SELECT * FROM flights;												

												
# Joining three table together and select only the cancelled flights
SELECT s.seat_no, s.fare_conditions, a.model ->>'en' AS model,
f.flight_no, f.departure_airport, f.arrival_airport, f.status 												
FROM seats s
INNER JOIN aircrafts a
ON s.aircraft_code = a.aircraft_code
INNER JOIN flights f
ON a.aircraft_code = f.aircraft_code
WHERE status = 'Cancelled';												

												
# Joining three table together and select only the cancelled flights	and the model of the flight is "Cessna 208 Caravan"	
												
SELECT s.seat_no, s.fare_conditions, a.model ->>'en' AS model,
f.flight_no, f.departure_airport, f.arrival_airport, f.status 												
FROM seats s
INNER JOIN aircrafts a
ON s.aircraft_code = a.aircraft_code
INNER JOIN flights f
ON a.aircraft_code = f.aircraft_code
WHERE status = 'Cancelled' AND model ->> 'en' = 'Cessna 208 Caravan';
												
												
/*
LEFT OUTER JOIN : 
This type of join returns all rows from the LEFT-hand table specified in the 
ON condition and only those rows from the other table where the joined 
fields are equal
*/												
																								
SELECT * FROM tickets;
SELECT * FROM ticket_flights;
SELECT * FROM bookings;
										
SELECT t.passenger_name, t.ticket_no,tf.fare_conditions,
date_part('day',b.book_date) AS DAY, 
date_part('month',b.book_date) AS MONTH
FROM tickets t
LEFT JOIN bookings b
ON t.book_ref = b.book_ref
LEFT JOIN ticket_flights tf
ON t.ticket_no = tf.ticket_no
WHERE fare_conditions = 'Economy'
ORDER BY month, day;												
												
												
/*
RIGHT JOIN:
This return all the rows from the right table and only the rows from the 												
other table where the specific field equal 												
*/
SELECT t.passenger_name, t.ticket_no,tf.fare_conditions,
date_part('day',b.book_date) AS DAY, 
date_part('month',b.book_date) AS MONTH
FROM tickets t
RIGHT JOIN bookings b
ON t.book_ref = b.book_ref
RIGHT JOIN ticket_flights tf
ON t.ticket_no = tf.ticket_no
WHERE fare_conditions = 'Economy'
ORDER BY month, day;												
												
/*
CROSS JOIN is useful in scenarios where you want to generate
all possible combinations between two tables.												
												
CROSS JOIN is useful in scenarios where you want to generate 
all possible combinations between two tables.												
*/
												
SELECT *
FROM TABLE 1
CROSS JOIN TABLE 2;												
												
SELECT * FROM aircrafts;												
SELECT * FROM airports;
												
SELECT *
FROM aircrafts
CROSS JOIN airports;											

												
/* 
UNION and UNION ALL
												
The UNION operator combines the results of multiple SELECT statements into a single result set, removing any duplicate rows.
												
*/												
												
SELECT *
FROM aircrafts
WHERE range > 4500											
UNION												
SELECT *
FROM aircrafts
WHERE range < 7500;		# This return 9 redults (without duplicated rows)												
												

												
SELECT *
FROM aircrafts
WHERE range > 4500											
UNION ALL												
SELECT *
FROM aircrafts
WHERE range < 7500;		# This return 12 redults (bcos it contain duplicated rows)											
												

/* INTERSECT and EXCEPT
INTERSECT: The result set will contain only the rows that are common to all SELECT statements,
excluding any duplicate rows. 
																								
EXCEPT/MINUS: The result set will contain only the rows from the first SELECT statement that are
not present in the result set of the second SELECT statement. 
*/												
												
												
SELECT *
FROM aircrafts
WHERE range > 4500											
INTERSECT												
SELECT *
FROM aircrafts
WHERE range < 7500;		# The result is 3 rows										
												
												
SELECT *
FROM aircrafts
WHERE range > 4500											
EXCEPT												
SELECT *
FROM aircrafts
WHERE range < 7500;		#THe result is 2 rows											
												

/*
SELF JOIN
This occur when a table is joined with itself. It is useful when you want 
to compare records within the same table based on a relationship or condition.												

Self joins are commonly used in scenarios where you have hierarchical relationships
within a table, such as employees and their managers or organizational structures. 
They allow you to compare and retrieve related information within the same table												
*/												
SELECT t1.column1, t2.column2
FROM table t1
JOIN table t2 ON t1.join_column = t2.join_column;
												
												
/*
USING: The "USING" keyword in SQL is used in conjunction with the "JOIN" clause 
to specify the columns used for joining two or more tables.
												
The "USING" keyword eliminates the need to explicitly mention the column in the result set and simplifies the join condition												
*/
SELECT column_list
FROM table1
JOIN table2 USING (common_column);
												
SELECT t.ticket_no, t.passenger_name, t.contact_data, b.total_amount, b.book_date
FROM tickets t
JOIN bookings b 
ON t.book_ref = b.book_ref ;												
	
SELECT t.ticket_no, t.passenger_name, t.contact_data, b.total_amount, b.book_date
FROM tickets t
JOIN bookings b USING (book_ref);

/* CHALLENGE */
SELECT * FROM bookings;												
SELECT * FROM aircrafts;													
SELECT * FROM airports;												
SELECT * FROM tickets;
SELECT * FROM ticket_flights;	
SELECT * FROM flights;
SELECT * FROM seats;													
SELECT * FROM boarding_passes;										
												
SELECT t.passenger_name,b.book_date,bp.seat_no,
	f.departure_airport, f.arrival_airport											
FROM bookings b
INNER JOIN tickets t USING (book_ref)												
JOIN boarding_passes bp
ON t.ticket_no = bp.ticket_no												
JOIN flights f
ON f.flight_id = bp.flight_id 												
WHERE departure_airport = 'SVO' AND arrival_airport ='OVB' 
AND seat_no='1A'
/*This line of code indicate yesterday */												
AND f.scheduled_departure::date = public.now()::date-INTERVAL '2 day'												
; 

												
SELECT t.passenger_name, t.ticket_no
FROM tickets t
JOIN boarding_passes bp 
ON bp.ticket_no = t.ticket_no
GROUP BY t.passenger_name, t.ticket_no
HAVING max(bp.boarding_no) = 1 AND count(*) > 1;												
												
												
/* Sub Queries 
This is a query within another SQL query and embedded within clauses, most commonly in the WHERE clause. 												
*/												

SELECT ai.city, ai.airport_code, ai.airport_name
FROM (												
SELECT city, count(*)
FROM airports
GROUP BY city												
HAVING count(*) > 1
) AS q
JOIN airports AS ai 
ON q.city = ai.city
ORDER BY ai.city, ai.airport_name;
												
												
												
												
												
												
												
												
												
												
												
												
												
												
												
												
												
												
												
												
												
												
												
												
												
												
												
												
												
												
												
												
												