CREATE DATABASE Axiastores;
USE Axiastores;
CREATE TABLE CustomerTB (CustomerID INT PRIMARY KEY,
First_Name VARCHAR(50),
Last_Name VARCHAR(50),
Email VARCHAR(50),
Phone VARCHAR(50),
City VARCHAR(50)
);
INSERT INTO CustomerTB (CustomerID, First_Name, Last_Name, Email, Phone, City)
VALUES (1, 'Musa', 'Ahmed', 'musa.ahmed@hotmail.com', 08031230001, 'Lagos'),
	   (2, 'Ray', 'Samson', 'ray.samson@yahoo.com', 08031230002, 'Ibadan'),
       (3, 'Chinedu', 'Okafor', 'chinedu.ok@yahoo.com', 08031230003, 'Enugu'),
       (4, 'Dare', 'Adewale', 'dare.ad@hotmail.com', 08031230004, 'Abuja'),
       (5, 'Efe', 'Ojo', 'efe.oj@gmail.com', 08031230005, 'Port Harcourt'),
       (6, 'Aisha', 'Bello', 'aisha.bello@hotmail.com', 08031230006, 'Kano'),
       (7, 'Tunde', 'Salami', 'tunde.salami@yahoo.com', 08031230007, 'Ilorin'),
       (8, 'Nneka', 'Umeh', 'nneka.umeh@gmail.com', 08031230008, 'Owerri'),
	   (9, 'Kelvin', 'Peters', 'kelvin.peters@hotmail.com', 08031230009, 'Asaba'),
	   (10, 'Blessing', 'Mark', 'blessing.mark@gmail.com', 08031230010, 'Uyo');
       

DROP TABLE ProductTB;
       
USE Axiastores;
CREATE TABLE ProductTB (ProductID INT PRIMARY KEY,
Product_Name VARCHAR(50),
Category VARCHAR(50),
Unit_Price DECIMAL,
Stock_Qty INT
);

INSERT INTO ProductTB (ProductID, Product_Name, Category, Unit_Price, Stock_Qty)
VALUES (1, 'Wireless Mouse', 'Accessories', 7500, 120),
	   (2, 'USB‑C Charger 65W', 'Electronics', 14500, 75),
       (3, 'Noise‑Cancel Headset', 'Audio', 85500, 50),
       (4, '27" 4K Monitor', 'Displays', 185000, 20),
       (5, 'Laptop Stand', 'Accessories', 19500, 90),
	   (6, 'Bluetooth Speaker', 'Audio', 52000, 60),
       (7, 'Mechanical Keyboard', 'Accessories', 18500, 40),
	   (8, 'WebCam 1080p', 'Electronics', 25000, 55),
	   (9, 'Smartwatch Series 5', 'Wearables', 320000, 30),
       (10, 'Portable SSD 1TB', 'Storage', 125000, 35);
       
USE Axiastores;
CREATE TABLE OrdersTB (OrderID INT PRIMARY KEY,
CustomerID INT REFERENCES CustomerTB(CustomerID),
ProductID INT REFERENCES ProductTB(ProductID),
Order_Date DATE,
Quantity INT
);

INSERT INTO OrdersTB (OrderID, CustomerID, ProductID, Order_Date, Quantity)
VALUES (1001, 1, 3, 20250601, 1),
	   (1002, 2, 1, 20250603, 2),
       (1003, 3, 5, 20250605, 1),
       (1004, 4, 4, 20250610, 1),
	   (1005, 5, 2, 20250612, 3),
	   (1006, 6, 7, 20250615, 1),
	   (1007, 7, 6, 20250618, 2),
	   (1008, 8, 8, 20250620, 1),
	   (1009, 9, 9, 20250622, 1),
       (1010, 10, 10,  20250625, 2);
       
-- Return the FirstName and Email of every customer who has ever purchased the product “Wireless Mouse”.
       
SELECT c.First_Name, c.Email, p.Product_Name
FROM CustomerTB AS c
JOIN OrdersTB AS od
ON c.CustomerID = od.CustomerID
JOIN ProductTB AS p
ON p.ProductID = od.ProductID
WHERE Product_Name = 'Wireless Mouse';

-- List all customers’ full names in ascending alphabetical order (LastName, then FirstName).

SELECT Last_Name, First_Name 
FROM CustomerTB 
ORDER BY Last_Name ASC;

-- Show every order together with the customer’s full name, the product name, quantity, unit price, total price (quantity × unit price), and order date. 

SELECT c.Last_Name, c.First_Name, pt.Product_Name, od.quantity, pt.Unit_Price, od.Order_Date
FROM CustomerTB AS c
JOIN OrdersTB AS od
ON c.customerID = od.CustomerID
JOIN ProductTB AS pt
ON pt.ProductID = od.ProductID;

-- Show average sales per product category and sort in descending order 

SELECT pt.Category, od.Quantity
FROM ProductTB AS pt
JOIN OrdersTB AS od
ON pt.ProductID = od.ProductID
ORDER BY od.Quantity DESC;

-- Which city generated the highest revenue for AxiaStores? 
SELECT c.City, 





       
       
       




