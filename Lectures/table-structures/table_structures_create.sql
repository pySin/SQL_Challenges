# Table Structures

-- CREATE TABLE table_name(
--      column_name_1 data_type default value column_constraint,
--      column_name_2 data_type default value column_constraint,
--      ...,
--      table_constraint
-- );

# Create table
CREATE TABLE recall_2024.courses (
    course_id INT AUTO_INCREMENT PRIMARY KEY,
    course_name VARCHAR(50) NOT NULL
);

CREATE TABLE recall_2024.trainings (
    employee_id INT,
    course_id INT,
    taken_date DATE,
    PRIMARY KEY (employee_id , course_id) # the combination of employee_id, and course_id has to be unique
										  # so they both are  the PRIMARY KEY
);



