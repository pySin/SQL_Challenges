# Life Expectancy Bins

SELECT MAX(low_37__44_84), MAX(low_44_84__52_68), MAX(low_52_68__60_52),
MAX(high_60_52__68_36), MAX(high_68_36__76_20), MAX(high_76_20__84_04)
FROM(
SELECT
	CASE WHEN LifeExpectancy > 37 AND LifeExpectancy <= 44.84 THEN Name END AS low_37__44_84,
    CASE WHEN LifeExpectancy > 44.84 AND LifeExpectancy <= 52.68 THEN Name END AS low_44_84__52_68,
    CASE WHEN LifeExpectancy > 52.68 AND LifeExpectancy <= 60.52 THEN Name END AS low_52_68__60_52,
    CASE WHEN LifeExpectancy > 60.52 AND LifeExpectancy <= 68.36 THEN Name END AS high_60_52__68_36,
    CASE WHEN LifeExpectancy > 68.36 AND LifeExpectancy <= 76.20 THEN Name END AS high_68_36__76_20,
    CASE WHEN LifeExpectancy > 76.20 AND LifeExpectancy <= 84.04 THEN Name END AS high_76_20__84_04,
    ROW_NUMBER() OVER (PARTITION BY LifeExpectancy) AS lep
    # @counter := @counter + 1 AS SimpleCounter
FROM world.country) AS LE_BINS
GROUP BY lep;
