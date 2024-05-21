# Top Earners

CREATE TABLE challenges_05_2024.employee(
employee_id INT,
name VARCHAR(100),
months  INT,
salary INT);

# DROP TABLE challenges_05_2024.employee;
SELECT * FROM challenges_05_2024.employee;

INSERT INTO challenges_05_2024.employee(employee_id, name, months, salary)
VALUES(12228, "Rose", 15, 1968),
	  (33645, "Angela", 1, 3443),
      (45692, "Frank", 17, 1608),
      (56118, "Patrick", 7, 1345),
      (59725, "Lisa", 11, 2330),
      (74197, "Kimberly", 16, 4372),
      (78454, "Bonnie", 8, 1771),
      (83565, "Michael", 6, 2017),
      (98607, "Todd", 5, 3396),
      (99989, "Joe", 9, 3573);

# Find top total earner

WITH all_totals AS
(SELECT (months * salary) AS totals
FROM challenges_05_2024.employee)
SELECT MAX(totals)
FROM all_totals;

SELECT e1.*, (e1.months * e1.salary) EmpTop, (e2.months * e2.salary) EmpTop2 
FROM challenges_05_2024.employee AS e1
JOIN challenges_05_2024.employee AS e2
ON e1.employee_id = e2.employee_id;


# Find and count top earners
WITH TopEmp AS
(SELECT (months * salary) AS EmpTop
FROM challenges_05_2024.employee)
SELECT CONCAT(MAX(EmpTop), " ", COUNT(EmpTop)) AS Results
FROM TopEmp WHERE EmpTop = (SELECT MAX(months * salary) FROM challenges_05_2024.employee);

# Add Another Top value
INSERT INTO challenges_05_2024.employee(employee_id, name, months, salary)
VALUES(34562, "Ahmad", 32, 2186);
