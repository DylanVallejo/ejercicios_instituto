--   INTEGRANTE 1 - CREACION DE BASE DE DATOS Y TABLAS (DDL)  Mari


CREATE DATABASE Ventas;
GO
USE Ventas;
GO

CREATE TABLE Stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(255) NOT NULL,
    phone VARCHAR(25),
    email VARCHAR(255),
    street VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(10),
    zip_code VARCHAR(5)
);

CREATE TABLE Staffs (
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    phone VARCHAR(25),
    active TINYINT NOT NULL,
    store_id INT NOT NULL,
    manager_id INT,
    CONSTRAINT fk_staff_store FOREIGN KEY (store_id) REFERENCES Stores(store_id),
    CONSTRAINT fk_staff_manager FOREIGN KEY (manager_id) REFERENCES Staffs(staff_id)
);

CREATE TABLE SystemUser (
    id_user VARCHAR(10) PRIMARY KEY,
    usuario VARCHAR(50) NOT NULL,
    pass VARCHAR(10) NOT NULL,
    rol VARCHAR(20),
    staff_id INT,
    CONSTRAINT fk_user_staff FOREIGN KEY (staff_id) REFERENCES Staffs(staff_id)
);

CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    phone VARCHAR(25),
    email VARCHAR(255) NOT NULL,
    street VARCHAR(255),
    city VARCHAR(50),
    state VARCHAR(25),
    zip_code VARCHAR(5)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_status TINYINT NOT NULL,
    order_date DATE NOT NULL,
    required_date DATE NOT NULL,
    shipped_date DATE,
    store_id INT NOT NULL,
    staff_id INT NOT NULL,
    CONSTRAINT fk_order_customer FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    CONSTRAINT fk_order_store FOREIGN KEY (store_id) REFERENCES Stores(store_id),
    CONSTRAINT fk_order_staff FOREIGN KEY (staff_id) REFERENCES Staffs(staff_id)
);

CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE Brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(255) NOT NULL
);

CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    category_id INT NOT NULL,
    model_year SMALLINT NOT NULL,
    list_price DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_product_brand FOREIGN KEY (brand_id) REFERENCES Brands(brand_id),
    CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);

CREATE TABLE Stocks (
    store_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (store_id, product_id),
    CONSTRAINT fk_stock_store FOREIGN KEY (store_id) REFERENCES Stores(store_id),
    CONSTRAINT fk_stock_product FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE Order_items (
    order_id INT NOT NULL,
    item_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    list_price DECIMAL(10,2) NOT NULL,
    discount DECIMAL(4,2) NOT NULL,
    PRIMARY KEY (order_id, item_id),
    CONSTRAINT fk_item_order FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    CONSTRAINT fk_item_product FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

