# SELECT CASE

SELECT Name, IndepYear, CASE
	WHEN IndepYear > 1900 THEN "Young"
    ELSE "Old"
    END CountryHistory
 FROM world.country;

# CASE pre-created case to check

SELECT Name, IndepYear, CASE(YEAR(CURDATE()) - IndepYear)
	WHEN 105 THEN "Exact"
    ELSE "Not Exact"
    END CountryHistory
 FROM world.country
 ORDER BY CountryHistory ASC;

# -- CASE with True - False checker

SELECT Name, IndepYear, CASE(YEAR(CURDATE()) - IndepYear > 100)
	WHEN TRUE THEN "Older than 100 years."
    ELSE "Younger than 100 years."
    END CountryHistory
 FROM world.country
 ORDER BY CountryHistory ASC;

