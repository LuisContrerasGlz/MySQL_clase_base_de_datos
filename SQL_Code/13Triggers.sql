-- Actualizar el campo last_update de rental cuando se inserta un nuevo payment

DELIMITER $$

CREATE TRIGGER actualizar_lastupdate_rental
AFTER INSERT ON payment
FOR EACH ROW
BEGIN
    UPDATE rental
    SET last_update = NOW()
    WHERE rental_id = NEW.rental_id;
END$$

DELIMITER ;

SELECT rental_id FROM rental LIMIT 5;

SELECT rental_id, last_update FROM rental WHERE rental_id = 2;

INSERT INTO payment (customer_id, staff_id, rental_id, amount, payment_date)
VALUES (2, 2, 2, 3.99, NOW());

SELECT rental_id, last_update FROM rental WHERE rental_id = 2;



-- Actividad

/*

1. Actualizar last_update de customer cuando se actualice su dirección

Crea un trigger que actualice el campo last_update de la tabla customer cuando se modifique su address_id.

*/

DELIMITER $$

CREATE TRIGGER actualizar_cliente_lastupdate
BEFORE UPDATE ON customer
FOR EACH ROW
BEGIN
    IF OLD.address_id <> NEW.address_id THEN
        SET NEW.last_update = NOW();
    END IF;
END$$

DELIMITER ;

/*

2. Actualizar last_update de rental al insertar un payment

Cuando se inserte un pago, actualiza el campo last_update del rental asociado.

*/

DELIMITER $$

CREATE TRIGGER actualizar_lastupdate_rental
AFTER INSERT ON payment
FOR EACH ROW
BEGIN
    IF NEW.rental_id IS NOT NULL THEN
        UPDATE rental
        SET last_update = NOW()
        WHERE rental_id = NEW.rental_id;
    END IF;
END$$

DELIMITER ;

/*

3. Actualizar last_update de la tabla inventory al actualizar film_id

Cuando se actualice el film_id de un inventario, actualiza su campo last_update.

*/

DELIMITER $$

CREATE TRIGGER actualizar_inventory_lastupdate
BEFORE UPDATE ON inventory
FOR EACH ROW
BEGIN
    IF OLD.film_id <> NEW.film_id THEN
        SET NEW.last_update = NOW();
    END IF;
END$$

DELIMITER ;

/* 

4. Actualizar last_update de la tabla staff cuando se modifique su nombre

Cuando se actualice el first_name o last_name de un empleado (staff), también debe actualizarse el campo last_update.

*/

DELIMITER $$

CREATE TRIGGER actualizar_lastupdate_staff
BEFORE UPDATE ON staff
FOR EACH ROW
BEGIN
    IF OLD.first_name <> NEW.first_name OR OLD.last_name <> NEW.last_name THEN
        SET NEW.last_update = NOW();
    END IF;
END$$

DELIMITER ;

