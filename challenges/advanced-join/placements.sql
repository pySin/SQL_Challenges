# Placements

CREATE TABLE recall_2024.students(
id INT,
Name VARCHAR(150)
);

INSERT INTO recall_2024.students(id, Name)
VALUES(1, "Ashley"),
	  (2, "Samantha"),
      (3, "Julia"),
      (4, "Scarlet");

SELECT * FROM recall_2024.students;

# ~-~

CREATE TABLE recall_2024.Friends (
id INT, 
Friend_ID INT
);

INSERT INTO recall_2024.Friends(id, Friend_ID)
VALUES(1, 2),
	  (2, 3),
      (3, 4),
      (4, 1);

SELECT * FROM recall_2024.Friends;

#~-~

CREATE TABLE recall_2024.packages(
id INT,
salary FLOAT
);

INSERT INTO recall_2024.packages(id, salary)
VALUES(1, 15.20),
	  (2, 10.06),
      (3, 11.55),
      (4, 12.12);

SELECT * FROM recall_2024.packages;

# _+_ **()**-+

SELECT ST.Name
FROM recall_2024.Friends AS FR
JOIN recall_2024.Packages AS PK
ON FR.id = PK.id
JOIN recall_2024.Packages AS PK2
ON FR.Friend_Id = PK2.id
JOIN recall_2024.Students AS ST
ON ST.id = FR.id
WHERE PK.Salary < PK2.salary
ORDER BY FR.id;
