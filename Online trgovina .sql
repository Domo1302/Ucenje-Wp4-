USE master;
GO
CREATE DATABASE online_store;
GO

USE online_store;

CREATE TABLE kupci (
    user_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    lozinka VARCHAR(255) NOT NULL
);

CREATE TABLE proizvod (
    product_id INT IDENTITY(1,1) PRIMARY KEY,
    name_ VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL
);

CREATE TABLE orders (
    order_id INT IDENTITY(1,1) PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES kupci(user_id),
    FOREIGN KEY (product_id) REFERENCES proizvod(product_id)
);

INSERT INTO kupci (username, email, lozinka)
VALUES 
('john_doe', 'john@example.com', 'lozinka_1'),
('jane_smith', 'jane@example.com', 'lozinka_2');

INSERT INTO proizvod (name_, price, stock)
VALUES 
('Laptop', 850.97, 10),
('Phone', 699.99, 20),
('Headphones', 199.99, 50);
