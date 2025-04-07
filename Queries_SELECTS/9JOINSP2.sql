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