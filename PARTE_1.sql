-- ============================================================
-- BIBLIA DE SQL
-- Nivel Básico e Intermedio
-- PARTE 1
-- CONSULTAS BÁSICAS
-- ============================================================

-- Tablas utilizadas en todos los ejemplos:
--
-- Customers c
-- Orders o
-- OrderDetails od
-- Products p
-- Categories cat
-- Employees e
-- Invoices i
-- Payments pay

-- ============================================================
-- ¿QUÉ ES SQL?
-- ============================================================
--
-- SQL (Structured Query Language) es el lenguaje utilizado para
-- consultar, insertar, actualizar, eliminar y administrar datos
-- en bases de datos relacionales.
--
-- Con SQL podemos:
--
-- - Consultar información.
-- - Crear bases de datos.
-- - Crear tablas.
-- - Modificar tablas.
-- - Insertar registros.
-- - Actualizar registros.
-- - Eliminar registros.
-- - Relacionar varias tablas.
--

-- ============================================================
-- SELECT
-- ============================================================
--
-- Descripción:
-- Muestra una o varias columnas de una tabla.
--
-- Cuándo se utiliza:
-- Siempre que se necesite consultar información.
--
-- Sintaxis:
--
-- SELECT columnas
-- FROM tabla;
--
-- Ejemplo 1

SELECT *
FROM Customers c;

-- Ejemplo 2

SELECT
    c.CustomerID,
    c.CustomerName,
    c.City
FROM Customers c;

-- Ejemplo 3

SELECT
    p.ProductName,
    p.UnitPrice
FROM Products p;

-- Buenas prácticas:
--
-- - Evitar SELECT * en producción.
-- - Consultar únicamente las columnas necesarias.
-- - Utilizar alias.

-- ============================================================
-- FROM
-- ============================================================
--
-- Descripción:
-- Indica la tabla desde donde se obtendrán los datos.
--
-- Cuándo se utiliza:
-- Siempre después del SELECT.
--
-- Sintaxis:
--
-- SELECT columnas
-- FROM tabla;
--
-- Ejemplo

SELECT
    c.CustomerName
FROM Customers c;

SELECT
    p.ProductName,
    p.UnitPrice
FROM Products p;

-- Buenas prácticas:
--
-- - Siempre utilizar alias.
-- - Mantener nombres claros.

-- ============================================================
-- AS (ALIAS)
-- ============================================================
--
-- Descripción:
-- Cambia temporalmente el nombre de una columna o tabla.
--
-- Cuándo se utiliza:
-- Para mejorar la legibilidad.
--
-- Sintaxis:
--
-- SELECT columna AS Alias
-- FROM tabla AS AliasTabla;
--
-- Ejemplo

SELECT
    c.CustomerName AS Cliente,
    c.City AS Ciudad
FROM Customers c;

SELECT
    p.ProductName AS Producto,
    p.UnitPrice AS Precio
FROM Products p;

-- Buenas prácticas:
--
-- - Utilizar alias descriptivos.
-- - Evitar alias demasiado cortos.

-- ============================================================
-- DISTINCT
-- ============================================================
--
-- Descripción:
-- Elimina valores repetidos.
--
-- Cuándo se utiliza:
-- Cuando solo se desean valores únicos.
--
-- Sintaxis:
--
-- SELECT DISTINCT columna
-- FROM tabla;
--
-- Ejemplo

SELECT DISTINCT
    c.City
FROM Customers c;

SELECT DISTINCT
    p.CategoryID
FROM Products p;

-- Buenas prácticas:
--
-- - Utilizar únicamente cuando sea necesario.
-- - Puede afectar el rendimiento en tablas grandes.

-- ============================================================
-- WHERE
-- ============================================================
--
-- Descripción:
-- Filtra registros que cumplen una condición.
--
-- Cuándo se utiliza:
-- Cuando no se desea mostrar toda la información.
--
-- Sintaxis:
--
-- SELECT columnas
-- FROM tabla
-- WHERE condición;
--
-- Ejemplo

SELECT *
FROM Customers c
WHERE c.City='Bogotá';

SELECT
    p.ProductName,
    p.UnitPrice
FROM Products p
WHERE p.UnitPrice>50000;

SELECT
    e.FirstName,
    e.LastName
FROM Employees e
WHERE e.City='Barranquilla';

-- Buenas prácticas:
--
-- - Filtrar siempre que sea posible.
-- - Utilizar índices en columnas muy consultadas.

-- ============================================================
-- AND
-- ============================================================
--
-- Descripción:
-- Todas las condiciones deben cumplirse.
--
-- Cuándo se utiliza:
-- Cuando existen varios filtros obligatorios.
--
-- Sintaxis:
--
-- WHERE condición1
-- AND condición2;
--
-- Ejemplo

SELECT *
FROM Products p
WHERE p.UnitPrice>50000
AND p.CategoryID=2;

SELECT *
FROM Customers c
WHERE c.City='Bogotá'
AND c.Country='Colombia';

-- Buenas prácticas:
--
-- - Agrupar condiciones con paréntesis cuando sea necesario.

-- ============================================================
-- OR
-- ============================================================
--
-- Descripción:
-- Basta con que una condición sea verdadera.
--
-- Cuándo se utiliza:
-- Cuando existen varias opciones válidas.
--
-- Sintaxis:
--
-- WHERE condición1
-- OR condición2;
--
-- Ejemplo

SELECT *
FROM Customers c
WHERE c.City='Bogotá'
OR c.City='Cali';

SELECT *
FROM Products p
WHERE p.CategoryID=1
OR p.CategoryID=2;

-- Buenas prácticas:
--
-- - Si existen muchos valores utilizar IN.

-- ============================================================
-- NOT
-- ============================================================
--
-- Descripción:
-- Niega una condición.
--
-- Cuándo se utiliza:
-- Para excluir registros.
--
-- Sintaxis:
--
-- WHERE NOT condición;
--
-- Ejemplo

SELECT *
FROM Customers c
WHERE NOT c.City='Bogotá';

SELECT *
FROM Products p
WHERE NOT p.CategoryID=3;

-- Buenas prácticas:
--
-- - Muy útil para excluir información.

-- ============================================================
-- IN
-- ============================================================
--
-- Descripción:
-- Busca varios valores en una sola condición.
--
-- Cuándo se utiliza:
-- Cuando se reemplazan varios OR.
--
-- Sintaxis:
--
-- WHERE columna IN(valor1,valor2,...);
--
-- Ejemplo

SELECT *
FROM Customers c
WHERE c.City IN
(
    'Bogotá',
    'Cali',
    'Medellín'
);

SELECT *
FROM Products p
WHERE p.CategoryID IN
(
    1,
    2,
    5
);

-- Buenas prácticas:
--
-- - Más limpio y fácil de leer que utilizar muchos OR.

-- ============================================================
-- NOT IN
-- ============================================================
--
-- Descripción:
-- Excluye una lista de valores.
--
-- Cuándo se utiliza:
-- Cuando ciertos registros no deben aparecer.
--
-- Sintaxis:
--
-- WHERE columna NOT IN(...);
--
-- Ejemplo

SELECT *
FROM Customers c
WHERE c.City NOT IN
(
    'Bogotá',
    'Cali'
);

SELECT *
FROM Products p
WHERE p.CategoryID NOT IN
(
    2,
    4
);

-- Buenas prácticas:
--
-- - Muy útil para excluir categorías completas.
--
-- ==========================
-- FIN PARTE 1
-- ==========================
