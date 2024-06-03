# Find Duplicates by numbering same rows

SELECT * FROM recall_2024.classes;

WITH dupl_classes AS
(SELECT ROW_NUMBER() OVER (PARTITION BY class_name, duration_seconds, duration_plus_rest) AS duplicates,
class_name, duration_seconds, duration_plus_rest
FROM recall_2024.classes)
SELECT duplicates, class_name, duration_seconds, duration_plus_rest
FROM dupl_classes
WHERE duplicates > 1;
