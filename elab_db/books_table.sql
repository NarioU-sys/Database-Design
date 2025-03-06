CREATE TABLE IF NOT EXISTS books(
    book_id int PRIMARY KEY,
    book_title VARCHAR(255) NOT NULL,
    author VARCHAR(100),
    publication_date DATE ,
    languages VARCHAR (50),
    copies int
);


-- USING THE GENERATE SERIES
-- TO LOAD DATA INTO THE DATABASE


