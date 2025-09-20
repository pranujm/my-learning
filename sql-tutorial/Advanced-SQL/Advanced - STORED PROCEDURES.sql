/* STORED PROCEDURES */

/* They are saved sets of SQL statements that you run later by calling them */
/* They are similar to functions in programming languages */

/* First, let's write a simple query */

SELECT *
FROM employee_salary
WHERE salary >= 60000;

/* Let's put this into a STORED PROCEDURE */

CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 60000;

/* We can get the output of the procedure by calling it */

CALL large_salaries();

/* Writing procedures is not best practice, because they are usually more complex in reality */
/* If we tried to add another query to the procedure below, it wouldn't work, because it is a separate query */

CREATE PROCEDURE large_salaries2()
SELECT *
FROM employee_salary
WHERE salary >= 60000;
SELECT *
FROM employee_salary
WHERE salary >= 50000;

/* We need to use DELIMITERS and the BEGIN / END keywords to fully control the code in the procedure */
/* DELIMITERS separate the queries by default, so we can make it something like $$ */
/* When we change the DELIMITER, it now reads everything as one whople unit instead of stopping after the first semi-colon */

DELIMITER $$
CREATE PROCEDURE large_salaries2()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 60000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
END $$

/* Now we change the DEMILITER back to default after we use it */

DELIMITER ;

/* Let's refresh to see the procedure and call the output */

CALL large_salaries2();

/* You can also create STORED PROCEDURES by right-clicking on 'Stored Procedures' and clicking 'Create Stored Prcoedure' */

/* We can also add parameters */
/* This will add the DELIMITER for us */

USE Parks_and_Recreation;

DELIMITER $$
CREATE PROCEDURE large_salaries3(employee_id_param INT)
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 60000
    AND employee_id_param = employee_id;
END $$

DELIMITER ;

/* This will only give us the employee occupation and salary for the employee with the given ID */

CALL large_salaries3(1);
