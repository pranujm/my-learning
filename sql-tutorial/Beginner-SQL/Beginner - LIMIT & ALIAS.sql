/* LIMIT */
/* LIMIT statement specifies how many records (rows of data) we want to output */

SELECT *
FROM employee_demographics
LIMIT 3;

/* We can also pair LIMIT with ORDER BY */
/* This gives us the first 3 names in alphabetical order by first name */

SELECT *
FROM employee_demographics
ORDER BY first_name
LIMIT 3;

/* This gives us the first 3 names in reverse alphabetical order by first name */
/* DESC stands for descending, so starting with Z instead of A */

SELECT *
FROM employee_demographics
ORDER BY first_name DESC
LIMIT 3;

/* We can also pair LIMIT with GROUP BY */
/* Let's get the first 2 departments with LIMIT */
/* Use COUNT to get the total number of employees in them */

SELECT department_id, COUNT(*) AS num_employees
FROM employee_salary
GROUP BY department_id
LIMIT 2;

/* LIMIT can also take in an additional parameter, although not commonly used */
/* For this example, we want to start at row 3, and take data from the 2 rows after that */

SELECT *
FROM employee_demographics
ORDER BY first_name
LIMIT 3, 2;


/* --------------------------------------------------------------------------------------------------------------------------------------------------------- */


/* ALIASING */
/* ALIASING is just a way to change the name of the column */ 

/* Use the keyword AS to specify we are using an Alias */
/* Let's get the average age for each gender */

SELECT gender, AVG(age) AS Avg_age
FROM employee_demographics
GROUP BY gender;
