DROP VIEW IF EXISTS vista_clientes;

CREATE VIEW vista_clientes AS
SELECT
c.customer_id AS customer_id,
CONCAT(c.first_name,
' ', c.last_name) AS nombre_completo,
ci.city AS city,
co.country AS country
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id;

select * from vista_clientes;

DROP VIEW IF EXISTS vista_clientes_activos; 

CREATE VIEW vista_clientes_activos AS
SELECT
c.customer_id AS customer_id,
CONCAT(c.first_name,
' ', c.last_name) AS nombre_completo,
ci.city AS city,
co.country AS country
FROM customer c
JOIN address a ON c.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id
WHERE c.active = 1;

SELECT * FROM vista_clientes_activos;