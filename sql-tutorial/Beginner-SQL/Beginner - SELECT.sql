/* The SELECT statement is used to work with columns and specify what columns you want to work see in your output. 
There are a few other things as well that */

SELECT * 
FROM employee_demographics;

/* Let's try selecting a specific column */

SELECT first_name
FROM employee_demographics;

/* To add more columns, we separate them with commas */

SELECT first_name, last_name
FROM employee_demographics;

/* The DISTINCT clause will return only unique values in the output without any duplicates */
/* In this case, the department_id values are already unique with PRIMARY KEY, so you can just select all of them */

SELECT department_id
FROM employee_salary;

SELECT DISTINCT department_id
FROM employee_salary;