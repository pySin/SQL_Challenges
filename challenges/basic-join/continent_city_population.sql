# Continent City population

SELECT * FROM world.city;
SELECT * FROM world.country;

SELECT SUM(wci.Population) AS AsiaCityPopulation FROM world.city AS wci
JOIN world.country AS wc ON wc.Code = wci.CountryCode
WHERE Continent = "Asia";
