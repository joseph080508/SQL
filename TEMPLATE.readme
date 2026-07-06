# Plantillas Universales de SQL
 
> Copia, pega y reemplaza únicamente los nombres en MAYÚSCULAS_CON_GUION o marcados. No cambies la estructura ni la sintaxis.
 
---
 
## 1. Crear una base de datos
 
```sql
CREATE DATABASE NombreBaseDatos;
```
 
**Reemplazar:**
- `NombreBaseDatos` → Nombre que quieras darle a la base de datos.
---
 
## 2. Seleccionar una base de datos
 
```sql
USE NombreBaseDatos;
```
 
**Reemplazar:**
- `NombreBaseDatos` → Nombre de la base de datos que vas a usar.
---
 
## 3. Crear una tabla básica
 
```sql
CREATE TABLE NombreTabla (
    Columna1 TIPO_DATO,
    Columna2 TIPO_DATO,
    Columna3 TIPO_DATO
);
```
 
**Reemplazar:**
- `NombreTabla` → Nombre de la tabla.
- `Columna1`, `Columna2`, `Columna3` → Nombres de las columnas.
- `TIPO_DATO` → Tipo de dato (INT, VARCHAR(100), DATE, DECIMAL(10,2), etc.).
---
 
## 4. Crear tabla con PRIMARY KEY, FOREIGN KEY, AUTO_INCREMENT, NOT NULL, UNIQUE, DEFAULT
 
```sql
CREATE TABLE NombreTabla (
    ID INT AUTO_INCREMENT,
    Columna1 VARCHAR(100) NOT NULL,
    Columna2 VARCHAR(100) UNIQUE,
    Columna3 TIPO_DATO DEFAULT ValorPorDefecto,
    OtraTablaID INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (OtraTablaID)
        REFERENCES OtraTabla(ID)
);
```
 
**Reemplazar:**
- `NombreTabla` → Nombre de la tabla que estás creando.
- `ID` → Nombre de la columna que será la clave primaria.
- `Columna1` → Columna obligatoria (no puede quedar vacía).
- `Columna2` → Columna que no debe repetirse (valor único).
- `Columna3` → Columna con un valor por defecto.
- `TIPO_DATO` → Tipo de dato de esa columna.
- `ValorPorDefecto` → Valor que se asigna automáticamente si no se especifica otro.
- `OtraTablaID` → Columna que actúa como clave foránea (relación con otra tabla).
- `OtraTabla` → Nombre de la tabla relacionada (tabla padre).
- `ID` (dentro de `REFERENCES OtraTabla(ID)`) → Clave primaria de la tabla relacionada.
---
 
## 5. INSERT (un registro)
 
```sql
INSERT INTO NombreTabla (Columna1, Columna2, Columna3)
VALUES (Valor1, Valor2, Valor3);
```
 
**Reemplazar:**
- `NombreTabla` → Tabla donde se insertará el registro.
- `Columna1, Columna2, Columna3` → Columnas a llenar.
- `Valor1, Valor2, Valor3` → Valores correspondientes a cada columna (texto entre comillas simples, números sin comillas).
---
 
## 6. INSERT de varios registros
 
```sql
INSERT INTO NombreTabla (Columna1, Columna2, Columna3)
VALUES
    (Valor1, Valor2, Valor3),
    (Valor4, Valor5, Valor6),
    (Valor7, Valor8, Valor9);
```
 
**Reemplazar:**
- `NombreTabla` → Tabla destino.
- `Columna1, Columna2, Columna3` → Columnas a llenar.
- Cada grupo `(ValorX, ValorY, ValorZ)` → Un registro distinto.
---
 
## 7. UPDATE
 
```sql
UPDATE NombreTabla
SET Columna1 = NuevoValor1,
    Columna2 = NuevoValor2
WHERE Condición;
```
 
**Reemplazar:**
- `NombreTabla` → Tabla a modificar.
- `Columna1, Columna2` → Columnas a actualizar.
- `NuevoValor1, NuevoValor2` → Nuevos valores.
- `Condición` → Condición que identifica qué fila(s) actualizar (ej: `ID = 1`).
> ⚠️ Si omites el `WHERE`, se actualizarán TODAS las filas de la tabla.
 
