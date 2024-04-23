# City Bigger than 750000 WITH ordering

SELECT Name, Population, id FROM world.city
WHERE Population < 75000
ORDER BY RIGHT(Name, 2), id;


