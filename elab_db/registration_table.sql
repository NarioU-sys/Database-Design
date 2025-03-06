CREATE TABLE IF NOT EXISTS registration(
    registration_id INT PRIMARY KEY,
    customer_id INT,
    reg_date TIMESTAMP,
    account_type VARCHAR(50) NOT NULL CHECK (account_type IN ('Online', 'Onsite', 'Foreign', 'Personal', 'Commercial')),
    username VARCHAR(100),
    pass_word VARCHAR(50),

    CONSTRAINT fk_customer_reg
        FOREIGN KEY(customer_id) 
        REFERENCES customers(customer_id)  -- Referencing the primarry key
        ON DELETE CASCADE


);

