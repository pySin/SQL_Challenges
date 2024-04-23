# Starting and Final Vowel

SELECT Name FROM world.city;

SELECT Name FROM world.city
WHERE 
LEFT(Name, 1) IN ("a", "i", "o", "u", "e")
AND
RIGHT(Name, 1) IN ("a", "i", "o", "u", "e");

SELECT DISTINCT(Name) FROM world.country
WHERE Name REGEXP ("^[aeuio].+[aeuio]$");
