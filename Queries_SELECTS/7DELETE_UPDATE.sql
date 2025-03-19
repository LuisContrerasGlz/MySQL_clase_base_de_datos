DROP DATABASE productos_prueba;
CREATE SCHEMA `productos_prueba`;

USE productos_prueba;

CREATE TABLE productos (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(10, 2),
    stock INT
);

INSERT INTO productos (id, nombre, precio, stock) VALUES
(1, 'Laptop', 1500.00, 10),
(2, 'Mouse', 25.00, 100),
(3, 'Teclado', 50.00, 60),
(4, 'Monitor', 300.00, 20);

SELECT * FROM productos;
SELECT * FROM productos WHERE nombre = 'Laptop';

-- Momentáneamente vamos a deshabilitar el safe mode para esta actividad

SET SQL_SAFE_UPDATES = 0;

-- Al terminar vamos activarlo nuevamente

SET SQL_SAFE_UPDATES = 1;


-- Cambiamos el precio de la "Laptop" a 1600.
UPDATE productos
SET precio = 1600
WHERE nombre = 'Laptop';

SELECT * FROM productos;
SELECT * FROM productos WHERE nombre = 'Laptop';

-- Incrementar el precio en un 10% para todos los productos con precio menor a 100.

UPDATE productos
SET precio = precio * 1.1
WHERE precio < 100;

SELECT * FROM productos;

-- Eliminar el producto con nombre "Mouse".

DELETE FROM productos
WHERE nombre = 'Mouse';

SELECT * FROM productos;

-- Eliminar todos los productos con stock menor a 30.

SELECT * FROM productos;
SELECT * FROM productos WHERE stock < 30;

DELETE FROM productos
WHERE stock < 30;

SELECT * FROM productos;

SELECT * FROM productos WHERE stock < 30;