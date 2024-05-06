# Data Cleaning

# Import the data with the Data Import Wizzard

# Create Database "world_layoffs"
CREATE DATABASE world_layoffs;
USE world_layoffs;

# Create a table "layoffs"
CREATE TABLE layoffs;

SELECT * FROM layoffs_staging;

# -- 1. Remove Duplicates
# -- 2. Standartize The Data
# -- 3. Null values or Blank Values.
# -- 4. Remove Any columns

CREATE TABLE layoffs_staging
LIKE layoffs;

INSERT INTO layoffs_staging
SELECT * FROM layoffs;

#-- Remove Duplicates

SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, industry, total_laid_off,
					percentage_laid_off, `date`) AS row_num # `date` with backtics, because it's MySQL reserved word.
FROM layoffs_staging;

#--

WITH duplicate_cte AS # cte Common Expression
(
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off,
					percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num # `date` with backtics, because it's MySQL reserved word.
FROM layoffs_staging
)
DELETE FROM duplicate_cte
WHERE row_num > 1;

SELECT * FROM layoffs_staging
WHERE company = "Casper";

#-=-
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off,
					percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num # `date` with backtics, because it's MySQL reserved word.
FROM layoffs_staging;


CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

#-0-

SELECT * FROM layoffs_staging2;

INSERT INTO layoffs_staging2
SELECT *,
ROW_NUMBER() OVER(PARTITION BY company, location, industry, total_laid_off,
					percentage_laid_off, `date`, stage, country, funds_raised_millions) AS row_num # `date` with backtics, because it's MySQL reserved word.
FROM layoffs_staging;

SELECT * FROM layoffs_staging2
WHERE row_num > 1; # Shows all duplicates

# -- Delete Duplicates
DELETE FROM layoffs_staging2
WHERE row_num > 1;

SELECT * FROM layoffs_staging2;

-- 2. Standardizing Data

# Check if there are whitespaces in the text fields(in thi scase Company)
SELECT company, TRIM(Company)
FROM layoffs_staging;

# Count how many rows have whitespaces in them
WITH whitespaces AS(
SELECT company, TRIM(Company) AS TrimmedCompany
FROM layoffs_staging
) SELECT COUNT(company) FROM whitespaces
WHERE company != TrimmedCompany;

# Update Column
UPDATE layoffs_staging2
SET company = TRIM(company);

# --=-
# Unify different values that mean the same thing like "Crypto" and "Crypto Currency"
# Check for misspelling
SELECT DISTINCT industry
FROM layoffs_staging2
ORDER BY 1;

# --

SELECT * FROM layoffs_staging2
WHERE industry LIKE 'Crypto%';

UPDATE layoffs_staging2
SET industry = "Crypto"
WHERE industry LIKE 'Crypto%';

#--=-

SELECT DISTINCT Country FROM layoffs_staging2
ORDER BY 1;

SELECT * FROM layoffs_staging2
WHERE Country LIKE "United States%";

# -=-- Trim particular symbol with "TRAILING" / trim character

UPDATE layoffs_staging2
SET country = TRIM(TRAILING "." FROM country)
WHERE country LIKE "United States";

SELECT DISTINCT Country FROM layoffs_staging2; # Check if the trimming worked

# -=--=

SELECT `date` FROM layoffs_staging2;

# Transform string to date format

SELECT `date`
FROM layoffs_staging2;

UPDATE layoffs_staging2
SET `date` = STR_TO_DATE(`date`, "%m/%d/%Y");

ALTER TABLE layoffs_staging2
MODIFY COLUMN `date` DATE;

SELECT * FROM layoffs_staging2;

CREATE TABLE layoffs_staging3
AS SELECT company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, 
		funds_raised_millions
		FROM layoffs_staging2;

SELECT * FROM layoffs_staging3;

# -- 3. Null Values or Blank Values

SELECT * FROM layoffs_staging2
WHERE total_laid_off IS NULL;

# Look for useless rows! - If 1 or more key columns like "total_laid_off" and "percentage_laid_off" are NULL
# we might consider removing the row.
SELECT * FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


SELECT * FROM layoffs_staging2
WHERE industry IS NULL
OR industry = ""; 

SELECT * FROM layoffs_staging2
WHERE company = "Airbnb";

# Populate NULL or empty values values. / If DIMENTION columns like industry or Country
# Are missing values we could transfer the values from othe rows where the industry and
# the value are populated for the same company.

SELECT COUNT(company) AS CountCompany,company FROM layoffs_staging2
WHERE company IN
(SELECT company FROM layoffs_staging2
WHERE industry IS NULL OR industry = "")
GROUP BY company;

#- Join a table to itself on 1 column(company). Check if another column Is NULL or empty string.
# If there is another row of the same company with a value for industry, the NULL can be filled with the value.
# Value of one row is copied to another row where the value is missing(NULL or "").
SELECT * FROM layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

# populate NULL value, populate blank value
UPDATE layoffs_staging2
SET industry = NULL
WHERE industry = "";


UPDATE layoffs_staging2 t1
JOIN layoffs_staging2 t2
	ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL;

SELECT * FROM layoffs_staging2
WHERE industry IS NULL OR industry = "";


SELECT * FROM layoffs_staging2
WHERE company = "Airbnb";

SELECT * FROM layoffs_staging2
WHERE company LIKE "Bally%";

# --

SELECT * FROM layoffs_staging2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;


# -=- 4. Delete Useless Rows and columns
# -=- Delete Useless Rows

DELETE FROM layoffs_staging2 # The information here is useless to the main subject.
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL;

# -=- Drop a column

ALTER TABLE layoffs_staging2
DROP COLUMN row_num;

SELECT * FROM layoffs_staging2;
