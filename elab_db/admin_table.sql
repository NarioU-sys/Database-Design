-- Initializing the fact ADMIN of e_library database

CREATE TABLE IF NOT EXISTS administration (
    admin_id INT NOT NULL PRIMARY KEY,
    customer_id INT NOT NULL,
    registration_id INT NOT NULL,
    date_id INT NOT NULL,
    location_id INT NOT NULL,
    loan_id INT NOT NULL,
    purchase_id INT NOT NULL,
    interaction_id INT NOT NULL,
    library_id INT NOT NULL,
    is_admin BOOLEAN DEFAULT FALSE,
    attendance_status VARCHAR(20) NOT NULL CHECK (attendance_status IN ('CHECKED', 'NOT_CHECKED')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT NOW() NOT NULL,

    CONSTRAINT fk_customer
        FOREIGN KEY (customer_id) 
        REFERENCES customers(customer_id),

    CONSTRAINT fk_registration
        FOREIGN KEY (registration_id) 
        REFERENCES registration(registration_id),

    CONSTRAINT fk_date
        FOREIGN KEY (date_id) 
        REFERENCES dates(date_id),

    -- CONSTRAINT fk_location
    --     FOREIGN KEY (location_id) 
    --     REFERENCES locations(location_id),

    CONSTRAINT fk_loan
        FOREIGN KEY (loan_id) 
        REFERENCES loan(loan_id),

    CONSTRAINT fk_purchase
        FOREIGN KEY (purchase_id) 
        REFERENCES purchase(purchase_id),

    CONSTRAINT fk_interaction
        FOREIGN KEY (interaction_id) 
        REFERENCES interaction(interaction_id),

    CONSTRAINT fk_library
        FOREIGN KEY (library_id) 
        REFERENCES library(library_id)
);


-- CREATE TABLE IF NOT EXISTS administration (
--     admin_id INT NOT NULL PRIMARY KEY,
--     customer_id INT NOT NULL,
--     registration_id INT NOT NULL,
--     date_id INT NOT NULL,
--     location_id INT NOT NULL,
--     loan_id INT NOT NULL,
--     purchase_id INT NOT NULL,
--     interaction_id INT NOT NULL,
--     library_id INT NOT NULL,
--     is_admin BOOLEAN DEFAULT FALSE,
--     attendance_status VARCHAR(20) CHECK(attendance_status IN('CHECKED','NOT_CHECKED')),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

--     CONSTRAINT fk_customer
--         FOREIGN KEY(customer_id) 
--         REFERENCES customers(customer_id),

--     CONSTRAINT fk_registration
--         FOREIGN KEY(registration_id) 
--         REFERENCES registration(registration_id),

--     CONSTRAINT fk_date
--         FOREIGN KEY(date_id) 
--         REFERENCES dates(date_id),

--     -- CONSTRAINT fk_location
--     --     FOREIGN KEY(location_id) 
--     --     REFERENCES locations(location_id),
--     CONSTRAINT fk_location
--         FOREIGN KEY(location_id) 
--         REFERENCES locations(location_id),

--     CONSTRAINT fk_loan
--         FOREIGN KEY(loan_id) 
--         REFERENCES loan(loan_id),

--     CONSTRAINT fk_purchase
--         FOREIGN KEY(purchase_id) 
--         REFERENCES purchase(purchase_id),

--     CONSTRAINT fk_interaction
--         FOREIGN KEY(interaction_id) 
--         REFERENCES interaction(interaction_id),

--     CONSTRAINT fk_library
--         FOREIGN KEY(library_id) 
--         REFERENCES library(library_id)
-- );