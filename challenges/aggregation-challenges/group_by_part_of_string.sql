# Group By Part Of String

SELECT * FROM world.country;

SELECT SUBSTRING(Name, 1, 1), SUM(Population) FROM world.country
GROUP BY SUBSTRING(Name, 1, 1);

