# Year Month Window

WITH time_laid_off AS
(SELECT company, 
	   MONTH(`date`) AS CMonth,
       YEAR(`date`) AS CYear,
       total_laid_off
FROM layoffs_staging2)
SELECT CYear,
	   CMonth,
       SUM(total_laid_off) OVER (PARTITION BY CYear ORDER BY CMonth) AS CLaid
FROM time_laid_off;


