CREATE TABLE IF NOT EXISTS dates(
    date_id SERIAL PRIMARY KEY,
    dates DATE NOT NULL,
    day INT NOT NULL,
    month INT NOT NULL,
    week_of_year INT,
    year INT NOT NULL
    
);