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

