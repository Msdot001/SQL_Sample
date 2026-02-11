
##Create Table##

CREATE TABLE teachers (
id bigserial,
first_name varchar(25),
last_name varchar(50),
school varchar(50),
hire_date date,
salary numeric
);

##Insert data into table##

INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
VALUES ('Janet', 'Smith', 'F.D. Roosevelt HS', '2011-10-30', 36200),  ## Each line stand for each row##
('Lee', 'Reynolds', 'F.D. Roosevelt HS', '1993-05-22', 65000),      ## Each row should be end with comma ##
('Samuel', 'Cole', 'Myers Middle School', '2005-08-01', 43500),    ## The last row should be end with semi colon
('Samantha', 'Bush', 'Myers Middle School', '2011-10-30', 36200),  ## Text and Date require quotes ##
('Betty', 'Diaz', 'Myers Middle School', '2005-08-30', 43500),     ## Decimal and Integers##
('Kathleen', 'Roush', 'F.D. Roosevelt HS', '2010-10-22', 38500);

SELECT * FROM teachers;  #select all columns#

#Subset of Columns#
SELECT first_name,last_name, salary,school  
FROM teachers;

##DISTINCT FOR UNIQUE VALUES

SELECT DISTINCT school # work on one column
FROM teachers;

SELECT DISTINCT school,salary  # work on  more than one column
FROM teachers;

## ORDER BY to sort##

SELECT first_name,last_name,salary  # work on one column
FROM teachers
ORDER BY salary DESC;

SELECT last_name,school, hire_date  # work on  more than one column
FROM teachers
ORDER BY school ASC,hire_date DESC;

##WHERE CONDITION##

SELECT last_name,school,hire_date
FROM teachers
WHERE school = 'Myers Middle School';

SELECT last_name,school,hire_date
FROM teachers
WHERE school <>'BakerMiddle';

SELECT last_name,school,hire_date,salary
FROM teachers
WHERE salary >20000;

SELECT last_name,school,hire_date,salary
FROM teachers
WHERE salary < 60500;

SELECT last_name,school,hire_date,salary
FROM teachers
WHERE salary BETWEEN 20000 AND 40000;

SELECT first_name,last_name,hire_date
FROM teachers
WHERE hire_date <'2000-01-01';

SELECT first_name
FROM teachers
WHERE first_name LIKE 'sam%';  ##case sensitivity

SELECT first_name
FROM teachers
WHERE first_name ILIKE 'sam%'; ##case insensitivity 

##WHERE + AND + OR

SELECT *
FROM teachers
WHERE school='Myers Middle School'
 AND salary< 40000;  
 
SELECT *
FROM teachers
WHERE last_name='Cole' 
  OR last_name ='Bush';
  
SELECT *
FROM teachers
WHERE school='F.D. Roosevelt HS' 
  AND (salary< 38000 OR salary> 40000);
  

SELECT first_name, last_name, school, hire_date, salary
FROM teachers
WHERE school LIKE '%Roos%'
ORDER BY hire_date DESC;


##  CHAPTER ONE and TW0##
SELECT column_names
FROM table_name
WHERE criteria
ORDER BY column_names;  
  
##Exercise##
SELECT last_name,school
FROM teachers
ORDER BY school DESC,last_name ASC;
  
SELECT first_name,salary
FROM teachers
WHERE first_name LIKE 'S%'
  AND salary > 40000;

SELECT first_name,last_name, salary, hire_date
FROM teachers
WHERE hire_date >'2010-01-01'
ORDER BY salary DESC;

##CHAPTER 3##
##DATA TYPE##

CREATE TABLE table_name (
column_name1 data_type, 
column_name2 data_type,
column_nameX data_type
);

CREATE TABLE eagle_watch (
observed_date date,
eagles_seen integer
);

    ##CHARACTER_TYPE##
	
CREATE TABLE char_data_type(
varchar_column varchar(10),
char_column char(10),
text_column text
);

INSERT INTO char_data_type(varchar_column,char_column,text_column)
  VALUES('abc','abc','abc'),
         ('defghi','defghi','defghi');

