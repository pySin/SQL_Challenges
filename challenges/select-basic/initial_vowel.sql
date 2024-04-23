# Initial Vowel

SELECT DISTINCT(Name) from world.city 
WHERE
Name LIKE "a%" or
Name LIKE "e%" or
Name LIKE "i%" or
Name LIKE "o%" or
Name LIKE "u%";

SELECT DISTINCT(Name) FROM world.city
WHERE LEFT(Name, 1) IN ("a", "e", "i", "o", "u");
