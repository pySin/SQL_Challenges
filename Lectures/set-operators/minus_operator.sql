# MINUS operator
# IN MySQL emulate minus with DISTINC, WHERE and NOT IN

SELECT * FROM recall_2024.employee;

SELECT DISTINCT manager_id FROM employee
WHERE manager_id NOT IN
(SELECT employee_id FROM employee);
