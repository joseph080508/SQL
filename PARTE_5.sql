-- ============================================================
-- BIBLIA DE SQL
-- Nivel Básico e Intermedio
-- PARTE 5
-- CLAVES (PK/FK) Y JOINS
-- ============================================================

-- ============================================================
-- ¿QUÉ ES UNA PRIMARY KEY (PK)?
-- ============================================================

-- Descripción:
-- Una Primary Key (Clave Primaria) identifica de forma única
-- cada registro de una tabla.

-- Características

-- • No se repite.
-- • No permite NULL.
-- • Solo existe una PK por tabla.
-- • Identifica un registro de manera única.

-- Ejemplo

Customers

CustomerID   CustomerName
----------   ------------
1            Juan
2            María
3            Pedro

-- CustomerID es la PRIMARY KEY.

--------------------------------------------------------------

-- ============================================================
-- ¿QUÉ ES UNA FOREIGN KEY (FK)?
-- ============================================================

-- Descripción:
-- Una Foreign Key (Clave Foránea) conecta una tabla con otra.

-- Características

-- • Puede repetirse.
-- • Su valor debe existir en la PK de otra tabla.
-- • Permite relacionar tablas.

--------------------------------------------------------------

Customers

CustomerID
----------
1
2
3

Orders

OrderID    CustomerID
-------    ----------
101        1
102        1
103        2

-- CustomerID en Orders
-- es una FOREIGN KEY.

--------------------------------------------------------------

-- ============================================================
-- ¿CÓMO IDENTIFICAR QUÉ TABLAS UNIR?
-- ============================================================

Siempre busca una FK que apunte a una PK.

Ejemplo

Customers
----------

PK CustomerID

Orders
-------

PK OrderID
FK CustomerID

La relación es:

Customers.CustomerID
=
Orders.CustomerID

--------------------------------------------------------------

Products

PK ProductID

OrderDetails

FK ProductID

La relación es:

Products.ProductID
=
OrderDetails.ProductID

--------------------------------------------------------------

Categories

PK CategoryID

Products

FK CategoryID

La relación es:

Categories.CategoryID
=
Products.CategoryID

--------------------------------------------------------------

Regla de oro

PK = identifica

FK = conecta

Siempre une:

PK = FK

Nunca unas columnas diferentes solo porque tienen nombres parecidos.

--------------------------------------------------------------

-- ============================================================
-- INNER JOIN
-- ============================================================

Descripción

Devuelve únicamente los registros que tienen coincidencia
en ambas tablas.

Representación

Customers
      ∩
Orders

--------------------------------------------------------------

Sintaxis

SELECT columnas
FROM Tabla1
INNER JOIN Tabla2
ON condición;

--------------------------------------------------------------

Ejemplo 1

SELECT
    c.CustomerName,
    o.OrderID
FROM Customers c
INNER JOIN Orders o
ON c.CustomerID = o.CustomerID;

--------------------------------------------------------------

Ejemplo 2

SELECT
    p.ProductName,
    cat.CategoryName
FROM Products p
INNER JOIN Categories cat
ON p.CategoryID = cat.CategoryID;

--------------------------------------------------------------

Resultado

Solo aparecen los registros relacionados.

--------------------------------------------------------------

Buenas prácticas

Siempre escribir primero el ON inmediatamente
después del JOIN.

--------------------------------------------------------------

-- ============================================================
-- LEFT JOIN
-- ============================================================

Descripción

Devuelve TODOS los registros de la tabla izquierda,
aunque no tengan coincidencia.

Representación

Customers
██████████

Orders
    ████

Resultado

██████████

--------------------------------------------------------------

Sintaxis

SELECT columnas
FROM Tabla1
LEFT JOIN Tabla2
ON condición;

--------------------------------------------------------------

Ejemplo

SELECT
    c.CustomerName,
    o.OrderID
FROM Customers c
LEFT JOIN Orders o
ON c.CustomerID = o.CustomerID;

--------------------------------------------------------------

Resultado

Todos los clientes.

Si alguno no tiene pedidos,
las columnas de Orders aparecerán en NULL.

--------------------------------------------------------------

¿Cuándo utilizarlo?

