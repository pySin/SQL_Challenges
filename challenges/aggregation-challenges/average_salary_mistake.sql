# The Blunder


CREATE TABLE challenges_05_2024.employees(
id INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(100),
Salary INT
);

SELECT * FROM challenges_05_2024.employees;

INSERT INTO challenges_05_2024.employees(Name, Salary)
VALUES("Kristeen", 1420),
	  ("Ashley", 2006),
      ("Julia", 2210),
      ("Maria", 3000);

SELECT AVG(Salary) - 98 FROM challenges_05_2024.employees;