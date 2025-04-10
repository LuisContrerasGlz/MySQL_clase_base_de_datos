-- LEFT/RIGHT JOINS

/*

Liste las ciudades (id y nombre) y las tiendas que se encuentran en cada ciudad, 
use RIGHT JOIN para mostrar TODAS las ciudades haya o no tiendas en ellas. 

*/

SELECT st.store_id, st.address_id, ci.city_id, ci.city 
FROM store as st 
RIGHT JOIN address as ad on st.address_id = ad.address_id
RIGHT JOIN city as ci on ad.city_id = ci.city_id order by ci.city_id;

/*

Liste los países (id y nombre) y las ciudades que se encuentran en cada país, 
use RIGHT JOIN para mostrar TODOS los países haya o no ciudades  en ellos. 

*/

SELECT ci.city_id, ci.city, co.country_id, co.country 
FROM city as ci 
RIGHT JOIN country as co on ci.country_id = co.country_id 
ORDER BY co.country_id;

/* 

Liste las ciudades (id y nombre) y los clientes que se encuentran en cada ciudad, 
use RIGHT JOIN para mostrar TODAS las ciudades haya o no clientes en ellas. 

*/

SELECT cu.customer_id,cu.first_name,cu.last_name, ci.city_id, ci.city 
FROM customer as cu 
RIGHT JOIN address as ad on cu.address_id = ad.address_id
RIGHT JOIN city as ci on ad.city_id = ci.city_id 
ORDER BY ci.city_id;

-- Liste las películas que para la tienda 1 no hayan sido rentadas 

SELECT f.film_id, f.title
FROM film f
JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
WHERE i.store_id = 1 AND r.rental_id IS NULL;

-- listar los nombres de los actores y en cuantas películas del catalogo participa 

SELECT a.actor_id, CONCAT(a.first_name, ' ', a.last_name) AS actor_name, COUNT(fa.film_id) AS total_movies
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY a.actor_id
ORDER BY actor_name;

-- liste los nombres de las películas y en cuantas tiendas están registradas 

SELECT f.title, COUNT(DISTINCT i.store_id) AS total_stores
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
GROUP BY f.film_id
ORDER BY total_stores DESC;


-- Liste los idiomas y cuantas películas están habladas en ese idioma

SELECT l.name AS language,  COUNT(f.film_id) AS total_movies
FROM language l
LEFT JOIN film f ON l.language_id = f.language_id
GROUP BY l.language_id, l.name
ORDER BY total_movies DESC;

-- Liste cuantas veces ha sido rentada cada película en el catalogo 

SELECT  f.title AS film_title, COUNT(r.rental_id) AS total_rentals
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.film_id, f.title
ORDER BY total_rentals DESC;

-- Liste los idiomas y cuantas películas están habladas en ese idioma

SELECT r.rental_id, COUNT(p.payment_id) AS total_payments
FROM rental r
LEFT JOIN payment p ON r.rental_id = p.rental_id
GROUP BY r.rental_id
ORDER BY total_payments DESC;

-- Liste cuantas películas ha rentado cada cliente 

SELECT c.customer_id, CONCAT(c.first_name, ' ', c.last_name) AS customer_name,  COUNT(r.rental_id) AS total_rentals
FROM customer c
LEFT JOIN rental r ON c.customer_id = r.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY total_rentals DESC;

-- Liste cuantas películas ha rentado cada miembro del staff 

SELECT 
    s.staff_id,
    CONCAT(s.first_name, ' ', s.last_name) AS staff_name,
    COUNT(r.rental_id) AS total_rentals
FROM staff s
LEFT JOIN rental r ON s.staff_id = r.staff_id
GROUP BY s.staff_id, staff_name
ORDER BY total_rentals DESC;

-- Liste los clientes que han generado pagos con un monto total mayor a $10

SELECT c.first_name, c.last_name, SUM(p.amount) AS total_paid
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
HAVING SUM(p.amount) > 10;

-- Liste los empleados que han generado pagos con un monto total mayor a $100

SELECT s.first_name, s.last_name, SUM(p.amount) AS total_processed
FROM staff s
JOIN payment p ON s.staff_id = p.staff_id
GROUP BY s.staff_id
HAVING SUM(p.amount) > 100;

-- Calcule el número de pagos realizados por cada cliente en el mes de junio

SELECT c.first_name, c.last_name, COUNT(p.payment_id) AS total_payments
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
WHERE MONTH(p.payment_date) = 6
GROUP BY c.customer_id;

-- Calcule la cantidad de películas por cada duración de renta (rental_duration)

SELECT rental_duration, COUNT(*) AS total_films
FROM film
GROUP BY rental_duration;

-- Calcule la cantidad total de pagos recibidos cada año

SELECT YEAR(payment_date) AS year, SUM(amount) AS total_payments
FROM payment
GROUP BY YEAR(payment_date);

-- Calcule el monto total de pagos por cada día de la semana

SELECT DAYNAME(payment_date) AS day_of_week, SUM(amount) AS total_amount
FROM payment
GROUP BY DAYNAME(payment_date);

-- Liste los días donde el total de pagos fue mayor a $50

SELECT DATE(payment_date) AS payment_day, SUM(amount) AS total_amount
FROM payment
GROUP BY DATE(payment_date)
HAVING SUM(amount) > 50;

-- Calcule cuántas películas hay en cada duración (length) específica

SELECT length, COUNT(*) AS total_films
FROM film
GROUP BY length;

-- Calcule la cantidad de pagos realizados en cada tienda

SELECT s.store_id, COUNT(p.payment_id) AS total_payments
FROM payment p
JOIN staff s ON p.staff_id = s.staff_id
GROUP BY s.store_id;

-- Calcule el monto total de pagos por cada cliente, pero solo para aquellos que han realizado más de 5 pagos

SELECT c.first_name, c.last_name, COUNT(p.payment_id) AS num_payments, SUM(p.amount) AS total_paid
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
HAVING COUNT(p.payment_id) > 5;

-- Calcule el número de películas (puede haber más de 1 película por cada título) según su clasificación (rating)

SELECT rating, COUNT(*) AS total_films
FROM film
GROUP BY rating;

-- Liste los clientes que han realizado pagos con un monto promedio mayor a $5

SELECT c.first_name, c.last_name, AVG(p.amount) AS avg_payment
FROM customer c
JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
HAVING AVG(p.amount) > 5;

-- Calcule la cantidad de títulos de películas en cada duración de renta (rental_duration) mayor a 5 días

SELECT rental_duration, COUNT(*) AS total_titles
FROM film
WHERE rental_duration > 5
GROUP BY rental_duration;

-- Liste el total de pagos recibidos por cada mes, pero solo los meses con más de 100 pagos

SELECT MONTH(payment_date) AS month, COUNT(*) AS total_payments, SUM(amount) AS total_amount
FROM payment
GROUP BY MONTH(payment_date)
HAVING COUNT(*) > 100;

-- Liste las clasificaciones de películas (rating) que tienen más de 50 películas registradas

SELECT rating, COUNT(*) AS total_films
FROM film
GROUP BY rating
HAVING COUNT(*) > 50;








