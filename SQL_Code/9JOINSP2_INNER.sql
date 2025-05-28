-- Inner Join

USE sakila;

SELECT film.film_id, film.title, film.language_id, language.name 
FROM film  
INNER JOIN language  ON film.language_id  =  language.language_id;

SELECT F.film_id, F.title,F.language_id,L.name 
FROM film F 
INNER JOIN language L  ON F.language_id=L.language_id;

/* 

Mostraremos el identificador, fecha y monto del pago,  el identificador y nombre del empleado, 
el identificador y nombre del cliente (usaremos los alias para las tablas) 

*/

SELECT P.payment_id, P.payment_date, P.amount, P.staff_id, S.first_name,
S.last_name, P.customer_id, C.first_name, C.last_name
FROM payment P 
INNER JOIN staff S ON P.staff_id=S.staff_id 
INNER JOIN customer C ON P.customer_id = C.customer_id;

/*

En la consulta anterior tenemos dos columnas con encabezado (nombre del campo) first_name y otras dos last_name, 
haremos uso de AS para dar nombres a la columnas de tal manera que sea mas claro a que se refieren.

*/

SELECT P.payment_id as folio, P.payment_date as fecha , P.amount as monto,
P.staff_id as num_empleado, S.first_name as nom_empleado, 
S.last_name as ap_empleado, P.customer_id as num_cliente, 
C.first_name as nom_cliente, C.last_name as ap_cliente
FROM payment P
INNER JOIN staff S ON P.staff_id=S.staff_id 
INNER JOIN customer C ON P.customer_id = C.customer_id;


-- Listaremos el identificador y título asi como los identificadores y nombres de los actores que intervienen en la película cuyo titulo es “ADAPTATION HOLES “

select F.film_id, F.title, FA.actor_id, A.first_name, A.last_name
from film F 
Inner Join film_actor FA on F.film_id=FA.film_id
Inner Join actor A on FA.actor_id = A.actor_id 
where F.title="ADAPTATION HOLES";

-- Listaremos el identificador y título de las películas así como su idioma e idioma original.

SELECT F.film_id, F.title,F.language_id,L.name, F.original_language_id, LO.name
FROM film F 
INNER JOIN language L ON F.language_id=L.language_id
INNER JOIN language LO ON F.original_language_id=LO.language_id;

-- Calcularemos cuantos registros hay para cada idioma en la tabla Film mostrando la interpretación del lenguaje.

SELECT count(*), F.language_id, L.name
from film F 
Inner Join language L on F.language_id=L.Language_id 
group by F.language_id;

-- Calcularemos la suma de pagos registrados agrupados por empleado y su nombre.

SELECT sum(P.amount) as monto, P.staff_id as num_empleado, S.first_name as nom_empleado, S.last_name as ap_empleado
FROM payment P 
INNER JOIN staff S ON P.staff_id=S.staff_id 
group by P.staff_id;

-- Actividad 20

-- Liste los identificadores, títulos y descripciones de las películas en el catalogo ??????
USE SAKILA;

SELECT * FROM film;
SELECT * FROM film_text;


SELECT f.film_id, f.title, t.description
FROM film f 
INNER JOIN  film_text t ON f.film_id = t.film_id;
    
SELECT f.*, t.*
FROM film f 
INNER JOIN film_text t ON f.film_id = t.film_id;

/* 
Liste los identificadores, títulos de las películas en el catalogo y nombres completos de los actores 
que participan en cada una de ellas 
*/ 

SELECT * FROM film;
SELECT * FROM actor;
SELECT * FROM film_actor;


SELECT f.film_id, f.title, concat(a.first_name," ",a.last_name) as actors
FROM film F 
INNER JOIN film_actor FA ON F.film_id=FA.film_id
INNER JOIN actor a ON FA.actor_id=a.actor_id ORDER BY f.title;

/*
Liste los nombres completos de los actores registrados asi como los títulos de las películas en que participan 
que están el catalogo de la empresa 
*/

SELECT * from actor; -- Contiene los nombres de los actores.
SELECT * FROM film; -- Contiene los títulos de las películas.
SELECT * FROM film_actor; -- Relaciona actores con películas.

SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor_name, f.title AS movie_title
FROM actor a
INNER JOIN film_actor fa ON a.actor_id = fa.actor_id
INNER JOIN film f ON fa.film_id = f.film_id
ORDER BY actor_name, movie_title;

-- Liste los nombres de los clientes y los títulos de las películas que ha rentado


SELECT * FROM customer; -- Contiene los nombres de los clientes.
SELECT * FROM rental; -- Relaciona a los clientes con las rentas.
SELECT * FROM inventory; -- Relaciona la renta con el inventario.
SELECT * FROM film;     -- Obtiene el título de la película.


SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, f.title AS movie_title
FROM customer c
INNER JOIN rental r ON c.customer_id = r.customer_id
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
ORDER BY customer_name, movie_title;

-- Lista cuantos clientes tiene cada miembro del staff 

SELECT * FROM staff; -- Información del empleado.
SELECT * FROM store; -- Relaciona el empleado con la tienda.
SELECT * FROM customer; -- Relaciona la tienda con los clientes.

SELECT s.first_name, s.last_name, COUNT(c.customer_id) AS total_clientes
FROM staff s
LEFT JOIN store st ON s.store_id = st.store_id
LEFT JOIN customer c ON st.store_id = c.store_id
GROUP BY s.first_name, s.last_name
ORDER BY total_clientes DESC;

-- Calcularemos la suma de pagos registrados agrupados por tienda y la dirección de la tienda 

SELECT * FROM store; -- Información de la tienda.
SELECT * FROM address; -- Dirección de la tienda.
SELECT * FROM staff;  -- Empleado asociado a la tienda.
SELECT * FROM payment; -- Pagos realizados en la tienda.

SELECT st.store_id, a.address, SUM(p.amount) AS total_pago
FROM store st
INNER JOIN address a ON st.address_id = a.address_id
INNER JOIN staff s ON st.store_id = s.store_id
INNER JOIN payment p ON s.staff_id = p.staff_id
GROUP BY st.store_id, a.address;
