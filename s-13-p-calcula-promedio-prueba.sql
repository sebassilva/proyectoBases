-- @Autores: López Santibáñez Jiménez, Luis Gerardo
--          Silva García, Carlos Sebastián
-- Fecha de creación: 10/06/2018
-- Descripción: Calcula el promedio de un artículo


declare
    V_ARTICULO_ID number(2,0) := 1;
begin
    CALCULA_PROMEDIO(V_ARTICULO_ID);
    --dbms_output.put_line('Numero de registros: '||v_num_registros);
end;
/