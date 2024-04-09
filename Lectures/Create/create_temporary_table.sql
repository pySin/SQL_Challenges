# Create Temporary Table

CREATE TEMPORARY TABLE create_options.temp_product (
id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
easter_egg VARCHAR(255),
easter_chocolate VARCHAR(255),
caramel_bunny VARCHAR(255),
product_category INT
);

SELECT * FROM create_options.temp_product;
