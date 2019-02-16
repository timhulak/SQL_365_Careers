-- Use, or activate, the "employees" database 
USE employees;
/*
Boilerplate Query Structure
SELECT 
	column_name_1, column_name_2, etc
FROM 
	table_name
WHERE
	condition
    (AND comes before OR) (and parentesis help 
    with execution order)
GROUP BY (when using aggregate functions)
	column
HAVING
	condition with aggregate function
ORDER BY
	column
LIMIT
	number
;

*/
/*
Wildcard Charachters:

% : a substitute for a sequence of characters 

_ : match a single character 

* : delivers a list of ALL columns in a table


*/

/*
Common Aggregate Functions:
Gather data from many rows , then 
aggregate into a single value.
Sometimes called "Summarizing Functions"

COUNT() counts non-null records in a columns
	applicable to both numeric and 
    non-numeric data.
	COUNT(*) will return all values, including NULL values. 
COUNT(DISTINCT ) finds the number of times a 
	unique value appears in a column. 
SUM() adds all non-null values in a column
MIN() returns minimum value 
MAX() returns maximum value
AVG() returns the average of all non-null values
ROUND(#,decimal places)
IFNULL(expression_1(if not null), expression_2(if null)) AS name
	must have 2 arguments 
COALESCE(expression_1, expression_2,...expression_n) AS name 
	IFNULL with more than 1,2, or more parameters 
NOTE: Both IFNULL and COALESCE only change the output, not the data set. 
*/

/*
Adding data

NOTE: Make sure you know the data type of the 
column you are adding into (INT, VARCHAR, etc.)

INSERT INTO table_name(column_1, column_2, ... column_n)
VALUES (value_1, value_2, ... valu3_n)
;
*/

/*
Updating existing date

UPDATE table_name
SET column_1 = value_1, column_n = value_n
WHERE conditions; 
*/

/*
Deleting a row of data 
NOTE: If there are keys connecting tables,
the record you are deleting will be deleted 
from ALL tables it is connected to so long
as the ON DELETE CASCADE constraint is there. 
(Relational DataBases!)

NOTE: If you do not include the WHERE clause,
then you will delete the enitre table! 

DELETE FROM table_name
WHERE condition;
*/

/*
DROP vs. TRUNCATE vs. DELETE

DROP: permanantly deletes a table and cannot be 
	recovered via COMMIT/ROLLBACK 

TRUNCATE: deletes all records in a table, 
	but the table will still exist. 
    Auto-Increment values will be reset 

DELETE: removes records row-by-row with WHERE Clause. 
	If there is no WHERE clause, it will resemble 
    TRUNCATE, but AUTO_INCREMENT vaues will NOT reset. 
*/

/* 
PART 1
Exploration
*/

-- Explore the "employees" table
SELECT 
    *
FROM
    employees;

-- Explore the names of all of our employees
SELECT 
    first_name, last_name
FROM
    employees;

-- How many employees work at our company?
SELECT 
    COUNT(emp_no) AS "Number of Emplyees"
FROM
    employees;

-- How many employees are named "Denis"?
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis';
    
SELECT 
    COUNT(first_name) AS 'Denis Frequency'
FROM
    employees
WHERE
    first_name = 'Denis';

-- Select all of the employees whose name is "Denis"
-- and are of the Male gender  
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';

SELECT 
    COUNT(first_name) AS 'Males Named Denis'
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';

-- Select all people from the “employees” table whose 
-- first name is “Elvis”. 
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Elvis';
    
SELECT 
    COUNT(first_name) AS 'Employees Named Elvis'
FROM
    employees
WHERE
    first_name = 'Elvis';
    
-- Retrieve a list with all female employees whose first name is Kellie. 
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';
    
SELECT 
    COUNT(first_name) AS 'Females Named Kellie'
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';

-- Select all of the employees who are named 
-- Kellie or Aruna
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';
        
-- Retrieve a list with all female employees whose first name 
-- is either Kellie or Aruna.
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');
        
-- Find the records for Cathie, Mark, and Nathan 
SELECT 
    *
FRM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');
    
-- Extract all records from the ‘employees’ table, aside from 
-- those with employees named John, Mark, or Jacob.
SELECT
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');
    
/* Working with the “employees” table, use the LIKE operator to
select the data about all individuals, whose first name 
starts with “Mark”; specify that the name can be succeeded 
by any sequence of characters.
*/
SELECT
    *
FROM
    employees
WHERE
    first_name LIKE('Mark%');

-- Retrieve a list with all employees who have been hired in 
-- the year 2000.

SELECT
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');
    
-- Retrieve a list with all employees whose employee number is 
-- written with 5 characters, and starts with “1000”. 
 
SELECT
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');

