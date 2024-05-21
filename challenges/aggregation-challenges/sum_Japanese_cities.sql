# Japanese Cities Sum

SELECT * FROM world.city;
SELECT * FROM world.country;

SELECT SUM(Population)
FROM world.city
WHERE CountryCode = (SELECT Code FROM world.country WHERE Name = "Japan");

SELECT SUM(Population) FROM world.city
WHERE CountryCode = "JPN";
