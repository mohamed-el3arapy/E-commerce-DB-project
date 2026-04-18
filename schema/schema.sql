CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    category_id INT,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock_quantity INT DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE `Order` (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Order_details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
INSERT INTO Category (category_id, category_name) VALUES 
(1, 'Electronics'), (2, 'Clothing'), (3, 'Home & Garden'), (4, 'Books'), (5, 'Sports');

INSERT INTO Product (product_id, category_id, name, description, price, stock_quantity) VALUES 
(101, 1, 'Laptop', 'High performance', 1200.00, 15),
(102, 2, 'Jacket', 'Leather winter jacket', 85.00, 40),
(103, 4, 'SQL Guide', 'Database textbook', 45.00, 100),
(104, 5, 'Yoga Mat', 'Non-slip exercise mat', 25.00, 60),
(105, 1, 'Mouse', 'Wireless optical mouse', 20.00, 200);

INSERT INTO Customer (customer_id, first_name, last_name, email, password) VALUES 
(1, 'Ahmed', 'Ali', 'ahmed@mail.com', 'pass123'),
(2, 'Sara', 'Khaled', 'sara@mail.com', 'sara789'),
(3, 'Omar', 'Zaid', 'omar@mail.com', 'omar555'),
(4, 'Mona', 'Hassan', 'mona@mail.com', 'mona_h'),
(5, 'Youssef', 'Amr', 'youssef@mail.com', 'y-1234');

INSERT INTO `Order` (order_id, customer_id, order_date, total_amount) VALUES 
(5001, 1, '2024-04-10', 1220.00),
(5002, 2, '2024-04-12', 85.00),
(5003, 3, '2024-04-15', 45.00),
(5004, 1, '2024-04-16', 25.00),
(5005, 4, '2024-04-17', 130.00);

INSERT INTO Order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES 
(1, 5001, 101, 1, 1200.00),
(2, 5001, 105, 1, 20.00),
(3, 5002, 102, 1, 85.00),
(4, 5003, 103, 1, 45.00),
(5, 5005, 103, 2, 45.00),
(6, 5005, 105, 2, 20.00);
