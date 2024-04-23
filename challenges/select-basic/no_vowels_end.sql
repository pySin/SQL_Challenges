# No vowels at end

SELECT Name FROM world.city
WHERE
RIGHT(Name, 1) NOT IN ("a", "i", "o", "u", "e");

SELECT DISTINCT(Name) FROM world.country
WHERE Name REGEXP ("[^aeuio]$");