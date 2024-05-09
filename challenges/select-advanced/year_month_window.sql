# Year Month Window
WITH CTotal AS
(
WITH time_laid_off AS
(SELECT company, 
	   MONTH(`date`) AS CMonth,
       YEAR(`date`) AS CYear,
       total_laid_off
FROM layoffs_staging2)
SELECT company,
	   CYear,
	   CMonth,
       total_laid_off,
       # AVG(total_laid_off) OVER (PARTITION BY CYear ORDER BY CMonth) AS CLaid
       ROW_NUMBER() OVER (PARTITION BY CYear, CMonth ORDER BY total_laid_off DESC) AS CLaid
FROM time_laid_off
WHERE total_laid_off IS NOT NULL AND CMonth IS NOT NULL
)
SELECT Company,
	   CYear,
       CMonth,
       total_laid_off,
       CLaid
FROM CTotal
WHERE CLaid < 4;


# Check Results
WITH YM AS
(
SELECT company, MONTH(`date`) AS CMonth, YEAR(`date`) AS CYear, total_laid_off
FROM layoffs_staging2
)
SELECT Company, CMonth, CYear, total_laid_off
FROM YM WHERE CYear = 2020 AND CMonth = 3
ORDER BY total_laid_off DESC;