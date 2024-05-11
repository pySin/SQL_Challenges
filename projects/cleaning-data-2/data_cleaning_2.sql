# Data Cleaning 2

SELECT * FROM recall_2024.classes;
DESCRIBE recall_2024.classes;

INSERT INTO recall_2024.classes(class_name, duration_seconds, duration_plus_rest)
VALUES("Biology", 2000, 5001);

# SELECT DISTINCT class_name, duration_seconds, duration_plus_rest FROM recall_2024.classes;

WITH class_subselect AS
(
SELECT id, class_name, duration_seconds, duration_plus_rest,
ROW_NUMBER() OVER (PARTITION BY class_name, duration_seconds, duration_plus_rest) AS DuplicateX
FROM recall_2024.classes
)
DELETE FROM recall_2024.classes
WHERE id = (SELECT id FROM class_subselect
WHERE DuplicateX  > 1);

#
CREATE TABLE recall_2024.classes_2 (
  `id` int NOT NULL AUTO_INCREMENT,
  `class_name` varchar(230) DEFAULT NULL,
  `duration_seconds` int DEFAULT NULL,
  `duration_plus_rest` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `classes_chk_3` CHECK ((`duration_seconds` > 0)),
  CONSTRAINT `classes_chk_4` CHECK ((`duration_plus_rest` > 0)),
  CONSTRAINT `proper_durations_2` CHECK ((`duration_plus_rest` > `duration_seconds`))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO recall_2024.classes_2(`id`, `class_name`, `duration_seconds`, `duration_plus_rest`)
WITH cur_class AS
(SELECT DISTINCT class_name, duration_seconds, duration_plus_rest FROM recall_2024.classes)
SELECT ROW_NUMBER() OVER (ORDER BY class_name) AS id, class_name, duration_seconds, duration_plus_rest
FROM cur_class;

SELECT * FROM recall_2024.classes_2;
