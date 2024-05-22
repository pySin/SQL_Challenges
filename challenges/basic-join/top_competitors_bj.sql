# Top Competitors

CREATE TABLE Challenges_05_2024.Hackers(
hacker_id INT,
Name VARCHAR(200)
);

INSERT INTO Challenges_05_2024.Hackers(hacker_id, Name)
VALUES(5580, "Rose"),
	  (8439, "Angela"),
      (27205, "Frank"),
      (52243, "Patrick"),
      (52348, "Lisa"),
      (57645, "Kimberly"),
      (77726, "Bonnie"),
      (83082, "Michael"),
      (86870, "Todd"),
      (90411, "Joe");

SELECT * FROM Challenges_05_2024.Hackers;

# -=--==-
CREATE TABLE Challenges_05_2024.Difficulty(
difficulty_level INT,
score INT);

INSERT INTO Challenges_05_2024.Difficulty(difficulty_level, score)
VALUES(1 ,20),
	  (2, 30),
	  (3, 40),
	  (4, 60),
	  (5, 80),
	  (6, 100),
	  (7, 120);
	
SELECT * FROM Challenges_05_2024.Difficulty;

#-=-=
CREATE TABLE Challenges_05_2024.Challenges(
challenge_id INT,
hacker_id INT,
difficulty_level INT);

INSERT INTO Challenges_05_2024.Challenges(challenge_id, hacker_id, difficulty_level)
VALUES(4810, 77726, 4),
	  (21098, 27205, 1),
      (36566, 5580, 7),
      (66730, 52243, 6),
      (771055, 52243, 2);

SELECT * FROM challenges_05_2024.Challenges;

#--=-=-

CREATE TABLE challenges_05_2024.Submissions(
submission_id INT,
hacker_id INT,
challenge_id INT,
score INT);

INSERT INTO challenges_05_2024.Submissions(submission_id, hacker_id, challenge_id, score)
VALUES(68628, 77726, 36566, 30),
	  (65300, 77726, 21089, 10),
      (40326, 52243, 36566, 77),
      (8941, 27205, 4810, 4),
      (83554, 77726, 66730, 30),
      (43353, 52243, 66730, 0),
      (55385, 52348, 71055, 20),
      (39784, 27205, 71055, 23),
      (94613, 86870, 71055, 30),
      (45788, 52348, 36566, 0),
      (93058, 86870, 36566, 30),
      (7344, 8439, 66730, 92),
      (2721, 8439, 4810, 36),
      (523, 5580, 71055, 4),
      (49105, 52348, 66730, 0),
      (55877, 57645, 66730, 80),
      (38355, 27205, 66730, 35),
      (3924, 8439, 36566, 80),
      (97397, 90411, 66730, 100),
      (84162, 83082, 4810, 40),
      (97431, 90411, 71055, 30);

SELECT * FROM challenges_05_2024.Submissions;

# Joins
# How JOIN join many tables into one
SELECT * FROM challenges_05_2024.submissions AS Subs
JOIN challenges_05_2024.challenges AS Chal
ON Subs.challenge_id = Chal.challenge_id
JOIN challenges_05_2024.Difficulty AS Diff
ON Chal.difficulty_level = Diff.difficulty_level
JOIN challenges_05_2024.hackers AS Hacks
ON Hacks.hacker_id = Subs.hacker_id;

# --=--

SELECT Hacks.hacker_id, Name FROM challenges_05_2024.submissions AS Subs
JOIN challenges_05_2024.challenges AS Chal
ON Subs.challenge_id = Chal.challenge_id
JOIN challenges_05_2024.Difficulty AS Diff
ON Chal.difficulty_level = Diff.difficulty_level
JOIN challenges_05_2024.hackers AS Hacks
ON Hacks.hacker_id = Subs.hacker_id
WHERE Subs.score = Diff.score;

# Add more top result to enable grouping

INSERT INTO challenges_05_2024.Submissions(submission_id, hacker_id, challenge_id, score)
VALUES(68669, 5580, 21098, 20);

DELETE FROM challenges_05_2024.Submissions
WHERE submission_id = 68639;

SELECT * FROM challenges_05_2024.Submissions;
SELECT * FROM challenges_05_2024.Challenges;

# ==--+--

SELECT * FROM challenges_05_2024.submissions AS Subs
JOIN challenges_05_2024.challenges AS Chal
ON Subs.challenge_id = Chal.challenge_id;

# --+--=--


WITH TopPerformers AS
(SELECT Hacks.hacker_id AS h_id, Name AS TopName FROM challenges_05_2024.submissions AS Subs
JOIN challenges_05_2024.challenges AS Chal
ON Subs.challenge_id = Chal.challenge_id
JOIN challenges_05_2024.Difficulty AS Diff
ON Chal.difficulty_level = Diff.difficulty_level
JOIN challenges_05_2024.hackers AS Hacks
ON Hacks.hacker_id = Subs.hacker_id
WHERE Subs.score = Diff.score)
SELECT h_id, TopName, COUNT(TopName) AS TopResultsN FROM TopPerformers
GROUP BY TopName, h_id
ORDER BY TopResultsN DESC
LIMIT 1;


