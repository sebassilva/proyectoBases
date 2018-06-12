-- @Autores: López Santibáñez Jiménez, Luis Gerardo
--          Silva García, Carlos Sebastián
-- Fecha de creación: 09/06/2018
-- Descripción: Ejecuta el procedimiento de subir_archivo

--Ejecuta el procedimiento

CREATE OR REPLACE PROCEDURE SUBIR_ARCHIVO(
  P_ARTICULO_ID IN NUMBER
)
IS 
v_longitud number;
v_nombre_tabla varchar2(30) := 'articulo_pdf';
v_nombre_col_blob varchar2(30) := 'archivo';
v_nombre_col_pk varchar2(30) := 'articulo_pdf_id';
v_nombre_directorio varchar2(30) := 'data_dir';
v_valor_pk numeric(10,0) := P_ARTICULO_ID;
v_nombre_archivo varchar2(100) := 'test.pdf';
CURSOR PDF_CUR IS SELECT * FROM ARTICULO_PDF;

begin
dbms_output.put_line('Cargando BLOB en la BD');

FOR  
   IN PDF_CUR
   LOOP
      DBMS_OUTPUT.put_line (
         employee_rec.last_name);
   END LOOP;




carga_blob_en_bd(v_nombre_directorio,v_nombre_archivo,
v_nombre_tabla,v_nombre_col_blob,v_nombre_col_pk,
v_valor_pk,v_longitud);
dbms_output.put_line('Listo, bytes escritos: '|| v_longitud);
--hace permanente el cambio
exception
when others then
dbms_output.put_line('Error al realizar la carga, se hara rollback');
dbms_output.put_line( dbms_utility.format_error_backtrace );
raise;

end;

/


BEGIN 
SUBIR_ARCHIVO(22);
END;
/