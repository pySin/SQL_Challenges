# LIMIT constraint

SELECT * FROM world.country
WHERE IndepYear > 1900
LIMIT 8;

# -- Get Top values with LIMIT and DESC

SELECT * FROM world.country
WHERE IndepYear > 1900
ORDER BY IndepYear DESC
LIMIT 8;

