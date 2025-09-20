/* COMMON TABLE EXPRESSIONS (CTE) */

/* CTEs allow you to define a subquery block that can be referenced within a main query */
/* CTEs are useful for recursive queries or queries that require a higher level of referencing */

/* CTEs start with the WITH keyword. Within the parenthesis, we can build our subquery. */
/* Let's get the sum, average, minimum, and maximum salaries for each gender using CTE */

WITH CTE_Example AS 
(
SELECT gender, SUM(salary), MIN(salary), MAX(salary), AVG(salary)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)

/* Now let's query our CTE */

SELECT *
FROM CTE_Example;

/* We can also use columns within this CTE to do calculations on the data */
/* Let's find  the average salary for each gender by calculating it */

WITH CTE_Example AS 
(
SELECT gender, SUM(salary), MIN(salary), MAX(salary), COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)

/* We have to use back ticks to specify the table names or it doesn't work */

SELECT gender, ROUND(AVG(`SUM(salary)`/`COUNT(salary)`), 2)
FROM CTE_Example
GROUP BY gender;

/* We can also create multiple CTEs using one expression */
/* We just have to separate them using a comma */
/* Here, we are matching employees born after 1985 and matching them with employees making over $50,000 */

WITH CTE_Example_1 AS 
(
SELECT employee_id, gender, birth_date
FROM employee_demographics dem
WHERE birth_date > '1985-01-01'
),
CTE_Example_2 AS 
(
SELECT employee_id, salary
FROM parks_and_recreation.employee_salary
WHERE salary >= 50000
)

/* Now, we can join these two CTEs together */

SELECT *
FROM CTE_Example_1 AS CTE_1
LEFT JOIN CTE_Example_2 AS CTE_2
	ON CTE_1.employee_id = CTE_2.employee_id;

/* We can also rename the columns in our CTE */

WITH CTE_Example (gender, sum_salary, min_salary, max_salary, count_salary) AS 
(
SELECT gender, SUM(salary), MIN(salary), MAX(salary), COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)

/* Since we renamed our columns, we don't need tick marks when performing calculations on them */

SELECT gender, ROUND(AVG(sum_salary/count_salary), 2)
FROM CTE_Example
GROUP BY gender;