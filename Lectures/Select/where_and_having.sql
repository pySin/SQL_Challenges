# Combine "WHERE" and "HAVING"

# "HAVING" can filer Alias names from the current selection.
SELECT Continent, Count(wci.Name) CityByCount FROM world.country AS wc
JOIN world.city AS wci
ON wc.Code = wci.CountryCode
WHERE wci.Population > 200000
GROUP BY Continent
HAVING CityByCount > 200;