/*
Extract all individuals from the ‘employees’ table whose 
first name contains “Jack”.
*/
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%Jack%');

/*
Once you have done that, extract another list containing 
the names of employees that do not contain “Jack”.
*/
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Jack%');

/*
Select all the information from the “salaries” table regarding 
contracts from 66,000 to 70,000 dollars per year.
*/
SELECT
    *
FROM
    salaries;
    
SELECT
    *
FROM
    salaries
WHERE
    salary BETWEEN 66000 AND 70000;
/*
Retrieve a list with all individuals whose employee number is 
not between ‘10004’ and ‘10012’.
*/
SELECT
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN '10004' AND '10012';
    
/*
Select the names of all departments with numbers between 
‘d003’ and ‘d006’.
*/
SELECT
    dept_name
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';

-- Check to see if any records are missing;
-- which employees do not have first names?
SELECT 
    *
FROM
    employees
WHERE
    first_name IS NULL;
    
-- Which employees were hired after January 1st, 2000?
select * from employees;

/*
Retrieve a list with data about all female employees who were 
hired in the year 2000 or after.
*/
SELECT 
    *
FROM
    employees
WHERE
    hire_date >=  '2000-01-01' AND gender = 'F';

/*
Extract a list with all employees’ salaries higher 
than $150,000 per annum.
*/

SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;

/*
Obtain a list with all different “hire dates”
 from the “employees” table.
*/
SELECT DISTINCT
    hire_date
FROM
    employees;

/*
How many employees are registered in our database?
*/
SELECT 
    COUNT(emp_no)
FROM
    employees;
    
/*
How many distinct names are in the employee table? 
*/
SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;
    
/*
How many annual contracts with a value higher than or 
equal to $100,000 have been registered in the 
salaries table?
*/
SELECT 
    COUNT(*)
FROM
    salaries
WHERE
    salary >= 100000;

/*
How many managers do we have in the “employees” database? 
Use the star symbol (*) in your code to solve this exercise.
*/
SELECT 
    COUNT(*)
FROM
    dept_manager;

/*
Get all of the employee data from the 
employees table and order it by first name

Then order the names ascending followed by another 
query ordering them descending
*/
SELECT 
    *
FROM
    employees
ORDER BY first_name;

-- ascending
SELECT 
    *
FROM
    employees
ORDER BY first_name ASC;

-- descending
SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;

/*
Sort the list of employee data
in descending order by employee number
*/
SELECT 
    *
FROM
    employees
ORDER BY emp_no DESC;

/*
Get the data from the employees table 
and order it by both 
first and last name 
in ascending order
*/
SELECT 
    *
FROM
    employees
ORDER BY first_name , last_name ASC;

/*
Select all data from the “employees” table,
 ordering it by “hire date” in descending order.
*/
SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

/*
Count how many employees have the same first name.
Make sure it is in alphabetical order from A-Z. 
Don't forget to display the name next the count. 
*/
SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name ASC;

/*
Clean up to column names of that last query
so that it can be presented to someone 
more clearly; alias the column names to 
something more clear
*/
SELECT 
    first_name AS "First Name", COUNT(first_name) AS "Name Count"
FROM
    employees
GROUP BY first_name
ORDER BY first_name ASC;


/*
Write a query that obtains two columns. 
The first column must contain annual salaries 
higher than 80,000 dollars. 
The second column, renamed to “Employees With Salary”, 
must show the number of employees contracted 
to that salary. Lastly, sort the output by 
the first column.
*/
SELECT
    salary AS "Salary", COUNT(emp_no) AS "Employees With Salary"
FROM
    salaries
WHERE
    salary > 80000
GROUP BY salary
ORDER BY salary;

/*
Select all employees whose average salary is 
higher than $120,000 per annum.
*/
SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

/*
Select the employee numbers of all individuals 
who have signed more than 1 contract after the 
1st of January 2000.
*/
SELECT
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no;

-- Explore the "departments" table
SELECT 
    *
FROM
    departments;

-- How many departments does our company have?
SELECT 
    COUNT(dept_no) AS "Total Departments"
FROM
    departments;

/*
Select the names of all departments whose department number 
value is not null.
*/
SELECT 
    dept_name
FROM
    departments
WHERE
    dept_no IS NOT NULL;
    
/*
Select the first 100 rows from the ‘dept_emp’ table. 
*/
SELECT
    *
FROM
    dept_emp
LIMIT 100;

-- ------------------------------------------------------------
/* 
PART 2
Inserting Data
*/
SELECT 
    *
FROM
    employees
LIMIT 10;

