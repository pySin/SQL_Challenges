# Ending in vowel

SELECT Name FROM world.city
WHERE 
Name LIKE "%a"
OR Name LIKE "%o"
OR Name LIKE "%u"
OR Name LIKE "%i"
OR Name LIKE "%e";

SELECT Name FROM world.city
WHERE LEFT(Name, 1) IN ("a", "e", "i", "o", "u");