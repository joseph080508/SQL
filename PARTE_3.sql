-- ============================================================
-- BIBLIA DE SQL
-- Nivel Básico e Intermedio
-- PARTE 3
-- FUNCIONES
-- ============================================================

-- ============================================================
-- ¿QUÉ ES UNA FUNCIÓN?
-- ============================================================
--
-- Una función recibe uno o varios valores,
-- realiza una operación y devuelve un resultado.
--
-- Existen funciones:
--
-- • De agregación
-- • De texto
-- • Numéricas
-- • De fecha
--
-- En esta sección veremos las más utilizadas
-- en un examen de SQL.

-- ============================================================
-- COUNT()
-- ============================================================
--
-- Descripción:
-- Cuenta la cantidad de registros.
--
-- Cuándo se utiliza:
-- Cuando se necesita conocer cuántas filas existen.
--
-- Sintaxis:
--
-- SELECT COUNT(*)
-- FROM tabla;
--
-- Ejemplo 1

SELECT COUNT(*)
FROM Customers c;

-- Ejemplo 2

SELECT
    COUNT(*) AS TotalProductos
FROM Products p;

-- Ejemplo 3

SELECT
    COUNT(p.ProductID) AS TotalProductos
FROM Products p;

-- Buenas prácticas:
--
-- COUNT(*) cuenta todas las filas.
-- COUNT(columna) ignora los valores NULL.

---------------------------------------------------------------

-- ============================================================
-- SUM()
-- ============================================================
--
-- Descripción:
-- Suma valores numéricos.
--
-- Cuándo se utiliza:
-- Para calcular totales.
--
-- Sintaxis:
--
-- SELECT SUM(columna)
-- FROM tabla;
--
-- Ejemplo

SELECT
    SUM(p.UnitPrice) AS TotalPrecio
FROM Products p;

-- Ejemplo

SELECT
    SUM(od.Quantity) AS TotalCantidad
FROM OrderDetails od;

-- Buenas prácticas:
--
-- Solo utilizar con columnas numéricas.

---------------------------------------------------------------

-- ============================================================
-- AVG()
-- ============================================================
--
-- Descripción:
-- Calcula el promedio.
--
-- Cuándo se utiliza:
-- Para obtener el valor medio.
--
-- Sintaxis:
--
-- SELECT AVG(columna)
-- FROM tabla;
--
-- Ejemplo

SELECT
    AVG(p.UnitPrice) AS PrecioPromedio
FROM Products p;

-- Ejemplo

SELECT
    AVG(od.Quantity) AS PromedioCantidad
FROM OrderDetails od;

-- Buenas prácticas:
--
-- AVG ignora los valores NULL.

---------------------------------------------------------------

-- ============================================================
-- MAX()
-- ============================================================
--
-- Descripción:
-- Devuelve el valor más grande.
--
-- Cuándo se utiliza:
-- Para encontrar el máximo.
--
-- Sintaxis:
--
-- SELECT MAX(columna)
-- FROM tabla;
--
-- Ejemplo

SELECT
    MAX(p.UnitPrice) AS PrecioMayor
FROM Products p;

-- Ejemplo

SELECT
    MAX(o.OrderDate) AS UltimoPedido
FROM Orders o;

-- Buenas prácticas:
--
-- Muy útil para encontrar fechas recientes.

---------------------------------------------------------------

-- ============================================================
-- MIN()
-- ============================================================
--
-- Descripción:
-- Devuelve el valor más pequeño.
--
-- Cuándo se utiliza:
-- Para encontrar el mínimo.
--
-- Sintaxis:
--
-- SELECT MIN(columna)
-- FROM tabla;
--
-- Ejemplo

SELECT
    MIN(p.UnitPrice) AS PrecioMenor
FROM Products p;

-- Ejemplo

SELECT
    MIN(o.OrderDate) AS PrimerPedido
FROM Orders o;

-- Buenas prácticas:
--
-- Puede utilizarse con números, fechas y texto.

---------------------------------------------------------------

-- ============================================================
-- ROUND()
-- ============================================================
--
-- Descripción:
-- Redondea números decimales.
--
-- Cuándo se utiliza:
-- Cuando se necesita controlar la cantidad de decimales.
--
-- Sintaxis:
--
-- ROUND(numero,decimales)
--
-- Ejemplo

SELECT
    ROUND(AVG(p.UnitPrice),2) AS Promedio
FROM Products p;

-- Ejemplo

SELECT
    ROUND(150.6789,2);

-- Resultado

