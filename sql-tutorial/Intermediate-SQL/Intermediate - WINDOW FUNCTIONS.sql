/* WINDOW FUNCTIONS */

/* WINDOW FUNCTIONS are similar to GROUP BY, except they don't roll everything up into one row */
/*  They allow us to look at a partition of a table while keeping their own unique rows in the output  */
/* We will look at ROW NUMBERS, RANK, and DENSE RANK */

/* First, let's use GROUP BY to compare gender of employees to their salaries */
/* As you can see, GROUP BY rolls up our data into one row for each row */

SELECT gender, AVG(salary)
FROM employee_demographics AS dem
JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;

/* Now let's try using WINDOW FUNCTIONS */
/* We can see here that our data is no longer rolled or grouped up */
/* OVER() means we are finding the average salary over everything, so we get that value for every employee */

SELECT gender, 
AVG(salary) OVER()
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;

/* PARTITION BY breaks up data based on columns */
/* Our resultset is similar to the GROUP BY, except we have individual columns for gender and average salary */
 
SELECT gender,
AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
/* PARTITION BY is useful when we want unique additional info for each row without grouping */
/* Let's get the first names of the employees and add that to our resultset */
/* This doesn't affect our other columns at all because we are using a WINDOW FUNCTION */

SELECT dem.first_name, dem.last_name, gender,
AVG(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
/* Now let's take a look at the SUM of salaries for each gender using PARTITION BY */
/* As we can see, the SUM of salaries for men is 402,000 and 215,000 for women */

SELECT dem.first_name, dem.last_name, gender,
SUM(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
/* We can improve this code with a ROLLING TOTAL */
/* ROLLING TOTALS start at the initial value and add on values from subsequent rows based on the PARTITION BY statement */
/* As you can see, the salary for the first employee of the specific gender gets added to the next employee's salary */
/* We achieved this specific ROLLING TOTAL pattern by ordering by the employee ID */

SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
/* ROW NUMBER */
/* ROW NUMBER gives us the row numbers and can be changed using PARTITION BY */
/* Here we can see we are getting the ROW NUMBERS for every row based on everything, so like employee ID */

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER()
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
/* We can PARTITION BY gender, and we see that it counts the rows for Male and Female separately */

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
/* We can also order these by highest to lowest salary like this */
/* As you can see, the highest salary for women is at row number 1 for women, and same with the men */

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
/* RANK */
/* RANK is slightly different than ROW NUMBER */
/* When RANK encounters a duplicate based off the ORDER BY, it assigns the rows with the same row number */
/* Let's try it here, where we see both male employees who make $50,000 salary have the same rank number */
/* The rank number for the next row won't be the next number numerically, but the next number positionally */

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num, 
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;

/* DENSE RANK is different from RANK */
/* It has the same duplicate effect, but the next rank number will be numeric, not positional */
/* For example, the resultset here will have the rank number for the 7th row as number 6 */

SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num, 
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;