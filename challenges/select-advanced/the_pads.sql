# The Pads

CREATE TABLE Recall_2024.Occupations(
Name VARCHAR(150),
occupation VARCHAR(255)
);

SELECT * FROM recall_2024.Occupations;

INSERT INTO recall_2024.Occupations(Name, Occupation)
VALUES("Samantha", "Doctor"),
	  ("Julia", "Actor"),
      ("Maria", "Actor"),
      ("Meera", "Singer"),
      ("Ashely", "Professor"),
      ("Ketty", "Professor"),
      ("Christeen", "Professor"),
      ("Jane", "Actor"),
      ("Jenny", "Doctor"),
      ("Priya", "Singer");

SELECT CONCAT(Name, "(", SUBSTRING(Occupation, 1, 1), ")") Name_ABR FROM recall_2024.Occupations
ORDER BY Name;
SELECT CONCAT("There are total of ", COUNT(Occupation), " ", LOWER(occupation), "s.") AS OccupationsCount
FROM recall_2024.Occupations
GROUP BY occupation
ORDER BY OccupationsCount;
