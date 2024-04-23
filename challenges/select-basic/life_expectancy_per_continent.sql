# Life Expectancy per Continent

SELECT Continent, COALESCE(ROUND(AVG(LifeExpectancy)), 0) AS AVG_LE FROM world.country
GROUP BY Continent;