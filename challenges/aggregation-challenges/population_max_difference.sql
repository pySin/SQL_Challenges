# Population Max Difference

SELECT MAX(Population) FROM world.city;
SELECT MIN(Population) FROM world.city;

SELECT (MAX(Population) - MIN(Population))
FROM world.city;