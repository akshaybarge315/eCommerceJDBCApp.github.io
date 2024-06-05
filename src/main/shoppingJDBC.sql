create database eCommerceJDBC;

use eCommerceJDBC;

CREATE TABLE User (
  userId INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  username VARCHAR(50) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  phone VARCHAR(20),
  createdDate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Products (
  productId INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  rating decimal(3,2) NOT NULL,
  price DECIMAL(10,2) NOT NULL, 
  category VARCHAR(50) NOT NULL,
  stock INT NOT NULL
);

CREATE TABLE OrderTable (
  orderId INT PRIMARY KEY AUTO_INCREMENT,  
  userId INT NOT NULL,  
  productId INT NOT NULL,
  orderDate datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,                 
  status ENUM('pending', 'shipped', 'delivered', 'canceled') NOT NULL DEFAULT 'pending', 
  price DECIMAL(10,2) NOT NULL,
  paymentMode varchar(20),
  FOREIGN KEY (userId) REFERENCES User(userId),
  FOREIGN KEY (productId) REFERENCES Products(productId)
);

CREATE TABLE OrderItem (
  orderItemId INT PRIMARY KEY AUTO_INCREMENT,
  orderId INT NOT NULL,
  productId INT NOT NULL,
  quantity INT NOT NULL,
  totalPrice DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (orderId) REFERENCES OrderTable(orderId),
  FOREIGN KEY (productId) REFERENCES Products(productId)
);

DROP Table orderitem;
DROP Table ordertable;

CREATE TEMPORARY TABLE temp_orderitem_prices (
    orderItemId INT,
    totalPrice DECIMAL(10,2),
    PRIMARY KEY (orderItemId)
);

-- DROP TEMPORARY TABLE temp_orderitem_prices; 

-- INSERT INTO `ecommercejdbc`.`orderitem` (`orderItemId`, `orderId`, `productId`, `quantity`, `totalPrice`)
-- VALUES ('10002', '4', '1004', '2', (SELECT price FROM Products WHERE productId = '1004') * 2);

-- INSERT INTO `ecommercejdbc`.`orderitem` (`orderId`, `productId`, `quantity`, `totalPrice`)
-- VALUES ('103', '1003', '3', '0');


-- TRIGGER FOR TOTAL AMOUT IN ORDERiTEM TABLE	
-- Delimiter //
-- CREATE TRIGGER update_orderitem_price
-- AFTER INSERT ON OrderItem
-- FOR EACH ROW
-- BEGIN
--   DECLARE temp_price DECIMAL(10,2);  -- Use DECIMAL for price calculations

--   -- Get the price from Products table based on inserted product ID
--   SELECT price INTO temp_price FROM Products WHERE productId = NEW.productId;

--   -- Insert calculated price into temporary table
--   INSERT INTO temp_orderitem_prices (orderItemId, totalPrice)
--   VALUES (NEW.orderItemId, NEW.quantity * temp_price);
-- END;
-- //

-- DROP TRIGGER update_orderitem_price; 

-- INSERT INTO User (name, username, password, email, phone)
-- VALUES ('John Doe', 'johndoe',  '123@123', 'johndoe@example.com', '7234567890'),
--        ('Jane Smith', 'janesmith', '000@000!', 'janesmith@example.com', '9876543210'),
--        ('Michael Brown', 'mikebrown', '111@111', 'mikebrown@example.com', '8123456789');


-- INSERT INTO Products (name, description, rating, price, category, stock)
-- VALUES ('Running Shoes', 'Lightweight and breathable running shoes for ultimate comfort and performance.', 4.5, 79.99, 'Clothing', 25),
--        ('Smartwatch', 'Multifunctional smartwatch with fitness tracking, notifications, and customizable watch faces.', 4.3, 199.99, 'Electronics', 30),
--        ('Coffee Maker', 'Programmable coffee maker with brew strength control and automatic shut-off.', 4.2, 39.99, 'Kitchen', 100),
--        ('Laptop Backpack', 'Stylish and durable laptop backpack with padded compartments and multiple pockets for organization.', 4.7, 49.99, 'Bags', 40);

-- INSERT INTO OrderTable (userId, productId, orderDate, status, price, paymentMode)
-- VALUES (1, 1001, CURRENT_TIMESTAMP, 'pending', 129.99, 'Debit Card'),
-- 		(3, 1003, CURRENT_TIMESTAMP, 'pending', 199.99, 'Cash'),
--        (2, 1002, CURRENT_TIMESTAMP, 'pending', 79.99, 'Debit Card');

-- INSERT INTO OrderItem (orderId, productId, quantity, totalPrice)
-- VALUES (1, 1, 1, 0),
--        (2, 2, 1, 0);
