# Alter Table Table Structures

# Add Column

-- ALTER TABLE table_name
-- ADD new_colum data_type column_constraint [AFTER existing_column];
-- Without the after clause the new column is added at the end.
SELECT * FROM recall_2024.products;

ALTER TABLE recall_2024.products
ADD year_made INT AFTER id;

INSERT INTO recall_2024.products
VALUES(4, 2024, "TV", "Philips");

# Add Multiple Columns
ALTER TABLE recall_2024.products
ADD weight INT AFTER id,
ADD size INT AFTER id;


 # Modify Column
 
 ALTER TABLE recall_2024.products
 MODIFY size SMALLINT;
 
 DESCRIBE recall_2024.products;
 
# DROP column / DROP COLUMN may be used instead just DROP

ALTER TABLE recall_2024.products
DROP size,
DROP weight;
 
 DESCRIBE recall_2024.products;
 
 
 
