CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY , --incremental key
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    pass_word VARCHAR(100) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    addreses VARCHAR(255),
    city VARCHAR(100),
    states VARCHAR(100),
    zip_code VARCHAR(20) ,
    country VARCHAR(50),
    phone_number CHAR(15) NOT NULL UNIQUE,
    activity_status CHAR(15),
    is_admin BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);
