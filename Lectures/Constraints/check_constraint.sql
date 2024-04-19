# CHACK Constraint

# -- Syntax: CONSTRAINT constraint_name CHECK(Boolean_expression)
# CHECK is satisfied when expression returns True OR NULL!!! Use NOT NULL for the column.

# Simple CHECK Constraint
CREATE TABLE classes(
id INT AUTO_INCREMENT PRIMARY KEY,
class_name VARCHAR(230),
	duration_seconds INT CHECK (duration_seconds > 0)
);

# -- Named CHECK Constraint
DROP TABLE recall_2024.classes;

CREATE TABLE classes(
id INT AUTO_INCREMENT PRIMARY KEY,
class_name VARCHAR(230),
duration_seconds INT,
	CONSTRAINT positive_duration CHECK (duration_seconds > 0)
);

DESCRIBE recall_2024.classes;

INSERT INTO recall_2024.classes(class_name, duration_seconds)
VALUES("Music", -5); # CHECK Constraint Violation
SELECT * FROM recall_2024.classes;

# Multiple CHECK's in a table / Table columns compare

CREATE TABLE classes(
id INT AUTO_INCREMENT PRIMARY KEY,
class_name VARCHAR(230),
duration_seconds INT CHECK (duration_seconds > 0),
duration_plus_rest INT CHECK (duration_plus_rest > 0),
CHECK (duration_plus_rest > duration_seconds) # Separate CHECK Constraint
);

INSERT INTO recall_2024.classes(class_name, duration_seconds, duration_plus_rest)
VALUES("History", 2000, 1000); # Third CHECK Constraint is Violated / Table Constraint

SELECT * FROM recall_2024.classes;

# Named Table Constraint

CREATE TABLE classes(
id INT AUTO_INCREMENT PRIMARY KEY,
class_name VARCHAR(230),
duration_seconds INT CHECK (duration_seconds > 0),
duration_plus_rest INT CHECK (duration_plus_rest > 0),
CONSTRAINT proper_durations CHECK (duration_plus_rest > duration_seconds) # Separate CHECK Constraint
);

INSERT INTO recall_2024.classes(class_name, duration_seconds, duration_plus_rest)
VALUES("History", 2000, 1000); # proper_durations Violated

