CREATE TABLE IF NOT EXISTS library(
    library_id INT PRIMARY KEY,
    library_reg_id INT UNIQUE,
    library_name VARCHAR(255)
);