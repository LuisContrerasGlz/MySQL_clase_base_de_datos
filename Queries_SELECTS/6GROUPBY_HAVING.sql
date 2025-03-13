-- GROUP BY, HAVING

-- Mostraremos el número de películas (registros en la tabla film) agrupados por el lenguaje. 
USE sakila;

SELECT language_id, COUNT(*) FROM film GROUP BY language_id; 

SELECT * FROM language;
SELECT DISTINCT language_id FROM film;

/*
Mostraremos el número de películas (registros en la tabla film) 
agrupados por el lenguaje excluyendo aquellos que tienen 3 o menos. 
*/

SELECT language_id, COUNT(*) FROM film GROUP BY language_id HAVING COUNT(*)>3;

/* 
Mostraremos el número de películas (a la suma le llamaremos cuantos) 
agrupados por su duración y los ordenaremos de forma descendente por el número de registros agrupados 
*/

SELECT rental_duration, COUNT(*) AS cuantos FROM film GROUP BY rental_duration ORDER BY cuantos DESC;

/* 
Mostraremos el número de películas (a la suma le llamaremos cuantos) 
agrupados por su duración y los ordenaremos de forma descendente por el número de registros agrupados 
filtrando los que tienen menos de 200 registros. 
*/

SELECT rental_duration, COUNT(*) AS cuantos 
FROM film 
GROUP BY rental_duration 
HAVING cuantos>200 
ORDER BY cuantos DESC; 

-- Mostraremos el monto pagado por cada cliente y lo ordenaremos por el identificador del cliente

SELECT customer_id, SUM(amount) 
FROM payment
GROUP BY(customer_id) 
ORDER BY customer_id;

-- Insert para prueba

INSERT INTO payment (customer_id, staff_id, rental_id, amount, payment_date)
VALUES (1, 1, 1, 100, NOW()),
       (2, 1, 2, 150, NOW()),
       (3, 2, 3, 300, NOW()),
       (4, 2, 4, 200, NOW());

SELECT NOW();

INSERT INTO payment (customer_id, staff_id, rental_id, amount, payment_date)
VALUES (5, 1, 5, 120, CURRENT_TIMESTAMP()),
       (6, 2, 6, 180, CURRENT_TIMESTAMP());

SELECT CURRENT_TIMESTAMP();

/*

CREATE TABLE ejemplo (
    id_ejemplo INT AUTO_INCREMENT PRIMARY KEY,
    fecha_de_Creacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

*/

/* 
Muestra el número total de rentas y el monto total de pagos por cada empleado (staff_id) 
para los pagos realizados desde el 1 de enero de 2024. 
solo incluyendo los empleados cuyo total de pagos supera los $500, 
y los resultados se ordenan de mayor a menor según el total de pagos.
*/

SELECT staff_id, COUNT(*) AS total_rentas, SUM(amount) AS total_pago
FROM payment
WHERE payment_date >= '2024-01-01'    				 -- 1. Filtra los pagos desde enero de 2024
GROUP BY staff_id                                    -- 2. Agrupa los datos por empleado
HAVING total_pago > 500                         	 -- 3. Filtra los grupos con pagos mayores a $500
ORDER BY total_pago DESC; 

 

-- Asignar 'Italian' a las primeras 100 películas
UPDATE film
SET language_id = 2
WHERE film_id BETWEEN 1 AND 100;

-- Asignar 'Japanese' a las siguientes 100 películas
UPDATE film
SET language_id = 3
WHERE film_id BETWEEN 101 AND 200;

-- Asignar 'Mandarin' a las siguientes 100 películas
UPDATE film
SET language_id = 4
WHERE film_id BETWEEN 201 AND 300;

-- Asignar 'French' a las siguientes 100 películas
UPDATE film
SET language_id = 5
WHERE film_id BETWEEN 301 AND 400;

-- Asignar 'German' a las siguientes 100 películas
UPDATE film
SET language_id = 6
WHERE film_id BETWEEN 401 AND 500;