---
 
## 8. DELETE
 
```sql
DELETE FROM NombreTabla
WHERE Condición;
```
 
**Reemplazar:**
- `NombreTabla` → Tabla de la que se eliminarán registros.
- `Condición` → Condición que identifica qué fila(s) eliminar.
> ⚠️ Si omites el `WHERE`, se eliminarán TODAS las filas de la tabla.
 
---
 
## 9. SELECT básico
 
```sql
SELECT Columna1, Columna2
FROM NombreTabla;
```
 
**Reemplazar:**
- `Columna1, Columna2` → Columnas a mostrar (o usar `*` para todas).
- `NombreTabla` → Tabla de origen.
---
 
## 10. SELECT con WHERE
 
```sql
SELECT Columna1, Columna2
FROM NombreTabla
WHERE Condición;
```
 
**Reemplazar:**
- `Columna1, Columna2` → Columnas a mostrar.
- `NombreTabla` → Tabla de origen.
- `Condición` → Filtro (ej: `Columna1 = Valor`, `Columna2 > 10`).
---
 
## 11. SELECT con ORDER BY
 
```sql
SELECT Columna1, Columna2
FROM NombreTabla
ORDER BY Columna1 ASC; -- Cambiar ASC por DESC si es descendente
```
 
**Reemplazar:**
- `Columna1, Columna2` → Columnas a mostrar.
- `NombreTabla` → Tabla de origen.
- `Columna1` (en ORDER BY) → Columna por la cual ordenar.
- `ASC` / `DESC` → Ascendente o descendente.
---
 
## 12. SELECT con GROUP BY
 
```sql
SELECT Columna1, FUNCION_AGREGADA(Columna2)
FROM NombreTabla
GROUP BY Columna1;
```
 
**Reemplazar:**
- `Columna1` → Columna por la que se agrupan los datos.
- `FUNCION_AGREGADA` → COUNT, SUM, AVG, MAX, MIN.
- `Columna2` → Columna sobre la que se aplica la función.
- `NombreTabla` → Tabla de origen.
---
 
## 13. SELECT con HAVING
 
```sql
SELECT Columna1, FUNCION_AGREGADA(Columna2)
FROM NombreTabla
GROUP BY Columna1
HAVING CondiciónSobreAgregado;
```
 
**Reemplazar:**
- `Columna1` → Columna de agrupación.
- `FUNCION_AGREGADA` → COUNT, SUM, AVG, MAX, MIN.
- `Columna2` → Columna sobre la que se aplica la función.
- `NombreTabla` → Tabla de origen.
- `CondiciónSobreAgregado` → Filtro aplicado al resultado agrupado (ej: `COUNT(Columna2) > 5`).
> Nota: `WHERE` filtra antes de agrupar; `HAVING` filtra después de agrupar.
 
---
 
## 14. SELECT con INNER JOIN
 
```sql
SELECT A.Columna1, B.Columna2
FROM Tabla1 A
INNER JOIN Tabla2 B
    ON A.ClaveComun = B.ClaveComun;
```
 
**Reemplazar:**
- `Tabla1`, `Tabla2` → Tablas a unir.
- `A`, `B` → Alias (abreviaturas) de cada tabla.
- `Columna1, Columna2` → Columnas a mostrar.
- `ClaveComun` → Columna que relaciona ambas tablas (usualmente clave primaria/foránea).
---
 
## 15. SELECT con LEFT JOIN
 
```sql
SELECT A.Columna1, B.Columna2
FROM Tabla1 A
LEFT JOIN Tabla2 B
    ON A.ClaveComun = B.ClaveComun;
```
 
**Reemplazar:**
- `Tabla1` → Tabla izquierda (se muestran todos sus registros).
- `Tabla2` → Tabla derecha (solo coincidencias, si no hay, se muestra NULL).
- `A`, `B` → Alias de las tablas.
- `Columna1, Columna2` → Columnas a mostrar.
- `ClaveComun` → Columna de relación entre tablas.
---
 
