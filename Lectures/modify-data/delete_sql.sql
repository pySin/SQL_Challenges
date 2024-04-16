# DELETE SQL

SELECT * FROM recall_2024.employee_2;

# Without WHERE clause all records will be deleted!!!
DELETE FROM recall_2024.employee_2
WHERE name_2 = "Jasmin";

# Delete Multiple rows with IN

DELETE FROM recall_2024.employee_2
WHERE m_id IN (1, 6);

# Delete rows from dependent tables.
# When PRIMARY KEY and FOREIGN KEY are used the dependant(foreign key) values has to be deleted first
# and the PRIMARY KEY thereafter. Without primary and foreign keys deletions are not restricted.

CREATE TABLE emp_dependants(
dep_id INT,
dep_name VARCHAR(200),
emp_id INT,
	FOREIGN KEY(emp_id)
		REFERENCES employee(employee_id)
);

SELECT * FROM employee;
DELETE FROM recall_2024.employee
WHERE Name = "Ani";

# Add primary Key
ALTER TABLE recall_2024.employee ADD PRIMARY KEY(employee_id);

# --
SELECT * FROM recall_2024.emp_dependants;

INSERT INTO recall_2024.employee
VALUES(3, "Luiz", 6);

INSERT INTO recall_2024.emp_dependants
VALUES(1, "Eugenia", 3),
	  (2, "Chepolita", 3);

DELETE FROM recall_2024.emp_dependants
WHERE emp_id = 3;

DELETE FROM recall_2024.employee
WHERE employee_id = 3;
