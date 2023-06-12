create database shop;
use shop;
CREATE TABLE customers(
name VARCHAR(30) NOT NULL PRIMARY KEY,
email VARCHAR(50),
phone VARCHAR(12)
);
-- DML(data manipulation language)
-- 1.INSERT
INSERT INTO customers (name, email, phone)
VALUES ('Rishav', 'rishavparasar@gmail.com', '123-456');
INSERT INTO customers (name, email, phone)
VALUES ('Tanishk', 'tsonany69@gmail.com', '456-123');

-- 2.SELECT
select* from customers;

-- 3.UPDATE
UPDATE customers
SET phone = '456-169' WHERE name = 'Tanishk';
select* from customers;

-- 4.DELETE
DELETE FROM customers
WHERE name = 'Tanishk';
select* from customers;

-- DCL(data control language)
INSERT INTO customers (name, email, phone)
VALUES ('Tanishk', 'tsonany69@gmail.com', '456-169');
INSERT INTO customers (name, email, phone)
VALUES ('Aditya', 'aadityamishra43@gmail.com', '753-951');
INSERT INTO customers (name, email, phone)
VALUES ('Shreesh', 'shreeshStuart@gmail.com', '123-789');
-- APPLYING DCL TO THE DATABASE NOW

-- 1.GRANT SELECT PERMISSION TO USER
GRANT SELECT ON customers TO Rishav;
-- Granted select permission to user Rishav

-- 2.REVOKE INSERT PERMISSION FROM A USER
REVOKE INSERT ON customers FROM Rishav;
-- Revoked insert permission from user Rishav

-- 3.CREATE A ROLE FOR USER
CREATE ROLE data_analyst;
GRANT SELECT ON customers TO data_analyst;
-- created role data anylist