## 16. SELECT con RIGHT JOIN
 
```sql
SELECT A.Columna1, B.Columna2
FROM Tabla1 A
RIGHT JOIN Tabla2 B
    ON A.ClaveComun = B.ClaveComun;
```
 
**Reemplazar:**
- `Tabla1` → Tabla izquierda (solo coincidencias, si no hay, se muestra NULL).
- `Tabla2` → Tabla derecha (se muestran todos sus registros).
- `A`, `B` → Alias de las tablas.
- `Columna1, Columna2` → Columnas a mostrar.
- `ClaveComun` → Columna de relación entre tablas.
---
 
## 17. SELECT con FULL OUTER JOIN
 
```sql
SELECT A.Columna1, B.Columna2
FROM Tabla1 A
FULL OUTER JOIN Tabla2 B
    ON A.ClaveComun = B.ClaveComun;
```
 
**Reemplazar:**
- `Tabla1`, `Tabla2` → Tablas a unir.
- `A`, `B` → Alias de las tablas.
- `Columna1, Columna2` → Columnas a mostrar.
- `ClaveComun` → Columna de relación entre tablas.
> Nota: MySQL no soporta `FULL OUTER JOIN` de forma nativa; se simula con `UNION` de LEFT JOIN y RIGHT JOIN.
 
---
 
## 18. SELECT con CROSS JOIN
 
```sql
SELECT A.Columna1, B.Columna2
FROM Tabla1 A
CROSS JOIN Tabla2 B;
```
 
**Reemplazar:**
- `Tabla1`, `Tabla2` → Tablas a combinar (se genera el producto cartesiano: todas las combinaciones posibles).
- `A`, `B` → Alias de las tablas.
- `Columna1, Columna2` → Columnas a mostrar.
---
 
## 19. SELECT con SELF JOIN
 
```sql
SELECT A.Columna1, B.Columna2
FROM NombreTabla A
INNER JOIN NombreTabla B
    ON A.ColumnaRelacion = B.ColumnaClave;
```
 
**Reemplazar:**
- `NombreTabla` → Misma tabla usada dos veces (se relaciona consigo misma).
- `A`, `B` → Alias distintos para diferenciar cada "copia" de la tabla.
- `Columna1, Columna2` → Columnas a mostrar.
- `ColumnaRelacion` → Columna de A que apunta a otro registro de la misma tabla.
- `ColumnaClave` → Columna de B con la que se compara (usualmente la clave primaria).
---
 
## 20. SELECT con 2 tablas
 
```sql
SELECT A.Columna1, B.Columna2
FROM Tabla1 A, Tabla2 B
WHERE A.ClaveComun = B.ClaveComun;
```
 
**Reemplazar:**
- `Tabla1`, `Tabla2` → Tablas involucradas.
- `A`, `B` → Alias.
- `Columna1, Columna2` → Columnas a mostrar.
- `ClaveComun` → Columna que relaciona ambas tablas.
---
 
## 21. SELECT con 3 tablas
 
```sql
SELECT A.Columna1, B.Columna2, C.Columna3
FROM Tabla1 A
INNER JOIN Tabla2 B ON A.ClaveComun1 = B.ClaveComun1
INNER JOIN Tabla3 C ON B.ClaveComun2 = C.ClaveComun2;
```
 
**Reemplazar:**
- `Tabla1`, `Tabla2`, `Tabla3` → Tablas involucradas.
- `A`, `B`, `C` → Alias.
- `Columna1, Columna2, Columna3` → Columnas a mostrar.
- `ClaveComun1` → Relación entre Tabla1 y Tabla2.
- `ClaveComun2` → Relación entre Tabla2 y Tabla3.
---
 
## 22. SELECT con 4 tablas
 
```sql
SELECT A.Columna1, B.Columna2, C.Columna3, D.Columna4
FROM Tabla1 A
INNER JOIN Tabla2 B ON A.ClaveComun1 = B.ClaveComun1
INNER JOIN Tabla3 C ON B.ClaveComun2 = C.ClaveComun2
INNER JOIN Tabla4 D ON C.ClaveComun3 = D.ClaveComun3;
```
 
