# Data Cleaning 2

SELECT * FROM recall_2024.classes;
DESCRIBE recall_2024.classes;

INSERT INTO recall_2024.classes(class_name, duration_seconds, duration_plus_rest)
VALUES("Biology", 2000, 5001);

# SELECT DISTINCT class_name, duration_seconds, duration_plus_rest FROM recall_2024.classes;

# -=-
WITH class_subselect AS
(
SELECT id, class_name, duration_seconds, duration_plus_rest,
ROW_NUMBER() OVER (PARTITION BY class_name, duration_seconds, duration_plus_rest) AS DuplicateX
FROM recall_2024.classes
)
DELETE FROM recall_2024.classes
WHERE id = (SELECT id FROM class_subselect
WHERE DuplicateX  > 1);

#
CREATE TABLE recall_2024.classes_2 (
  `id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(230) DEFAULT NULL,
  `duration_seconds` int DEFAULT NULL,
  `duration_plus_rest` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `classes_chk_3` CHECK ((`duration_seconds` > 0)),
  CONSTRAINT `classes_chk_4` CHECK ((`duration_plus_rest` > 0)),
  CONSTRAINT `proper_durations_2` CHECK ((`duration_plus_rest` > `duration_seconds`))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO recall_2024.classes_2(`id`, `class_name`, `duration_seconds`, `duration_plus_rest`)
WITH cur_class AS
(SELECT DISTINCT class_name, duration_seconds, duration_plus_rest FROM recall_2024.classes)
SELECT ROW_NUMBER() OVER (ORDER BY class_name) AS id, class_name, duration_seconds, duration_plus_rest
FROM cur_class;

SELECT * FROM recall_2024.classes_2;

# -==- Handling Missing Values -==- #

SELECT * FROM recall_2024.occupations;

#-# Check Missing values
CREATE TABLE recall_2024.layoffs_r AS
SELECT * FROM world_layoffs.layoffs;

SELECT * FROM recall_2024.layoffs_r;

SELECT * FROM recall_2024.layoffs_r
WHERE industry IS NULL;

SELECT * FROM recall_2024.layoffs_r
WHERE company = "Bally's Interactive";

## -=- Remove Rows With Missing Values

SELECT * FROM recall_2024.layoffs_r
WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;

# remove missing values when key collumns are NULL
DELETE FROM recall_2024.layoffs_r
WHERE total_laid_off IS NULL AND percentage_laid_off IS NULL;

## -=- Replace Missing Values WITH Default

SELECT * FROM recall_2024.layoffs_r;
SELECT * FROM recall_2024.layoffs_r
WHERE funds_raised_millions = 874;
SELECT * FROM recall_2024.layoffs_r
WHERE funds_raised_millions IS NULL;

SET @avg_laid = (SELECT AVG(funds_raised_millions) FROM recall_2024.layoffs_r);
SELECT @avg_laid;
UPDATE recall_2024.layoffs_r
	SET funds_raised_millions = @avg_laid
WHERE funds_raised_millions IS NULL;

# --=- Replace Missing Values with Default with COALESCE()
SELECT * FROM recall_2024.layoffs_r;
SELECT * FROM recall_2024.layoffs_r
WHERE percentage_laid_off IS NULL;

SELECT company, COALESCE(percentage_laid_off, (SELECT ROUND(AVG(percentage_laid_off), 3)
						FROM recall_2024.layoffs_r)) AS AVG_PL
	FROM recall_2024.layoffs_r;

# -=- UPDATE with COALESCE
UPDATE recall_2024.layoffs_r
	SET percentage_laid_off = COALESCE(percentage_laid_off, 0.333); # Place 0.333 when NULL


UPDATE recall_2024.layoffs_r
SET percentage_laid_off = NULL
WHERE percentage_laid_off = 0.333;

SELECT percentage_laid_off FROM recall_2024.layoffs_r;
SELECT company, percentage_laid_off FROM recall_2024.layoffs_r
WHERE percentage_laid_off = 0;

# -=- Fill Missing Values with "CASE"

UPDATE recall_2024.layoffs_r
SET percentage_laid_off = CASE 
			WHEN percentage_laid_off IS NULL THEN 0.333
            ELSE percentage_laid_off
            END;


# -=- Impute Missing Values with Aggregated Values
WITH Percentage_All AS
(
SELECT * FROM recall_2024.layoffs_r
)
UPDATE recall_2024.layoffs_r
SET percentage_laid_off = CASE 
			WHEN percentage_laid_off IS NULL THEN (SELECT AVG(percentage_laid_off) FROM Percentage_All)
            ELSE percentage_laid_off
            END;


# --=-- Fill Values where it's present in other columns.

# Check if the companies have other records where the industry is filled
SELECT * FROM recall_2024.layoffs_r
WHERE industry = "";

# --=- Unify Empty spaces as NULL ("" ADN NULL = NULL)

UPDATE recall_2024.layoffs_r
SET industry = NULL
WHERE industry = "";

WITH fill_value_2 AS
(
SELECT DISTINCT company, industry FROM recall_2024.layoffs_r
WHERE company IN (SELECT company FROM recall_2024.layoffs_r
				  WHERE industry IS NULL)
)
SELECT company, industry FROM fill_value_2
WHERE industry IS NOT NULL;

# Join Table to itself on company where one company has a NULL record for Industry, but
# also non-null record. Then update the non-NULL record to the NULL one.

# Show industry NULL values that have NON NULL values as well
SELECT l1.company, l1.industry, l2.company, l2.industry FROM recall_2024.layoffs_r AS l1
JOIN recall_2024.layoffs_r AS l2 ON l1.company = l2.company
WHERE l1.industry IS NULL AND l2.industry IS NOT NULL;

# Transfer the NON-NULL values to the NULL cells with UPDATE
UPDATE recall_2024.layoffs_r AS l1
	JOIN recall_2024.layoffs_r AS l2
    ON l1.company = l2.company
SET l1.industry = l2.industry
WHERE l1.industry IS NULL AND l2.industry IS NOT NULL;

# Data Normalization / Data Standardization

DROP TABLE recall_2024.parcels_england;

CREATE TABLE recall_2024.parcels_england(
id INT PRIMARY KEY AUTO_INCREMENT,
recipient_name VARCHAR(255),
Town VARCHAR(255),
weight FLOAT
);

INSERT INTO recall_2024.parcels_england(recipient_name, Town, weight)
VALUES("John", "London", 2.21),
	  ("Billy", "Manchester", 1.51),
      ("Petra", "Brighton", 4.35);

SELECT * FROM recall_2024.parcels_germany;
SELECT * FROM recall_2024.parcels_england;

CREATE TABLE recall_2024.parcels_germany(
id INT PRIMARY KEY AUTO_INCREMENT,
recipient_name VARCHAR(255),
Town VARCHAR(255),
weight FLOAT
);

INSERT INTO recall_2024.parcels_germany(recipient_name, Town, weight)
VALUES("Henzel", "Berlin", 3.63),
	  ("Grethel", "Stutgart", 1.84),
      ("Zelda", "Cologne", 2.24);


CREATE TABLE recall_2024.parcels_europe(
id INT PRIMARY KEY AUTO_INCREMENT,
recipient_name VARCHAR(255),
Town VARCHAR(255),
weight FLOAT
);

# Add the England parcels to Europe and transform the pounds to kilograms.
INSERT INTO recall_2024.parcels_europe(recipient_name, Town, weight)
SELECT recipient_name, Town, weight / 2.2046 FROM recall_2024.parcels_england;

INSERT INTO recall_2024.parcels_europe(recipient_name, Town, weight)
SELECT recipient_name, Town, weight FROM recall_2024.parcels_germany;

SELECT * FROM recall_2024.parcels_europe;
DELETE FROM recall_2024.parcels_europe;

## _+-+_ Find Inconsistent Category Text values

SELECT * FROM recall_2024.layoffs_r;
SELECT company FROM recall_2024.layoffs_r
ORDER BY company;

WITH sift AS
(
SELECT company FROM recall_2024.layoffs_r
)
SELECT company FROM recall_2024.layoffs_r AS l1
WHERE l1.company LIKE company
ORDER BY l1.company;

# 
SELECT Id, Name, LEAD(Id) OVER (ORDER BY Id) AS Next_Id, LEAD(Name) OVER (ORDER BY Id) AS Next_Name
FROM YourTable
WHERE Id = 6;

# Find similar values from the same column / almost same values / possible misspells
WITH similar AS
(SELECT company, LEAD(company) OVER (ORDER BY company) AS lead_c, LAG(company) OVER (ORDER BY company) AS lag_c
FROM recall_2024.layoffs_r
ORDER BY company
)SELECT company, lead_c, lag_c FROM similar
WHERE SUBSTRING(company, 1, 7) LIKE SUBSTRING(lead_c, 1, 7)
AND company != lead_c;

SELECT company FROM recall_2024.layoffs_r
WHERE company = "Affirm";

SELECT COUNT(company) FROM recall_2024.layoffs_r;

