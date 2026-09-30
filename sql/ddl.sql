CREATE TABLE CUSTOMER (
    Customer_ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(120) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    Address VARCHAR(200)
);

CREATE TABLE PRODUCT (
    Product_ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(120) NOT NULL,
    Category VARCHAR(80),
    Price DECIMAL(10,2) CHECK (Price > 0),
    Stock_Qty INT DEFAULT 0 CHECK (Stock_Qty >= 0)
);

CREATE TABLE ORDERS (
    Order_ID VARCHAR(10) PRIMARY KEY,
    Customer_ID VARCHAR(10) NOT NULL,
    Order_Date DATE NOT NULL,
    Status VARCHAR(30) NOT NULL,
    Total_Amount DECIMAL(10,2) CHECK (Total_Amount >= 0),

    FOREIGN KEY (Customer_ID)
        REFERENCES CUSTOMER(Customer_ID)
);

CREATE TABLE ORDER_ITEM (
    Order_Item_ID VARCHAR(10) PRIMARY KEY,
    Order_ID VARCHAR(10) NOT NULL,
    Product_ID VARCHAR(10) NOT NULL,
    Quantity INT CHECK (Quantity > 0),
    Unit_Price DECIMAL(10,2) CHECK (Unit_Price > 0),

    FOREIGN KEY (Order_ID)
        REFERENCES ORDERS(Order_ID),

    FOREIGN KEY (Product_ID)
        REFERENCES PRODUCT(Product_ID)
);

CREATE TABLE PAYMENT (
    Payment_ID VARCHAR(10) PRIMARY KEY,
    Order_ID VARCHAR(10) NOT NULL,
    Method VARCHAR(30),
    Amount DECIMAL(10,2) CHECK (Amount >= 0),
    Payment_Status VARCHAR(30),

    FOREIGN KEY (Order_ID)
        REFERENCES ORDERS(Order_ID)
);

CREATE TABLE SHIPMENT (
    Shipment_ID VARCHAR(10) PRIMARY KEY,
    Order_ID VARCHAR(10) NOT NULL,
    Address VARCHAR(200),
    Carrier VARCHAR(80),
    Tracking_No VARCHAR(100) UNIQUE,
    Status VARCHAR(30),

    FOREIGN KEY (Order_ID)
        REFERENCES ORDERS(Order_ID)
);
