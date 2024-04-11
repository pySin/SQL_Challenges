# Join Basic

SELECT * FROM world.country;
SELECT * FROM world.city;

# Ordinary Join
SELECT * FROM world.country
JOIN world.city ON world.country.Code = world.city.CountryCode;

# Inner Join
CREATE TABLE recall_2024.join_1(
text_rep_1 VARCHAR(255),
digit_rep_1 INT);

CREATE TABLE recall_2024.join_2(
text_rep_2 VARCHAR(255), 
digit_rep_2 INT);

INSERT INTO recall_2024.join_1(text_rep_1, digit_rep_1)
VALUES("one", 1),
	  ("two", 2),
      ("three", 3),
      ("four", 4),
      ("five", 5);

# --
INSERT INTO recall_2024.join_2(text_rep_2, digit_rep_2)
VALUES("three", 3),
      ("four", 4),
      ("five", 5),
      ("six", 6),
      ("seven", 7);

# Inner Join
SELECT * FROM recall_2024.join_1
INNER JOIN recall_2024.join_2 ON digit_rep_1 = digit_rep_2;

# Left Join
SELECT * FROM recall_2024.join_1
LEFT JOIN recall_2024.join_2 ON digit_rep_1 = digit_rep_2;

# Right Join
SELECT * FROM recall_2024.join_1
RIGHT JOIN recall_2024.join_2 ON digit_rep_1 = digit_rep_2;

# Full Join
SELECT * FROM recall_2024.join_1
LEFT JOIN recall_2024.join_2 ON digit_rep_1 = digit_rep_2
UNION
SELECT * FROM recall_2024.join_1
RIGHT JOIN recall_2024.join_2 ON digit_rep_1 = digit_rep_2;



# Left Join Real Data
SELECT * FROM world.country
LEFT JOIN world.city ON world.country.Code = world.city.CountryCode;

# Right Join Real Data
SELECT * FROM world.country
RIGHT JOIN world.city ON world.country.Code = world.city.CountryCode;
