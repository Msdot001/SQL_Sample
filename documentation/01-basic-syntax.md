### 01. DISTINCT

- To understand the range of values in a **column**
- The DISTINCT eliminate duplicates and shoes only uniques values. 

- With date or numbers, DISTINCT helps to highligh inconsistent or broken formatting. 

- DISTINCT can work one or more than one column at at time ( The return the each unique par for teh vales)


### 02. ORDER BY

- By default, ORDER BY sorts values in ascending order, but we can sort otherwise using **DESC** words

- Sorting a column with **letters or other characters** may return surprising results, especially if it has a mix of uppercase and lowercase characters, punctuation, or numbers that are treated as text 

- You can sort more than one column  e.g [ORDER BY school ASC, hire_date DESC;]

### 03. WHERE

- This help you find rows that match **a specific values**, **a ranges of value**, or **multiple values based on the criteria supplied via an operator**.

- **WHERE** clause oftenn follow the **FROM** clause.

#### 03a. Using LIKE and ILIKE with WHERE (filtering rows)

- There are both use to search for patterns in string by using special charater:
        - (%): used in matching one or more charatcers
        - (_): used in matching one character

- Main different is that **LIKE** is case sensitive and **ILIKE** is not.

- It adviceable to use "ILIKE" and "%" as this take care of both (_) and (LIKE) too


#### 03b. Comparison Operators (AND  OR)

- Using **AND** with **WHERE** ; the two condition connect must return **TRUE**

- Using **OR** with **WHERE** ; One of the condition must return **TRUE**


