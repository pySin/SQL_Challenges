# Grouping Data

USE recall_2024;
SELECT * FROM world.country;

# Simple
SELECT Continent, COUNT(Name) Countries FROM world.country
GROUP BY Continent;

SELECT Continent FROM world.country
GROUP BY Continent;

# GROUP BY with INNER JOIN

SELECT country.Name, Continent, COUNT(city.Name) CitiesPerCountry FROM world.country
INNER JOIN world.city ON country.Code = city.CountryCode
GROUP BY Country.Name;

#-- Gve Aliase names if the joining columns

SELECT wc.Name, wc.Continent, COUNT(wci.Name) CitiesPerCountry FROM world.country wc
INNER JOIN world.city wci ON wc.Code = wci.CountryCode
GROUP BY wc.Name;

# GROP BY with JOIN and ORDER BY aggregation.
SELECT wc.Name, wc.Continent, COUNT(wci.Name) CitiesPerCountry FROM world.country wc
INNER JOIN world.city wci ON wc.Code = wci.CountryCode
GROUP BY wc.Name
ORDER BY CitiesPerCountry DESC;

# Filter GROUP BY on the agregation column with HAVING
SELECT wc.Name, wc.Continent, COUNT(wci.Name) CitiesPerCountry FROM world.country wc
INNER JOIN world.city wci ON wc.Code = wci.CountryCode
GROUP BY wc.Name
HAVING CitiesPerCountry < 50
ORDER BY CitiesPerCountry DESC;

# Filter GROUP BY on a non-agregation column with HAVING
SELECT wc.Name, wc.Continent, wc.Population, COUNT(wci.Name) CitiesPerCountry FROM world.country wc
INNER JOIN world.city wci ON wc.Code = wci.CountryCode
GROUP BY wc.Name
HAVING wc.Population > 120000000
ORDER BY CitiesPerCountry DESC;

# MIN, MAX, AVG, SUM aggregations with GROUP BY
SELECT wc.Name, wc.Continent, wc.Population, COUNT(wci.Name) CitiesPerCountry, AVG(wci.Population),
	SUM(wci.Population)
	FROM world.country wc
INNER JOIN world.city wci ON wc.Code = wci.CountryCode
GROUP BY wc.Name
HAVING wc.Population > 120000000
ORDER BY CitiesPerCountry DESC;

# Group By Multiple Columns.
# Groups when all Group Columns same data.

SELECT Continent, IndepYear, COUNT(IndepYear) FROM world.country
GROUP BY Continent, IndepYear
ORDER BY IndepYear DESC; # 8 matching count for Asia

SELECT Name, Continent, IndepYear FROM world.country
WHERE IndepYear = 1991 AND Continent = "Asia"; # 8 matches



