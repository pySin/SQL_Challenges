# Transaction 1

START TRANSACTION;
	INSERT INTO recall_2024.classes(id, class_name, duration_seconds, duration_plus_rest)
	VALUES(16, "Physics", 3000, 3500);

	INSERT INTO recall_2024.classes(id, class_name, duration_seconds, duration_plus_rest)
	VALUES(17, "Medicine", 4000, 4300);
    ROLLBACK;
COMMIT;

SELECT * FROM recall_2024.classes;