CREATE TABLE IF NOT EXISTS interaction(
    interaction_id SERIAL NOT NUll PRIMARY KEY,
    customer_id INT ,
    registration_id INT,
    interaction_type VARCHAR(30) NOT NULL CHECK(interaction_type IN('Social_media', 'Email', 'Phone', 'Text')),
    interaction_rating VARCHAR(30) NOT NULL CHECK(interaction_rating IN('Fair', 'Good', 'Excellent', 'Bad', 'Worse')),

    CONSTRAINT fk_customer_int
        FOREIGN KEY(customer_id) 
        REFERENCES customers(customer_id)  -- Referencing the primarry key
        ON DELETE CASCADE,
        

    CONSTRAINT fk_reg_int
        FOREIGN KEY(registration_id) 
        REFERENCES registration(registration_id)  -- Referencing the primarry key
        ON DELETE CASCADE
)