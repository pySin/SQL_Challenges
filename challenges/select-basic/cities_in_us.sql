# Query all columns for all American cities in the CITY table with populations larger than 100000. 
# The CountryCode for America is USA.

SELECT * FROM world.city
WHERE COuntryCode  = "USA"
AND Population > 100000;