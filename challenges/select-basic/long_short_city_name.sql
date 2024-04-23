# Longest Shortest City Names

SELECT * FROM world.city;

SELECT Name, MIN(LENGTH(Name)) AS Length FROM world.city
WHERE LENGTH(Name) = (SELECT MIN(LENGTH(Name)) FROM world.city
					 ORDER BY Name)
UNION
SELECT Name, LENGTH(Name) AS Length FROM world.city
WHERE LENGTH(Name) = (SELECT MAX(LENGTH(Name)) FROM world.city
					 ORDER BY Name);

SELECT * FROM world.city
WHERE LENGTH(Name) = 3
ORDER BY Name;

(SELECT Name, LENGTH(Name) AS Length FROM world.city
WHERE LENGTH(Name) = (SELECT MIN(LENGTH(Name)) FROM world.city)
ORDER BY Name
LIMIT 1)
UNION
(SELECT Name, LENGTH(Name) AS Length FROM world.city
WHERE LENGTH(Name) = (SELECT MAX(LENGTH(Name)) FROM world.city)
ORDER BY Name
LIMIT 1);

SELECT Name, LENGTH(Name) FROM world.city
ORDER BY LENGTH(Name) DESC, Name ASC
LIMIT 1;

SELECT Name, LENGTH(Name) FROM world.city
ORDER BY LENGTH(Name) ASC, Name ASC
LIMIT 1;

