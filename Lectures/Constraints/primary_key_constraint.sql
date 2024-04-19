# PRIMARY KEY in SQL
# There is a Composite Primary key

-- If the primary key consists of two or more columns, the values may be duplicated in one column,
-- but the combination of values from all columns in the primary key must be unique.

# -- 

CREATE TABLE recall_2024.tasks(
task_id INT PRIMARY KEY AUTO_INCREMENT,
description_t TEXT,
start_date DATE
);

INSERT INTO recall_2024.tasks(description_t, start_date) # id is automaticaly added
VALUES("Greet the guests", "2024-03-12");

SELECT * FROM recall_2024.tasks;

# Primary Key as table constraint
CREATE TABLE recall_2024.tasks_2(
task_id INT,
description_t TEXT,
start_date DATE,
	CONSTRAINT t_id PRIMARY KEY (task_id)
);

INSERT INTO recall_2024.tasks_2
VALUES(2, "Print Flyer", "2025-05-13");
SELECT * FROM recall_2024.tasks_2;

# 2 Column Primary Key

CREATE TABLE recall_2024.task_assignments(
task_id INT,
employee_id INT,
task_date DATE,
	CONSTRAINT emp_task PRIMARY KEY (task_id, employee_id)
);

INSERT INTO recall_2024.task_assignments
VALUES(2, 3, "2025-05-15");

SELECT * FROM recall_2024.task_assignments;
SELECT * FROM recall_2024.employee;

# Add PROMARY KEY with ALTER TABLE

CREATE TABLE recall_2024.non_pk_table(
id INT,
value_x VARCHAR(100)
);

ALTER TABLE recall_2024.non_pk_table
	ADD CONSTRAINT pk_non PRIMARY KEY (id);

DESCRIBE recall_2024.non_pk_table;

# OR

ALTER TABLE recall_2024.non_pk_table
ADD PRIMARY KEY (id);

# -- Removing PRIMARY KEY constraint
ALTER TABLE recall_2024.non_pk_table
DROP CONSTRAINT pk_non;

## Or

ALTER TABLE recall_2024.non_pk_table
DROP PRIMARY KEY;
