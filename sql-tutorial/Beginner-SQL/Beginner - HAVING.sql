/* HAVING vs WHERE */

/* Both were created to filter rows of data, but they filter 2 separate things */
/* WHERE is going to filters rows based off columns of data */
/* HAVING is going to filter rows based off aggregated columns when grouped */

/* When we try getting the average age for each gender, we get an error. */
/* This is because the order of statements is wrong. We use HAVING with GROUP BY instead of WHERE. */

SELECT gender, AVG(age)
FROM employee_demographics
WHERE AVG(age) > 40
GROUP BY gender;

/* We do this instead */ 

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40;

/* To change the column name for the average age, we can use the AS statement */

SELECT gender, AVG(age) AS AVG_age
FROM employee_demographics
GROUP BY gender
HAVING AVG_age > 40;
