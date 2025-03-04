-- AND, OR, NOT

-- Listaremos el Film_id, Titulo, duración de renta, costo de renta y rating de  los registros con rating=‘PG’

SELECT film_id, title, rental_duration, rental_rate, rating FROM film WHERE rating =“PG”;

-- Listaremos el Film_id, Titulo, duración de renta, costo de renta y rating de  los registros con rating=‘PG’ y cuyo precio de renta es menor que 2 dlls.

SELECT film_id, title, rental_duration, rental_rate, rating FROM film WHERE rating="PG" AND rental_rate<2;

-- Listaremos el Film_id, Titulo, duración de renta, costo de renta y rating de  los registros con rating=‘G’  o ‘PG’.

SELECT film_id, title, rental_duration, rental_rate, rating FROM film WHERE rating="G" OR rating=“PG”;

/* 

Listaremos el Film_id, Titulo, duración de renta, costo de renta y rating de  los registros con rating=‘G’  o ‘PG’ 
y precio de renta es menor que 2 dlls.

Como podemos ver el resultado de la consulta
aun muestra registros con rating “G” y costo 
mayor a 2 dlls pero no “PG”


*/

SELECT film_id, title, rental_duration, rental_rate, rating FROM film 
WHERE rating="G" OR rating="PG" AND rental_rate<2;

/*
 
Listaremos el Film_id, Titulo, duración de renta, costo de renta y rating de  los registros con rating=‘G’ o ‘PG’ 
y precio de renta es menor que 2 dlls.

Ahora muestra solo los registro con precio menor a 2 dlls.

*/

SELECT film_id, title, rental_duration, rental_rate, rating FROM film 
WHERE (rating="G" OR rating= "PG") AND rental_rate<2; 

-- Obtener todos los actores excepto aquellos cuyo nombre es "JOHNNY".

SELECT * FROM actor WHERE NOT first_name = 'JOHNNY';

-- Listaremos el Film_id, Titulo, duración de renta, costo de renta y rating de  los registros que no tienen rating=‘G’  o ‘PG’.

SELECT film_id, title, rental_duration, rental_rate, rating FROM film WHERE NOT(rating="G" OR rating="PG");
