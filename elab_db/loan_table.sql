CREATE TABLE IF NOT EXISTS loan(
    loan_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    book_id INT NOT NULL,
    shelf_id SERIAL ,
    loan_date TIMESTAMP ,
    return_date TIMESTAMP,
    duration CHAR(15),
    statu VARCHAR(20) DEFAULT 'borrowed',

    CONSTRAINT fk_customer_loan
        FOREIGN KEY(customer_id) 
        REFERENCES customers(customer_id)  -- Referencing the primarry key
        ON DELETE CASCADE,

    CONSTRAINT fk_customer_book
        FOREIGN KEY(book_id) 
        REFERENCES books(book_id)  -- Referencing the primarry key
        ON DELETE CASCADE
);

