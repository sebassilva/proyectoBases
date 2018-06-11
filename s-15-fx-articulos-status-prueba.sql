SET SERVEROUTPUT ON;
declare
     result number;
     status_id number := 1;
begin
   -- Call the function
   result := ft_get_count_status(status_id);
   DBMS_OUTPUT.PUT_LINE('# Articulos con status ' || status_id || ' son :' || result );
end;
/
