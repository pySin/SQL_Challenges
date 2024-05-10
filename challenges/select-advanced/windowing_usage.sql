# Windowing Usage

# ROW_NUMBER(), RANK(), DENSE_RANK(), SUM(), AVG(), LEAD(), and LAG()

# -- RANK()

USE world_layoffs;
SELECT * FROM layoffs_staging2;

WITH CL AS
(SELECT Company, YEAR(`date`) AS CYear, total_laid_off
FROM layoffs_staging2)
SELECT Company, CYear, total_laid_off,
	RANK() OVER (PARTITION BY CYear ORDER BY total_laid_off DESC) AS TopCompanyesYear
FROM CL WHERE CYear IS NOT NULL;

# --
# The LEAD() function in SQL is a window function that allows you to access data from the next row within
# the same partition of a result set. It is particularly useful for comparing values across consecutive
# rows or calculating differences between adjacent rows.

WITH CL AS
(SELECT Company, YEAR(`date`) AS CYear, total_laid_off
FROM layoffs_staging2)
SELECT Company, CYear, total_laid_off,
	LEAD(total_laid_off) OVER (PARTITION BY CYear) AS NextRowLO
FROM CL WHERE CYear IS NOT NULL;

# LAG() / The oposite of LEAD() Get the value from another column's upper row.

WITH CL AS
(SELECT Company, YEAR(`date`) AS CYear, total_laid_off
FROM layoffs_staging2)
SELECT Company, CYear, total_laid_off,
	LAG(total_laid_off) OVER (PARTITION BY CYear) AS NextRowLO
FROM CL WHERE CYear IS NOT NULL;


