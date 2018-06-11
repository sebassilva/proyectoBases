-- @Autores: López Santibáñez Jiménez, Luis Gerardo
--          Silva García, Carlos Sebastián
-- Fecha de creación: 10/06/2018
-- Descripción: Prueba el trigger de backup

CREATE OR REPLACE PROCEDURE CREAR_ARTICULO(
    V_ARTICULO_ID IN ARTICULO.ARTICULO_ID%TYPE,
    V_TITULO IN ARTICULO.TITULO%TYPE, 
    V_SINOPSIS IN ARTICULO.SINOPSIS%TYPE, 
    V_AREA_INTERES_ID IN ARTICULO.AREA_INTERES_ID%TYPE, 
    V_AUTOR_1 IN ARTICULO_AUTOR.AUTOR_ID%TYPE, 
    V_AUTOR_2 IN ARTICULO_AUTOR.AUTOR_ID%TYPE, 
    V_AUTOR_3 IN ARTICULO_AUTOR.AUTOR_ID%TYPE
     )
IS
BEGIN
  IF V_AUTOR_1 IS NOT NULL THEN 
    INSERT INTO ARTICULO(ARTICULO_ID, TITULO, SINOPSIS, STATUS_ARTICULO_ID, AREA_INTERES_ID)
    VALUES (V_ARTICULO_ID, V_TITULO, V_SINOPSIS, 1, V_AREA_INTERES_ID);
    
    INSERT INTO ARTICULO_AUTOR(ARTICULO_ID, AUTOR_ID)
    VALUES(V_ARTICULO_ID, V_AUTOR_1);
  END IF;
  
  
    IF V_AUTOR_2 IS NOT NULL THEN 
    INSERT INTO ARTICULO_AUTOR(ARTICULO_ID, AUTOR_ID)
    VALUES(V_ARTICULO_ID, V_AUTOR_2);
  END IF;
  
  
    IF (V_AUTOR_3 IS NOT NULL) THEN 
    INSERT INTO ARTICULO_AUTOR(ARTICULO_ID, AUTOR_ID)
    VALUES(V_ARTICULO_ID, V_AUTOR_3);
  END IF;
  
  COMMIT;

END;
/
