-- ============================================================
-- BIBLIA DE SQL
-- Nivel Básico e Intermedio
-- PARTE 10
-- DML (DATA MANIPULATION LANGUAGE)
-- ============================================================

-- ============================================================
-- ¿QUÉ ES DML?
-- ============================================================

-- DML significa Data Manipulation Language.
--
-- Se utiliza para manipular los datos almacenados
-- dentro de las tablas.
--
-- Los comandos principales son:
--
-- INSERT
-- UPDATE
-- DELETE

-- ============================================================
-- INSERT
-- ============================================================

-- Descripción:
-- Agrega uno o varios registros a una tabla.

--------------------------------------------------------------

-- Sintaxis

INSERT INTO Tabla
(
    Columna1,
    Columna2
)
VALUES
(
    Valor1,
    Valor2
);

--------------------------------------------------------------

-- Ejemplo 1

INSERT INTO Customers
(
    CustomerName,
    City
)
VALUES
(
    'Juan Pérez',
    'Barranquilla'
);

--------------------------------------------------------------

-- Ejemplo 2

INSERT INTO Products
(
    ProductName,
    UnitPrice,
    CategoryID
)
VALUES
(
    'Teclado',
    120.50,
    2
);

--------------------------------------------------------------

-- INSERTAR VARIOS REGISTROS

INSERT INTO Customers
(
    CustomerName,
    City
)
VALUES
('Ana','Bogotá'),
('Carlos','Cali'),
('María','Medellín'),
('Pedro','Barranquilla');

--------------------------------------------------------------

-- INSERTAR TODAS LAS COLUMNAS

INSERT INTO Categories
VALUES
(
    1,
    'Electrónicos'
);

--------------------------------------------------------------

-- INSERT ... SELECT

-- Copia datos de una tabla hacia otra.

INSERT INTO CustomersBackup
(
    CustomerID,
    CustomerName,
    City
)

SELECT
    c.CustomerID,
    c.CustomerName,
    c.City
FROM Customers c;

--------------------------------------------------------------

-- Buenas prácticas

-- Especificar siempre las columnas.
-- No depender del orden de la tabla.
-- Validar claves foráneas.

==============================================================

-- UPDATE
-- ============================================================

-- Descripción:
-- Modifica registros existentes.

--------------------------------------------------------------

-- Sintaxis

UPDATE Tabla

SET
    columna = valor

WHERE condición;

--------------------------------------------------------------

-- Ejemplo 1

UPDATE Customers

SET City = 'Bogotá'

WHERE CustomerID = 1;

--------------------------------------------------------------

-- Ejemplo 2

UPDATE Products

SET UnitPrice = 250

WHERE ProductID = 10;

--------------------------------------------------------------

-- Actualizar varias columnas

UPDATE Customers

SET

    CustomerName = 'Juan Torres',

    City = 'Cartagena'

WHERE CustomerID = 2;

--------------------------------------------------------------

-- Actualizar todos los registros

UPDATE Products

SET UnitPrice = UnitPrice * 1.10;

--------------------------------------------------------------

Resultado

Todos los productos aumentan un 10%.

--------------------------------------------------------------

-- UPDATE utilizando JOIN (MySQL)

UPDATE Products p

INNER JOIN Categories cat

ON p.CategoryID = cat.CategoryID

SET

p.UnitPrice = p.UnitPrice * 1.15

WHERE cat.CategoryName = 'Electrónicos';

--------------------------------------------------------------

-- Buenas prácticas

Siempre utilizar WHERE.

Verificar primero con SELECT.

==============================================================

-- DELETE
-- ============================================================

-- Descripción:
-- Elimina registros.

--------------------------------------------------------------

-- Sintaxis

DELETE

FROM Tabla

WHERE condición;

--------------------------------------------------------------

-- Ejemplo

DELETE

FROM Customers

WHERE CustomerID = 5;

--------------------------------------------------------------

-- Eliminar varios registros

DELETE

FROM Products

WHERE UnitPrice < 20;

--------------------------------------------------------------

-- Eliminar todos los registros

DELETE

FROM Customers;

--------------------------------------------------------------

Resultado

La tabla continúa existiendo.

Solo desaparecen los datos.

==============================================================

-- DELETE CON SUBCONSULTA

DELETE

FROM Customers

WHERE CustomerID IN

(
    SELECT
        o.CustomerID
    FROM Orders o
    WHERE o.OrderDate < '2023-01-01'
);

==============================================================

-- DIFERENCIA ENTRE
-- DELETE
-- TRUNCATE
-- DROP
-- ============================================================

DELETE

• Elimina registros.

• Puede utilizar WHERE.

• Conserva la tabla.

• Puede eliminar uno o varios registros.

--------------------------------------------------------------

TRUNCATE

• Elimina TODOS los registros.

• No utiliza WHERE.

• Conserva la estructura.

• Es más rápido que DELETE.

--------------------------------------------------------------

DROP

• Elimina completamente la tabla.

• Elimina estructura.

• Elimina datos.

• Elimina índices.

• Elimina restricciones.

==============================================================

-- EJEMPLO COMPLETO
-- ============================================================

INSERT INTO Customers

(
    CustomerName,
    City
)

VALUES

(
    'Laura',
    'Barranquilla'
);

--------------------------------------------------------------

UPDATE Customers

SET

City = 'Santa Marta'

WHERE CustomerName = 'Laura';

--------------------------------------------------------------

DELETE

FROM Customers

WHERE CustomerName = 'Laura';

==============================================================

-- ERRORES COMUNES
-- ============================================================

ERROR

Olvidar WHERE.

UPDATE Customers

SET City = 'Bogotá';

Resultado

Todos los clientes cambian
a Bogotá.

--------------------------------------------------------------

ERROR

DELETE sin WHERE.

DELETE

FROM Customers;

Resultado

Todos los registros son eliminados.

--------------------------------------------------------------

ERROR

Insertar una FK inexistente.

INSERT INTO Orders

(
    CustomerID
)

VALUES

(
    9999
);

Si CustomerID no existe,

la FK producirá un error.

--------------------------------------------------------------

ERROR

Insertar un dato incompatible.

INSERT INTO Products

(
    UnitPrice
)

VALUES

(
    'ABC'
);

==============================================================

-- BUENAS PRÁCTICAS
-- ============================================================

Antes de UPDATE

Ejecutar primero

SELECT *

FROM Customers

WHERE CustomerID = 10;

--------------------------------------------------------------

Antes de DELETE

Ejecutar primero

SELECT *

FROM Customers

WHERE CustomerID = 10;

--------------------------------------------------------------

Siempre utilizar transacciones
cuando se modifiquen muchos datos.

==============================================================

-- RESUMEN
-- ============================================================

INSERT

Agrega registros.

--------------------------------------------------------------

UPDATE

Modifica registros.

--------------------------------------------------------------

DELETE

Elimina registros.

--------------------------------------------------------------

TRUNCATE

Vacía una tabla.

--------------------------------------------------------------

DROP

Elimina una tabla completa.

==============================================================
-- FIN PARTE 10
-- ============================================================
