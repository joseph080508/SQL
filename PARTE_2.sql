-- ============================================================
-- BIBLIA DE SQL
-- Nivel Básico e Intermedio
-- PARTE 2
-- FILTROS Y ORDENAMIENTO
-- ============================================================

-- ============================================================
-- BETWEEN
-- ============================================================
--
-- Descripción:
-- Filtra registros dentro de un rango de valores.
--
-- Cuándo se utiliza:
-- Cuando se necesitan valores comprendidos entre un mínimo y un máximo.
--
-- Sintaxis:
--
-- SELECT columnas
-- FROM tabla
-- WHERE columna BETWEEN valor1 AND valor2;
--
-- Ejemplo 1

SELECT
    p.ProductID,
    p.ProductName,
    p.UnitPrice
FROM Products p
WHERE p.UnitPrice BETWEEN 10000 AND 50000;

-- Ejemplo 2

SELECT
    o.OrderID,
    o.OrderDate
FROM Orders o
WHERE o.OrderDate BETWEEN '2025-01-01' AND '2025-12-31';

-- Buenas prácticas:
--
-- - BETWEEN incluye ambos valores.
-- - También funciona con fechas.

-- ============================================================
-- LIKE
-- ============================================================
--
-- Descripción:
-- Busca texto utilizando caracteres comodín.
--
-- Cuándo se utiliza:
-- Cuando se desconoce el texto completo.
--
-- Comodines:
--
-- %  = Cualquier cantidad de caracteres.
-- _  = Un solo carácter.
--
-- Sintaxis:
--
-- WHERE columna LIKE patrón;
--
-- Ejemplo 1
-- Empieza por A

SELECT *
FROM Customers c
WHERE c.CustomerName LIKE 'A%';

-- Ejemplo 2
-- Termina en o

SELECT *
FROM Customers c
WHERE c.CustomerName LIKE '%o';

-- Ejemplo 3
-- Contiene "Juan"

SELECT *
FROM Customers c
WHERE c.CustomerName LIKE '%Juan%';

-- Ejemplo 4
-- Segunda letra = a

SELECT *
FROM Customers c
WHERE c.CustomerName LIKE '_a%';

-- Buenas prácticas:
--
-- - Evitar LIKE '%texto%' en tablas muy grandes.
-- - Si es posible, utilizar índices.

-- ============================================================
-- IS NULL
-- ============================================================
--
-- Descripción:
-- Busca campos sin información.
--
-- Cuándo se utiliza:
-- Cuando una columna puede estar vacía.
--
-- Sintaxis:
--
-- WHERE columna IS NULL;
--
-- Ejemplo

SELECT *
FROM Customers c
WHERE c.Email IS NULL;

SELECT *
FROM Employees e
WHERE e.Phone IS NULL;

-- Buenas prácticas:
--
-- - Nunca utilizar = NULL.

-- ============================================================
-- IS NOT NULL
-- ============================================================
--
-- Descripción:
-- Busca campos que contienen información.
--
-- Cuándo se utiliza:
-- Cuando se necesitan únicamente registros completos.
--
-- Sintaxis:
--
-- WHERE columna IS NOT NULL;
--
-- Ejemplo

SELECT *
FROM Customers c
WHERE c.Email IS NOT NULL;

SELECT *
FROM Employees e
WHERE e.Phone IS NOT NULL;

-- Buenas prácticas:
--
-- - IS NULL e IS NOT NULL son las únicas formas correctas.

-- ============================================================
-- EXISTS
-- ============================================================
--
-- Descripción:
-- Devuelve TRUE si la subconsulta encuentra registros.
--
-- Cuándo se utiliza:
-- Para verificar la existencia de información relacionada.
--
-- Sintaxis:
--
-- WHERE EXISTS(Subconsulta);
--
-- Ejemplo

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

-- Resultado:
-- Clientes que tienen al menos un pedido.

-- Buenas prácticas:
--
-- - Muy eficiente para validar existencia.
-- - Normalmente más rápido que IN en consultas grandes.

-- ============================================================
-- NOT EXISTS
-- ============================================================
--
-- Descripción:
-- Devuelve TRUE cuando la subconsulta NO encuentra registros.
--
-- Cuándo se utiliza:
-- Para encontrar registros sin relación.
--
-- Sintaxis:
--
-- WHERE NOT EXISTS(Subconsulta);
--
-- Ejemplo

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

-- Resultado:
-- Clientes que nunca han realizado pedidos.

-- Buenas prácticas:
--
-- - Muy útil para detectar información faltante.

-- ============================================================
-- ORDER BY ASC
-- ============================================================
--
-- Descripción:
-- Ordena de menor a mayor o de A a Z.
--
-- Cuándo se utiliza:
-- Cuando se necesita ordenar información ascendentemente.
--
-- Sintaxis:
--
-- ORDER BY columna ASC;
--
-- Ejemplo

SELECT
    p.ProductName,
    p.UnitPrice
FROM Products p
ORDER BY p.UnitPrice ASC;

SELECT
    c.CustomerName
FROM Customers c
ORDER BY c.CustomerName ASC;

-- Buenas prácticas:
--
-- - ASC es el valor predeterminado.

-- ============================================================
-- ORDER BY DESC
-- ============================================================
--
-- Descripción:
-- Ordena de mayor a menor o de Z a A.
--
-- Cuándo se utiliza:
-- Cuando se desean mostrar primero los valores más altos.
--
-- Sintaxis:
--
-- ORDER BY columna DESC;
--
-- Ejemplo

SELECT
    p.ProductName,
    p.UnitPrice
FROM Products p
ORDER BY p.UnitPrice DESC;

SELECT
    c.CustomerName
FROM Customers c
ORDER BY c.CustomerName DESC;

-- Buenas prácticas:
--
-- - Muy utilizado en reportes.

-- ============================================================
-- LIMIT
-- ============================================================
--
-- Descripción:
-- Limita la cantidad de filas devueltas.
--
-- Cuándo se utiliza:
-- Para mostrar solamente cierta cantidad de registros.
--
-- Sintaxis:
--
-- LIMIT cantidad;
--
-- Ejemplo

SELECT *
FROM Products p
LIMIT 10;

SELECT
    c.CustomerName
FROM Customers c
LIMIT 5;

-- Buenas prácticas:
--
-- - Muy útil para pruebas.
-- - Compatible con MySQL, PostgreSQL y SQLite.

-- ============================================================
-- TOP
-- ============================================================
--
-- Descripción:
-- Limita la cantidad de registros en SQL Server.
--
-- Cuándo se utiliza:
-- Cuando se trabaja con Microsoft SQL Server.
--
-- Sintaxis:
--
-- SELECT TOP cantidad columnas
-- FROM tabla;
--
-- Ejemplo

SELECT TOP 10
    p.ProductName,
    p.UnitPrice
FROM Products p;

SELECT TOP 5
    c.CustomerName
FROM Customers c;

-- ============================================================
-- DIFERENCIA ENTRE LIMIT Y TOP
-- ============================================================

-- LIMIT
--
-- Motores:
-- MySQL
-- PostgreSQL
-- SQLite

SELECT *
FROM Products p
LIMIT 10;

--------------------------------------------------------------

-- TOP
--
-- Motor:
-- SQL Server

SELECT TOP 10 *
FROM Products p;

--------------------------------------------------------------

-- Ambos limitan la cantidad de registros.
--
-- LIMIT se escribe al final.
-- TOP se escribe después de SELECT.

-- ==========================
-- FIN PARTE 2
-- ==========================
