-- @Autores: López Santibáñez Jiménez, Luis Gerardo
--          Silva García, Carlos Sebastián
-- Fecha de creación: 09/06/2018
-- Descripción: Ejecuta el procedimiento de subir_archivo

--Ejecuta el procedimiento

CREATE OR REPLACE PROCEDURE SUBIR_ARCHIVO
IS 
v_longitud number;
v_nombre_tabla varchar2(30) := 'articulo_pdf';
v_nombre_col_blob varchar2(30) := 'archivo';
v_nombre_col_pk varchar2(30) := 'articulo_pdf_id';
v_nombre_directorio varchar2(30) := 'data_dir';
v_valor_pk numeric(10,0);
v_nombre_archivo varchar2(100) := 'test.pdf';
cursor cur_pdf is select * from articulo_pdf; 

begin
for c in cur_pdf 
loop

dbms_output.put_line('Cargando BLOB en la BD');
carga_blob_en_bd(v_nombre_directorio,v_nombre_archivo,
v_nombre_tabla,v_nombre_col_blob,v_nombre_col_pk,
c.articulo_pdf_id,v_longitud);
dbms_output.put_line('Listo, bytes escritos: '|| v_longitud);

--hace permanente el cambio
end loop; 

exception
when others then
dbms_output.put_line('Error al realizar la carga, se hara rollback');
dbms_output.put_line( dbms_utility.format_error_backtrace );
raise;

end;

/


BEGIN 
SUBIR_ARCHIVO();
END;
/