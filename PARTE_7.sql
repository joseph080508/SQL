-- ============================================================
-- BIBLIA DE SQL
-- Nivel Básico e Intermedio
-- PARTE 7
-- SUBCONSULTAS (SUBQUERIES)
-- ============================================================

-- ============================================================
-- ¿QUÉ ES UNA SUBCONSULTA?
-- ============================================================

-- Descripción:
-- Una subconsulta es una consulta SQL dentro de otra consulta.
--
-- Se utiliza para obtener un resultado que será utilizado
-- por la consulta principal.
--
-- Una subconsulta siempre se ejecuta primero.

--------------------------------------------------------------

Ejemplo general

SELECT columnas
FROM tabla
WHERE columna =

(
    SELECT columna
    FROM otra_tabla
);

--------------------------------------------------------------

-- ============================================================
-- SUBCONSULTA EN WHERE
-- ============================================================

-- Descripción:
-- La subconsulta devuelve un valor que utiliza el WHERE.

--------------------------------------------------------------

Ejemplo 1

Mostrar los pedidos realizados por el cliente
con CustomerID = 1.

SELECT
    o.OrderID,
    o.OrderDate
FROM Orders o
WHERE o.CustomerID =
(
    SELECT
        c.CustomerID
    FROM Customers c
    WHERE c.CustomerID = 1
);

--------------------------------------------------------------

Ejemplo 2

Mostrar los productos cuyo precio es mayor
que el precio promedio.

SELECT
    p.ProductName,
    p.UnitPrice
FROM Products p
WHERE p.UnitPrice >
(
    SELECT
        AVG(UnitPrice)
    FROM Products
);

--------------------------------------------------------------

Resultado

Solo aparecerán los productos cuyo precio
sea superior al promedio.

--------------------------------------------------------------

-- ============================================================
-- SUBCONSULTA CON IN
-- ============================================================

-- Descripción:
-- Se utiliza cuando la subconsulta devuelve
-- varios registros.

--------------------------------------------------------------

Ejemplo

Mostrar los clientes que tienen pedidos.

SELECT
    c.CustomerID,
    c.CustomerName
FROM Customers c
WHERE c.CustomerID IN
(
    SELECT
        o.CustomerID
    FROM Orders o
);

--------------------------------------------------------------

Explicación

La subconsulta devuelve todos los CustomerID
existentes en Orders.

La consulta principal muestra únicamente
esos clientes.

--------------------------------------------------------------

Otro ejemplo

Mostrar productos pertenecientes
a las categorías 1 y 2 obtenidas
desde otra consulta.

SELECT
    p.ProductName
FROM Products p
WHERE p.CategoryID IN
(
    SELECT
        cat.CategoryID
    FROM Categories cat
    WHERE cat.CategoryID IN (1,2)
);

--------------------------------------------------------------

-- ============================================================
-- SUBCONSULTA CON NOT IN
-- ============================================================

-- Descripción:
-- Devuelve los registros que NO aparecen
-- en la subconsulta.

--------------------------------------------------------------

Ejemplo

Clientes que nunca han realizado pedidos.

SELECT
    c.CustomerID,
    c.CustomerName
FROM Customers c
WHERE c.CustomerID NOT IN
(
    SELECT
        o.CustomerID
    FROM Orders o
);

--------------------------------------------------------------

Resultado

Clientes sin pedidos.

--------------------------------------------------------------

-- ============================================================
-- SUBCONSULTA CON EXISTS
-- ============================================================

-- Descripción:
-- EXISTS devuelve TRUE cuando la subconsulta
-- encuentra registros.

--------------------------------------------------------------

Ejemplo

SELECT
    c.CustomerID,
    c.CustomerName
FROM Customers c
WHERE EXISTS
(
    SELECT 1
    FROM Orders o
    WHERE o.CustomerID = c.CustomerID
);

--------------------------------------------------------------

Resultado

Clientes que tienen al menos un pedido.

--------------------------------------------------------------

¿Por qué SELECT 1?

Porque EXISTS solo necesita comprobar
si existe un registro.

No importa qué columna se seleccione.

--------------------------------------------------------------

-- ============================================================
-- SUBCONSULTA CON NOT EXISTS
-- ============================================================

-- Descripción:
-- Devuelve TRUE cuando NO existe
-- un registro relacionado.

--------------------------------------------------------------

Ejemplo

SELECT
    c.CustomerID,
    c.CustomerName
FROM Customers c
WHERE NOT EXISTS
(
    SELECT 1
    FROM Orders o
    WHERE o.CustomerID = c.CustomerID
);

