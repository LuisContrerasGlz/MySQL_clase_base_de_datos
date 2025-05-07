-- Muestra los títulos de todas las películas junto con el nombre de la categoría a la que pertenecen.

SELECT f.title, c.name AS category
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id;

-- Lista todas las películas con el idioma en que están habladas. Si alguna película no tiene idioma, muestra "NULL".

SELECT f.title, l.name AS language
FROM film f
LEFT JOIN language l ON f.language_id = l.language_id;

-- Muestra todas las categorías, y si tienen películas, el número de películas en esa categoría. Si no tienen, muestra 0.

SELECT c.name AS category, COUNT(fc.film_id) AS total_films
FROM film_category fc
RIGHT JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name;

-- Lista todos los clientes y cuánto dinero han pagado en total. Si no han hecho pagos, muestra 0.

SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name, 
       IFNULL(SUM(p.amount), 0) AS total_paid
FROM customer c
LEFT JOIN payment p ON c.customer_id = p.customer_id
GROUP BY customer_name;

-- Muestra todas las direcciones y, si hay una tienda en esa dirección, muestra su ID.

SELECT a.address, s.store_id
FROM store s
RIGHT JOIN address a ON s.address_id = a.address_id;

-- Muestra la fecha de renta y el título de la película que fue rentada.

SELECT r.rental_date, f.title
FROM rental r
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id;

-- Lista todos los empleados y la tienda en la que trabajan. Si algún empleado no tiene tienda asignada, muestra NULL.

SELECT CONCAT(e.first_name, ' ', e.last_name) AS employee, s.store_id
FROM staff e
LEFT JOIN store s ON e.store_id = s.store_id;

-- Muestra todas las ciudades y la cantidad de clientes que viven en ellas. Si no hay clientes, muestra 0.

SELECT ci.city, COUNT(c.customer_id) AS total_customers
FROM customer c
RIGHT JOIN address a ON c.address_id = a.address_id
RIGHT JOIN city ci ON a.city_id = ci.city_id
GROUP BY ci.city;

-- Lista los clientes junto con las películas que han rentado.

SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer, f.title
FROM rental r
INNER JOIN inventory i ON r.inventory_id = i.inventory_id
INNER JOIN film f ON i.film_id = f.film_id
INNER JOIN customer c ON r.customer_id = c.customer_id;

-- Muestra todas las películas y cuántas veces han sido rentadas. Incluye las que nunca se han rentado.

SELECT f.title, COUNT(r.rental_id) AS times_rented
FROM film f
LEFT JOIN inventory i ON f.film_id = i.film_id
LEFT JOIN rental r ON i.inventory_id = r.inventory_id
GROUP BY f.title;

-- Muestra todos los actores junto con la cantidad de películas en las que han actuado. Si un actor no ha actuado en ninguna película, mostrar 0.

SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor_name,
       COUNT(fa.film_id) AS total_films
FROM actor a
LEFT JOIN film_actor fa ON a.actor_id = fa.actor_id
GROUP BY actor_name;

-- Muestra todas las tiendas, incluso si no tienen empleados asignados, junto con la cantidad de empleados que trabajan en cada una.

SELECT s.store_id, COUNT(st.staff_id) AS total_employees
FROM staff st
RIGHT JOIN store s ON st.store_id = s.store_id
GROUP BY s.store_id;