-- ============================================================
-- BIBLIA DE SQL
-- Nivel Básico e Intermedio
-- PARTE 9
-- RESTRICCIONES (CONSTRAINTS)
-- ============================================================

-- ============================================================
-- ¿QUÉ ES UNA RESTRICCIÓN?
-- ============================================================

-- Descripción:
-- Una restricción (Constraint) es una regla que SQL aplica
-- para garantizar la integridad y consistencia de los datos.
--
-- Las restricciones más utilizadas son:
--
-- PRIMARY KEY
-- FOREIGN KEY
-- UNIQUE
-- NOT NULL
-- DEFAULT
-- AUTO_INCREMENT

-- ============================================================
-- PRIMARY KEY (PK)
-- ============================================================

-- Descripción:
-- Identifica de forma única cada registro de una tabla.

-- Características

-- • No admite valores NULL.
-- • No permite valores repetidos.
-- • Solo puede existir una PRIMARY KEY por tabla.
-- • Se utiliza para relacionar tablas.

--------------------------------------------------------------

Ejemplo

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100),
    City VARCHAR(50)
);

--------------------------------------------------------------

Ejemplo compuesto

CREATE TABLE OrderDetails
(
    OrderID INT,
    ProductID INT,

    PRIMARY KEY(OrderID, ProductID)
);

--------------------------------------------------------------

Buenas prácticas

-- Utilizar columnas numéricas.
-- Evitar modificar la PK.

==============================================================

-- FOREIGN KEY (FK)
-- ============================================================

-- Descripción:
-- Relaciona una tabla con otra.

--------------------------------------------------------------

Ejemplo

CREATE TABLE Orders
(
    OrderID INT PRIMARY KEY,

    OrderDate DATE,

    CustomerID INT,

    FOREIGN KEY(CustomerID)
    REFERENCES Customers(CustomerID)
);

--------------------------------------------------------------

Resultado

Orders.CustomerID

↓

Customers.CustomerID

--------------------------------------------------------------

Ventajas

• Evita registros huérfanos.

• Mantiene la integridad referencial.

==============================================================

-- UNIQUE
-- ============================================================

-- Descripción:
-- No permite valores repetidos.

--------------------------------------------------------------

Ejemplo

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,

    Email VARCHAR(100) UNIQUE
);

--------------------------------------------------------------

Ejemplo

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,

    DocumentNumber VARCHAR(20) UNIQUE
);

--------------------------------------------------------------

Diferencia entre UNIQUE y PRIMARY KEY

PRIMARY KEY

• Solo una por tabla.

• No acepta NULL.

--------------------------------------------------------------

UNIQUE

• Puede haber varias.

• Dependiendo del motor, puede aceptar NULL.

==============================================================

-- NOT NULL
-- ============================================================

-- Descripción:
-- Obliga a que una columna tenga un valor.

--------------------------------------------------------------

Ejemplo

CREATE TABLE Customers
(
    CustomerID INT PRIMARY KEY,

    CustomerName VARCHAR(100) NOT NULL,

    City VARCHAR(50)
);

--------------------------------------------------------------

Ejemplo

CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,

    ProductName VARCHAR(100) NOT NULL,

    UnitPrice DECIMAL(10,2) NOT NULL
);

--------------------------------------------------------------

Resultado

No será posible insertar registros
sin esos datos.

==============================================================

-- DEFAULT
-- ============================================================

-- Descripción:
-- Asigna un valor automáticamente
-- cuando no se especifica uno.

--------------------------------------------------------------

Ejemplo

CREATE TABLE Employees
(
    EmployeeID INT PRIMARY KEY,

    Country VARCHAR(50)
    DEFAULT 'Colombia'
);

--------------------------------------------------------------

Ejemplo

CREATE TABLE Products
(
    ProductID INT PRIMARY KEY,

    Stock INT DEFAULT 0
);

--------------------------------------------------------------

Resultado

Si no se indica un valor,

SQL asignará el valor por defecto.

==============================================================

