-- @Autores: López Santibáñez Jiménez, Luis Gerardo
--          Silva García, Carlos Sebastián
-- Fecha de creación: 09/06/2018
-- Descripción: Calcula el promedio de los articulos en las revistas


CREATE OR REPLACE FUNCTION PROMEDIO_REVISTA(P_REVISTA_ID IN NUMBER)
RETURN NUMBER 
IS 
PROM NUMBER;
BEGIN
SELECT AVG(PROMEDIO) 
INTO PROM
FROM ARTICULO_REVISTA AR, ARTICULO A
WHERE AR.ARTICULO_ID = A.ARTICULO_ID
AND AR.REVISTA_ID = P_REVISTA_ID; 
RETURN PROM; 
END;
