# Ollivander's Inventory

CREATE TABLE wands(
id INT,
code INT,
coins_needed INT,
power INT
);

INSERT INTO challenges_05_2024.wands(id, code, coins_needed, power)
VALUES(1, 4, 3688, 8),
	  (2, 3, 9365, 3),
      (3, 3, 7187, 10),
      (4, 3, 734, 8),
      (5, 1, 6020, 2),
      (6, 2, 6773, 7),
      (7, 3, 9873, 9),
      (8, 3, 7721, 7),
      (9, 1, 1647, 10),
      (10, 4, 504, 5),
      (11, 2, 7587, 5),
      (12, 5, 9897, 10),
      (13, 3, 46, 51),
      (14, 2, 5408, 1),
      (15, 2, 6018, 7),
      (16, 4, 7710, 5),
      (17, 2, 8798, 7),
      (18, 2, 3312, 3),
      (19, 4, 7651, 6),
      (20, 5, 5689, 3);

SELECT * FROM challenges_05_2024.wands;

CREATE TABLE wand_property(
code INT,
age INT,
is_evil INT
);

INSERT INTO wand_property(code, age, is_evil)
VALUES(1, 45, 0),
	  (2, 40, 0),
      (3, 4, 1),
      (4, 20, 0),
      (5, 17, 0);

SELECT * FROM challenges_05_2024.wand_property;

SELECT id, W.code, coins_needed, power, WP.code, age, is_evil FROM challenges_05_2024.wands AS W
JOIN challenges_05_2024.wand_property AS WP
ON W.code = WP.code
WHERE is_evil = 0
ORDER BY power DESC;

SELECT id, age, coins_needed, power FROM challenges_05_2024.wands AS W
JOIN challenges_05_2024.wand_property AS WP
ON W.code = WP.code
WHERE is_evil = 0
GROUP BY power
ORDER BY power DESC, age DESC;

# --=-

SELECT W.id, W.code, W.coins_needed, W.power, WP.code, WP.age, WP.is_evil FROM challenges_05_2024.wands AS W
JOIN challenges_05_2024.wand_property AS WP
ON W.code = WP.code
WHERE WP.is_evil = 0
ORDER BY W.power, age;

#--=-=-
# Similar to nested loop in Python

SELECT W.id, W.code, W.coins_needed, W.power, WP.code, WP.age, WP.is_evil
FROM challenges_05_2024.wands AS W
JOIN challenges_05_2024.wand_property AS WP
ON W.code = WP.code
WHERE WP.is_evil = 0
AND coins_needed = (SELECT MIN(coins_needed) # Minimal Value For it's group
					FROM challenges_05_2024.wands AS W2
                    JOIN challenges_05_2024.wand_property AS WP2
                    ON W2.code = WP2.code
                    WHERE W.power = W2.power AND WP.age = WP2.age)
ORDER BY W.power DESC, WP.age DESC;


SELECT MIN(coins_needed) FROM challenges_05_2024.wands;
