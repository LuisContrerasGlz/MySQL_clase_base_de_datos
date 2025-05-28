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

-- Actividad 16

-- Verificar con SELECT * FROM productos;

/*

Mostrar el nombre y una columna llamada rango_precio que clasifique los productos así:

"Económico" si el precio es menor a 100.
"Moderado" si el precio está entre 100 y 500.
"Caro" si el precio es mayor a 500.

*/
use productos_prueba;
SELECT nombre, precio,
    CASE
        WHEN precio < 100 THEN 'Económico'
        WHEN precio BETWEEN 100 AND 500 THEN 'Moderado'
        ELSE 'Caro'
    END AS rango_precio
FROM productos;

/*

Mostrar el nombre del producto y una columna disponibilidad que diga:

"Sin Stock" si el stock es 0.
"Bajo Stock" si el stock es menor a 20.
"Disponible" si el stock es igual o mayor a 20.

*/

SELECT nombre, stock,
    CASE
        WHEN stock = 0 THEN 'Sin Stock'
        WHEN stock < 20 THEN 'Bajo Stock'
        ELSE 'Disponible'
    END AS disponibilidad
FROM productos;

/*

Agregar una columna calculada llamada descuento que aplique lo siguiente:

Si el precio es mayor a 1000, aplicar un descuento del 10%.
Si el precio es entre 500 y 1000, aplicar un descuento del 5%.
En otros casos, sin descuento (0).

*/

SELECT nombre, precio,
    CASE
        WHEN precio > 1000 THEN precio * 0.10
        WHEN precio BETWEEN 500 AND 1000 THEN precio * 0.05
        ELSE 0
    END AS descuento
FROM productos;

/*

Actualizar la columna stock_status de la tabla productos con los siguientes valores:

"Sin Stock" si el stock es 0.
"Bajo" si el stock es menor a 20.
"Disponible" si el stock es igual o mayor a 20.

*/

UPDATE productos
SET stock_status = 
    CASE
        WHEN stock = 0 THEN 'Sin Stock'
        WHEN stock < 20 THEN 'Bajo'
        ELSE 'Disponible'
    END;
    
SELECT * FROM productos;

/*

Actualizar la categoría de los productos:

Si el precio es mayor a 1000, cambiar la categoría a "Alta Gama".
Si el precio está entre 500 y 1000, cambiar a "Gama Media".
En otros casos, dejar la categoría como "Gama Baja".

*/

UPDATE productos
SET categoria = 
    CASE
        WHEN precio > 1000 THEN 'Alta Gama'
        WHEN precio BETWEEN 500 AND 1000 THEN 'Gama Media'
        ELSE 'Gama Baja'
    END;

SELECT * FROM productos;

/*

Ordenar los productos mostrando primero los "Sin Stock", 
luego los de "Bajo Stock" y al final los "Disponibles".

*/

SELECT nombre, stock_status
FROM productos
ORDER BY
    CASE 
        WHEN stock_status = 'Sin Stock' THEN 1
        WHEN stock_status = 'Bajo' THEN 2
        ELSE 3
    END;

/*

Ordenar los productos por precio según la siguiente prioridad:

Primero los productos "Caros" (precio > 1000).
Luego los "Moderados" (precio entre 500 y 1000).
Por último, los "Económicos" (precio menor a 500).

*/

SELECT nombre, precio
FROM productos
ORDER BY 
    CASE
        WHEN precio > 1000 THEN 1
        WHEN precio BETWEEN 500 AND 1000 THEN 2
        ELSE 3
    END;

/*

Mostrar una lista de productos con una columna oferta_especial que indique:

"Sí" si el producto está en la categoría "Muebles" y tiene un stock menor a 10.
"No" en caso contrario.

*/

SELECT nombre, categoria, stock,
    CASE
        WHEN categoria = 'Muebles' AND stock < 10 THEN 'Sí'
        ELSE 'No'
    END AS oferta_especial
FROM productos;

-- IFNULL

-- DROP: Borra la estructura y los datos de la tabla. 

DROP TABLE IF EXISTS productos;

-- Truncate: TRUNCATE TABLE productos;

TRUNCATE TABLE productos;

-- DELETE: Borra todos los registros de la tabla pero mantiene su estructura.

DELETE FROM productos;


CREATE TABLE productos (
    id INT PRIMARY KEY,
    nombre VARCHAR(50),
    categoria VARCHAR(50),
    precio DECIMAL(10, 2),
    stock INT,
    descuento DECIMAL(10, 2)
);

INSERT INTO productos (id, nombre, categoria, precio, stock, descuento) VALUES
(1, 'Laptop', 'Tecnología', 1500.00, 10, NULL),
(2, 'Mouse', 'Tecnología', 25.00, NULL, 5.00),
(3, 'Teclado', 'Tecnología', 50.00, 60, NULL),
(4, 'Monitor', 'Tecnología', 300.00, 20, 15.00),
(5, 'Silla', 'Muebles', 120.00, NULL, NULL),
(6, 'Escritorio', 'Muebles', 250.00, 5, 10.00);

-- Mostrar todos los productos y su stock. Si el stock es NULL, mostrar 0.

SELECT nombre, IFNULL(stock, 0) AS stock_disponible
FROM productos;


/*

Mostrar el nombre del producto y el precio_final considerando el descuento. 
Si descuento es NULL, considerarlo como 0.

*/

SELECT nombre, 
       precio, 
       IFNULL(precio - descuento, precio) AS precio_final
FROM productos;

-- Mostrar el nombre y una columna categoria_segura que muestre "Desconocida" si la categoría es NULL.

SELECT nombre, IFNULL(categoria, 'Desconocida') AS categoria_segura
FROM productos;

-- Actualizar el campo stock para que, si es NULL, se establezca en 0.

UPDATE productos
SET stock = IFNULL(stock, 0);

SELECT * from productos;

-- Actualizar el campo descuento para que, si es NULL, se establezca en 0.

UPDATE productos
SET descuento = IFNULL(descuento, 0);

SELECT * from productos;

-- Mostrar todos los productos ordenados por stock, considerando los NULL como 0.

SELECT nombre, IFNULL(stock, 0) AS stock_disponible
FROM productos
ORDER BY stock_disponible;