150.68

-- Buenas prácticas:
--
-- Muy utilizada en reportes financieros.

---------------------------------------------------------------

-- ============================================================
-- CONCAT()
-- ============================================================
--
-- Descripción:
-- Une varios textos.
--
-- Cuándo se utiliza:
-- Para construir nombres completos o mensajes.
--
-- Sintaxis:
--
-- CONCAT(texto1,texto2,...)
--
-- Ejemplo

SELECT
    CONCAT(c.FirstName,' ',c.LastName) AS NombreCompleto
FROM Customers c;

-- Ejemplo

SELECT
    CONCAT(p.ProductName,' - $',p.UnitPrice) AS Producto
FROM Products p;

-- Buenas prácticas:
--
-- Facilita mostrar información más legible.

---------------------------------------------------------------

-- ============================================================
-- UPPER()
-- ============================================================
--
-- Descripción:
-- Convierte un texto a MAYÚSCULAS.
--
-- Cuándo se utiliza:
-- Para normalizar datos.
--
-- Sintaxis:
--
-- UPPER(columna)
--
-- Ejemplo

SELECT
    UPPER(c.CustomerName)
FROM Customers c;

-- Ejemplo

SELECT
    UPPER(p.ProductName)
FROM Products p;

---------------------------------------------------------------

-- ============================================================
-- LOWER()
-- ============================================================
--
-- Descripción:
-- Convierte un texto a minúsculas.
--
-- Cuándo se utiliza:
-- Para normalizar información.
--
-- Sintaxis:
--
-- LOWER(columna)
--
-- Ejemplo

SELECT
    LOWER(c.CustomerName)
FROM Customers c;

-- Ejemplo

SELECT
    LOWER(p.ProductName)
FROM Products p;

---------------------------------------------------------------

-- ============================================================
-- LENGTH()
-- ============================================================
--
-- Descripción:
-- Devuelve la cantidad de caracteres de un texto.
--
-- Cuándo se utiliza:
-- Para validar tamaños de cadenas.
--
-- Sintaxis:
--
-- LENGTH(columna)
--
-- Ejemplo

SELECT
    LENGTH(c.CustomerName)
FROM Customers c;

-- Ejemplo

SELECT
    c.CustomerName,
    LENGTH(c.CustomerName) AS CantidadCaracteres
FROM Customers c;

-- Buenas prácticas:
--
-- En SQL Server la función equivalente es LEN().

---------------------------------------------------------------

-- ============================================================
-- TRIM()
-- ============================================================
--
-- Descripción:
-- Elimina espacios al inicio y al final de un texto.
--
-- Cuándo se utiliza:
-- Para limpiar información.
--
-- Sintaxis:
--
-- TRIM(columna)
--
-- Ejemplo

SELECT
    TRIM(c.CustomerName)
FROM Customers c;

-- Ejemplo

SELECT
    TRIM('    SQL Básico    ');

-- Resultado

SQL Básico

-- Buenas prácticas:
--
-- Muy útil antes de comparar textos.

---------------------------------------------------------------

-- ============================================================
-- SUBSTRING()
-- ============================================================
--
-- Descripción:
-- Extrae una parte de un texto.
--
-- Cuándo se utiliza:
-- Para obtener una porción específica de una cadena.
--
-- Sintaxis (MySQL):
--
-- SUBSTRING(texto,inicio,longitud)
--
-- Ejemplo

SELECT
    SUBSTRING(c.CustomerName,1,5)
FROM Customers c;

-- Ejemplo

SELECT
    SUBSTRING(p.ProductName,3,4)
FROM Products p;

-- Resultado

Devuelve únicamente los caracteres indicados.

-- Buenas prácticas:
--
-- El primer carácter comienza en la posición 1.

---------------------------------------------------------------

-- RESUMEN DE FUNCIONES

-- COUNT()      -> Cuenta registros.
-- SUM()        -> Suma valores.
-- AVG()        -> Calcula promedio.
-- MAX()        -> Devuelve el mayor valor.
-- MIN()        -> Devuelve el menor valor.
-- ROUND()      -> Redondea números.
-- CONCAT()     -> Une textos.
-- UPPER()      -> Convierte a MAYÚSCULAS.
-- LOWER()      -> Convierte a minúsculas.
-- LENGTH()     -> Cuenta caracteres.
-- TRIM()       -> Elimina espacios.
-- SUBSTRING()  -> Extrae parte de un texto.

-- ============================================================
-- FIN PARTE 3
-- ============================================================
