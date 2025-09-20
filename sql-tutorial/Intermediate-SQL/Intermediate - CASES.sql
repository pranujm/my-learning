/* CASE STATEMENTS */

/* CASE STATEMENTS adds logic to your Select Statement, similar to an IF/ELSE statement */
/* Let's create a new column, where only employees are labeled 'Young' if younger than 30 */

SELECT first_name, 
last_name, 
CASE
	WHEN age <= 30 THEN 'Young'
END
FROM employee_demographics;

/* Let's try it with multiple WHEN statements */

SELECT first_name, 
last_name, 
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Middle-Aged'
    WHEN age >= 50 THEN "Old"
END
FROM employee_demographics;

/* Let's use CASES to perform calculations and give bonuses to employees */

SELECT * 
FROM employee_salary;

/* If they make less than 45k then they get a 5% raise - very generous */
/* If they make more than 45k they get a 7% raise */
/* They get a bonus of 10% if they work for the Finance Department */
/* We will join the demographics and salary tables so we can get the names of the employees */

SELECT 
    dem.first_name,
    dem.last_name,
    sal.salary,
    CASE
        WHEN sal.salary < 45000 THEN sal.salary + (sal.salary * 0.05)
        WHEN sal.salary >= 45000 THEN sal.salary + (sal.salary * 0.07)
    END AS new_salary,
    CASE
        WHEN sal.department_id = 6 THEN sal.salary * 0.10
        ELSE 0
    END AS bonus
FROM employee_salary sal
JOIN employee_demographics dem
    ON sal.employee_id = dem.employee_id;
