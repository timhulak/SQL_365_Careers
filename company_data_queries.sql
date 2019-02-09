-- Use, or activate, the "employees" database 
USE employees;
/*
Boilerplate Query Structure
SELECT 
	column_name_1, column_name_2
FROM 
	table_name
WHERE
	condition
    (AND comes before OR and parentesis help with execution order)
;

*/
/*

Wildcard Charachters:

% : a substitute for a sequence of characters 

_ : match a single character 

* : delivers a list of ALL columns in a table


*/

/* PART 1
   Employee Information */
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


/* PART 2
   Department Information */
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