**Reemplazar:**
- `Tabla1`, `Tabla2`, `Tabla3`, `Tabla4` → Tablas involucradas.
- `A`, `B`, `C`, `D` → Alias.
- `Columna1...Columna4` → Columnas a mostrar.
- `ClaveComun1`, `ClaveComun2`, `ClaveComun3` → Relaciones entre cada par de tablas consecutivas.
---
 
## 23. SELECT con 5 tablas
 
```sql
SELECT A.Columna1, B.Columna2, C.Columna3, D.Columna4, E.Columna5
FROM Tabla1 A
INNER JOIN Tabla2 B ON A.ClaveComun1 = B.ClaveComun1
INNER JOIN Tabla3 C ON B.ClaveComun2 = C.ClaveComun2
INNER JOIN Tabla4 D ON C.ClaveComun3 = D.ClaveComun3
INNER JOIN Tabla5 E ON D.ClaveComun4 = E.ClaveComun4;
```
 
**Reemplazar:**
- `Tabla1`...`Tabla5` → Tablas involucradas.
- `A`...`E` → Alias.
- `Columna1`...`Columna5` → Columnas a mostrar.
- `ClaveComun1`...`ClaveComun4` → Relaciones entre cada par de tablas consecutivas.
---
 
## 24. Subconsulta en WHERE
 
```sql
SELECT Columna1, Columna2
FROM NombreTabla
WHERE Columna3 = (
    SELECT FUNCION_AGREGADA(ColumnaSub)
    FROM OtraTabla
    WHERE CondiciónSub
);
```
 
**Reemplazar:**
- `NombreTabla` → Tabla principal.
- `Columna1, Columna2, Columna3` → Columnas de la tabla principal.
- `OtraTabla` → Tabla usada en la subconsulta.
- `ColumnaSub` → Columna evaluada dentro de la subconsulta.
- `FUNCION_AGREGADA` → (Opcional) COUNT, SUM, AVG, MAX, MIN, o quitarla si no aplica.
- `CondiciónSub` → Condición dentro de la subconsulta.
---
 
## 25. Subconsulta con IN
 
```sql
SELECT Columna1, Columna2
FROM NombreTabla
WHERE ColumnaComparar IN (
    SELECT ColumnaSub
    FROM OtraTabla
    WHERE CondiciónSub
);
```
 
**Reemplazar:**
- `NombreTabla` → Tabla principal.
- `Columna1, Columna2` → Columnas a mostrar.
- `ColumnaComparar` → Columna de la tabla principal que se compara.
- `OtraTabla` → Tabla usada en la subconsulta.
- `ColumnaSub` → Columna que devuelve la subconsulta (debe corresponder con `ColumnaComparar`).
- `CondiciónSub` → Condición dentro de la subconsulta.
---
 
## 26. Subconsulta con EXISTS
 
```sql
SELECT Columna1, Columna2
FROM NombreTabla A
WHERE EXISTS (
    SELECT 1
    FROM OtraTabla B
    WHERE B.ClaveComun = A.ClaveComun
      AND CondiciónSub
);
```
 
**Reemplazar:**
- `NombreTabla` → Tabla principal.
- `A` → Alias de la tabla principal.
- `Columna1, Columna2` → Columnas a mostrar.
- `OtraTabla` → Tabla usada en la subconsulta.
- `B` → Alias de la tabla de la subconsulta.
- `ClaveComun` → Columna que relaciona ambas tablas.
- `CondiciónSub` → Condición adicional dentro de la subconsulta (opcional).
---
 
## 27. UNION
 
```sql
SELECT Columna1, Columna2
FROM Tabla1
WHERE Condición1
 
UNION
 
SELECT Columna1, Columna2
FROM Tabla2
WHERE Condición2;
```
 
**Reemplazar:**
- `Tabla1`, `Tabla2` → Tablas cuyos resultados se combinarán.
- `Columna1, Columna2` → Columnas a mostrar (deben coincidir en cantidad y tipo de dato en ambas consultas).
- `Condición1`, `Condición2` → Filtros de cada consulta (opcionales).
> Nota: `UNION` elimina automáticamente los registros duplicados.
 
