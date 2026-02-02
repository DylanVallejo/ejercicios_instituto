--  INTEGRANTE 3 - RF01: REPORTE DE VENTAS POR TIENDA Y FECHAS  Pame
USE Ventas;
GO

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
SELECT
    s.store_id,
    s.store_name,
    COUNT(DISTINCT o.order_id) AS total_ordenes,
    SUM(oi.quantity) AS total_unidades,
    SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_ventas
FROM Orders o
    JOIN Stores s ON o.store_id = s.store_id
    JOIN Order_items oi ON o.order_id = oi.order_id
WHERE o.order_date BETWEEN '2025-01-05' AND '2025-01-12'
GROUP BY s.store_id, s.store_name;
GO


--   INTEGRANTE 4 - RF02: CLIENTES CON COMPRAS SUPERIORES A UN MONTO   Samuel


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


--   INTEGRANTE 5 - RF03: HISTORIAL DE COMPRAS DE UN CLIENTE  Rouxana


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


--   INTEGRANTE 6 - RF04: REGISTRAR ORDEN SOLO SI EXISTE STOCK Dylan


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
-- EXEC sp_register_order 2, 2, 3, 3, 1;
-- EXEC sp_register_order 3, 3, 5, 6, 2;
EXEC sp_register_order 1, 1, 1, 1, 2;
GO