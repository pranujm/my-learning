/* UNIONS */ 

/* UNIONS combine rows of data together */
/* Let's use Union to bring together some random data, then we will look at an actual use case */

SELECT first_name, last_name
FROM employee_demographics
UNION
SELECT occupation, salary
FROM employee_salary;

/* Here we will combine the data together, but not side by side in different columns, but one on top of the other in the same columns */
/* This obviously is not good since you're mixing data, but it can be done if you want */

SELECT first_name, last_name
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary;

/* Notice it gets rid of duplicates? UNION is actually shorthand for UNION DISTINCT */

SELECT first_name, last_name
FROM employee_demographics
UNION DISTINCT
SELECT first_name, last_name
FROM employee_salary;

/* We can use UNION ALL to show all values */

SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;

/* Now Let's actually try to use UNION */
/* The Parks department is trying to cut their budget and wants to identify older employees they can push out or high paid employees who they can reduce pay or push out */
/* For the last SELECT statement, we need to match the employee IDs so we can get their names and salaries */

SELECT first_name, last_name, 'Old Lady' AS category
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Old Man' AS category
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT d.first_name, d.last_name, 'Highly Paid Employee' AS category
FROM employee_salary s
JOIN employee_demographics d ON s.employee_id = d.employee_id
WHERE s.salary >= 70000
ORDER BY first_name;