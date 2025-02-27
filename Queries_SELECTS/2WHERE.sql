-- Clase 2 query, WHERE SELECT campos FROM tabla WHERE condiciones;

-- Para mostrar todos los campos de los registros con actor_id igual a 1

SELECT * FROM actor WHERE actor_id=1;

-- Para mostrar todos los campos de los registros de la tabla cuyo nombre es “PENELOPE”.

SELECT * FROM actor WHERE first_name="PENELOPE";

-- Para mostrar todos los campos de los registros de la tabla de actores cuyo actor_id es diferente a 1

SELECT * FROM actor WHERE actor_id <> 1;
SELECT * FROM actor WHERE actor_id !=1;


-- Para mostrar todos los campos de los registros de la tabla cuyo nombre no es “PENELOPE”.

SELECT * FROM actor WHERE first_name <> "PENELOPE";
SELECT * FROM actor WHERE first_name!="PENELOPE";

-- Para mostrar todos los campos de los registros con actor_id mayor a 10

SELECT * FROM actor WHERE actor_id>10;

-- Para mostrar todos los campos de los registros con actor_id mayor o igual a 10

SELECT * FROM actor WHERE actor_id>=10;

-- Para mostrar todos los campos de los registros con actor_id menor a 10

SELECT * FROM actor WHERE actor_id<10;

-- Para mostrar todos los campos de los registros con actor_id menor o igual a 10

SELECT * FROM actor WHERE actor_id<=10;

-- EJEMPLOS LIKE --

-- Para mostrar todos los registros donde el nombre comienza con "P"
SELECT * FROM actor WHERE first_name LIKE 'P%';

-- Para mostrar todos los registros donde el nombre termina con "A"
SELECT * FROM actor WHERE first_name LIKE '%A';

-- Para mostrar todos los registros donde el nombre contiene "EN"



SELECT * FROM actor WHERE first_name LIKE '%EN%';


-- Para mostrar todos los registros donde la segunda letra del nombre es "E"
SELECT * FROM actor WHERE first_name LIKE '_E%';

-- EJEMPLOS BETWEEN --

-- Para mostrar todos los actores con actor_id entre 5 y 15 (incluyendo ambos valores)
SELECT * FROM actor WHERE actor_id BETWEEN 5 AND 15;

-- Para mostrar todos los registros de alquiler con fecha de alquiler entre '2005-05-01' y '2005-06-01'
SELECT * FROM rental WHERE rental_date BETWEEN '2005-05-01' AND '2005-06-01';

-- EJEMPLOS IN() --

-- Para mostrar todos los actores cuyo actor_id sea 1, 5 o 10
SELECT * FROM actor WHERE actor_id IN (1, 5, 10);

-- Para mostrar todos los actores cuyo nombre sea "PENELOPE", "NICK" o "ED"
SELECT * FROM actor WHERE first_name IN ('PENELOPE', 'NICK', 'ED');
