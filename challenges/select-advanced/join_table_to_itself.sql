# Join Table to itself

SELECT wc1.Name, wc1.Continent, wc2.Name, wc2.Continent,
	   wc1.Population AS col1_pop, wc2.Population AS col2_pop,
	   (wc1.Population + wc2.Population) AS Combined_Population FROM world.country AS wc1
LEFT JOIN world.country AS wc2
ON wc1.Continent = wc2.continent
WHERE wc1.Population * 2 < wc2.Population;
