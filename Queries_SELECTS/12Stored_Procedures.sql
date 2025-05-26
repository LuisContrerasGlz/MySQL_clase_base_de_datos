USE sakila;

-- Crear un procedimiento que reciba el ID de un cliente y devuelva cuántas películas ha rentado.

DROP PROCEDURE IF EXISTS contar_rentas_cliente;
DELIMITER $$

CREATE PROCEDURE contar_rentas_cliente (
    IN p_customer_id INT,
    OUT total_rentas INT
)
BEGIN
    SELECT COUNT(*) INTO total_rentas
    FROM rental
    WHERE customer_id = p_customer_id;
END$$

DELIMITER ;

CALL contar_rentas_cliente(1, @total);
SELECT @total;

-- Además de devolver el número de rentas, también te devuelva el nombre completo del cliente. 
-- Esto lo logramos agregando otro parámetro de salida (OUT) para el nombre.

USE sakila;
DROP PROCEDURE IF EXISTS contar_rentas_cliente;
DELIMITER $$

CREATE PROCEDURE contar_rentas_cliente (
    IN p_customer_id INT,
    OUT total_rentas INT,
    OUT nombre_cliente VARCHAR(100)
)
BEGIN
    -- Obtener cantidad de rentas
    SELECT COUNT(*) INTO total_rentas
    FROM rental
    WHERE customer_id = p_customer_id;

    -- Obtener nombre completo
    SELECT CONCAT(first_name, ' ', last_name)
    INTO nombre_cliente
    FROM customer
    WHERE customer_id = p_customer_id;
END$$

CALL contar_rentas_cliente(1, @total, @nombre);
SELECT @total, @nombre;


DELIMITER ;

-- Crea un procedimiento que reciba el customer_id y devuelva el nombre completo (first_name + last_name) como salida.

DELIMITER $$

CREATE PROCEDURE obtener_nombre_cliente (
    IN p_customer_id INT,
    OUT nombre_completo VARCHAR(100)
)
BEGIN
    SELECT CONCAT(first_name, ' ', last_name)
    INTO nombre_completo
    FROM customer
    WHERE customer_id = p_customer_id;
END;

-- Crear un procedimiento que reciba el nombre de una categoría (por ejemplo, 'Action') y devuelva cuántas películas hay en esa categoría.

CREATE PROCEDURE contar_peliculas_categoria (
    IN p_categoria VARCHAR(50),
    OUT total INT
)
BEGIN
    SELECT COUNT(*) INTO total
    FROM film_category fc
    JOIN category c ON fc.category_id = c.category_id
    WHERE c.name = p_categoria;
END;

-- Crea un procedimiento que reciba un customer_id y devuelva 1 si existe, o 0 si no.

CREATE PROCEDURE verificar_cliente (
    IN p_customer_id INT,
    OUT existe INT
)
BEGIN
    SELECT COUNT(*) > 0 INTO existe
    FROM customer
    WHERE customer_id = p_customer_id;
END;

-- Crear un procedimiento que reciba un número (min_duracion) y muestre todas las películas que duran más que ese valor.

CREATE PROCEDURE listar_peliculas_largas (
    IN min_duracion INT
)
BEGIN
    SELECT title, length
    FROM film
    WHERE length > min_duracion;
END;

-- Crea un procedimiento que reciba el customer_id y devuelva una lista de títulos de películas que ha rentado.

CREATE PROCEDURE peliculas_rentadas_cliente (
    IN p_customer_id INT
)
BEGIN
    SELECT f.title
    FROM rental r
    JOIN inventory i ON r.inventory_id = i.inventory_id
    JOIN film f ON i.film_id = f.film_id
    WHERE r.customer_id = p_customer_id;
END;

-- Crear un procedimiento que reciba el store_id y devuelva el total de dinero generado por esa tienda.

CREATE PROCEDURE ingresos_por_tienda (
    IN p_store_id INT,
    OUT total_ingresos DECIMAL(10,2)
)
BEGIN
    SELECT SUM(p.amount) INTO total_ingresos
    FROM payment p
    JOIN staff s ON p.staff_id = s.staff_id
    WHERE s.store_id = p_store_id;
END;

-- Crear un procedimiento que reciba el film_id y devuelva el número de copias disponibles en la tabla inventory.

CREATE PROCEDURE verificar_inventario (
    IN p_film_id INT,
    OUT copias_disponibles INT
)
BEGIN
    SELECT COUNT(*) INTO copias_disponibles
    FROM inventory
    WHERE film_id = p_film_id;
END;

-- Crear un procedimiento que reciba el film_id y muestre una lista con los nombres de los actores que participan en esa película.

CREATE PROCEDURE actores_de_pelicula (
    IN p_film_id INT
)
BEGIN
    SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor
    FROM film_actor fa
    JOIN actor a ON fa.actor_id = a.actor_id
    WHERE fa.film_id = p_film_id;
END;

-- Recibir el customer_id y devolver el correo electrónico del cliente.

CREATE PROCEDURE obtener_email_cliente (
    IN p_customer_id INT,
    OUT email_cliente VARCHAR(50)
)
BEGIN
    SELECT email INTO email_cliente
    FROM customer
    WHERE customer_id = p_customer_id;
END;

-- Recibir el nombre de una ciudad y devolver cuántos clientes viven ahí.

CREATE PROCEDURE contar_clientes_ciudad (
    IN p_ciudad VARCHAR(50),
    OUT total INT
)
BEGIN
    SELECT COUNT(*) INTO total
    FROM customer cu
    JOIN address a ON cu.address_id = a.address_id
    JOIN city c ON a.city_id = c.city_id
    WHERE c.city = p_ciudad;
END;

-- Recibir la clasificación (rating, como 'PG' o 'R') y mostrar las películas con esa clasificación.

CREATE PROCEDURE peliculas_por_clasificacion (
    IN p_rating VARCHAR(10)
)
BEGIN
    SELECT title, rating
    FROM film
    WHERE rating = p_rating;
END;

-- Recibir el estado (activo o inactivo) y mostrar la lista de clientes.

CREATE PROCEDURE listar_clientes_estado (
    IN p_activo BOOLEAN
)
BEGIN
    SELECT customer_id, first_name, last_name
    FROM customer
    WHERE active = p_activo;
END;

-- Recibir un número y mostrar las películas con duración menor a ese valor.

CREATE PROCEDURE peliculas_cortas (
    IN max_duracion INT
)
BEGIN
    SELECT title, length
    FROM film
    WHERE length < max_duracion;
END;

-- Recibir una fecha y listar los clientes registrados después de esa fecha.

CREATE PROCEDURE clientes_recientes (
    IN fecha_registro DATE
)
BEGIN
    SELECT customer_id, first_name, last_name, create_date
    FROM customer
    WHERE create_date > fecha_registro;
END;

-- Recibir un store_id y mostrar todas las películas disponibles en esa tienda.

CREATE PROCEDURE peliculas_por_tienda (
    IN p_store_id INT
)
BEGIN
    SELECT DISTINCT f.title
    FROM inventory i
    JOIN film f ON i.film_id = f.film_id
    WHERE i.store_id = p_store_id;
END;

-- 