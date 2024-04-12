# Self Join

SELECT Continent, COUNT(Continent) FROM world.country
GROUP BY Continent;

CREATE TABLE recall_2024.employee(
employee_id INT, 
Name VARCHAR(200),
manager_id INT
);

INSERT INTO recall_2024.employee(employee_id, Name, manager_id)
VALUES(12, "Miro", 2),
	  (2, "Ani", 1);

INSERT INTO recall_2024.employee(employee_id, Name, manager_id)
VALUES(14, "Jasmin", 2);
	
SELECT * FROM recall_2024.employee;

SELECT em.Name, me.Name FROM recall_2024.employee em
INNER JOIN recall_2024.employee me
ON em.manager_id = me.employee_id;