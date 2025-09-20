/* STRING FUNCTIONS */
/*STRING FUNCTIONS help us change and look at strings differently */

/* LENGTH FUNCTION gives us the length of a string value */
/* The bottom code gives us 3 because that is the length of 'sky' */

SELECT LENGTH('sky');

/* Let's find the length of every first name in our database */

SELECT first_name, LENGTH(first_name) 
FROM employee_demographics;

/* UPPER will change all strings to uppercase */
/* Let's try this with our last names */

SELECT last_name, UPPER(last_name)
FROM employee_demographics;

/* LOWER will change all strings to lowercase */
/* Let's try this with our last names */

SELECT last_name, LOWER(last_name)
FROM employee_demographics;

/* If values have white space on the front or end, we can get rid of that using TRIM */

SELECT TRIM('sky'   );

/* Use LTRIM for trimming just the left side */

SELECT LTRIM('     I love SQL');

/* Use RTRIM for trimming just the right side */

SELECT RTRIM('I love SQL    ');

/* LEFT allows us to take a certain number of strings from the left side */
/* The code below will take the first 4 characters of the string */

SELECT LEFT('Alexander', 4);

/* Right is basically the opposite - taking it starting from the right side */

SELECT RIGHT('Alexander', 6);

/* SUBSTRING specifies a starting point and length of substring */

SELECT SUBSTRING('Alexander', 2, 3);

/* Let's use SUBSTRING to extract the birth years of all employees */

SELECT birth_date, SUBSTRING(birth_date, 1, 4) as birth_year
FROM employee_demographics;

/* REPLACE allows us to replace a specified character with another one */
/* Let's replace all lowercase A's with lowercase Z's in every first name */
/* REPLACE is case sensitive, so specify whether uppercase or lowercase letters */

SELECT REPLACE(first_name, 'a', 'z')
FROM employee_demographics;

/* LOCATION gives us the position of a character or substring in the inputted string */
/* Let's locate all A's in our first names */
/* LOCATION is not case sensitive */

SELECT first_name, LOCATE('a', first_name) 
FROM employee_demographics;

/* CONCAT (concatenate) combines strings together */

SELECT CONCAT('Alex', ' ', 'Freberg');

/* Let's combine the first and last name columns as one column */

SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employee_demographics;