CREATE TABLE people(
	id serial,
person_name varchar(100)
);

##NUMBER##

CREATE TABLE number_data_types(
numeric_column numeric(20,5),
real_column real,
double_column double precision
);

INSERT INTO number_data_types
VALUES
(.7, .7, .7),
(2.13579, 2.13579, 2.13579),
(2.1357987654, 2.1357987654, 2.1357987654);

SELECT * FROM number_data_types;

SELECT
numeric_column * 10000000  AS "Fixed",
real_column * 10000000  AS "Float"
FROM number_data_types
WHERE numeric_column = .7;

   ##DATE AND TIME##
   
 CREATE TABLE date_time_types(
timestamp_column timestamp with time zone,
Interval_column interval
);

INSERT INTO date_time_types
VALUES 
('2018-12-31 01:00 EST', '2 days'),
('2018-12-31 01:00 -8','1 month'),
('2018-12-31 01:00 Australia/Melbourne','1 century'),
(now(),'1 week');

SELECT * FROM date_time_types;

SELECT 
timestamp_column ,Interval_column,
timestamp_column - Interval_column AS new_date
FROM date_time_types
	 
	##TRASNSFORMING VALUES FROM ONE DATE TYPE TO ANOTHER##
	##USING CAST() function## 

SELECT timestamp_column,
CAST(timestamp_column AS varchar(10))
FROM date_time_types;

SELECT numeric_column,
CAST(numeric_column AS varchar(6)),
  CAST(numeric_column AS integer)
FROM number_data_types;
	 
##SHORTCUT FOR CAST##

SELECT timestamp_column,
timestamp_column::varchar(10)
FROM date_time_types;

SELECT numeric_column,
       numeric_column::varchar(6),
	   numeric_column::integer
FROM number_data_types;

##CHAPTER FOUR##

        ##DATA IMPORT AND EXPORT##
		
--1. Data are imported inform of delimited text file
--2.Each row represent a row of table
--3. Column are represented by a character seperator or delimiter
--4. Text qualifier usually "" are often used to wrapped words that conatin character sperator and prevent it to be run as delimiter
--5. Header rows from the delimited text file should be exluded using HEADER option 

--Using Copy to import Data
--  COPY table_name      ## table_name which have already been created in your database
--  FROM 'C:\YourDirectory\your_file.csv'
--  WITH (FORMAT CSV, HEADER);

