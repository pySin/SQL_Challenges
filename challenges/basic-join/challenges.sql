# Challenges

CREATE TABLE Challenges_05_2024.HackerChallenges(
hacker_id INT,
name VARCHAR(100)
);

DESCRIBE Challenges_05_2024.HackerChallenges;

INSERT INTO Challenges_05_2024.HackerChallenges(hacker_id, name)
VALUES(5077, "Rose"),
	  (21283, "Angela"),
      (62743, "Frank"),
      (88255, "Patrick"),
      (96196, "Lisa");

SELECT * FROM Challenges_05_2024.HackerChallenges;

CREATE TABLE ChallengesH(
challenge_id INT,
hacker_id INT);

SELECT * FROM Challenges_05_2024.ChallengesH;

INSERT INTO Challenges_05_2024.ChallengesH(challenge_id, hacker_id)
VALUES(61654, 5077),
	  (58302, 21283),
      (40587, 88255),
      (29477, 5077),
      (1220, 21283),
      (69514, 21283),
      (46561, 62743),
      (58077, 62743),
      (58077, 62743),
      (18483, 88255),
      (76766, 21283),
      (52382, 5077),
      (74467, 21283),
      (33625, 96196),
      (26053, 88255),
      (42665, 62743),
      (12859, 62743),
      (70094, 21283),
      (34599, 88255),
      (54680, 88255),
      (61881, 5077);

SELECT * FROM Challenges_05_2024.ChallengesH;

SELECT HC.name, HC.hacker_id, COUNT(challenge_id) FROM challenges_05_2024.HackerChallenges AS HC
JOIN challenges_05_2024.ChallengesH CH
ON HC.hacker_id = CH.hacker_id
GROUP BY HC.hacker_id, HC.name;

CREATE TABLE challenges_05_2024.ChallengesH2
AS SELECT * FROM challenges_05_2024.ChallengesH
WHERE challenge_id != 58077;

SELECT * FROM challenges_05_2024.ChallengesH2;

INSERT INTO challenges_05_2024.ChallengesH2(challenge_id, hacker_id)
VALUES(58077, 62743);

# Full Final Query
WITH BestHackers AS
	(SELECT HC.name, HC.hacker_id, COUNT(challenge_id) AS CHCount
	FROM challenges_05_2024.HackerChallenges AS HC
	JOIN challenges_05_2024.ChallengesH2 CH
	ON HC.hacker_id = CH.hacker_id
	GROUP BY HC.hacker_id, HC.name)
SELECT BH.name, BH.hacker_id, BH.CHCount
FROM BestHackers AS BH
HAVING (SELECT COUNT(BH2.CHCount) # Count the values that are currently in 
		FROM BestHackers AS BH2 # The upper loop
		WHERE BH2.CHCount = BH.CHCount) < 2;

# Middle stage
WITH BestHackers AS
(SELECT HC.name, HC.hacker_id, COUNT(challenge_id) AS CHCount FROM challenges_05_2024.HackerChallenges AS HC
JOIN challenges_05_2024.ChallengesH2 CH
ON HC.hacker_id = CH.hacker_id
GROUP BY HC.hacker_id, HC.name)
SELECT BH.name, BH.hacker_id, BH.CHCount, (SELECT COUNT(BH2.CHCount) 
										   FROM BestHackers AS BH2 
                                           WHERE BH2.CHCount = BH.CHCount) AS same_challenges
FROM BestHackers AS BH
HAVING same_challenges < 2;