Cuando deseas ver toda la información
de la tabla izquierda.

--------------------------------------------------------------

-- ============================================================
-- RIGHT JOIN
-- ============================================================

Descripción

Devuelve TODOS los registros
de la tabla derecha.

--------------------------------------------------------------

Ejemplo

SELECT
    c.CustomerName,
    o.OrderID
FROM Customers c
RIGHT JOIN Orders o
ON c.CustomerID = o.CustomerID;

--------------------------------------------------------------

Resultado

Todos los pedidos.

Si un pedido no tiene cliente relacionado,
los datos del cliente aparecerán en NULL.

--------------------------------------------------------------

¿Cuándo utilizarlo?

Cuando la tabla más importante
es la que está a la derecha.

--------------------------------------------------------------

-- ============================================================
-- FULL OUTER JOIN
-- ============================================================

Descripción

Devuelve TODOS los registros
de ambas tablas.

Coincidan o no.

--------------------------------------------------------------

Sintaxis

SELECT columnas
FROM Tabla1
FULL OUTER JOIN Tabla2
ON condición;

--------------------------------------------------------------

Ejemplo

SELECT
    c.CustomerName,
    o.OrderID
FROM Customers c
FULL OUTER JOIN Orders o
ON c.CustomerID = o.CustomerID;

--------------------------------------------------------------

Resultado

Clientes con pedidos.

Clientes sin pedidos.

Pedidos sin cliente.

--------------------------------------------------------------

IMPORTANTE

MySQL no soporta FULL OUTER JOIN directamente.

Se suele reemplazar usando:

LEFT JOIN
UNION
RIGHT JOIN

--------------------------------------------------------------

-- ============================================================
-- CROSS JOIN
-- ============================================================

Descripción

Combina TODOS los registros
de una tabla con TODOS los registros
de la otra.

No necesita ON.

--------------------------------------------------------------

Ejemplo

SELECT
    c.CustomerName,
    p.ProductName
FROM Customers c
CROSS JOIN Products p;

--------------------------------------------------------------

Si existen:

10 clientes

20 productos

Resultado

200 registros

10 × 20

--------------------------------------------------------------

¿Cuándo usarlo?

Muy pocas veces.

Generalmente para generar combinaciones.

--------------------------------------------------------------

-- ============================================================
-- SELF JOIN
-- ============================================================

Descripción

Una tabla se une consigo misma.

--------------------------------------------------------------

Ejemplo

Employees

EmployeeID

ManagerID

--------------------------------------------------------------

SELECT

    e.FirstName,

    m.FirstName AS Manager

FROM Employees e

LEFT JOIN Employees m

ON e.ManagerID = m.EmployeeID;

--------------------------------------------------------------

Resultado

Empleado          Jefe

Ana               Carlos

Pedro             Carlos

Luis              María

--------------------------------------------------------------

¿Cuándo utilizarlo?

Jerarquías.

Organigramas.

Empleados y jefes.

Categorías padre e hijas.

--------------------------------------------------------------

-- ============================================================
-- DIFERENCIA ENTRE LOS JOIN
-- ============================================================

INNER JOIN

Solo coincidencias.

--------------------------------------------------------------

LEFT JOIN

Todos los registros
de la tabla izquierda.

--------------------------------------------------------------

RIGHT JOIN

Todos los registros
de la tabla derecha.

--------------------------------------------------------------

FULL OUTER JOIN

Todos los registros
de ambas tablas.

--------------------------------------------------------------

CROSS JOIN

Todas las combinaciones posibles.

--------------------------------------------------------------

SELF JOIN

Una tabla unida consigo misma.

--------------------------------------------------------------

TRUCO PARA EXAMEN

Si el ejercicio dice:

"Mostrar TODOS los clientes"

LEFT JOIN

--------------------------------------------------------------

Si dice:

"Mostrar solamente los clientes
que tienen pedidos"

INNER JOIN

--------------------------------------------------------------

Si dice:

"Mostrar todos los pedidos"

RIGHT JOIN

--------------------------------------------------------------

Si dice:

"Mostrar absolutamente todo"

FULL OUTER JOIN

--------------------------------------------------------------

-- ============================================================
-- FIN PARTE 5
-- ============================================================