--Data Import Example--
-- Creating Table--

 CREATE TABLE us_counties_2010 (
    geo_name varchar(90),                    -- Name of the geography
    state_us_abbreviation varchar(2),        -- State/U.S. abbreviation
    summary_level varchar(3),                -- Summary Level
    region smallint,                         -- Region
    division smallint,                       -- Division
    state_fips varchar(2),                   -- State FIPS code
    county_fips varchar(3),                  -- County code
    area_land bigint,                        -- Area (Land) in square meters
    area_water bigint,                        -- Area (Water) in square meters
    population_count_100_percent integer,    -- Population count (100%)
    housing_unit_count_100_percent integer,  -- Housing Unit count (100%)
    internal_point_lat numeric(10,7),        -- Internal point (latitude)
    internal_point_lon numeric(10,7),        -- Internal point (longitude)

    -- This section is referred to as P1. Race:
    p0010001 integer,   -- Total population
    p0010002 integer,   -- Population of one race:
    p0010003 integer,       -- White Alone
    p0010004 integer,       -- Black or African American alone
    p0010005 integer,       -- American Indian and Alaska Native alone
    p0010006 integer,       -- Asian alone
    p0010007 integer,       -- Native Hawaiian and Other Pacific Islander alone
    p0010008 integer,       -- Some Other Race alone
    p0010009 integer,   -- Population of two or more races
    p0010010 integer,   -- Population of two races:
    p0010011 integer,       -- White; Black or African American
    p0010012 integer,       -- White; American Indian and Alaska Native
    p0010013 integer,       -- White; Asian
    p0010014 integer,       -- White; Native Hawaiian and Other Pacific Islander
    p0010015 integer,       -- White; Some Other Race
    p0010016 integer,       -- Black or African American; American Indian and Alaska Native
    p0010017 integer,       -- Black or African American; Asian
    p0010018 integer,       -- Black or African American; Native Hawaiian and Other Pacific Islander
    p0010019 integer,       -- Black or African American; Some Other Race
    p0010020 integer,       -- American Indian and Alaska Native; Asian
    p0010021 integer,       -- American Indian and Alaska Native; Native Hawaiian and Other Pacific Islander
    p0010022 integer,       -- American Indian and Alaska Native; Some Other Race
    p0010023 integer,       -- Asian; Native Hawaiian and Other Pacific Islander
    p0010024 integer,       -- Asian; Some Other Race
    p0010025 integer,       -- Native Hawaiian and Other Pacific Islander; Some Other Race
    p0010026 integer,   -- Population of three races
    p0010047 integer,   -- Population of four races
    p0010063 integer,   -- Population of five races
    p0010070 integer,   -- Population of six races

    -- This section is referred to as P2. HISPANIC OR LATINO, AND NOT HISPANIC OR LATINO BY RACE
    p0020001 integer,   -- Total
    p0020002 integer,   -- Hispanic or Latino
    p0020003 integer,   -- Not Hispanic or Latino:
    p0020004 integer,   -- Population of one race:
    p0020005 integer,       -- White Alone
    p0020006 integer,       -- Black or African American alone
    p0020007 integer,       -- American Indian and Alaska Native alone
    p0020008 integer,       -- Asian alone
    p0020009 integer,       -- Native Hawaiian and Other Pacific Islander alone
    p0020010 integer,       -- Some Other Race alone
    p0020011 integer,   -- Two or More Races
    p0020012 integer,   -- Population of two races
    p0020028 integer,   -- Population of three races
    p0020049 integer,   -- Population of four races
    p0020065 integer,   -- Population of five races
    p0020072 integer,   -- Population of six races

    -- This section is referred to as P3. RACE FOR THE POPULATION 18 YEARS AND OVER
    p0030001 integer,   -- Total
    p0030002 integer,   -- Population of one race:
    p0030003 integer,       -- White alone
    p0030004 integer,       -- Black or African American alone
    p0030005 integer,       -- American Indian and Alaska Native alone
    p0030006 integer,       -- Asian alone
    p0030007 integer,       -- Native Hawaiian and Other Pacific Islander alone
    p0030008 integer,       -- Some Other Race alone
    p0030009 integer,   -- Two or More Races
    p0030010 integer,   -- Population of two races
    p0030026 integer,   -- Population of three races
    p0030047 integer,   -- Population of four races
    p0030063 integer,   -- Population of five races
    p0030070 integer,   -- Population of six races

    -- This section is referred to as P4. HISPANIC OR LATINO, AND NOT HISPANIC OR LATINO BY RACE
    -- FOR THE POPULATION 18 YEARS AND OVER
    p0040001 integer,   -- Total
    p0040002 integer,   -- Hispanic or Latino
    p0040003 integer,   -- Not Hispanic or Latino:
    p0040004 integer,   -- Population of one race:
    p0040005 integer,   -- White alone
    p0040006 integer,   -- Black or African American alone
    p0040007 integer,   -- American Indian and Alaska Native alone
    p0040008 integer,   -- Asian alone
    p0040009 integer,   -- Native Hawaiian and Other Pacific Islander alone
    p0040010 integer,   -- Some Other Race alone
    p0040011 integer,   -- Two or More Races
    p0040012 integer,   -- Population of two races
    p0040028 integer,   -- Population of three races
    p0040049 integer,   -- Population of four races
    p0040065 integer,   -- Population of five races
    p0040072 integer,   -- Population of six races

    -- This section is referred to as H1. OCCUPANCY STATUS
    h0010001 integer,   -- Total housing units
    h0010002 integer,   -- Occupied
    h0010003 integer    -- Vacant
);

  --importig CSV file into the table--
COPY us_counties_2010
FROM 'C:\Postgre_File\us_counties_2010.csv'
WITH (FORMAT CSV, HEADER);

SELECT * FROM us_counties_2010;