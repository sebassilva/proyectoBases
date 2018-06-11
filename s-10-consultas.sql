-- @Autores: López Santibáñez Jiménez, Luis Gerardo
--          Silva García, Carlos Sebastián
-- Fecha de creación: 10/06/2018
-- Descripción: Consultas SQL usando diferentes tipos de join, subconsultas y álgebra relacional

--selecciona todos los articulos con sus fechas
SELECT NUM_ARCHIVO, TITULO, FOLIO, FECHA_STATUS
FROM ARTICULO
NATURAL JOIN ARTICULO_PDF
minus
SELECT NUM_ARCHIVO, TITULO, FOLIO, FECHA_STATUS
FROM ARTICULO
NATURAL JOIN ARTICULO_PDF
WHERE NUM_ARCHIVO IS NULL; 

--Selecciona todos los empelados
SELECT NOMBRE, AP_PATERNO, AP_MATERNO, NUM_CEDULA, NUM_CONTRATO
FROM EMPLEADO E
LEFT JOIN EDITOR ED
ON ED.EMPLEADO_ID = E.EMPLEADO_ID
LEFT JOIN REVISOR R
ON E.EMPLEADO_ID = R.EMPLEADO_ID
WHERE AP_PATERNO LIKE '%H%';


--selecciona el articulo con la mejor calificación sin tomar en cuenta a los reprobados.

SELECT Q1.ARTICULO_ID, MAX(Q1.PROM)
FROM  (
  SELECT ARTICULO_ID, AVG(CALIFICACION) PROM
  FROM ARTICULO_REVISOR
  GROUP BY ARTICULO_ID
  HAVING AVG(CALIFICACION) > 5
)  Q1
GROUP BY Q1.ARTICULO_ID;




