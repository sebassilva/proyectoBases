-- @Autores: López Santibáñez Jiménez, Luis Gerardo
--          Silva García, Carlos Sebastián
-- Fecha de creación: 10/06/2018
-- Descripción: Archivo inicial, llama a todos los demás ejecutar con plsql


connect system;
SET SERVEROUTPUT ON;

DECLARE 
USEREXIST INTEGER; 
BEGIN
  SELECT COUNT(*) INTO USEREXIST
  FROM DBA_USERS 
  WHERE USERNAME='LSSG_PROY_INVITADO'
  OR USERNAME = 'LSSG_PROY_ADMIN';
  IF (USEREXIST > 0) THEN 
    EXECUTE IMMEDIATE 'DROP USER LSSG_PROY_INVITADO CASCADE ';
    EXECUTE IMMEDIATE 'DROP USER LSSG_PROY_admin CASCADE ';
    DBMS_OUTPUT.PUT_LINE('BORRANDO USUARIOS ANTERIORES -- ');
  END IF; 
  END;
  
  /

--s-00-main.sql 

start s-01-usuarios.sql	    ;
start s-02-entidades.sql	 ;  
start s-03-tablas-temporales.sql ;
start s-04-tablas-externas.sql   ;
start s-05-sequencias.sql	   ;
start s-06-indices.sql	   ;
start s-07-sinonimos.sql	;  
start s-08-vistas.sql		   ;
start s-09-carga-inicial.sql;

-- start s-10-consultas.sql;
-- start s-11-tr-actualiza-historico.sql;
-- start s-11-tr-backup-prueba.sql;
-- start s-11-tr-backup.sql;
-- start s-12-tr-actualiza-historico-prueba.sql;
-- start s-13-p-calcula-promedio-prueba.sql;
-- start s-13-p-calcula-promedio.sql;
-- start s-13-p-crear-articulo.sql;
-- start s-14-p-crear-articulo-pueba.sql;
-- start s-15-fx-<nombre-funcion>.sql;
-- start s-15-fx-revisor-editor.sql;
-- start s-16-fx-revisor-editor-prueba.sql;




