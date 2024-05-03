# WINDOW with Max
SELECT Name, Continent, Population,
MAX(Population) OVER (PARTITION BY Continent) AS MaxContinent FROM world.country;
