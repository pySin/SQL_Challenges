# Distinct Select Filtering

SELECT * FROM world.country;

SELECT DISTINCT Continent FROM world.country;
SELECT DISTINCT Region as R, (SELECT count(name) FROM world.country 
WHERE Region = R) AS CountriesRegion FROM world.country;

# Aply DISTINCT through GROUP BY

SELECT COUNT(name) AS count, Region FROM world.country
GROUP BY Region
ORDER BY count DESC;

# DISTINCT for multiple columns
SELECT DISTINCT Continent, GovernmentForm FROM world.country;
