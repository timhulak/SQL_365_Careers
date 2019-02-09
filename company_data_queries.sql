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
;

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
-- 
