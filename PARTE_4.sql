-- ============================================================
-- BIBLIA DE SQL
-- Nivel Básico e Intermedio
-- PARTE 4
-- GROUP BY Y HAVING
-- ============================================================

-- ============================================================
-- ¿QUÉ ES UNA AGRUPACIÓN?
-- ============================================================
--
-- Una agrupación permite reunir registros que tienen el mismo
-- valor en una o varias columnas.
--
-- Normalmente se utiliza junto con funciones como:
--
-- COUNT()
-- SUM()
-- AVG()
-- MAX()
-- MIN()
--
-- Sin GROUP BY las funciones trabajan sobre toda la tabla.
-- Con GROUP BY trabajan sobre cada grupo.

-- ============================================================
-- GROUP BY
-- ============================================================
--
-- Descripción:
-- Agrupa registros que tienen el mismo valor.
--
-- Cuándo se utiliza:
-- Cuando se desean obtener estadísticas por categoría,
-- ciudad, cliente, empleado, producto, etc.
--
-- Sintaxis:
--
-- SELECT columna, función()
-- FROM tabla
-- GROUP BY columna;
--
-- Ejemplo 1
-- Cantidad de productos por categoría

SELECT
    p.CategoryID,
    COUNT(*) AS TotalProductos
FROM Products p
GROUP BY p.CategoryID;

------------------------------------------------------------

-- Ejemplo 2
-- Cantidad de clientes por ciudad

SELECT
    c.City,
    COUNT(*) AS TotalClientes
FROM Customers c
GROUP BY c.City;

------------------------------------------------------------

-- Ejemplo 3
-- Precio promedio por categoría

SELECT
    p.CategoryID,
    AVG(p.UnitPrice) AS PrecioPromedio
FROM Products p
GROUP BY p.CategoryID;

------------------------------------------------------------

-- Ejemplo 4
-- Precio máximo por categoría

SELECT
    p.CategoryID,
    MAX(p.UnitPrice) AS PrecioMayor
FROM Products p
GROUP BY p.CategoryID;

------------------------------------------------------------

-- Ejemplo 5
-- Precio mínimo por categoría

SELECT
    p.CategoryID,
    MIN(p.UnitPrice) AS PrecioMenor
FROM Products p
GROUP BY p.CategoryID;

------------------------------------------------------------

-- Ejemplo 6
-- Valor total por categoría

SELECT
    p.CategoryID,
    SUM(p.UnitPrice) AS ValorTotal
FROM Products p
GROUP BY p.CategoryID;

------------------------------------------------------------

-- Ejemplo 7
-- Agrupar por dos columnas

SELECT
    c.Country,
    c.City,
    COUNT(*) AS TotalClientes
FROM Customers c
GROUP BY
    c.Country,
    c.City;

------------------------------------------------------------

-- Buenas prácticas
--
-- Toda columna del SELECT que NO tenga una función
-- debe aparecer en el GROUP BY.
--
-- Correcto

SELECT
    c.City,
    COUNT(*)
FROM Customers c
GROUP BY c.City;

------------------------------------------------------------

-- Incorrecto

SELECT
    c.CustomerName,
    c.City,
    COUNT(*)
FROM Customers c;

-- Error porque CustomerName no está agrupada.

------------------------------------------------------------

-- ============================================================
-- HAVING
-- ============================================================
--
-- Descripción:
-- Filtra grupos después del GROUP BY.
--
-- Cuándo se utiliza:
-- Cuando se desea filtrar resultados agrupados.
--
-- Sintaxis:
--
-- SELECT ...
-- FROM ...
-- GROUP BY ...
-- HAVING condición;
--
-- Ejemplo 1
-- Mostrar únicamente ciudades con más de 5 clientes

SELECT
    c.City,
    COUNT(*) AS TotalClientes
FROM Customers c
GROUP BY c.City
HAVING COUNT(*) > 5;

------------------------------------------------------------

-- Ejemplo 2
-- Categorías cuyo precio promedio supera 100

SELECT
    p.CategoryID,
    AVG(p.UnitPrice) AS Promedio
FROM Products p
GROUP BY p.CategoryID
HAVING AVG(p.UnitPrice) > 100;

------------------------------------------------------------

-- Ejemplo 3
-- Categorías cuyo precio máximo supera 500

SELECT
    p.CategoryID,
    MAX(p.UnitPrice) AS PrecioMayor
