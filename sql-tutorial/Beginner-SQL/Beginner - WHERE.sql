/* WHERE clauses are used to only filter records (rows of data) */
/* WHERE clause only extracts records that fulfill a specified condition */

/* We want the data of only employees with a salary greater than 50000 */

SELECT * 
FROM employee_salary
WHERE salary > 50000;

/* We want data of only women employees */

SELECT * 
FROM employee_demographics
WHERE gender = 'Female';

/* We want data of employees who are NOT women */

SELECT * 
FROM employee_demographics
WHERE gender != 'Female';

/* We want employees born after January 1, 1985 */
/* Note that '1990-01-01' is the default date format in MySQL */

SELECT * 
FROM employee_demographics
WHERE birth_date > '1985-01-01';


