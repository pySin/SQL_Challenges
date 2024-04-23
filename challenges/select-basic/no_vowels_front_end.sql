# End Front No Vowels

SELECT Name FROM world.city
WHERE 
LEFT(Name, 1) NOT IN ("a", "i", "o", "u", "e")
AND
RIGHT(Name, 1) NOT IN ("a", "i", "o", "u", "e");

SELECT DISTINCT(Name) FROM world.country
WHERE Name REGEXP ("^[^aeuio].+[^aeuio]$");
