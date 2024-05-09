# Top three population by Continent

WITH top_three_population AS
(
SELECT 
	Name,
    Population,
    Continent,
    ROW_NUMBER() OVER (PARTITION BY Continent ORDER BY Population DESC) AS PBK
FROM world.country
)
SELECT Name, Population, Continent PBK FROM top_three_population
WHERE PBK < 4;
