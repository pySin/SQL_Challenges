# Find Typos


# Find typos
SELECT l1.company, l2.company FROM recall_2024.layoffs_r AS l1
JOIN recall_2024.layoffs_r AS l2
ON SUBSTRING(l1.company, 1, LENGTH(l1.company) - 1) = SUBSTRING(l2.company, 1, LENGTH(l2.company) - 1)
WHERE l1.company != l2.company
AND LENGTH(l1.company) > 3;
