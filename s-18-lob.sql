set serveroutput on
create or replace directory data_dir as '/tmp/data_dir';
create or replace procedure carga_blob_en_bd (
v_nombre_directorio in varchar2,
v_nombre_archivo in varchar2,
v_nombre_tabla in out varchar2,
v_nombre_col_blob in out varchar2,
v_nombre_col_pk in out varchar2,
v_valor_pk in number,
v_longitud out number
) is
v_sql varchar2(2000);
v_bfile bfile;
v_src_offset number := 1;
v_dest_offset number:= 1;
v_dest_blob blob;
v_src_length number;
v_dest_length number;
begin
--verifica que los nombres de las tablas y columnas sean
--cadenas validas. Ayuda con la inyección de SQL.
v_nombre_tabla := dbms_assert.simple_sql_name(v_nombre_tabla);
v_nombre_col_blob := dbms_assert.simple_sql_name(v_nombre_col_blob);
v_nombre_col_pk := dbms_assert.simple_sql_name(v_nombre_col_pk);



v_bfile := bfilename(upper(v_nombre_directorio),v_nombre_archivo);
if dbms_lob.fileexists(v_bfile) = 1 and not
dbms_lob.isopen(v_bfile) = 1 then
dbms_lob.open(v_bfile,dbms_lob.lob_readonly);
else
raise_application_error(-20001,'El archivo '
||v_nombre_archivo
||' no existe en el directorio '
||v_nombre_directorio
||' o el archivo esta abierto');
end if;
--sentencia dinamica.
v_sql := 'update '
||v_nombre_tabla
||' set '
||v_nombre_col_blob
||' = empty_blob()'
||' where '
||v_nombre_col_pk
||' = :ph_pk'
||' returning '
||v_nombre_col_blob
||' into :ph_blob';
--ejecuta la consulta dinamica
execute immediate v_sql using v_valor_pk returning into v_dest_blob;
--escribe el contenido del archivo en el objeto blob: v_dest_blob
dbms_lob.loadblobfromfile(
dest_lob => v_dest_blob,
src_bfile => v_bfile,
amount => dbms_lob.getlength(v_bfile),
dest_offset => v_dest_offset,
src_offset => v_src_offset);
dbms_lob.close(v_bfile);
v_src_length := dbms_lob.getlength(v_bfile);
v_dest_length := dbms_lob.getlength(v_dest_blob);
if v_src_length = v_dest_length then
dbms_output.put_line('Escritura correcta, bytes escritos: '
|| v_src_length);
v_longitud := v_src_length;
else
raise_application_error(-20002,'Error al escribir datos.\n'
||' Se esperaba escribir '
||v_src_length
||' Pero solo se escribio '
||v_dest_length);
end if;


-- Manejo de excepciones
exception
when others then
v_longitud := 1;
dbms_output.put_line( dbms_utility.format_error_backtrace );
raise;
end;
/
show errors

insert into articulo_pdf(articulo_pdf_id, num_archivo, articulo_id) values (PDF_NUM_ARCHIVO_SEQ.nextval, PDF_NUM_ARCHIVO_SEQ.currval, 1 );
select * from articulo_pdf;
commit;


declare
v_longitud number;
v_nombre_tabla varchar2(30) := 'articulo_pdf';
v_nombre_col_blob varchar2(30) := 'archivo';
v_nombre_col_pk varchar2(30) := 'articulo_pdf_id';
v_nombre_directorio varchar2(30) := 'data_dir';
v_valor_pk numeric(10,0) := 22;
v_nombre_archivo varchar2(100) := 'test.pdf';
begin
dbms_output.put_line('Cargando BLOB en la BD');
carga_blob_en_bd(v_nombre_directorio,v_nombre_archivo,
v_nombre_tabla,v_nombre_col_blob,v_nombre_col_pk,
v_valor_pk,v_longitud);
dbms_output.put_line('Listo, bytes escritos: '|| v_longitud);
--hace permanente el cambio
commit;
exception
when others then
dbms_output.put_line('Error al realizar la carga, se hara rollback');
dbms_output.put_line( dbms_utility.format_error_backtrace );
rollback;
raise;
end;
/