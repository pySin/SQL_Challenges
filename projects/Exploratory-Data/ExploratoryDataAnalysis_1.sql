# Exploratory Data Analysis

SELECT * FROM layoffs_staging2;

SELECT MAX(total_laid_off), MAX(percentage_laid_off) FROM layoffs_staging2;

SELECT * FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY total_laid_off DESC;

# -=-

SELECT * FROM layoffs_staging2
WHERE percentage_laid_off = 1
ORDER BY funds_raised_millions DESC;

# -=-

SELECT company, SUM(total_laid_off) FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC; # 2 means the second column of the result.

# -=-

SELECT MIN(`date`), MAX(`date`) FROM layoffs_staging2; # Check the first date in record

# -=- Check LaidOffs by Industry

# sum by group / dimension
SELECT industry, SUM(total_laid_off) FROM layoffs_staging2
GROUP BY industry
ORDER BY 2 DESC;

# countries affected
SELECT country, SUM(total_laid_off) FROM layoffs_staging2
GROUP BY country
ORDER BY 2 DESC; # oorder by second column

# - =

SELECT YEAR(`date`), SUM(total_laid_off) FROM layoffs_staging2
GROUP BY YEAR(`date`)
ORDER BY 2 DESC;

SELECT country, SUM(total_laid_off), YEAR(`date`) FROM layoffs_staging2
GROUP BY country, YEAR(`date`)
ORDER BY 2 DESC;

SELECT * FROM layoffs_staging2;

SELECT stage, SUM(total_laid_off) FROM layoffs_staging2
GROUP BY stage
ORDER BY 2 DESC;

# -=-

SELECT country, AVG(percentage_laid_off), YEAR(`date`) FROM layoffs_staging2
GROUP BY country, YEAR(`date`)
ORDER BY 2 ASC;

SELECT country, AVG(percentage_laid_off), YEAR(`date`) FROM layoffs_staging2
WHERE Country = "Canada"
GROUP BY Country, YEAR(`date`);

SELECT country, percentage_laid_off, `date` FROM layoffs_staging2
WHERE Country = "Canada" AND YEAR(`date`) = 2021;

# Rowling total laioffs

SELECT SUM(total_laid_off), SUBSTRING(`date`, 6, 2)
FROM layoffs_staging2
GROUP BY SUBSTRING(`date`, 6, 2);

# SELECT total_laid_off FROM layoffs_staging2
# WHERE SUBSTRING(`date`, 6, 2) = "07";

SELECT SUBSTRING(`date`, 1, 7) AS `Month`, SUM(total_laid_off) AS sum_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY 1
ORDER BY 1;

SELECT * FROM layoffs_staging2;

# Increase column value by another column
WITH Rowling_Total AS (
SELECT SUBSTRING(`date`, 1, 7) AS `Month`, SUM(total_laid_off) AS total_off
FROM layoffs_staging2
WHERE SUBSTRING(`date`, 1, 7) IS NOT NULL
GROUP BY 1
ORDER BY 1
)
SELECT 
	`Month`,
    total_off,
    SUM(total_off) OVER (ORDER BY `Month`) AS RTotal # Rowling total increases the total for each month.
FROM Rowling_Total;

# -=-

SELECT * FROM layoffs_staging2
WHERE company = "Amazon";


SELECT company, SUM(total_laid_off), SUBSTRING(`date`, 1, 7) FROM layoffs_staging2
WHERE company = "Amazon"
GROUP BY SUBSTRING(`date`, 1, 7)
ORDER BY 3 ASC;

SELECT company, SUM(total_laid_off) FROM layoffs_staging2
GROUP BY company
ORDER BY 2 DESC;

SELECT company, YEAR(`date`), SUM(total_laid_off) FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
ORDER BY 3 DESC;

#-==

WITH Company_Year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off) FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
)
SELECT *,
	DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL AND total_laid_off IS NOT NULL;
# ORDER BY Ranking ASC;

# --

WITH Company_Year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off) FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
), Company_Year_Rank AS
(SELECT *,
	DENSE_RANK() OVER (PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL AND total_laid_off IS NOT NULL)
SELECT * FROM Company_Year_Rank
WHERE Ranking <= 5;

