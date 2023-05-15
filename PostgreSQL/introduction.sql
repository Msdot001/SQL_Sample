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