---
 
## 28. UNION ALL
 
```sql
SELECT Columna1, Columna2
FROM Tabla1
WHERE Condición1
 
UNION ALL
 
SELECT Columna1, Columna2
FROM Tabla2
WHERE Condición2;
```
 
**Reemplazar:**
- `Tabla1`, `Tabla2` → Tablas cuyos resultados se combinarán.
- `Columna1, Columna2` → Columnas a mostrar (deben coincidir en cantidad y tipo de dato).
- `Condición1`, `Condición2` → Filtros de cada consulta (opcionales).
> Nota: `UNION ALL` conserva los registros duplicados (más rápido que `UNION`).
 
---
 
## 29. CREATE INDEX
 
```sql
CREATE INDEX NombreIndice
ON NombreTabla (Columna1, Columna2);
```
 
**Reemplazar:**
- `NombreIndice` → Nombre que le darás al índice.
- `NombreTabla` → Tabla sobre la que se crea el índice.
- `Columna1, Columna2` → Columna(s) que formarán el índice.
---
 
## 30. DROP TABLE
 
```sql
DROP TABLE NombreTabla;
```
 
**Reemplazar:**
- `NombreTabla` → Tabla que se eliminará por completo (estructura y datos).
---
 
## 31. ALTER TABLE
 
```sql
-- Agregar columna
ALTER TABLE NombreTabla
ADD Columna1 TIPO_DATO;
 
-- Modificar columna
ALTER TABLE NombreTabla
MODIFY Columna1 NUEVO_TIPO_DATO;
 
-- Eliminar columna
ALTER TABLE NombreTabla
DROP COLUMN Columna1;
 
-- Renombrar columna
ALTER TABLE NombreTabla
RENAME COLUMN Columna1 TO ColumnaNueva;
```
 
**Reemplazar:**
- `NombreTabla` → Tabla a modificar.
- `Columna1` → Columna a agregar, modificar, eliminar o renombrar.
- `TIPO_DATO` / `NUEVO_TIPO_DATO` → Tipo de dato de la columna.
- `ColumnaNueva` → Nuevo nombre de la columna (solo para renombrar).
> Nota: usa solo el bloque que necesites; no es obligatorio usar los cuatro juntos.
 
---
 
## 32. TRUNCATE
 
```sql
TRUNCATE TABLE NombreTabla;
```
 
**Reemplazar:**
- `NombreTabla` → Tabla cuyos datos se eliminarán por completo (mantiene la estructura, pero borra todas las filas y no se puede filtrar con WHERE).
---
 
## Leyenda general de reemplazos
 
| Marcador | Significado |
|---|---|
| `NombreBaseDatos` | Nombre de la base de datos |
| `NombreTabla`, `Tabla1`, `Tabla2`, ... | Nombre(s) de tabla(s) |
| `OtraTabla` | Tabla relacionada (para FOREIGN KEY o subconsultas) |
| `Columna1`, `Columna2`, ... | Nombre(s) de columna(s) |
| `ColumnaSub`, `ColumnaComparar` | Columna usada en subconsultas |
| `ClaveComun`, `ClaveComun1`, ... | Columna de relación entre tablas (JOIN) |
| `ID` | Clave primaria |
| `OtraTablaID` | Clave foránea |
| `TIPO_DATO` | Tipo de dato (INT, VARCHAR(n), DATE, DECIMAL(p,e), etc.) |
| `Valor1`, `Valor2`, ... | Valores a insertar |
| `NuevoValor1`, ... | Valores a actualizar |
| `Condición`, `Condición1`, `CondiciónSub` | Condición lógica (WHERE / HAVING) |
| `FUNCION_AGREGADA` | COUNT, SUM, AVG, MAX, MIN |
| `A`, `B`, `C`, `D`, `E` | Alias de tablas |
| `NombreIndice` | Nombre del índice |
| `ValorPorDefecto` | Valor por defecto de una columna |
