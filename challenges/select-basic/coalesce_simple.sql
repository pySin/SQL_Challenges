# Simple Coalesce

SELECT Name, Continent, COALESCE(IndepYear, (SELECT AVG(IndepYear)
											FROM world.country)) AS AVG_Indep_Year
FROM world.country;
