# UNIQUE Constraint

# UNIQUE allowes multiple NULL values

# -- Create Unique Constraint

CREATE TABLE recall_2024.subscribers(
id INT AUTO_INCREMENT PRIMARY KEY,
email VARCHAR(250) NOT NULL UNIQUE,
password_x VARCHAR(120) NOT NULL
);

# Add UNIQUE as a named Constrain

CREATE TABLE recall_2024.subscribers(
id INT AUTO_INCREMENT PRIMARY KEY,
email VARCHAR(250) NOT NULL,
password_x VARCHAR(120) NOT NULL,
	CONSTRAINT uni_email UNIQUE (email)
);

# Add UNIQUE Constraint to an Existing Table

CREATE TABLE recall_2024.subscribers_2(
id INT AUTO_INCREMENT PRIMARY KEY,
email VARCHAR(250) NOT NULL,
password_x VARCHAR(120) NOT NULL
);

DESCRIBE recall_2024.subscribers_2;

ALTER TABLE recall_2024.subscribers_2
ADD CONSTRAINT uni_email UNIQUE(email);

# Add new column with UNIQUE Constraint
ALTER TABLE recall_2024.subscribers_2
ADD COLUMN work_email VARCHAR(120) UNIQUE;

# Removing Unique Constraint

ALTER TABLE recall_2024.subscribers_2
DROP CONSTRAINT uni_email;

