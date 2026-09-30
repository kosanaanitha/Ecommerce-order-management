-- CUSTOMER DATA

INSERT INTO CUSTOMER
(Customer_ID, Name, Email, Phone, Address)
VALUES
('C001', 'Ananya', 'ananya@example.com', '9876543210', 'Hyderabad'),
('C002', 'Rahul', 'rahul@example.com', '9123456780', 'Vijayawada'),
('C003', 'Siri', 'siri@example.com', '9988776655', 'Visakhapatnam');


-- PRODUCT DATA

INSERT INTO PRODUCT
(Product_ID, Name, Category, Price, Stock_Qty)
VALUES
('P001', 'Laptop', 'Electronics', 55000.00, 10),
('P002', 'Headphones', 'Electronics', 2499.00, 25),
('P003', 'Smart Watch', 'Electronics', 3299.00, 15),
('P004', 'Keyboard', 'Accessories', 1599.00, 20);


-- ORDER DATA

INSERT INTO ORDERS
(Order_ID, Customer_ID, Order_Date, Status, Total_Amount)
VALUES
('O101', 'C001', '2026-09-20', 'Paid', 2499.00),
('O102', 'C002', '2026-09-21', 'Shipped', 1599.00),
('O103', 'C003', '2026-09-22', 'Delivered', 3299.00);


-- ORDER ITEM DATA

INSERT INTO ORDER_ITEM
(Order_Item_ID, Order_ID, Product_ID, Quantity, Unit_Price)
VALUES
('OI001', 'O101', 'P002', 1, 2499.00),
('OI002', 'O102', 'P004', 1, 1599.00),
('OI003', 'O103', 'P003', 1, 3299.00);


-- PAYMENT DATA

INSERT INTO PAYMENT
(Payment_ID, Order_ID, Method, Amount, Payment_Status)
VALUES
('PAY001', 'O101', 'UPI', 2499.00, 'Paid'),
('PAY002', 'O102', 'Card', 1599.00, 'Paid'),
('PAY003', 'O103', 'UPI', 3299.00, 'Paid');


-- SHIPMENT DATA

INSERT INTO SHIPMENT
(Shipment_ID, Order_ID, Address, Carrier, Tracking_No, Status)
VALUES
('S001', 'O101', 'Hyderabad', 'Delhivery', 'TRK001', 'Shipped'),
('S002', 'O102', 'Vijayawada', 'BlueDart', 'TRK002', 'Shipped'),
('S003', 'O103', 'Visakhapatnam', 'DTDC', 'TRK003', 'Delivered');


-- UPDATE EXAMPLE

UPDATE ORDERS
SET Status = 'Delivered'
WHERE Order_ID = 'O102';


-- DELETE EXAMPLE
-- Run only when you want to demonstrate DELETE.

-- DELETE FROM ORDER_ITEM
-- WHERE Order_Item_ID = 'OI003';
