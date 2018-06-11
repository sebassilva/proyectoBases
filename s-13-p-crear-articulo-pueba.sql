-- @Autores: López Santibáñez Jiménez, Luis Gerardo
--          Silva García, Carlos Sebastián
-- Fecha de creación: 10/06/2018
-- Descripción: Bloque PL/SQL anonimo empleado para verificar el 
--              procedimiento s-13-p-crear-articulo

declare
    V_ARTICULO_ID number(2,0) := 12;
    V_TITULO varchar2(40) := 'Titulo art. nuevo';
    V_SINOPSIS varchar2(40) := 'Titulo art. nuevo';
    V_AREA_INTERES_ID number(2,0) := 2;
    V_AUTOR_1 number(2,0) := 1; 
    V_AUTOR_2 number(2,0) := 2; 
    V_AUTOR_3 number(2,0) := 3;
begin
    CREAR_ARTICULO(V_ARTICULO_ID,V_TITULO,V_SINOPSIS,V_AREA_INTERES_ID,V_AUTOR_1,V_AUTOR_2,V_AUTOR_3);
    --dbms_output.put_line('Numero de registros: '||v_num_registros);
end;
/
