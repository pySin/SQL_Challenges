# City Double Sift plus Join
# Get the Cities from Africa Bigger than 1000000 Population.

SELECT * FROM world.city;

SELECT wco.Name, wc.Name, wc.Population, wc.CountryCode FROM world.city AS wc
INNER JOIN world.country AS wco 
ON wc.CountryCode = wco.code
WHERE wco.Continent = "Africa";
