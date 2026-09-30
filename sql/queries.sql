-- 1. Display all customers

SELECT *
FROM CUSTOMER;


-- 2. Display all products

SELECT *
FROM PRODUCT;


-- 3. Display all orders with customer names

SELECT
    O.Order_ID,
    C.Name AS Customer_Name,
    O.Order_Date,
    O.Status,
    O.Total_Amount
FROM ORDERS O
INNER JOIN CUSTOMER C
    ON O.Customer_ID = C.Customer_ID;


-- 4. Display order items with product names

SELECT
    OI.Order_Item_ID,
    OI.Order_ID,
    P.Name AS Product_Name,
    OI.Quantity,
    OI.Unit_Price
FROM ORDER_ITEM OI
INNER JOIN PRODUCT P
    ON OI.Product_ID = P.Product_ID;


-- 5. Calculate total sales

SELECT
    SUM(Total_Amount) AS Total_Sales
FROM ORDERS;


-- 6. Count orders for each customer

SELECT
    Customer_ID,
    COUNT(Order_ID) AS Total_Orders
FROM ORDERS
GROUP BY Customer_ID;


-- 7. Find products with low stock

SELECT
    Product_ID,
    Name,
    Stock_Qty
FROM PRODUCT
WHERE Stock_Qty < 15;


-- 8. Display delivered orders

SELECT
    Order_ID,
    Customer_ID,
    Order_Date,
    Total_Amount
FROM ORDERS
WHERE Status = 'Delivered';


-- 9. Display orders with payment details

SELECT
    O.Order_ID,
    O.Total_Amount,
    P.Method,
    P.Amount,
    P.Payment_Status
FROM ORDERS O
INNER JOIN PAYMENT P
    ON O.Order_ID = P.Order_ID;


-- 10. Display shipment details for orders

SELECT
    O.Order_ID,
    C.Name AS Customer_Name,
    S.Carrier,
    S.Tracking_No,
    S.Status
FROM ORDERS O
INNER JOIN CUSTOMER C
    ON O.Customer_ID = C.Customer_ID
INNER JOIN SHIPMENT S
    ON O.Order_ID = S.Order_ID;


-- 11. Find average order amount

SELECT
    AVG(Total_Amount) AS Average_Order_Amount
FROM ORDERS;


-- 12. Find maximum order amount

SELECT
    MAX(Total_Amount) AS Maximum_Order_Amount
FROM ORDERS;


-- 13. Create an order summary view

CREATE VIEW Order_Summary AS
SELECT
    O.Order_ID,
    C.Name AS Customer_Name,
    O.Order_Date,
    O.Status,
    O.Total_Amount
FROM ORDERS O
INNER JOIN CUSTOMER C
    ON O.Customer_ID = C.Customer_ID;


-- 14. Display the order summary view

SELECT *
FROM Order_Summary;
