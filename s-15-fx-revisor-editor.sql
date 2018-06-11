-- @Autores: López Santibáñez Jiménez, Luis Gerardo
--          Silva García, Carlos Sebastián
-- Fecha de creación: 10/06/2018
-- Descripción: Crear una funcion que calcula 

CREATE OR REPLACE FUNCTION ft_get_revisor_editor
RETURN NUMBER
IS
	v_counter NUMBER(2,0);
BEGIN
    SELECT count(*) into v_counter from empleado e
    where e.es_editor = 1 
    and   e.es_revisor = 1;

	RETURN v_counter;

	EXCEPTION WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('No existe un editor que sea revisor');

END ft_get_revisor_editor;
/
