-- CREATE TABLE IF NOT EXISTS purchase (
--     purchase_id SERIAL PRIMARY KEY,
--     order_id INT REFERENCES Orders(order_id) ON DELETE CASCADE,
--     amount DECIMAL(10, 2) NOT NULL,
--     method VARCHAR(50) NOT NULL CHECK (method IN ('Credit Card', 'Debit Card', 'PayPal', 'Bank Transfer', 'Cash')),
--     statu VARCHAR(50) NOT NULL CHECK (statu IN ('Pending', 'Completed', 'Failed')),
--     transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

--     CONSTRAINT fk_purchase_cus
--         FOREIGN KEY(customer_id) 
--         REFERENCES customers(customer_id)  -- Referencing the primarry key
--         ON DELETE CASCADE,
-- );

CREATE TABLE IF NOT EXISTS purchase (
    purchase_id SERIAL PRIMARY KEY,
    book_id INT REFERENCES books(book_id) ON DELETE CASCADE,
    customer_id INT NOT NULL, -- Added this line
    amount DECIMAL(10, 2) NOT NULL,
    method VARCHAR(50) NOT NULL CHECK (method IN ('Credit Card', 'Debit Card', 'PayPal', 'Bank Transfer', 'Cash')),
    status VARCHAR(50) NOT NULL CHECK (status IN ('Pending', 'Completed', 'Failed')),
    transaction_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_purchase_cus
        FOREIGN KEY(customer_id)
        REFERENCES customers(customer_id)
        ON DELETE CASCADE
);