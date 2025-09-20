/* SUBQUERIES */
/* SUBQUERIES are queries within queries, or nested queries */

SELECT * 
FROM employee_demographics;

/* Let's take a look at employees who actually work in the Parks and Rec department */
/* Note that SUBQUERIES can only take in only one column as a parameter */

SELECT * 
FROM employee_demographics 
WHERE employee_id IN 
				(SELECT employee_id
                 FROM employee_salary
                 WHERE department_id = 1);
                 
/* We can also use subqueries in SELECT and FROM statements */
/* Let's look at the salaries and compare them to the average salary */

SELECT employee_id, salary, AVG(salary)
FROM employee_salary;

/* If we run this it's not going to work, we are using columns with an aggregate function, so we need GROUP BY */
/* if we do that though we don't exactly get what we want. It gives us the average PER GROUP, which we don't want. */

SELECT employee_id, salary, AVG(salary)
FROM employee_salary
GROUP BY employee_id, salary;

/* Here's a good way to do this using SUBQUERIES */

SELECT employee_id, 
salary, 
	(SELECT AVG(salary) 
	 FROM employee_salary)
FROM employee_salary;

/* We can also use it in the FROM Statement */
/* When we use it here, we are creating a small table to query off of */
/* For this one, we will find the average salary per department */

/* First, we join the salary and departments tables my matching department IDs */
/* Then, we find the average salary for each department ID */
/* Then, we only extract the department names and the salaries for each from the joined tables */

SELECT 
	dept.department_name, 
    avg_data.avg_salary
FROM (SELECT
			department_id,
			AVG(salary) AS avg_salary
	  FROM employee_salary 
      GROUP BY department_id)
      AS avg_data
JOIN park_departments AS dept
	ON avg_data.department_id = dept.department_id;
      
/* We can also use it in the WHERE statement */
/* Let's find the employees older than the average age of all employees */

SELECT 
    first_name, 
    last_name, 
    age
FROM employee_demographics
WHERE age > (
    SELECT AVG(age) FROM employee_demographics);
    
