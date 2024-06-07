# Transactons with IF

DELIMITER $$
CREATE PROCEDURE recall_2024.`sp_fail11`()
BEGIN
	IF 5 > 6 THEN
	INSERT INTO recall_2024.classes(id, class_name, duration_seconds, duration_plus_rest)
	VALUES(27, "TSeven", 3000, 3500);
	END IF;
END$$
DELIMITER ;

# CALL recall_2024.sp_fail11();
SELECT * FROM recall_2024.classes;
