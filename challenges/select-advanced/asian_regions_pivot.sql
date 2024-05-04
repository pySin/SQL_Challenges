# Asian Regions Pivot

SELECT MAX(Southern_and_Central_Asia) AS Southern_and_Central_Asia, MAX(Middle_East) AS Middle_East, 
	   MAX(Southeast_Asia) AS Southeast_Asia, MAX(Eastern_Asia) AS Eastern_Asia
FROM(
SELECT 
	CASE WHEN Region = "Southern and Central Asia" THEN Name END AS Southern_and_Central_Asia,
	CASE WHEN Region = "Middle East" THEN Name END AS Middle_East,
	CASE WHEN Region = "Southeast Asia" THEN Name END AS Southeast_Asia,
	CASE WHEN Region = "Eastern Asia" THEN Name END AS Eastern_Asia,
    ROW_NUMBER() OVER (PARTITION BY Region) AS RegionNumbers
FROM world.country WHERE Continent = "Asia") AS AsianRegions
GROUP BY RegionNumbers;
