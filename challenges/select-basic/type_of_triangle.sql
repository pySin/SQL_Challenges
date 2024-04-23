# Type of triangle

CREATE TABLE recall_2024.triangle(
a INT, 
b INT, 
c INT);

INSERT INTO recall_2024.triangle
VALUES(20, 20, 23),
	  (20, 20, 20),
      (20, 21, 22),
      (13, 14, 30);
	
SELECT * FROM recall_2024.triangle;

SELECT CASE
	WHEN a = b AND b != c THEN "Isosceles"
    WHEN a = b AND b = c THEN "Equilateral"
	WHEN a > b + c OR b > a + c OR c > a + b THEN "Not A Triangle"
    WHEN a != b and b != c THEN "Scalene"
    END AS "Triangle Type"
FROM recall_2024.triangle;
