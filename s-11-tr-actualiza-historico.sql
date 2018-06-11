-- @Autores: López Santibáñez Jiménez, Luis Gerardo
--          Silva García, Carlos Sebastián
-- Fecha de creación: 10/06/2018
-- Descripción: Trigger que actualiza la tabla historico status articulo


CREATE OR REPLACE TRIGGER Actu_Hist_Stat_Art
  AFTER  INSERT OR UPDATE ON ARTICULO
  FOR EACH ROW
 
BEGIN
   INSERT INTO ARTICULO_STATUS_HISTORICO(ARTICULO_ID, STATUS_ARTICULO_ID) 
   VALUES (:NEW.ARTICULO_ID, :NEW.STATUS_ARTICULO_ID);
END;
/