### Introduction

- In a SQL database, each column in a table can hold one and only one data type, which is defined in the CREATE TABLE statement.

### Types of Data Type

- Numbers: Number columns hold various types of (you guessed it) numbers, but that’s not all: they also allow you to perform calculations on those numbers. 

    - Numbers stored as characters sort differently than numbers stored as numbers, arranging in text rather than numerical order. 
 
    - **i. Integers** : Whole numbers (both positive and negative). There are three type of integers ( difference between the three is the number is the maximum size they can hold)

     - 1. Smallint : 2 bytes (-32,768 to 32,767)
     - 2. Integer : 4 bytes (-2,147,483,648 to 2,147,483,647)
     - 3. Bigint : 8 bytes

    - Auto-Incrementing Integers: This is used when you want to auto-increment the value in the column each time you insert a row

        - This involve using declaration such as **smallserial**, **serial** and **bigserial** on special column called **identity culumn**


    - **ii. Decimal Numbers:** represent a whole number plus a fraction of a whole number; the fraction is represented by digits following a decimal point.

    - This is categories under the **Fixed-point** and **floating-point number**

    - Fixed Point Numbers

     - It called the arbitrary precision type, is **numeric(precision,scale).** 
    

 
- Characters : These can be general-purpose types suitable for any combination of text, numbers, and symbols. 

    - i. char(n) :  A column set at char(20) stores 20 characters per row regardless of how many characters you insert. 

        - If you insert fewer than 20 characters in any row, PostgreSQL pads the **rest of that column with spaces.**

    - ii. varchar() : If you insert fewer characters than the maximum, PostgreSQL **will not store extra spaces.**

    - iii. text : A variable-length column of unlimited length (the longest possible character string you can store is about 1 gigabyte)

- Generally: there is no substantial difference in performance among the three types.

- When using a "INSERT into Table" , with the VALUES: If the VALUES statements match the number of columns in the table, the database will assume you’re inserting values in the order the column definitions were specified in the table.




- Dates and times

