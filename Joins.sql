create database shop;
use shop;
-- CREATED TABLE CUSTOMERS
CREATE TABLE customers (
id INT PRIMARY KEY,
name VARCHAR(50),
email VARCHAR(100),
phone VARCHAR(20)
);
-- CREATED TABLE ORDERS
CREATE TABLE orders (
id INT PRIMARY KEY,
customer_id INT,
order_date DATE,
total_amount DECIMAL(10,2),
FOREIGN KEY (customer_id) REFERENCES customers(id)
);
-- INSERTED DATA INTO TABLE CUSTOMERS
INSERT INTO customers (id, name, email, phone)
VALUES (1, 'Rishav', 'rishavparasar@gmail.com', '555-1234');
INSERT INTO customers (id, name, email, phone)
VALUES (2, 'Tanishk', 'tsonany69@gmail.com', '555-5678');
-- INSERTED DATA INTO TABLE ORDERS
INSERT INTO orders (id, customer_id, order_date, total_amount)
VALUES (1, 1, '2022-01-01', 100.00);
INSERT INTO orders (id, customer_id, order_date, total_amount)
VALUES (2, 2, '2022-02-01', 200.00);

-- DEPLOYED JOINS QUERIES
-- 1. INNER JOIN
SELECT customers.name, orders.order_date
FROM customers
INNER JOIN orders ON customers.id = orders.customer_id;

-- 2. LEFT JOIN
SELECT customers.name, orders.order_date
FROM customers
LEFT JOIN orders ON customers.id = orders.customer_id;

-- 3. RIGHT JOIN
SELECT customers.name, orders.order_date
FROM customers
RIGHT JOIN orders ON customers.id = orders.customer_id;

-- 4. FULL OUTER JOIN
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
LEFT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
UNION
SELECT Customers.CustomerName, Orders.OrderID
FROM Customers
RIGHT JOIN Orders ON Customers.CustomerID = Orders.CustomerID
ORDER BY CustomerName;

-- 5. CROSS JOIN
SELECT customers.name, orders.total_amount
FROM customers
CROSS JOIN orders;