-- AUTO_INCREMENT
-- ============================================================

-- Descripción:
-- Genera automáticamente
-- el siguiente número disponible.

--------------------------------------------------------------

(MySQL)

CREATE TABLE Customers
(
    CustomerID INT AUTO_INCREMENT,

    CustomerName VARCHAR(100),

    PRIMARY KEY(CustomerID)
);

--------------------------------------------------------------

Resultado

Primer registro

CustomerID = 1

Segundo registro

CustomerID = 2

Tercer registro

CustomerID = 3

--------------------------------------------------------------

SQL Server

IDENTITY(1,1)

CREATE TABLE Customers
(
    CustomerID INT IDENTITY(1,1),

    CustomerName VARCHAR(100),

    PRIMARY KEY(CustomerID)
);

--------------------------------------------------------------

PostgreSQL

SERIAL

CREATE TABLE Customers
(
    CustomerID SERIAL PRIMARY KEY,

    CustomerName VARCHAR(100)
);

==============================================================

-- EJEMPLO COMPLETO
-- TODAS LAS RESTRICCIONES
-- ============================================================

CREATE TABLE Categories
(
    CategoryID INT AUTO_INCREMENT,

    CategoryName VARCHAR(100) NOT NULL,

    PRIMARY KEY(CategoryID)
);

--------------------------------------------------------------

CREATE TABLE Products
(
    ProductID INT AUTO_INCREMENT,

    ProductName VARCHAR(100) NOT NULL,

    UnitPrice DECIMAL(10,2) NOT NULL,

    Barcode VARCHAR(50) UNIQUE,

    Stock INT DEFAULT 0,

    CategoryID INT NOT NULL,

    PRIMARY KEY(ProductID),

    FOREIGN KEY(CategoryID)
        REFERENCES Categories(CategoryID)
);

--------------------------------------------------------------

CREATE TABLE Customers
(
    CustomerID INT AUTO_INCREMENT,

    CustomerName VARCHAR(100) NOT NULL,

    Email VARCHAR(150) UNIQUE,

    City VARCHAR(50) DEFAULT 'Barranquilla',

    PRIMARY KEY(CustomerID)
);

--------------------------------------------------------------

CREATE TABLE Orders
(
    OrderID INT AUTO_INCREMENT,

    OrderDate DATE NOT NULL,

    CustomerID INT NOT NULL,

    PRIMARY KEY(OrderID),

    FOREIGN KEY(CustomerID)
        REFERENCES Customers(CustomerID)
);

==============================================================

-- EJEMPLOS DE INSERT
-- ============================================================

INSERT INTO Customers
(
    CustomerName,
    Email
)
VALUES
(
    'Juan Pérez',
    'juan@email.com'
);

--------------------------------------------------------------

Como CustomerID es AUTO_INCREMENT,

SQL genera automáticamente

CustomerID = 1

--------------------------------------------------------------

Como City tiene DEFAULT,

Si no se envía,

City = 'Barranquilla'

==============================================================

-- ERRORES COMUNES
-- ============================================================

ERROR

Intentar insertar una PRIMARY KEY repetida.

--------------------------------------------------------------

ERROR

Insertar NULL en una columna NOT NULL.

--------------------------------------------------------------

ERROR

Insertar un CustomerID inexistente
en la tabla Orders.

--------------------------------------------------------------

ERROR

Insertar dos correos iguales
cuando Email es UNIQUE.

==============================================================

-- RESUMEN
-- ============================================================

PRIMARY KEY

Identifica un registro.

--------------------------------------------------------------

FOREIGN KEY

Relaciona tablas.

--------------------------------------------------------------

UNIQUE

No permite duplicados.

--------------------------------------------------------------

NOT NULL

Obliga a ingresar un valor.

--------------------------------------------------------------

DEFAULT

Asigna un valor automáticamente.

--------------------------------------------------------------

AUTO_INCREMENT

Genera IDs automáticamente.

==============================================================
-- FIN PARTE 9
-- ============================================================
