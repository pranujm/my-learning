/* JOINS */
/* JOINS allow you to combine 2 tabels together (or more) if they share a common column */
/* The column names are not always the same, but the values in the columns are the same */
/* We will take a look at INNER JOIN, OUTER JOIN (LEFT & RIGHT JOINS), and SELF JOIN */

/* We see that these tabels share a column of values -- employee_id */

SELECT * FROM employee_demographics;
SELECT * FROM employee_salary;

/* INNER JOIN returns rows that are the same in both of the shared columns */
/* Let's join the employee_id columns from both tables */

SELECT * 
FROM employee_demographics 
JOIN employee_salary
	ON employee_demographics.employee_id = employee_salary.employee_id;

/* We can do this easier by using ALIASING */

SELECT * 
FROM employee_demographics as demo
JOIN employee_salary as sal
	ON demo.employee_id = sal.employee_id;

/* OUTER JOINS have LEFT JOINS and RIGHT JOINS */
/* LEFT JOIN takes everytyhing from the left table even if nothing matches, but will only return matches from the right table */
/* RIGHT JOIN does the exact opposite */

/* LEFT JOIN will show all employees even if no employees match with them (NULL) */

SELECT d.department_name, s.occupation
FROM park_departments AS d
LEFT JOIN employee_salary AS s
	ON d.department_id = s.department_id;

/* RIGHT JOIN will show all employees, even if their department is not in the table (NULL) */
/* In this case, no department is missing */

SELECT d.department_name, s.occupation
FROM park_departments d
RIGHT JOIN employee_salary s
	ON d.department_id = s.department_id;

/* SELF JOIN is used to tie a table to itself */
/* We can use SELF JOIN to find pairs of employees who work in the same department */
/* The 'e1.employee_id < e2.employee_id' avoids duplicate pairings and matching a person with themselves */

SELECT 
	e1.employee_id AS emp1_id,
    e1.occupation AS emp1_role,
    e2.employee_id AS emp2_id,
    e2.occupation AS emp2_role,
    e1.department_id
FROM employee_salary AS e1
JOIN employee_salary AS e2
	ON e1.department_id = e2.department_id
	AND e1.employee_id < e2.employee_id;

/* JOINING multiple tables */
/* INNER JOIN combines the demographics and salary tables where the employee IDs match in both */
/* INNER JOIN only includes rows existing in both tables, so if someone's demographics or salary data is missing (NULL), they are excluded */
/* Since regular JOINS are implicitly treated as INNER JOINS by default, it will only include rows where all 3 tables have matching records */

SELECT *
FROM employee_demographics dem
INNER JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id
JOIN park_departments dept
    ON dept.department_id = sal.department_id;
    
/* INNER JOIN works the same as before */
/* LEFT JOIN still brings in department info if it exists, but it doesn't exclude employees without a matching department */

SELECT *
FROM employee_demographics dem
INNER JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id
LEFT JOIN park_departments dept
    ON dept.department_id = sal.department_id;