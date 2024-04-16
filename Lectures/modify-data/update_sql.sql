# UPDATE SQL

SELECT * FROM recall_2024.employee;

UPDATE recall_2024.employee
	SET manager_id = 13, employee_id = 14
WHERE Name = "Ani";

# Modify multiple rows of tdata with the WHERE clause
UPDATE recall_2024.employee
	SET employee_id = 15
WHERE employee_id > 13;

# Update with Subquery

SELECT * FROM recall_2024.employee_2;
UPDATE recall_2024.employee_2
	SET id = (SELECT employee_id FROM recall_2024.employee
			  WHERE Name = "Jasmin")
WHERE name_2 = "Euzebio";

