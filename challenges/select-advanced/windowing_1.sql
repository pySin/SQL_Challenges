# Windowing

SELECT * FROM world.country;

SELECT *,
ROW_NUMBER() OVER (PARTITION BY Continent)
FROM world.country;