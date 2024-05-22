# Average Population Per Continent

SELECT Continent, AVG(wci.Population) AS AVGContCityPop FROM world.city AS wci
JOIN world.country AS wc
ON wci.CountryCode = wc.Code
GROUP BY Continent;
