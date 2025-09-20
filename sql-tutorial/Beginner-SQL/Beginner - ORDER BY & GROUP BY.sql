/* ORDER BY */
/* ORDER BY keyword allows us to sort our results in ascending or descending order */
/* ORDER BY sets the result to ascending order by default. DESC keyword sets it to descending order */

/* Get the first names of employees in ascending order (starting with A) */

SELECT *
FROM employee_demographics
ORDER BY first_name;

/* Get the same names in descending order */

SELECT *
FROM employee_demographics
ORDER BY first_name DESC;

/* We can also order by multiple columns */
/* This orders by age and gender in ascending order */

SELECT *
FROM employee_demographics
ORDER BY gender, age;

/* This orders by age and gender in descending order */

SELECT *
FROM employee_demographics
ORDER BY gender, age DESC;


/* ------------------------------------------------------------------------------------------------------------------------------------------------------------ */


/* GROUP BY */
/* GROUP BY groups together rows that have the same values in the specified columns */
/* GROUP BY allows us to group rows with the same data and run aggregate functions on them */

/* When using GROUP BY, you have to group the same columns in your SELECT statement */

SELECT first_name, gender
FROM employee_demographics
GROUP BY first_name, gender;

/* Let's perform our first aggregate function, the AVG function */
/* This gives us the average for each gender */

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender;

/* This gives us the maximum (oldest) and minimum (youngest) age for each gender */

SELECT gender, MIN(age), MAX(age)
FROM employee_demographics
GROUP BY gender;

