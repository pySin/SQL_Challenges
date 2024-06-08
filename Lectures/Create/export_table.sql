# Export Table

SHOW VARIABLES LIKE "secure_file_priv";

SELECT * FROM recall_2024.classes INTO OUTFILE "C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/classes.csv"
FIELDS TERMINATED BY ',' ENCLOSED BY '"';
