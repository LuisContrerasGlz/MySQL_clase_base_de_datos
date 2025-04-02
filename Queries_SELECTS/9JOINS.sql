CREATE DATABASE shop_db;
USE shop_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50)
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY,
    amount DECIMAL(5,2),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

INSERT INTO customers (customer_id, first_name, last_name) VALUES
(1, 'Peter', 'Parker'),
(2, 'Steve', 'Rogers'),
(3, 'Clark', 'Kent'),
(4, 'Bob', 'Esponja');

INSERT INTO transactions (transaction_id, amount, customer_id) VALUES
(1000, 4.99, 3),
(1001, 2.89, 2),
(1002, 3.38, 3),
(1003, 4.99, 1),
(1004, 1.00, NULL);

-- Revisamos de la tabla customers todo

SELECT * FROM customers;

-- Revisamos de la tabla transactions todo

SELECT * FROM transactions;

/*

INNER JOIN: Selecciona únicamente los registros que tienen una clave coincidente en ambas tablas.

En este caso, se obtienen todos los registros de "transactions" y "customers" 
donde el valor de "customer_id" coincide en ambas tablas.

*/ 

SELECT *
FROM transactions INNER JOIN customers
ON transactions.customer_id = customers.customer_id;

SELECT *
FROM transactions JOIN customers
ON transactions.customer_id = customers.customer_id;

/* 

LEFT JOIN: Devuelve todos los registros de la tabla de la izquierda (transactions) 
y los registros coincidentes de la tabla de la derecha (customers).
Si no hay coincidencia en la tabla de la derecha, el resultado muestra NULL en las columnas de "customers".
Esta consulta es útil cuando queremos obtener todas las transacciones aunque no tengan un cliente asociado.

*/


SELECT *
FROM transactions LEFT JOIN customers
ON transactions.customer_id = customers.customer_id;

/*

RIGHT JOIN: Devuelve todos los registros de la tabla de la derecha (customers) 
y los registros coincidentes de la tabla de la izquierda (transactions).
Si no hay coincidencia en la tabla de la izquierda, el resultado muestra NULL en las columnas de "transactions".
Esta consulta es útil cuando queremos obtener todos los clientes, aunque no hayan realizado ninguna transacción.

*/ 

SELECT *
FROM transactions RIGHT JOIN customers
ON transactions.customer_id = customers.customer_id;

-- Union cuando hay relacion muchos a muchos con tabla intermedia

-- Almacena los detalles de los productos de la tienda.
CREATE TABLE productos (
    producto_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(5,2)
);

-- Almacena los detalles de las categorías disponibles.
CREATE TABLE categorias (
    categoria_id INT PRIMARY KEY,
    nombre VARCHAR(50)
);

-- Relaciona productos con categorías mediante claves foráneas.
CREATE TABLE productos_categorias (
    producto_id INT,
    categoria_id INT,
    PRIMARY KEY (producto_id, categoria_id),
    FOREIGN KEY (producto_id) REFERENCES productos(producto_id),
    FOREIGN KEY (categoria_id) REFERENCES categorias(categoria_id)
);

INSERT INTO productos (producto_id, nombre, precio) VALUES
(1, 'Laptop', 799.99),
(2, 'Teclado', 29.99),
(3, 'Ratón', 19.99),
(4, 'Monitor', 149.99);

INSERT INTO categorias (categoria_id, nombre) VALUES
(1, 'Electrónica'),
(2, 'Periféricos'),
(3, 'Oficina');

-- Insertamos datos en la tabla intermedia que une productos y categorías
INSERT INTO productos_categorias (producto_id, categoria_id) VALUES
(1, 1), -- Laptop pertenece a Electrónica
(2, 2), -- Teclado pertenece a Periféricos
(3, 2), -- Ratón pertenece a Periféricos
(4, 1), -- Monitor pertenece a Electrónica
(4, 3); -- Monitor también pertenece a Oficina

/*

INNER JOIN: Selecciona los productos y sus categorías cuando ambos tienen coincidencias.
La consulta muestra los nombres de los productos y los nombres de las categorías.
Muestra solo los productos que tienen una categoría asignada.

*/

SELECT * from productos;
SELECT * from categorias;
select * from productos_categorias;

SELECT p.nombre AS producto, c.nombre AS categoria
FROM productos p
INNER JOIN productos_categorias pc ON p.producto_id = pc.producto_id
INNER JOIN categorias c ON pc.categoria_id = c.categoria_id;

-- LEFT JOIN: Devuelve todos los productos, aunque no tengan categorías asignadas.
SELECT p.nombre AS producto, c.nombre AS categoria
FROM productos p
LEFT JOIN productos_categorias pc ON p.producto_id = pc.producto_id
LEFT JOIN categorias c ON pc.categoria_id = c.categoria_id;

-- RIGHT JOIN: Devuelve todas las categorías, incluso si no tienen productos asignados.
SELECT p.nombre AS producto, c.nombre AS categoria
FROM productos p
RIGHT JOIN productos_categorias pc ON p.producto_id = pc.producto_id
RIGHT JOIN categorias c ON pc.categoria_id = c.categoria_id;





