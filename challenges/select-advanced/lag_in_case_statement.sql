# Use LAG() in CASE statement

WITH Laid_Monthly AS
(SELECT STR_TO_DATE(date, "%m/%d/%Y") AS date_n, SUM(total_laid_off) AS Monthly_Laid_Off FROM recall_2024.layoffs_r
GROUP BY SUBSTRING(date_n, 1, 7)
ORDER BY date_n DESC)
SELECT date_n, Monthly_Laid_Off, CASE
	WHEN Monthly_Laid_Off < LAG(Monthly_Laid_Off) OVER (ORDER BY date_n) THEN "Decrease" 
	WHEN Monthly_Laid_Off > LAG(Monthly_Laid_Off) OVER (ORDER BY date_n) THEN "Increase" 
	ELSE "No Change"
    END AS Tendency
FROM Laid_Monthly;
