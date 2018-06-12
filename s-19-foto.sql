--@Autores:			Espinosa Curiel Oscar
--					Martínez Segrera Daniel Enrique
--@Fecha creacion:	20/05/18
--@Descripcion:		Procedimiento que permite guardar una foto
--					de un auto en especifico.

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE registra_fotos (
	p_auto_id IN NUMBER,
	p_directorio IN VARCHAR2,
	p_nombre_archivo IN VARCHAR2,
	p_cantidad_bytes OUT NUMBER
)IS
	v_bfile BFILE;
	v_src_offset NUMBER := 1;
	v_dest_offset NUMBER := 1;
	v_dest_blob BLOB;
	v_src_length NUMBER;
	v_dest_length NUMBER;
BEGIN
	v_bfile := BFILENAME(p_directorio,p_nombre_archivo);
	IF DBMS_LOB.FILEEXISTS(v_bfile) = 1 
		AND NOT DBMS_LOB.ISOPEN(v_bfile) = 1 THEN
		DBMS_LOB.OPEN(v_bfile,DBMS_LOB.LOB_READONLY);
	ELSE
		RAISE_APPLICATION_ERROR(-20001,'El archivo '
			||p_nombre_archivo
			||' no existe en el directorio '
			||p_directorio
			||' o esta abierto.');
	END IF;

	SELECT foto
	INTO v_dest_blob
	FROM auto
	WHERE auto_id = p_auto_id
	FOR UPDATE;

	DBMS_LOB.LOADBLOBFROMFILE (
		dest_lob 	=> v_dest_blob,
		src_bfile 	=> v_bfile,
		amount 		=> DBMS_LOB.GETLENGTH(v_bfile),
		dest_offset	=> v_dest_offset,
		src_offset	=> v_src_offset);
	DBMS_LOB.CLOSE(v_bfile);

	v_src_length := DBMS_LOB.GETLENGTH(v_bfile);
	v_dest_length := DBMS_LOB.GETLENGTH(v_dest_blob);

	IF v_src_length <> v_dest_length THEN
		RAISE_APPLICATION_ERROR(-20002,'Error al escribir datos.'||CHR(10)
			||' Se esperaba escribir '||v_src_length
			||', pero solo se escribio '||v_dest_length);
	END IF;

	p_cantidad_bytes := DBMS_LOB.GETLENGTH(v_dest_blob);
END;
/
SHOW ERRORS






--@Autores:			Espinosa Curiel Oscar
--					Martínez Segrera Daniel Enrique
--@Fecha creacion:	20/05/18
--@Descripcion:		Prueba del procedimiento que permite
--					guardar fotos.

PROMPT Ejecutando procedimiento para autos con ID 1 a 5.

DECLARE
	v_cantidad_bytes NUMBER;
BEGIN

	FOR i IN 1..5 LOOP
		registra_fotos(i,'DATA_DIR','auto'||i||'.jpg',v_cantidad_bytes);
		DBMS_OUTPUT.PUT_LINE(CHR(10)||'Se guardaron '||v_cantidad_bytes
			||' para el auto con ID '||i||'.');
	END LOOP;
END;
/
SHOW ERRORS

PROMPT Datos guardados en la BD de los autos con ID 1 a 8.

SELECT auto_id,DBMS_LOB.GETLENGTH(foto) AS longitud
FROM auto
WHERE auto_id = 1
OR auto_id = 2
OR auto_id = 3
OR auto_id = 4
OR auto_id = 5
OR auto_id = 6
OR auto_id = 7
OR auto_id = 8;




--@Autores:			Espinosa Curiel Oscar
--					Martínez Segrera Daniel Enrique
--@Fecha creacion:	20/05/18
--@Descripcion:		Procedimiento que permite guardar la foto 
--					de un rango de autos en disco.

SET SERVEROUTPUT ON
CREATE OR REPLACE PROCEDURE escribe_fotos (
	p_auto_id_min IN NUMBER,
	p_auto_id_max IN NUMBER,
	p_directorio IN VARCHAR2
)IS
	v_blob BLOB;
	v_file UTL_FILE.FILE_TYPE;
	v_buffer_size NUMBER := 32767;
	v_buffer RAW(32767);
	v_position NUMBER := 1;
	v_longitud NUMBER;
BEGIN
	IF p_auto_id_min > p_auto_id_max THEN
		RAISE_APPLICATION_ERROR(-20001,'El limite menor es mas grande que el mayor.');
	END IF;
	FOR i IN p_auto_id_min..p_auto_id_max LOOP
		SELECT foto
		INTO v_blob
		FROM auto
		WHERE auto_id = i;
		IF DBMS_LOB.GETLENGTH(v_blob) <> 0 THEN
			v_file := UTL_FILE.FOPEN(UPPER(p_directorio),
				'foto_auto_'||i||'.jpg','wb',v_buffer_size);

			v_longitud := DBMS_LOB.GETLENGTH(v_blob);

			WHILE v_position < v_longitud LOOP
				DBMS_LOB.READ(v_blob,v_buffer_size,v_position,v_buffer);
				UTL_FILE.PUT_RAW(v_file,v_buffer,TRUE);
				v_position := v_position + v_buffer_size;
			END LOOP;
			UTL_FILE.FCLOSE(v_file);
		DBMS_OUTPUT.PUT_LINE(CHR(10)||'La foto del auto con ID '||i||' se guardo exitosamente');
		ELSE
			DBMS_OUTPUT.PUT_LINE(CHR(10)||'La foto del auto con ID '||i||' no fue encontrada.');
		END IF;
		v_position := 1;
	END LOOP;

	EXCEPTION
	WHEN OTHERS THEN 
		IF UTL_FILE.IS_OPEN(v_file) THEN
			UTL_FILE.FCLOSE(v_file);
		END IF;

		DBMS_OUTPUT.PUT_LINE(DBMS_UTILITY.FORMAT_ERROR_BACKTRACE);

		v_longitud := 1;
		RAISE;

END;
/
SHOW ERRORS



--@Autores:			Espinosa Curiel Oscar
--					Martínez Segrera Daniel Enrique
--@Fecha creacion:	20/05/18
--@Descripcion:		Prueba del procedimiento que permite
--					guardar fotos en el disco.

PROMPT Ejecutando procedimiento para los autos con ID 1 a 8

DECLARE
	v_cantidad_bytes NUMBER;
BEGIN
	escribe_fotos(1,8,'DUMP_DIR');
END;
/
SHOW ERRORS