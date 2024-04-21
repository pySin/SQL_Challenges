# US cities over 120000 Name Only

SELECT Name FROM world.city
WHERE CountryCode  = "USA"
AND Population > 120000;
