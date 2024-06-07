# Double Like Clause

SELECT * FROM world_layoffs.layoffs_staging
WHERE Company LIKE '%La%'
AND Company LIKE "%na%"; # it gives you the small 'l' as well
