# Subquery
SELECT Name, Population FROM world.city
WHERE CountryCode IN (
	SELECT Code FROM world.country
    WHERE Continent = "Africa")
ORDER BY Population DESC;

# Subquery with comparisson operator

SELECT Name, Continent, GovernmentForm FROM world.country
WHERE SurfaceArea = (SELECT MAX(SurfaceArea) FROM world.country);

# Select all countries with higher than the average surface area.
SELECT Name, Continent, GovernmentForm FROM world.country
WHERE SurfaceArea > (SELECT AVG(SurfaceArea) FROM world.country);

# Using EXISTS
SELECT Name, Continent, GovernmentForm FROM world.country as wc
WHERE NOT EXISTS(
	SELECT 1 FROM world.city AS wci
    WHERE wc.code = wci.CountryCode);

# Using EXISTS. Select all the countries that have a city with population bigger than 9 milion
SELECT Name, Continent, GovernmentForm FROM world.country as wc
WHERE EXISTS(
	SELECT 1 FROM world.city AS wci
    WHERE population > 9000000 
    AND wc.code = wci.CountryCode);

# Using EXISTS
SELECT Name, Continent, GovernmentForm FROM world.country as wc
WHERE EXISTS(
	SELECT 1 FROM world.city AS wci
    WHERE wc.code = wci.CountryCode);

# Subquery with ALL
SELECT * FROM recall_2024.employee;
SELECT * FROM recall_2024.employee
WHERE employee_id > ALL(SELECT manager_id FROM recall_2024.employee);

INSERT INTO recall_2024.employee(employee_id, Name, manager_id)
VALUES(6, "Embembe", 3);

# Which Cities are bigger than the biggest city in Africa
SELECT wci.Name, wci.Population, wc.Name FROM world.city AS wci
INNER JOIN world.country AS wc 
	ON wci.CountryCode = wc.Code
WHERE wci.Population > ALL(SELECT Population FROM world.city
	WHERE CountryCode IN(SELECT Code FROM world.country WHERE Continent = "Africa"));

# SQL Subquery With ANY Operator
SELECT * FROM recall_2024.employee # Only 5 and 3 are bigger than the smallest in employee "2".
WHERE manager_id > ANY(SELECT employee_id FROM recall_2024.employee);

# Select all the countries in South America where GNP is bigger than the Lowest GNP in Europe
SELECT Name, GNP FROM world.country
WHERE Continent = "Europe" 
AND GNP < ANY(SELECT GNP FROM world.country WHERE Continent = "Africa");

# SELECT the European Countries with bigger GNP then the richest country
# In the Poorest Continent
SELECT Name, GNP FROM world.country
WHERE Continent = "Europe" 
AND GNP > ANY(SELECT MAX(GNP) FROM world.country
WHERE Population > 5000000
GROUP BY Continent);

# SQL Subquery in the FROM Clause. The alias name is mandatory.
SELECT MAX(wc.av) FROM
(SELECT AVG(GNP) AS av FROM world.country
GROUP BY Continent) wc;

# --

SELECT Name, GNP FROM
(SELECT Name, GNP, Continent FROM world.country
WHERE GNP > 150000) AS gnp_limit
WHERE Continent = "Asia";

# Subquery in the SELECT clause
SELECT * FROM world.country;

SELECT Name, 
	SurfaceArea,
    (SELECT AVG(SurfaceArea) FROM world.country) AS AVG_SA,
    (SELECT SurfaceArea - AVG_SA) AVG_dif

FROM world.country;

