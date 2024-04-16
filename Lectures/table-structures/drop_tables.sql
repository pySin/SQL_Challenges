# Drop Table

# -- Syntax
# DROP TABLE [IF EXISTS] table_name;

CREATE TABLE recall_2024.personal_lockers(
employee_id INT,
key_number INT
);

DROP TABLE recall_2024.personal_lockers;

# Truncate Table
SELECT * FROM recall_2024.personal_lockers;
INSERT INTO recall_2024.personal_lockers
VALUES(1, 2);

TRUNCATE TABLE recall_2024.personal_lockers; 

# Remove multiple tables
# DROP TABLE table_name1,table_name2,...;
