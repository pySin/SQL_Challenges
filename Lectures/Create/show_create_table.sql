# Show create table

SHOW CREATE TABLE world_layoffs.layoffs;

CREATE TABLE `layoffs` (
   `company` text,
   `location` text,
   `industry` text,
   `total_laid_off` int DEFAULT NULL,
   `percentage_laid_off` text,
   `date` text,
   `stage` text,
   `country` text,
   `funds_raised_millions` int DEFAULT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;