CREATE TABLE IF NOT EXISTS shelf(
    shelf_id SERIAL PRIMARY KEY,
    book_id INT NOT NULL,
    collections VARCHAR(50),
    genre VARCHAR(50)

);