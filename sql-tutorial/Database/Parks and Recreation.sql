/* Create database */
/* USE clause allows you to edit database */

CREATE DATABASE Parks_and_Recreation;
USE Parks_and_Recreation;

/* Create employee_demographics table */
/* Use VARCHAR placeholder for string characters */
/* Use INT placeholder for integers */
/* Use DATE placeholder for dates */
/* Use PRIMARY KEY for employee_id because each value is unique */
/* Use NOT NULL so employee_id always has a value */

CREATE TABLE employee_demographics (

	employee_id INT NOT NULL PRIMARY KEY,
    	first_name VARCHAR(32) NOT NULL,
    	last_name VARCHAR(32) NOT NULL,
	age INT,
    	gender VARCHAR(10),
    	birth_date DATE
);

/* Create table for all departments in park */
/* AUTO_INCREMENT auto generates unique values */ 

CREATE TABLE park_departments (

	department_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    	department_name VARCHAR(50) NOT NULL
);

/* Create employee_salary table */
/* Must contain full name, employee ID, job title, salary, and department ID */
/* Use FOREIGN KEY to match values already initialized in previous tables */

CREATE TABLE employee_salary (

	employee_id INT NOT NULL PRIMARY KEY,
	occupation VARCHAR(80),
    	salary INT,
    	department_id INT NOT NULL,
    
    	FOREIGN KEY (employee_id) REFERENCES employee_demographics(employee_id),
    	FOREIGN KEY (department_id) REFERENCES park_departments(department_id)
);

/* Insert values into employee_demographics table */

INSERT INTO employee_demographics (employee_id, first_name, last_name, age, gender, birth_date)

VALUES	(1,'Leslie', 'Knope', 44, 'Female','1979-09-25'),
	(2,'Tom', 'Haverford', 36, 'Male', '1987-03-04'),
	(3, 'April', 'Ludgate', 29, 'Female', '1994-03-27'),
	(4, 'Jerry', 'Gergich', 61, 'Male', '1962-08-28'),
	(5, 'Donna', 'Meagle', 46, 'Female', '1977-07-30'),
	(6, 'Ann', 'Perkins', 35, 'Female', '1988-12-01'),
	(7, 'Chris', 'Traeger', 43, 'Male', '1980-11-11'),
	(8, 'Ben', 'Wyatt', 38, 'Male', '1985-07-26'),
	(9, 'Andy', 'Dwyer', 34, 'Male', '1989-03-25'),
	(10, 'Mark', 'Brendanawicz', 40, 'Male', '1983-06-14'),
	(11, 'Craig', 'Middlebrooks', 37, 'Male', '1986-07-27');

/* Insert values into employee_salary table */

INSERT INTO employee_salary (employee_id, occupation, salary, department_id)

VALUES	(1, 'Deputy Director of Parks and Recreation', 75000,1),
	(2, 'Entrepreneur', 50000,5),
	(3, 'Assistant to the Director of Parks and Recreation', 25000,1),
	(4, 'Office Manager', 50000,2),
	(5, 'Office Manager', 60000,1),
	(6, 'Nurse', 55000,4),
	(7, 'City Manager', 90000,3),
	(8, 'State Auditor', 70000,6),
	(9, 'Shoe Shiner and Musician', 20000, 4),
	(10, 'City Planner', 57000, 3),
	(11, 'Parks Director', 65000,1);
        
/* Insert values into park_departments table */
        
INSERT INTO park_departments (department_name)

VALUES 	('Parks and Recreation'),
	('Animal Control'),
	('Public Works'),
	('Healthcare'),
	('Library'),
	('Finance');
        
/* View tables */

SELECT * FROM employee_demographics;
SELECT * FROM employee_salary;
SELECT * FROM park_departments;
