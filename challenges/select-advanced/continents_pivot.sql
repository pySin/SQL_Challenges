# Continents Pivot

SELECT MAX(NorthAmerica) AS NorthAmerica, MAX(Asia) AS Asia, MAX(Africa) AS Africa, 
							MAX(SouthAmerica) AS SouthAmerica, MAX(Europe) AS Europe, MAX(Oceania) AS Oceania
FROM (SELECT 
	CASE WHEN Continent = "North America" THEN Name END AS NorthAmerica,
	CASE WHEN Continent = "Asia" THEN Name END AS Asia,
	CASE WHEN Continent = "Africa" THEN Name END AS Africa,
	CASE WHEN Continent = "South America" THEN Name END AS SouthAmerica,
	CASE WHEN Continent = "Europe" THEN Name END AS Europe,
	CASE WHEN Continent = "Oceania" THEN Name END AS Oceania,
    ROW_NUMBER() OVER (PARTITION BY Continent) AS cn
FROM world.country) AS wc
GROUP BY cn;
