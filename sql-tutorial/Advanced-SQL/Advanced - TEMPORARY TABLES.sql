/* TEMPORARY TABLES */

/* TEMPORARY TABLES are only visible to the session that created them */
/* They can store intermediate results for complex queries or to manipulate data before inserting it into a permanent table */

/* There are 2 ways to create TEMPORARY TABLES */
/* The first way is to build it like a real table and insert data into it */

CREATE TEMPORARY TABLE temp_table
(
first_name VARCHAR(50),
last_name VARCHAR(50),
fav_movie VARCHAR(50)
);

/* If we execute the table, we can actually query it */

SELECT * 
FROM temp_table;

/* Now if we refresh our tables, it's gone */
/* This is because it is not an actual table, only a table in memory */

/* Now let's insert data into it */

INSERT INTO temp_table
VALUES ('Pranuj','Mandavia','Big Hero 6');

SELECT * 
FROM temp_table;

/* The second way to build it by inserting data into it */
/* Let's make a separate table for only employees making above 50k salary */

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
FROM employee_salary
WHERE salary > 50000;

SELECT * 
FROM salary_over_50k;