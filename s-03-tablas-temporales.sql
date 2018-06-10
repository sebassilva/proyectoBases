CREATE GLOBAL TEMPORARY TABLE TODOS_EMPLEADOS AS
SELECT * FROM EMPLEADO E
LEFT JOIN REVISOR R
ON E.EMPLEADO_ID = R.EMPLEADO_ID;
LEFT JOIN EDITOR ED
ON E.EMPLEADO_ID = ED.EMPLEADO_ID;