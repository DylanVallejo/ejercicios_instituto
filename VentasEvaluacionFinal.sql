/* =========================================================
   INTEGRANTE 1 - CREACION DE BASE DE DATOS Y TABLAS (DDL)
   ========================================================= */

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



/* =========================================================
   INTEGRANTE 2 - INSERCION DE DATOS (DML)
   ========================================================= */

INSERT INTO Stores VALUES
(1,'Store Centro','0991111111','centro@store.com','Av. Central','Quito','EC','17001'),
(2,'Store Norte','0991111112','norte@store.com','Av. Norte','Quito','EC','17002'),
(3,'Store Sur','0991111113','sur@store.com','Av. Sur','Quito','EC','17003'),
(4,'Store Este','0991111114','este@store.com','Av. Este','Quito','EC','17004'),
(5,'Store Oeste','0991111115','oeste@store.com','Av. Oeste','Quito','EC','17005'),
(6,'Store A','0991111116','a@store.com','Zona A','Cuenca','EC','01001'),
(7,'Store B','0991111117','b@store.com','Zona B','Cuenca','EC','01002'),
(8,'Store C','0991111118','c@store.com','Zona C','Cuenca','EC','01003'),
(9,'Store D','0991111119','d@store.com','Zona D','Guayaquil','EC','09001'),
(10,'Store E','0991111120','e@store.com','Zona E','Guayaquil','EC','09002');

INSERT INTO Staffs VALUES
(1,'Carlos','Mendoza','carlos@store.com','0992222221',1,1,NULL),
(2,'Ana','Paredes','ana@store.com','0992222222',1,1,1),
(3,'Luis','Torres','luis@store.com','0992222223',1,2,NULL),
(4,'Maria','Vera','maria@store.com','0992222224',1,2,3),
(5,'Pedro','Ramirez','pedro@store.com','0992222225',1,3,NULL),
(6,'Sofia','Castillo','sofia@store.com','0992222226',1,3,5),
(7,'Juan','Salazar','juan@store.com','0992222227',1,4,NULL),
(8,'Paula','Ortega','paula@store.com','0992222228',1,4,7),
(9,'Miguel','Reyes','miguel@store.com','0992222229',1,5,NULL),
(10,'Lucia','Benitez','lucia@store.com','0992222230',1,5,9);

INSERT INTO SystemUser VALUES
('U1','admin','1234','ADMIN',1),
('U2','ventas1','1234','USER',2),
('U3','ventas2','1234','USER',3),
('U4','ventas3','1234','USER',4),
('U5','ventas4','1234','USER',5),
('U6','ventas5','1234','USER',6),
('U7','ventas6','1234','USER',7),
('U8','ventas7','1234','USER',8),
('U9','ventas8','1234','USER',9),
('U10','ventas9','1234','USER',10);

INSERT INTO Customers VALUES
(1,'Carlos','Lopez','0993333331','carlos@mail.com','Calle A','Quito','Pichincha','17001'),
(2,'Ana','Martinez','0993333332','ana@mail.com','Calle B','Quito','Pichincha','17002'),
(3,'Luis','Perez','0993333333','luis@mail.com','Calle C','Quito','Pichincha','17003'),
(4,'Maria','Gomez','0993333334','maria@mail.com','Calle D','Cuenca','Azuay','01001'),
(5,'Pedro','Rojas','0993333335','pedro@mail.com','Calle E','Cuenca','Azuay','01002'),
(6,'Sofia','Mora','0993333336','sofia@mail.com','Calle F','Cuenca','Azuay','01003'),
(7,'Juan','Diaz','0993333337','juan@mail.com','Calle G','Guayaquil','Guayas','09001'),
(8,'Paula','Sanchez','0993333338','paula@mail.com','Calle H','Guayaquil','Guayas','09002'),
(9,'Miguel','Vega','0993333339','miguel@mail.com','Calle I','Guayaquil','Guayas','09003'),
(10,'Lucia','Castro','0993333340','lucia@mail.com','Calle J','Guayaquil','Guayas','09004');

INSERT INTO Categories VALUES
(1,'Mountain Bikes'),
(2,'Road Bikes'),
(3,'Hybrid Bikes'),
(4,'Electric Bikes'),
(5,'Children Bikes'),
(6,'Accessories'),
(7,'Components'),
(8,'Clothing'),
(9,'Helmets'),
(10,'Shoes');

INSERT INTO Brands VALUES
(1,'Trek'),
(2,'Giant'),
(3,'Specialized'),
(4,'Cannondale'),
(5,'Scott'),
(6,'Merida'),
(7,'Cube'),
(8,'BMC'),
(9,'Orbea'),
(10,'Santa Cruz');

INSERT INTO Products VALUES
(1,'Trek X-Caliber 8',1,1,2023,950.00),
(2,'Giant Talon 3',2,1,2023,780.00),
(3,'Specialized Allez',3,2,2023,1100.00),
(4,'Cannondale Quick 4',4,3,2023,650.00),
(5,'Scott Addict',5,2,2023,1800.00),
(6,'Merida Big Nine',6,1,2023,900.00),
(7,'Cube Reaction',7,1,2023,870.00),
(8,'BMC Alpenchallenge',8,3,2023,1300.00),
(9,'Orbea Gain',9,4,2023,2500.00),
(10,'Santa Cruz Chameleon',10,1,2023,2200.00);

INSERT INTO Stocks VALUES
(1,1,10),(1,2,15),(1,3,5),(1,4,12),(1,5,6),(1,6,8),(1,7,9),(1,8,7),(1,9,4),(1,10,3),
(2,1,7),(2,2,10),(2,3,6),(2,4,9),(2,5,5),(2,6,6),(2,7,8),(2,8,4),(2,9,3),(2,10,2),
(3,1,5),(3,2,7),(3,3,4),(3,4,6),(3,5,3),(3,6,5),(3,7,6),(3,8,3),(3,9,2),(3,10,1);

