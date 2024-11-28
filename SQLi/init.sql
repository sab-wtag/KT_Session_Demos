CREATE TABLE Products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category VARCHAR(50) NOT NULL
);


INSERT INTO Products (name, price, category) VALUES
('Laptop Pro', 1299.99, 'Electronics'),
('Smartphone X', 999.99, 'Electronics'),
('Headphones', 199.99, 'Electronics'),
('4K TV', 799.99, 'Electronics'),
('Gaming Console', 499.99, 'Gaming'),
('Wireless Mouse', 49.99, 'Accessories'),
('Keyboard', 69.99, 'Accessories'),
('Coffee Maker', 89.99, 'Appliances'),
('Blender', 59.99, 'Appliances'),
('Air Purifier', 129.99, 'Home');