FROM Products p
GROUP BY p.CategoryID
HAVING MAX(p.UnitPrice) > 500;

------------------------------------------------------------

-- Ejemplo 4
-- Categorías con más de 10 productos

SELECT
    p.CategoryID,
    COUNT(*) AS TotalProductos
FROM Products p
GROUP BY p.CategoryID
HAVING COUNT(*) > 10;

------------------------------------------------------------

-- Ejemplo 5
-- Total vendido por cliente

SELECT
    o.CustomerID,
    SUM(od.Quantity) AS TotalVendido
FROM Orders o
INNER JOIN OrderDetails od
ON o.OrderID = od.OrderID
GROUP BY o.CustomerID
HAVING SUM(od.Quantity) > 100;

------------------------------------------------------------

-- WHERE vs HAVING

-- WHERE filtra filas antes de agrupar.

SELECT
    *
FROM Products p
WHERE p.UnitPrice > 100;

------------------------------------------------------------

-- HAVING filtra grupos después de agrupar.

SELECT
    p.CategoryID,
    AVG(p.UnitPrice)
FROM Products p
GROUP BY p.CategoryID
HAVING AVG(p.UnitPrice) > 100;

------------------------------------------------------------

-- ============================================================
-- WHERE + GROUP BY + HAVING
-- ============================================================

-- Ejemplo completo

SELECT
    p.CategoryID,
    COUNT(*) AS TotalProductos,
    AVG(p.UnitPrice) AS Promedio
FROM Products p
WHERE p.UnitPrice > 20
GROUP BY p.CategoryID
HAVING COUNT(*) >= 3
ORDER BY Promedio DESC;

------------------------------------------------------------

-- Explicación

-- WHERE
-- Elimina primero los productos con precio menor o igual a 20.

-- GROUP BY
-- Agrupa los productos por categoría.

-- COUNT()
-- Cuenta productos por categoría.

-- AVG()
-- Calcula el promedio por categoría.

-- HAVING
-- Elimina categorías con menos de 3 productos.

-- ORDER BY
-- Ordena el promedio de mayor a menor.

------------------------------------------------------------

-- ============================================================
-- FUNCIONES MÁS USADAS CON GROUP BY
-- ============================================================

-- COUNT()

SELECT
    c.City,
    COUNT(*) AS Total
FROM Customers c
GROUP BY c.City;

------------------------------------------------------------

-- SUM()

SELECT
    p.CategoryID,
    SUM(p.UnitPrice) AS Total
FROM Products p
GROUP BY p.CategoryID;

------------------------------------------------------------

-- AVG()

SELECT
    p.CategoryID,
    AVG(p.UnitPrice) AS Promedio
FROM Products p
GROUP BY p.CategoryID;

------------------------------------------------------------

-- MAX()

SELECT
    p.CategoryID,
    MAX(p.UnitPrice) AS PrecioMayor
FROM Products p
GROUP BY p.CategoryID;

------------------------------------------------------------

-- MIN()

SELECT
    p.CategoryID,
    MIN(p.UnitPrice) AS PrecioMenor
FROM Products p
GROUP BY p.CategoryID;

------------------------------------------------------------

-- ============================================================
-- ERRORES COMUNES
-- ============================================================

-- ERROR 1

SELECT
    p.ProductName,
    COUNT(*)
FROM Products p;

-- ProductName no está agrupado.

------------------------------------------------------------

-- ERROR 2

Usar HAVING cuando debería utilizarse WHERE.

Incorrecto

SELECT
    *
FROM Products p
HAVING p.UnitPrice > 100;

Correcto

SELECT
    *
FROM Products p
WHERE p.UnitPrice > 100;

------------------------------------------------------------

-- ERROR 3

Olvidar GROUP BY al utilizar funciones y columnas.

Incorrecto

SELECT
    c.City,
    COUNT(*)
FROM Customers c;

Correcto

SELECT
    c.City,
    COUNT(*)
FROM Customers c
GROUP BY c.City;

------------------------------------------------------------

-- ============================================================
-- RESUMEN
-- ============================================================

-- GROUP BY
-- Agrupa registros.

-- HAVING
-- Filtra grupos.

-- WHERE
-- Filtra filas antes del GROUP BY.

-- HAVING
-- Filtra grupos después del GROUP BY.

-- Orden correcto:

-- SELECT
-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- ORDER BY

-- ============================================================
-- FIN PARTE 4
-- ============================================================
