# Union Operator

SELECT * FROM employee;
SELECT * FROM products;

INSERT INTO recall_2024.products(id, product_name, product_brad)
VALUES(1, "Smarthphone", "Xiaomi"),
	  (2, "Smarthphone", "Apple"),
	  (3, "Earbuds", "Sennhaiser");

SELECT Name, manager_id FROM recall_2024.employee
UNION
SELECT product_name, product_brad FROM recall_2024.products;

# Union with ORDER BY
SELECT Name, manager_id FROM recall_2024.employee
UNION
SELECT product_name, product_brad FROM recall_2024.products
ORDER BY Name;

