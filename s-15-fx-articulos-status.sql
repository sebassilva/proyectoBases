-- @Autores: López Santibáñez Jiménez, Luis Gerardo
--          Silva García, Carlos Sebastián
-- Fecha de creación: 10/06/2018
-- Descripción: Crear una funcion que calcula 

CREATE OR REPLACE FUNCTION ft_get_count_status(
    v_articulo NUMBER
)
RETURN NUMBER
IS
	v_counter NUMBER(2,0) := 0;
BEGIN
    SELECT count(*) into v_counter from articulo a
    where a.STATUS_ARTICULO_ID = v_articulo;

	RETURN v_counter;

	EXCEPTION WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('No hay datos con ese estatus');

END ft_get_count_status;
/
