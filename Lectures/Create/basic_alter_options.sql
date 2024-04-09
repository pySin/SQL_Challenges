# Basic Table Alterations

# Add Column Alteration
ALTER TABLE create_options.products ADD COLUMN origin_country VARCHAR(150) AFTER product_brand;

# ALTER column datatype or name
ALTER TABLE create_options.products MODIFY origin_country TEXT;
ALTER TABLE create_options.products CHANGE product_name product VARCHAR(120);

SELECT * FROM create_options.products;
DESCRIBE create_options.products;
