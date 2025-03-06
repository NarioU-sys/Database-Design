CREATE TABLE IF NOT EXISTS collection(
    collection_id int PRIMARY KEY,
    shelf_id int UNIQUE,
    book_id INT,
    --book_title VARCHAR(255)

    CONSTRAINT fk_shelf
        FOREIGN KEY(shelf_id) 
        REFERENCES shelf(shelf_id)  -- Referencing the primarry key
        ON DELETE CASCADE,

    CONSTRAINT fk_book
        FOREIGN KEY(book_id) 
        REFERENCES books(book_id)  
        ON DELETE CASCADE



);