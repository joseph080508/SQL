-- ============================================================
-- BIBLIA DE SQL
-- Nivel Básico e Intermedio
-- PARTE 6
-- EJEMPLOS DE JOIN (2, 3, 4 Y 5 TABLAS)
-- ============================================================

-- ============================================================
-- EJEMPLO 1
-- INNER JOIN ENTRE 2 TABLAS
-- ============================================================

-- Relación

Customers
PK CustomerID

Orders
FK CustomerID

--------------------------------------------------------------

SELECT
    c.CustomerID,
    c.CustomerName,
    o.OrderID,
    o.OrderDate
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;

--------------------------------------------------------------

Explicación

Customers contiene los clientes.

Orders contiene los pedidos.

La relación se realiza mediante CustomerID.

Solo aparecerán los clientes que tengan pedidos.

==============================================================

-- EJEMPLO 2
-- LEFT JOIN ENTRE 2 TABLAS
-- ============================================================

SELECT
    c.CustomerID,
    c.CustomerName,
    o.OrderID
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;

--------------------------------------------------------------

Resultado

Todos los clientes.

Si un cliente no tiene pedidos,
OrderID aparecerá como NULL.

==============================================================

-- EJEMPLO 3
-- JOIN ENTRE 3 TABLAS
-- ============================================================

Relaciones

Customers

PK CustomerID

Orders

PK OrderID
FK CustomerID

OrderDetails

FK OrderID

--------------------------------------------------------------

SELECT

    c.CustomerName,

    o.OrderID,

    od.ProductID,

    od.Quantity

FROM Customers c

INNER JOIN Orders o

ON c.CustomerID = o.CustomerID

INNER JOIN OrderDetails od

ON o.OrderID = od.OrderID;

--------------------------------------------------------------

Explicación

Customers
↓

Orders
↓

OrderDetails

Primero se unen Customers con Orders.

Después Orders con OrderDetails.

==============================================================

-- EJEMPLO 4
-- JOIN ENTRE 4 TABLAS
-- ============================================================

Relaciones

Customers

↓

Orders

↓

OrderDetails

↓

Products

--------------------------------------------------------------

SELECT

    c.CustomerName,

    o.OrderID,

    p.ProductName,

    od.Quantity

FROM Customers c

INNER JOIN Orders o

ON c.CustomerID = o.CustomerID

INNER JOIN OrderDetails od

ON o.OrderID = od.OrderID

INNER JOIN Products p

ON od.ProductID = p.ProductID;

--------------------------------------------------------------

Resultado

Cliente

Pedido

Producto comprado

Cantidad

==============================================================

-- EJEMPLO 5
-- JOIN ENTRE 5 TABLAS
-- ============================================================

Relaciones

Customers

↓

Orders

↓

OrderDetails

↓

Products

↓

Categories

--------------------------------------------------------------

SELECT

    c.CustomerName,

    o.OrderID,

    p.ProductName,

    cat.CategoryName,

    od.Quantity

FROM Customers c

INNER JOIN Orders o

ON c.CustomerID = o.CustomerID

INNER JOIN OrderDetails od

ON o.OrderID = od.OrderID

INNER JOIN Products p

ON od.ProductID = p.ProductID

INNER JOIN Categories cat

ON p.CategoryID = cat.CategoryID;

--------------------------------------------------------------

Resultado

Cliente

Pedido

Producto

Categoría

Cantidad

==============================================================

-- CONSULTA COMPLETA
-- INNER JOIN + WHERE + GROUP BY + HAVING + ORDER BY
-- ============================================================

SELECT

    c.CustomerName,

    COUNT(o.OrderID) AS TotalPedidos,

    SUM(od.Quantity) AS TotalProductos

FROM Customers c

INNER JOIN Orders o

ON c.CustomerID = o.CustomerID

INNER JOIN OrderDetails od

ON o.OrderID = od.OrderID

WHERE o.OrderDate >= '2025-01-01'

GROUP BY

    c.CustomerName

HAVING

    COUNT(o.OrderID) >= 2

ORDER BY

    TotalProductos DESC;

--------------------------------------------------------------

Explicación paso a paso

FROM

Empieza en Customers.

↓

INNER JOIN Orders

Relaciona clientes con pedidos.

↓

INNER JOIN OrderDetails

Obtiene los productos vendidos.

↓

WHERE

Solo pedidos desde 2025.

↓

GROUP BY

Agrupa por cliente.

↓

COUNT

Cuenta pedidos.

↓

SUM

Suma productos comprados.

↓

HAVING

Solo clientes con 2 o más pedidos.

↓

ORDER BY

Ordena de mayor a menor.

==============================================================

-- EJEMPLO CON ALIAS
-- ============================================================

SELECT

    c.CustomerName AS Cliente,

    o.OrderID AS Pedido,

    p.ProductName AS Producto,

    od.Quantity AS Cantidad

FROM Customers c

INNER JOIN Orders o

ON c.CustomerID = o.CustomerID

INNER JOIN OrderDetails od

ON o.OrderID = od.OrderID

INNER JOIN Products p

ON od.ProductID = p.ProductID;

==============================================================

-- ¿CÓMO SABER QUÉ TABLAS UNIR?
-- ============================================================

Siempre busca una FK.

Ejemplo

Customers

PK CustomerID

↓

Orders

FK CustomerID

↓

OrderDetails

FK OrderID

↓

Products

FK ProductID

↓

Categories

PK CategoryID

--------------------------------------------------------------

Regla

PK = FK

Nunca unas tablas por columnas que no tengan relación.

==============================================================

-- ORDEN PARA HACER UN JOIN
-- ============================================================

Paso 1

Buscar la tabla principal.

--------------------------------------------------------------

Paso 2

Buscar la Foreign Key.

--------------------------------------------------------------

Paso 3

Agregar el JOIN.

--------------------------------------------------------------

Paso 4

Escribir el ON.

--------------------------------------------------------------

Paso 5

Agregar más JOIN si son necesarios.

--------------------------------------------------------------

Paso 6

Agregar WHERE.

--------------------------------------------------------------

Paso 7

Agregar GROUP BY.

--------------------------------------------------------------

Paso 8

Agregar HAVING.

--------------------------------------------------------------

Paso 9

Agregar ORDER BY.

==============================================================

-- ERRORES COMUNES
-- ============================================================

ERROR

Olvidar el ON.

Incorrecto

SELECT *
FROM Customers c
INNER JOIN Orders o;

--------------------------------------------------------------

Correcto

SELECT *
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;

--------------------------------------------------------------

ERROR

Relacionar columnas incorrectas.

Incorrecto

ON c.CustomerName = o.OrderID;

--------------------------------------------------------------

Correcto

ON c.CustomerID = o.CustomerID;

--------------------------------------------------------------

ERROR

Usar LEFT JOIN cuando el ejercicio pide
solo registros relacionados.

En ese caso debe utilizarse

INNER JOIN

==============================================================

-- RESUMEN
-- ============================================================

INNER JOIN

Solo coincidencias.

LEFT JOIN

Todos los registros de la izquierda.

RIGHT JOIN

Todos los registros de la derecha.

FULL OUTER JOIN

Todos los registros de ambas tablas.

CROSS JOIN

Todas las combinaciones.

SELF JOIN

Una tabla consigo misma.

==============================================================
-- FIN PARTE 6
-- ============================================================
