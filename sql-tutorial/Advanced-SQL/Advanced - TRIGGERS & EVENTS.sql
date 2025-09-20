/* TRIGGERS */

/* TRIGGERS are blocks of code that automatically executes when an event takes place in a table */

/* For example, let's say we have 2 tables - invoice and payments */
/* When a client makes a payment, we want it to update the invoice field to reflect that the client paid their invoice */

SELECT * FROM employee_salary;
SELECT * FROM employee_demographics;

/* When a new row of data is inserted into the payments table, we want a trigger to update the correct invoice with the amount that was paid */

USE Parks_and_Recreation;
DELIMITER $$

CREATE TRIGGER employee_insert2

	-- this means the trigger activates after each new row of data is inserted
	
	AFTER INSERT ON employee_salary
	FOR EACH ROW

-- now we can write the code we want to run when the trigger is activated

BEGIN 

-- we want to update our client invoices table 
-- set total paid = total_paid (if they already had some payments) + NEW.amount_paid
-- NEW means only from new rows inserted (OLD is for deleted or updated rows)

	INSERT INTO employee_demographics (employee_id, first_name, last_name) VALUES (NEW.employee_id,NEW.first_name,NEW.last_name);
    
END $$

DELIMITER ;

/* This is the full code */

USE Parks_and_Recreation;
DELIMITER $$

CREATE TRIGGER employee_insert2

	AFTER INSERT ON employee_salary
	FOR EACH ROW

BEGIN 

	INSERT INTO employee_demographics (employee_id, first_name, last_name) VALUES (NEW.employee_id,NEW.first_name,NEW.last_name);
    
END $$

/* Let's insert a payment and see if it updates the invoice table */

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES(13, 'Jean-Ralphio', 'Saperstein', 'Entertainment 720 CEO', 1000000, NULL);

/* The invoice table was updated! */


/* -------------------------------------------------------------------------------------------------------------------------------------------- */

/* EVENTS */

/* EVENTS are blocks of code that get executed according to a schedule */ 
/* These are fantastic for so many reasons, such as importing data on a schedule, and automation */
/* Let's say Parks and Rec has a policy that anyone over the age of 60 is immediately retired with lifetime pay */
/* All we have to do is delete them from the demographics table */

SELECT * 
FROM parks_and_recreation.employee_demographics;

SHOW EVENTS;

/* We can drop or alter these events like this */

DROP EVENT IF EXISTS delete_retirees;
DELIMITER $$

CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO BEGIN
	DELETE
	FROM parks_and_recreation.employee_demographics
    WHERE age >= 60;
END $$

/* If we run it again you can see Jerry is now retired */

SELECT * 
FROM parks_and_recreation.employee_demographics;