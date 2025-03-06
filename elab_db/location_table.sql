CREATE TABLE IF NOT EXISTS locations(
    location_id INT NOT NULL,
    addresses CHAR(255) NOT NULL,
    city CHAR(50) NOT NULL,
    states CHAR(50) NOT NULL,
    country CHAR(50)NOT NULL
)