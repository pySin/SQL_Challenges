# Insert

# INSERT data without specifying the column names. Only with matching amount of columns!
SELECT * FROM recall_2024.employee;

INSERT INTO recall_2024.employee
VALUES(3, "Luiz", 6);

# Copy Rows from another tables

CREATE TABLE recall_2024.employee_2(
id INT,
name_2 VARCHAR(200),
m_id INT);


INSERT INTO recall_2024.employee_2(id, name_2, m_id)
SELECT employee_id, Name, manager_id FROM recall_2024.employee
WHERE employee_id > 5;

# -- INSERT all records frpom a table into another with the same structure.

INSERT INTO recall_2024.employee_2
SELECT * FROM recall_2024.employee;
