# ROW_NUMBER() By group

SELECT ROW_NUMBER() OVER (PARTITION BY continent ORDER BY continent) AS Cont_Rows, Name, Continent
FROM world.country;