INSERT INTO Orders VALUES
(1,1,1,'2025-01-05','2025-01-10','2025-01-08',1,1),
(2,2,1,'2025-01-06','2025-01-11','2025-01-09',1,2),
(3,3,1,'2025-01-07','2025-01-12','2025-01-10',2,3),
(4,4,1,'2025-01-08','2025-01-13','2025-01-11',2,4),
(5,5,1,'2025-01-09','2025-01-14','2025-01-12',3,5),
(6,6,1,'2025-01-10','2025-01-15','2025-01-13',3,6),
(7,7,1,'2025-01-11','2025-01-16','2025-01-14',4,7),
(8,8,1,'2025-01-12','2025-01-17','2025-01-15',4,8),
(9,9,1,'2025-01-13','2025-01-18','2025-01-16',5,9),
(10,10,1,'2025-01-14','2025-01-19','2025-01-17',5,10);

INSERT INTO Order_items VALUES
(1,1,1,1,950,0.05),(1,2,2,1,780,0.00),
(2,1,3,1,1100,0.10),(2,2,4,2,650,0.00),
(3,1,5,1,1800,0.05),(3,2,6,1,900,0.00),
(4,1,7,1,870,0.00),(4,2,8,1,1300,0.05),
(5,1,9,1,2500,0.10),(5,2,10,1,2200,0.00),
(6,1,1,1,950,0.00),(6,2,2,1,780,0.00),
(7,1,3,1,1100,0.05),(7,2,4,1,650,0.00),
(8,1,5,1,1800,0.00),(8,2,6,1,900,0.00),
(9,1,7,1,870,0.00),(9,2,8,1,1300,0.00),
(10,1,9,1,2500,0.05),(10,2,10,1,2200,0.00);
GO


/* =========================================================
   INTEGRANTE 3 - RF01: REPORTE DE VENTAS POR TIENDA Y FECHAS     corregir el id
   ========================================================= */
 
CREATE VIEW vw_sales_report_by_store AS
SELECT 
    s.store_id,
    s.store_name,
    COUNT(DISTINCT o.order_id) AS total_ordenes,
    SUM(oi.quantity) AS total_unidades,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_ventas
FROM Orders o
JOIN Stores s ON o.store_id = s.store_id
JOIN Order_items oi ON o.order_id = oi.order_id
GROUP BY s.store_id, s.store_name;
GO

-- Prueba
SELECT *
FROM vw_sales_report_by_store
WHERE order_id IN (
    SELECT order_id
    FROM Orders
    WHERE order_date BETWEEN '2025-01-05' AND '2025-01-12'
);
GO


/* =========================================================
   INTEGRANTE 4 - RF02: CLIENTES CON COMPRAS SUPERIORES A UN MONTO
   ========================================================= */

CREATE VIEW vw_customers_over_amount AS
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_purchases
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_items oi ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.first_name, c.last_name;
GO

-- Prueba
SELECT *
FROM vw_customers_over_amount
WHERE total_purchases > 2000;
GO


/* =========================================================
   INTEGRANTE 5 - RF03: HISTORIAL DE COMPRAS DE UN CLIENTE
   ========================================================= */

CREATE VIEW vw_customer_purchase_history AS
SELECT 
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    p.product_name,
    oi.quantity,
    oi.list_price,
    oi.discount,
    (oi.quantity * oi.list_price * (1 - oi.discount)) AS subtotal
FROM Customers c
JOIN Orders o ON c.customer_id = o.customer_id
JOIN Order_items oi ON o.order_id = oi.order_id
JOIN Products p ON oi.product_id = p.product_id;
GO

-- Prueba
SELECT *
FROM vw_customer_purchase_history
WHERE customer_id = 1;
GO


/* =========================================================
   INTEGRANTE 6 - RF04: REGISTRAR ORDEN SOLO SI EXISTE STOCK
   ========================================================= */

CREATE PROCEDURE sp_register_order
    @customer_id INT,
    @store_id INT,
    @staff_id INT,
    @product_id INT,
    @quantity INT
AS
BEGIN
    DECLARE @current_stock INT;
    DECLARE @price DECIMAL(10,2);
    DECLARE @order_id INT;

    SELECT @current_stock = quantity
    FROM Stocks
    WHERE store_id = @store_id AND product_id = @product_id;

    IF @current_stock IS NULL OR @current_stock < @quantity
    BEGIN
        PRINT 'Stock insuficiente para realizar la venta';
        RETURN;
    END

    SELECT @price = list_price FROM Products WHERE product_id = @product_id;

    INSERT INTO Orders (order_id, customer_id, order_status, order_date, required_date, shipped_date, store_id, staff_id)
    VALUES (
        (SELECT ISNULL(MAX(order_id),0)+1 FROM Orders),
        @customer_id, 1, GETDATE(), DATEADD(DAY,5,GETDATE()), GETDATE(), @store_id, @staff_id
    );

    SET @order_id = (SELECT MAX(order_id) FROM Orders);

    INSERT INTO Order_items (order_id, item_id, product_id, quantity, list_price, discount)
    VALUES (
        @order_id,
        (SELECT ISNULL(MAX(item_id),0)+1 FROM Order_items WHERE order_id = @order_id),
        @product_id,
        @quantity,
        @price,
        0
    );

    UPDATE Stocks
    SET quantity = quantity - @quantity
    WHERE store_id = @store_id AND product_id = @product_id;

    PRINT 'Orden registrada correctamente';
END;
GO

-- Pruebas
EXEC sp_register_order 1, 1, 1, 1, 2;
EXEC sp_register_order 1, 1, 1, 9, 100;
GO
