-- MIN, MAX, COUNT, SUM, AVG, ALIAS, CONCAT, UPPER, LOWER

-- En este caso, se muestra el pago más pequeño registrado en la tabla payment.

SELECT MIN(amount) FROM payment;

-- Aquí, obtenemos la duración más larga entre todas las películas de la tabla film.

SELECT * FROM film;
SELECT MAX(length) FROM film;

-- Aquí, obtenemos el número total de clientes en la tabla customer.

SELECT COUNT(*) AS total_clientes FROM customer;

-- En este caso, se obtiene la suma total de los costos de reemplazo de todas las películas.

SELECT SUM(replacement_cost) FROM film;

-- Aquí, se obtiene el promedio de la tarifa de alquiler de todas las películas.

SELECT AVG(rental_rate) AS promedio_tarifa_alquiler FROM film;

-- Aquí, title aparecerá como "Pelicula" y rental_rate como "Tarifa".

SELECT title AS Pelicula, rental_rate AS Tarifa FROM film;

-- En este caso, se combina el nombre y el apellido de los actores en una sola columna.

SELECT first_name FROM actor;
SELECT last_name FROM actor;
SELECT first_name, last_name FROM actor;
SELECT CONCAT(first_name, ' ', last_name) FROM actor;
SELECT CONCAT('Nombre: ',first_name, ' ', 'Apellido: ', last_name, ' ', ':-D ') AS nombre_completo FROM actor;
SELECT CONCAT(first_name, last_name) FROM actor;

SELECT CONCAT(first_name, ' ', last_name) AS Nombre_Completo FROM actor;

-- Aquí, los nombres de las categorías de películas aparecerán en mayúsculas.

SELECT name FROM category;

SELECT UPPER(name) FROM category;

-- En este caso, los correos electrónicos de los clientes aparecerán en minúsculas.

SELECT LOWER(email) FROM customer;

SELECT LOWER(name) FROM category;


SELECT first_name, last_name FROM actor  
ORDER BY first_name  
LIMIT 5 OFFSET 10;

-- Actividad 13

-- MIN

-- Obtener la fecha más antigua de alquiler:
SELECT MIN(rental_date) AS fecha_mas_antigua FROM rental;

-- Obtener el ID de actor más bajo:
SELECT MIN(actor_id) AS menor_id FROM actor;

-- Obtener la duración mínima de una película:
SELECT MIN(length) AS duracion_minima FROM film;

-- MAX

-- Obtener la fecha más reciente de alquiler:
SELECT MAX(rental_date) AS fecha_mas_reciente FROM rental;

-- Obtener el ID de actor más alto:
SELECT MAX(actor_id) AS mayor_id FROM actor;

-- Obtener la duración máxima de una película:
SELECT MAX(length) AS duracion_maxima FROM film;

-- COUNT

-- Contar el número total de actores:
SELECT COUNT(*) AS total_actores FROM actor;

-- Contar cuántas películas tienen clasificación PG:
SELECT COUNT(*) AS total_peliculas_pg FROM film WHERE rating = 'PG';

-- Contar cuántos clientes hay en la tienda 1:
SELECT COUNT(*) AS total_clientes_tienda_1 FROM customer WHERE store_id = 1;

-- SUM

-- Sumar todos los pagos registrados:
SELECT SUM(amount) AS total_pagos FROM payment;

-- Sumar la duración total de todas las películas:
SELECT SUM(length) AS duracion_total_peliculas FROM film;

-- Sumar todos los pagos de un cliente específico (ID 5):
SELECT SUM(amount) AS total_pagado_cliente_5 FROM payment WHERE customer_id = 5;

-- AVG

-- Calcular el promedio de duración de las películas:
SELECT AVG(length) AS promedio_duracion_peliculas FROM film;

-- Calcular el promedio de los pagos realizados:
SELECT AVG(amount) AS promedio_pagos FROM payment;

-- Calcular el promedio de duración de alquiler de las películas:
SELECT AVG(rental_duration) AS promedio_duracion_alquiler FROM film;

-- ALIAS

-- Mostrar nombres de actores con alias:
SELECT first_name AS nombre, last_name AS apellido FROM actor;

-- Mostrar la cantidad total de películas con un alias:
SELECT COUNT(*) AS total_peliculas FROM film;

-- Calcular el pago total por cliente con un alias:
-- Calcular el pago total de los clientes con un alias
SELECT SUM(amount) AS Pago_Total FROM payment;

SELECT customer_id AS ID_Cliente, SUM(amount) AS Pago_Total FROM payment GROUP BY customer_id;

-- CONCAT

-- Concatenar el nombre y apellido de los actores:
SELECT CONCAT(first_name, ' ', last_name) AS nombre_completo FROM actor;

-- Concatenar el título de la película con su clasificación:
SELECT CONCAT(title, ' - ', rating) AS pelicula_y_clasificacion FROM film;

-- Concatenar el nombre completo del cliente con su ID:
SELECT CONCAT(customer_id, ': ', first_name, ' ', last_name) AS cliente_info FROM customer;

-- UPPER

-- Convertir todos los nombres de actores a mayúsculas:
SELECT UPPER(first_name) AS nombre_mayusculas FROM actor;

-- Convertir los nombres de las películas a mayúsculas:
SELECT UPPER(title) AS titulo_mayusculas FROM film;

-- Convertir el nombre del país a mayúsculas:
SELECT UPPER(country) AS pais_mayusculas FROM country;

-- LOWER

-- Convertir todos los nombres de actores a minúsculas:
SELECT LOWER(first_name) AS nombre_minusculas FROM actor;

-- Convertir los nombres de las películas a minúsculas:
SELECT LOWER(title) AS titulo_minusculas FROM film;

-- Convertir el nombre del país a minúsculas:
SELECT LOWER(country) AS pais_minusculas FROM country;

-- Obtener 5 películas saltando las primeras 10 en orden alfabético

SELECT title FROM film ORDER BY title LIMIT 5 OFFSET 10;

-- Obtener 5 clientes saltando los primeros 15 en orden por apellido

SELECT customer_id, first_name, last_name FROM customer ORDER BY last_name LIMIT 5 OFFSET 15;