--------------------------------------------------------------

Resultado

Clientes sin pedidos.

--------------------------------------------------------------

-- ============================================================
-- SUBCONSULTA EN SELECT
-- ============================================================

-- Descripción:
-- Una subconsulta también puede devolver
-- un valor dentro del SELECT.

--------------------------------------------------------------

Ejemplo

SELECT
    c.CustomerName,

    (
        SELECT COUNT(*)
        FROM Orders o
        WHERE o.CustomerID = c.CustomerID
    ) AS TotalPedidos

FROM Customers c;

--------------------------------------------------------------

Resultado

Cliente      TotalPedidos

Juan              5

Pedro             2

Ana               0

--------------------------------------------------------------

-- ============================================================
-- SUBCONSULTA EN FROM
-- ============================================================

-- Descripción:
-- Una subconsulta puede actuar
-- como si fuera una tabla temporal.

--------------------------------------------------------------

Ejemplo

SELECT
    t.CategoryID,
    t.Promedio
FROM
(
    SELECT
        p.CategoryID,
        AVG(p.UnitPrice) AS Promedio
    FROM Products p
    GROUP BY p.CategoryID
) AS t;

--------------------------------------------------------------

Resultado

CategoryID    Promedio

1             25

2             80

3             45

--------------------------------------------------------------

-- ============================================================
-- SUBCONSULTA CORRELACIONADA
-- ============================================================

-- Descripción:
-- Depende de la consulta principal.
--
-- Se ejecuta una vez por cada fila.

--------------------------------------------------------------

Ejemplo

Mostrar productos cuyo precio es mayor
que el promedio de su categoría.

SELECT
    p.ProductName,
    p.UnitPrice,
    p.CategoryID
FROM Products p
WHERE p.UnitPrice >
(
    SELECT
        AVG(p2.UnitPrice)
    FROM Products p2
    WHERE p2.CategoryID = p.CategoryID
);

--------------------------------------------------------------

Resultado

Cada producto se compara únicamente
con el promedio de su categoría.

--------------------------------------------------------------

-- ============================================================
-- DIFERENCIA ENTRE IN Y EXISTS
-- ============================================================

IN

Compara valores.

Ideal para listas pequeñas.

--------------------------------------------------------------

EXISTS

Comprueba si existe un registro.

Ideal para tablas grandes.

--------------------------------------------------------------

Ejemplo IN

WHERE CustomerID IN
(
    SELECT CustomerID
    FROM Orders
);

--------------------------------------------------------------

Ejemplo EXISTS

WHERE EXISTS
(
    SELECT 1
    FROM Orders o
    WHERE o.CustomerID = c.CustomerID
);

--------------------------------------------------------------

-- ============================================================
-- ERRORES COMUNES
-- ============================================================

ERROR

La subconsulta devuelve varias filas
cuando el operador espera una sola.

Incorrecto

SELECT *
FROM Products p
WHERE p.CategoryID =
(
    SELECT
        cat.CategoryID
    FROM Categories cat
);

--------------------------------------------------------------

Correcto

SELECT *
FROM Products p
WHERE p.CategoryID IN
(
    SELECT
        cat.CategoryID
    FROM Categories cat
);

--------------------------------------------------------------

ERROR

Olvidar relacionar una subconsulta
correlacionada.

Incorrecto

WHERE EXISTS
(
    SELECT *
    FROM Orders o
);

--------------------------------------------------------------

Correcto

WHERE EXISTS
(
    SELECT 1
    FROM Orders o
    WHERE o.CustomerID = c.CustomerID
);

--------------------------------------------------------------

-- ============================================================
-- RESUMEN
-- ============================================================

Subconsulta en WHERE

Devuelve un único valor.

--------------------------------------------------------------

Subconsulta con IN

Devuelve varios valores.

--------------------------------------------------------------

Subconsulta con NOT IN

Excluye los valores devueltos.

--------------------------------------------------------------

Subconsulta con EXISTS

Comprueba existencia.

--------------------------------------------------------------

Subconsulta con NOT EXISTS

Comprueba que NO exista información.

--------------------------------------------------------------

Subconsulta en SELECT

Devuelve un valor por cada fila.

--------------------------------------------------------------

Subconsulta en FROM

Se utiliza como tabla temporal.

--------------------------------------------------------------

Subconsulta correlacionada

Depende de la consulta principal.

-- ============================================================
-- FIN PARTE 7
-- ============================================================
