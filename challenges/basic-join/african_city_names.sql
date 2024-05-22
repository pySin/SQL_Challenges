# African City Names

SELECT * FROM world.city;

SELECT wci.Name FROM world.city AS wci
JOIN world.country AS wc ON wci.CountryCode = wc.Code
WHERE Continent = "Africa";
