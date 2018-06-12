-- @Autores: López Santibáñez Jiménez, Luis Gerardo
--          Silva García, Carlos Sebastián
-- Fecha de creación: 10/06/2018
-- Descripción: Prueba el trigger de historico

declare
    V_ARTICULO_ID number(2,0) := 99;
    V_TITULO varchar2(40) := 'dfgfdgfdg art. retertert';
    V_SINOPSIS varchar2(40) := 'gfdgdfg art. gfdgdfg';
    V_AREA_INTERES_ID number(2,0) := 3;
    V_AUTOR_1 number(2,0) := 1; 
    V_AUTOR_2 number(2,0) := 2; 
    V_AUTOR_3 number(2,0) := 3;
begin
     INSERT INTO ARTICULO VALUES  (80, 'JJJFJFJFJFJF848484', 'UNA SINOPSIS', 'SINOPSIS',  SYSDATE, 1, 1, 0);
     
    --CREAR_ARTICULO(V_ARTICULO_ID,V_TITULO,V_SINOPSIS,V_AREA_INTERES_ID,V_AUTOR_1,V_AUTOR_2,V_AUTOR_3);
    --dbms_output.put_line('Numero de registros: '||v_num_registros);
end;
/