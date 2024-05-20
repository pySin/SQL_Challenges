# Binary Tree Nodes

CREATE DATABASE Challenges_05_2024;

CREATE TABLE Challenges_05_2024.binary_tree_nodes(N INT, P INT);
SHOW TABLES FROM Challenges_05_2024;

# -- 
SELECT * FROM Challenges_05_2024.binary_tree_nodes;

INSERT INTO Challenges_05_2024.binary_tree_nodes(N, P)
VALUES(1, 2),
	  (3, 2),
      (6, 8),
      (9, 8),
      (2, 5),
      (8, 5),
      (5, NULL);

#  --0-=

SELECT * FROM Challenges_05_2024.binary_tree_nodes;
SELECT N FROM Challenges_05_2024.binary_tree_nodes;

#--=-=

SELECT CASE
	WHEN N IN (SELECT P FROM Challenges_05_2024.binary_tree_nodes) AND P IS NOT NULL THEN 
    CONCAT(N, " Inner")
    WHEN P IS NULL THEN CONCAT(N, " Root")
    ELSE  CONCAT(N, " Leaf")
    END AS SB
FROM Challenges_05_2024.binary_tree_nodes
ORDER BY SB;