/*
Add an employee into the employees table. 
Their Info is:
Employee ID: 999903
Birth Date: 1977-09-14
First Name: Johnathan
Last Name: Creek
Gender: M
Hire Date: 1999-01-01
*/
INSERT INTO employees
VALUES
(999903,
'1977-09-14',
'Johnathan',
'Creek',
'M',
'1999-01-01'
);

/*
Select ten records from the “titles” 
table to get a better idea about its content.

Then, in the same table, insert information about 
employee number 999903. State that he/she is a “Senior Engineer”, 
who has started working in this position on October 1st, 1997.

At the end, sort the records from the “titles” table in 
descending order to check if you have successfully 
inserted the new record.
*/

SELECT 
    *
FROM
    titles
LIMIT 10;

INSERT INTO titles
(emp_no,
title,
from_date)
VALUES
(999903,
'Senior Engineer',
'1997-10-01');

SELECT
    *
FROM
    titles
ORDER BY emp_no DESC;

/*
Insert information about the individual with 
employee number 999903 into the “dept_emp” table. 
He is working for department number 5, and has 
started work on  October 1st, 1997; his contract 
is for an indefinite period of time (‘9999-01-01’).
*/
SELECT 
    *
FROM
    dept_emp
LIMIT 10;

INSERT INTO dept_emp
(emp_no, dept_no, from_date, to_date)
VALUES 
(999903, 'd005', '1997-10-01', '9999-01-01');


/*
Create a new department called “Business Analysis”. 
Register it under number ‘d010’.
*/
SELECT 
    *
FROM
    departments
ORDER BY
	dept_no;

INSERT INTO departments 
VALUES
('d010', 'Business Analysis');

-- ------------------------------------------------------------
/* 
PART 3
UPDATE
*/

/*
It turns out that there was a mistake in
the request to add “Business Analysis” to 
our departments table.
Change the “Business Analysis” department name to “Data Analysis"
*/

UPDATE departments
SET dept_name = 'Data Analysis'
WHERE dept_no = 'd010';

-- Check that it worked. 
SELECT 
    *
FROM
    departments
ORDER BY
	dept_no;

-- ------------------------------------------------------------
/* 
PART 4
DELETE 
*/

/*
Remove the department number 10 record 
from the “departments” table.
*/
DELETE FROM departments 
WHERE dept_no = 'd010';

SELECT 
    *
FROM
    departments
ORDER BY
	dept_no
LIMIT 10;

-- ------------------------------------------------------------
/* 
PART 5
Aggregate Functions:

*/

/*
How many departments are there in the “employees” database? 
Use the ‘dept_emp’ table to answer the question.
*/
SELECT 
    COUNT(DISTINCT dept_no)
FROM
    dept_emp;

/*
How much does our company spend on 
salaries?
*/
SELECT 
    SUM(salary)
FROM
    salaries;

/*
What is the total amount of money spent on 
salaries for all contracts starting after the 
1st of January 1997?
*/
SELECT 
    SUM(salary)
FROM
    salaries
WHERE
    from_date > '1997-01-01';

/*
Find the highest and lowest respective salary 
*/
SELECT 
    MAX(salary)
FROM
    salaries;
    
SELECT 
    MIN(salary)
FROM
    salaries;

/*
What is the average annual salary?
Round to 2 decimal places
*/
SELECT 
    ROUND(AVG(salary), 2) AS 'Average Salary'
FROM
    salaries;

/*
What is the average annual salary paid to employees
 who started after the 1st of January 1997?
 Round to 2 decimal places
*/
SELECT 
    ROUND(AVG(salary),2)
FROM
    salaries
WHERE
    from_date > '1997-01-01';


-- ------------------------------------------------------------
/* 
PART 6
JOINs
*/

/*

*/

/*

*/


/*

*/


/*

*/


/*

*/


/*

*/
-- ------------------------------------------------------------
/* 
PART 7
Subquieries 
*/

/*

*/

/*

*/


/*

*/


/*

*/


/*

*/


/*

*/


-- ------------------------------------------------------------
/* 
PART 8
Self JOIN
*/

/*

*/

/*

*/


/*

*/


/*

*/


/*

*/


/*

*/
-- ------------------------------------------------------------
/* 
PART 9
Views
*/

/*

*/

/*

*/


/*

*/


/*

*/


/*

*/


/*

*/


-- ------------------------------------------------------------
/* 
PART 10
Stores Routines
*/

/*

*/

/*

*/


/*

*/


/*

*/


/*

*/


/*

*/
-- ------------------------------------------------------------
/* 
PART 11
Advanced SQL Topics
*/

/*

*/

/*

*/


/*

*/


/*

*/


/*

*/


/*

*/


-- ------------------------------------------------------------
/* 
PART 12
Visualization Combining SQL and Tableau
*/

/*

*/

/*

*/


/*

*/


/*

*/


/*

*/


/*

*/
