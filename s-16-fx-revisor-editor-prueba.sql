SET SERVEROUTPUT ON;
declare
     result number;
begin
   -- Call the function
   result := ft_get_revisor_editor();
   DBMS_OUTPUT.PUT_LINE('# Editores que son revisores: ' || result );
end;
/
