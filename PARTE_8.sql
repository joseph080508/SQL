-- ============================================================
-- BIBLIA DE SQL
-- Nivel Básico e Intermedio
-- PARTE 8
-- DDL (DATA DEFINITION LANGUAGE)
-- ============================================================

-- ============================================================
-- ¿QUÉ ES DDL?
-- ============================================================

-- DDL significa Data Definition Language.
--
-- Se utiliza para crear, modificar y eliminar
-- la estructura de una base de datos.
--
-- Los comandos más importantes son:
--
-- CREATE DATABASE
-- DROP DATABASE
-- CREATE TABLE
-- ALTER TABLE
-- DROP TABLE
-- TRUNCATE TABLE

-- ============================================================
-- CREATE DATABASE
-- ============================================================

-- Descripción:
-- Crea una nueva base de datos.

-- Sintaxis

CREATE DATABASE CompanyDB;

--------------------------------------------------------------

-- Crear una base de datos

CREATE DATABASE SalesDB;

--------------------------------------------------------------

-- Seleccionar la base de datos (MySQL)

USE SalesDB;

--------------------------------------------------------------

-- Buenas prácticas

-- Utilizar nombres descriptivos.
-- Evitar espacios.
-- No usar caracteres especiales.

==============================================================

-- DROP DATABASE
-- ============================================================

-- Descripción:
-- Elimina una base de datos completamente.

-- Sintaxis

DROP DATABASE SalesDB;

--------------------------------------------------------------

IMPORTANTE

Este comando elimina

• Todas las tablas.

• Todos los datos.

• Todas las relaciones.

No puede recuperarse fácilmente.

==============================================================

-- CREATE TABLE
-- ============================================================

-- Descripción:
-- Crea una nueva tabla.

--------------------------------------------------------------

Sintaxis

CREATE TABLE NombreTabla
(
    Columna TipoDato
);

--------------------------------------------------------------

Ejemplo

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,

    CustomerName VARCHAR(100),

    City VARCHAR(50)
);

--------------------------------------------------------------

Ejemplo completo

CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,

    ProductName VARCHAR(100),

    UnitPrice DECIMAL(10,2),

    CategoryID INT
);

==============================================================

-- TIPOS DE DATOS MÁS UTILIZADOS
-- ============================================================

INT

Números enteros.

--------------------------------------------------------------

VARCHAR(100)

Texto.

--------------------------------------------------------------

CHAR(10)

Texto de longitud fija.

--------------------------------------------------------------

DECIMAL(10,2)

Números con decimales.

--------------------------------------------------------------

DATE

Fechas.

--------------------------------------------------------------

DATETIME

Fecha y hora.

--------------------------------------------------------------

BOOLEAN

Verdadero o falso.

==============================================================

-- ALTER TABLE
-- ============================================================

-- Descripción:
-- Modifica la estructura de una tabla.

--------------------------------------------------------------

Agregar una columna

ALTER TABLE Customers

ADD Phone VARCHAR(20);

--------------------------------------------------------------

Agregar varias columnas

ALTER TABLE Customers

ADD Email VARCHAR(100),

ADD Country VARCHAR(50);

--------------------------------------------------------------

Modificar un tipo de dato
(MySQL)

ALTER TABLE Customers

MODIFY Phone VARCHAR(30);

--------------------------------------------------------------

Cambiar el nombre de una columna
(MySQL 8)

ALTER TABLE Customers

RENAME COLUMN Phone TO MobilePhone;

--------------------------------------------------------------

Eliminar una columna

ALTER TABLE Customers

DROP COLUMN MobilePhone;

--------------------------------------------------------------

Buenas prácticas

Modificar tablas únicamente cuando sea necesario.

==============================================================

-- DROP TABLE
-- ============================================================

-- Descripción:
-- Elimina completamente una tabla.

--------------------------------------------------------------

Sintaxis

DROP TABLE Customers;

--------------------------------------------------------------

Resultado

Se elimina

La tabla.

Los datos.

Las restricciones.

Los índices.

==============================================================

-- TRUNCATE TABLE
-- ============================================================

-- Descripción:
-- Elimina todos los registros de una tabla,
-- pero conserva su estructura.

--------------------------------------------------------------

Sintaxis

TRUNCATE TABLE Customers;

--------------------------------------------------------------

Resultado

Se eliminan todos los registros.

La tabla sigue existiendo.

==============================================================

-- DIFERENCIA ENTRE DELETE, TRUNCATE Y DROP
-- ============================================================

DELETE

• Elimina registros.

• Puede utilizar WHERE.

• Conserva la tabla.

Ejemplo

DELETE
FROM Customers
WHERE CustomerID = 10;

--------------------------------------------------------------

TRUNCATE

• Elimina TODOS los registros.

• No utiliza WHERE.

• Conserva la tabla.

Ejemplo

TRUNCATE TABLE Customers;

--------------------------------------------------------------

DROP

• Elimina la tabla completa.

• También elimina los datos.

Ejemplo

DROP TABLE Customers;

==============================================================

-- EJEMPLO COMPLETO
-- CREAR TABLAS RELACIONADAS
-- ============================================================

CREATE TABLE Categories
(
    CategoryID INT PRIMARY KEY,

    CategoryName VARCHAR(100)
);

--------------------------------------------------------------

CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,

    ProductName VARCHAR(100),

    UnitPrice DECIMAL(10,2),

    CategoryID INT
);

--------------------------------------------------------------

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,

    CustomerName VARCHAR(100),

    City VARCHAR(100)
);

--------------------------------------------------------------

CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,

    OrderDate DATE,

    CustomerID INT
);

==============================================================

-- ORDEN RECOMENDADO PARA CREAR TABLAS
-- ============================================================

1.

Crear la base de datos.

↓

2.

Seleccionar la base de datos.

↓

3.

Crear las tablas principales.

↓

4.

Crear las tablas relacionadas.

↓

5.

Insertar datos.

==============================================================

-- ERRORES COMUNES
-- ============================================================

ERROR

Crear una tabla con un nombre repetido.

--------------------------------------------------------------

ERROR

Eliminar una tabla equivocada con DROP.

--------------------------------------------------------------

ERROR

Confundir DROP con TRUNCATE.

--------------------------------------------------------------

ERROR

Eliminar una base de datos accidentalmente.

==============================================================

-- RESUMEN
-- ============================================================

CREATE DATABASE

Crea una base de datos.

--------------------------------------------------------------

DROP DATABASE

Elimina una base de datos.

--------------------------------------------------------------

CREATE TABLE

Crea una tabla.

--------------------------------------------------------------

ALTER TABLE

Modifica una tabla.

--------------------------------------------------------------

DROP TABLE

Elimina una tabla.

--------------------------------------------------------------

TRUNCATE TABLE

Elimina todos los registros,
pero conserva la tabla.

==============================================================
-- FIN PARTE 8
-- ============================================================
