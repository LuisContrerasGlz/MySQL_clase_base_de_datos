-- CASE, IFNULL
DROP DATABASE productos_prueba;
CREATE SCHEMA `productos_prueba`;

DROP TABLE productos;

CREATE TABLE productos (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    categoria VARCHAR(50),
    precio DECIMAL(10, 2),
    stock INT,
    stock_status VARCHAR(20)
);

INSERT INTO productos (id, nombre, categoria, precio, stock) VALUES
(1, 'Laptop', 'Tecnología', 1500.00, 10),
(2, 'Mouse', 'Tecnología', 25.00, 0),
(3, 'Teclado', 'Tecnología', 50.00, 60),
(4, 'Monitor', 'Tecnología', 300.00, 20),
(5, 'Silla', 'Muebles', 120.00, 15),
(6, 'Escritorio', 'Muebles', 250.00, 5);

/* 

Actualizar la columna stock_status en una tabla productos de la siguiente forma:

Si el stock es 0, poner "Sin Stock".
Si el stock es menor a 20, poner "Bajo".
Si el stock es igual o mayor a 20, poner "Disponible".

*/

UPDATE productos
SET stock_status = 
    CASE
        WHEN stock = 0 THEN 'Sin Stock'
        WHEN stock < 20 THEN 'Bajo'
        ELSE 'Disponible'
    END;
    
SELECT * FROM productos;

-- Clasificar productos en una consulta SELECT según su precio

SELECT nombre, precio,
    CASE
        WHEN precio < 100 THEN 'Económico'
        WHEN precio BETWEEN 100 AND 500 THEN 'Moderado'
        ELSE 'Caro'
    END AS rango_precio
FROM productos;

SELECT nombre, precio,
    CASE
        WHEN precio < 100 THEN 'Económico'
        WHEN precio BETWEEN 100 AND 500 THEN 'Moderado'
        ELSE 'Caro'
    END 
FROM productos;

-- Si el campo stock es NULL, se mostrará 0 en su lugar.

SELECT nombre, IFNULL(stock, 0) AS stock_disponible
FROM productos;

SELECT * FROM productos;
-- Reemplazar cualquier valor NULL en la columna stock con 0.

UPDATE productos
SET stock = IFNULL(stock, 0);

SELECT * FROM productos;