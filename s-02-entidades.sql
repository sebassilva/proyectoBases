-- @Autores: López Santibáñez Jiménez, Luis Gerardo
--          Silva García, Carlos Sebastián
-- Fecha de creación: 09/06/2018
-- Descripción: Crea todas las tablas necesarias para el proyecto.


CREATE SEQUENCE seq_by_two
MINVALUE 2
START WITH 2
INCREMENT BY 2
CACHE 20;

-- 
-- Crea tabla: AREA_INTERES 
--

CREATE TABLE AREA_INTERES(
    AREA_INTERES_ID    NUMBER(10, 0)    GENERATED BY DEFAULT ON NULL AS IDENTITY,
    CLAVE              VARCHAR2(40)     NOT NULL,
    DESCRIPCION        VARCHAR2(40)     NOT NULL,
    CONSTRAINT AREA_INTERES_PK PRIMARY KEY (AREA_INTERES_ID)
);



-- 
-- Crea tabla: AREA_INTERES_REVISOR 
--

CREATE TABLE AREA_INTERES_REVISOR(
    AREA_INTERES_REVISOR_ID    NUMBER(10, 0)    GENERATED BY DEFAULT ON NULL AS IDENTITY,
    ANIOS                      VARCHAR2(40)     NOT NULL,
    EMPLEADO_ID                NUMBER(10, 0)    NOT NULL,
    AREA_INTERES_ID            NUMBER(10, 0)    NOT NULL,
    CONSTRAINT AREA_INT_REV_PK PRIMARY KEY (AREA_INTERES_REVISOR_ID)
);



-- 
-- Crea tabla: ARTICULO 
--

CREATE TABLE ARTICULO(
    ARTICULO_ID           NUMBER(10, 0)    GENERATED BY DEFAULT ON NULL AS IDENTITY,
    FOLIO                 CHAR(18)         NULL,
    TITULO                VARCHAR2(40)     NOT NULL,
    SINOPSIS              VARCHAR2(40)     NOT NULL,
    FECHA_STATUS          DATE             DEFAULT SYSDATE NOT NULL,
    STATUS_ARTICULO_ID    NUMBER(10, 0)    NOT NULL,
    AREA_INTERES_ID       NUMBER(10, 0)    NOT NULL,
    PROMEDIO                  NUMBER(4, 2)     DEFAULT 0  NOT NULL,
    CONSTRAINT ARTICULO_FOLIO_UK UNIQUE (FOLIO),
    CONSTRAINT ARTICULO_PK PRIMARY KEY (ARTICULO_ID)
);



-- 
-- Crea tabla: ARTICULO_AUTOR 
--

CREATE TABLE ARTICULO_AUTOR(
    ARTICULO_AUTOR_ID    NUMBER(10, 0)    GENERATED BY DEFAULT ON NULL AS IDENTITY,
    ARTICULO_ID          NUMBER(10, 0)    NOT NULL,
    AUTOR_ID             NUMBER(10, 0)    NOT NULL,
    CONSTRAINT ARTICULO_AUTOR_PK PRIMARY KEY (ARTICULO_AUTOR_ID)
);



-- 
-- Crea tabla: ARTICULO_PDF 
--

CREATE TABLE ARTICULO_PDF(
    ARTICULO_PDF_ID    NUMBER(10, 0)    GENERATED BY DEFAULT ON NULL AS IDENTITY,
    NUM_ARCHIVO        NUMBER(10, 0)    NOT NULL,
    ARTICULO_ID        NUMBER(10, 0)    NOT NULL,
    CONSTRAINT ARTICULO_PDF_PK PRIMARY KEY (ARTICULO_PDF_ID)
);



-- 
-- Crea tabla: ARTICULO_REVISOR 
--

CREATE TABLE ARTICULO_REVISOR(
    ARTICULO_REVISOR_ID    NUMBER(10, 0)    GENERATED BY DEFAULT ON NULL AS IDENTITY,
    CALIFICACION           NUMBER(10, 0)    NOT NULL,
    ARTICULO_ID            NUMBER(10, 0)    NOT NULL,
    EMPLEADO_ID            NUMBER(10, 0)    NOT NULL,
    CONSTRAINT ARTICULO_REVISOR_PK PRIMARY KEY (ARTICULO_REVISOR_ID),
    CONSTRAINT CALIFICACION_CHK CHECK (CALIFICACION>=0 AND CALIFICACION <= 10)
);



-- 
-- Crea tabla: ARTICULO_REVISTA 
--

CREATE TABLE ARTICULO_REVISTA(
    ARTICULO_REVISTA_ID    NUMBER(10, 0)    GENERATED BY DEFAULT ON NULL AS IDENTITY,
    NUM_PAG                NUMBER(10, 0)    NOT NULL,
    ARTICULO_ID            NUMBER(10, 0)    NOT NULL,
    REVISTA_ID             NUMBER(10, 0)    NOT NULL,
    CONSTRAINT ARTICULO_REVISTA_PK PRIMARY KEY (ARTICULO_REVISTA_ID)
);



-- 
-- Crea tabla: ARTICULO_STATUS_HISTORICO 
--

CREATE TABLE ARTICULO_STATUS_HISTORICO(
    ARTICULO_STATUS_HISTORICO_ID    NUMBER(10, 0)    GENERATED BY DEFAULT ON NULL AS IDENTITY,
    FECHA                           DATE             DEFAULT SYSDATE NOT NULL,
    ARTICULO_ID                     NUMBER(10, 0)    NOT NULL,
    STATUS_ARTICULO_ID              NUMBER(10, 0)    NOT NULL,
    CONSTRAINT ARTICULO_STATUS_HISTORICO_PK PRIMARY KEY (ARTICULO_STATUS_HISTORICO_ID)
);



-- 
-- Crea tabla: AUTOR 
--

CREATE TABLE AUTOR(
    AUTOR_ID      NUMBER(10, 0)    GENERATED BY DEFAULT ON NULL AS IDENTITY,
    EMPRESA       VARCHAR2(40)     NOT NULL,
    EMAIL         VARCHAR2(80)     NOT NULL,
    NOMBRE        VARCHAR2(40)     NOT NULL,
    AP_PATERNO    VARCHAR2(40)     NOT NULL,
    AP_MATERNO    VARCHAR2(40)     NOT NULL,
    OCUPACION     VARCHAR2(40)     NOT NULL,
    CONSTRAINT AUTOR_PK PRIMARY KEY (AUTOR_ID)
);



-- 
-- Crea tabla: DIRECCION 
--

CREATE TABLE DIRECCION(
    DIRECCION_ID    NUMBER(10, 0)    GENERATED BY DEFAULT ON NULL AS IDENTITY,
    CP              NUMBER(10, 0)    NOT NULL,
    CALLE           VARCHAR2(40)     NOT NULL,
    NUMERO          NUMBER(10, 0)    NOT NULL,
    ESTADO          VARCHAR2(40)     NOT NULL,
    MUNICIPIO       VARCHAR2(40)     NOT NULL,
    COLONIA         VARCHAR2(40)     NOT NULL,
    CONSTRAINT DIRECCION_PK PRIMARY KEY (DIRECCION_ID)
);



-- 
-- Crea tabla: EDITOR 
--

CREATE TABLE EDITOR(
    EMPLEADO_ID    NUMBER(10, 0)    GENERATED BY DEFAULT ON NULL AS IDENTITY,
    NUM_CEDULA     VARCHAR2(40)     NOT NULL,
    TITULO         VARCHAR2(40)     NOT NULL,
    CONSTRAINT EDITOR_PK PRIMARY KEY (EMPLEADO_ID)
);



-- 
-- Crea tabla: EMPLEADO 
--

CREATE TABLE EMPLEADO(
    EMPLEADO_ID      NUMBER(10, 0)    DEFAULT seq_by_two.NEXTVAL NOT NULL,
    ES_EDITOR        NUMBER(1, 0)     NOT NULL,
    ES_REVISOR       NUMBER(1, 0)     NOT NULL,
    NOMBRE           VARCHAR2(40)     NOT NULL,
    AP_PATERNO       VARCHAR2(40)     NOT NULL,
    AP_MATERNO       VARCHAR2(40)     NOT NULL,
    EMAIL            VARCHAR2(80)     NOT NULL,
    FECHA_INGRESO    DATE             NOT NULL,
    CONSTRAINT EMPLEADO_PK PRIMARY KEY (EMPLEADO_ID)
);



-- 
-- Crea tabla: REVISOR 
--

CREATE TABLE REVISOR(
    EMPLEADO_ID           NUMBER(10, 0)    GENERATED BY DEFAULT ON NULL AS IDENTITY,
    FECHA_FIN_CONTRATO    DATE             NOT NULL,
    NUM_CONTRATO          VARCHAR2(40)     NOT NULL,
    CONSTRAINT REVISOR_PK PRIMARY KEY (EMPLEADO_ID)
);



-- 
-- Crea tabla: REVISTA 
--

CREATE TABLE REVISTA(
    REVISTA_ID             NUMBER(10, 0)    GENERATED BY DEFAULT ON NULL AS IDENTITY,
    BIMESTRE               NUMBER(10, 0)    NOT NULL,
    ANIO_PUBLICACION       NUMBER(10, 0)    NOT NULL,
    NUM_COPIAS             NUMBER(10, 0)    NOT NULL,
    NUM_COPIAS_VENDIDAS    NUMBER(10, 0)    DEFAULT 0 NOT NULL ,
    NUM_COPIAS_DISPONIBLES NUMBER(10, 0)    GENERATED ALWAYS AS (NUM_COPIAS - NUM_COPIAS_VENDIDAS) VIRTUAL,
    TITULO                 VARCHAR2(40)     NOT NULL,
    CONSTRAINT REVISTA_PK PRIMARY KEY (REVISTA_ID)
);



-- 
-- Crea tabla: STATUS_ARTICULO 
--

CREATE TABLE STATUS_ARTICULO(
    STATUS_ARTICULO_ID    NUMBER(10, 0)    GENERATED BY DEFAULT ON NULL AS IDENTITY,
    CLAVE                 VARCHAR2(40)     NOT NULL,
    DESCRIPCION           VARCHAR2(40)     NOT NULL,
    CONSTRAINT STATUS_ARTICULO_PK PRIMARY KEY (STATUS_ARTICULO_ID)
);



-- 
-- Crea tabla: SUSCRIPTOR 
--

CREATE TABLE SUSCRIPTOR(
    SUSCRIPTOR_ID        NUMBER(10, 0)   GENERATED BY DEFAULT ON NULL AS IDENTITY,
    VIGENCIA             DATE            NOT NULL,
    FECHA_SUSCRIPCION    DATE            NOT NULL,
    NOMBRE               VARCHAR2(40)    NOT NULL,
    AP_PATERNO           VARCHAR2(40)    NOT NULL,
    AP_MATERNO           VARCHAR2(40)    NOT NULL,
    EMAIL                VARCHAR2(80)    NOT NULL,
    CONSTRAINT SUSCRIPTOR_PK PRIMARY KEY (SUSCRIPTOR_ID)
);



-- 
-- Crea tabla: SUSCRIPTOR_REVISTA 
--

CREATE TABLE SUSCRIPTOR_REVISTA(
    SUSCRIPTOR_REVISTA_ID    NUMBER(10, 0)    GENERATED BY DEFAULT ON NULL AS IDENTITY,
    FECHA_INICIO             DATE             NOT NULL,
    DIRECCION                VARCHAR2(120)    NOT NULL,
    REVISTA_ID               NUMBER(10, 0)    NOT NULL,
    SUSCRIPTOR_ID            NUMBER(10, 0)     NOT NULL,
    CONSTRAINT SUSCRIPTOR_REVISTA_PK PRIMARY KEY (SUSCRIPTOR_REVISTA_ID)
);



-- 
-- Agrega Foreign Keys a tabla: AREA_INTERES_REVISOR 
--

ALTER TABLE AREA_INTERES_REVISOR 
    ADD CONSTRAINT AREA_INT_REVISOR_FK
    FOREIGN KEY (EMPLEADO_ID)
    REFERENCES REVISOR(EMPLEADO_ID)
;

ALTER TABLE AREA_INTERES_REVISOR 
    ADD CONSTRAINT AREA_INT_INTERES_FK
    FOREIGN KEY (AREA_INTERES_ID)
    REFERENCES AREA_INTERES(AREA_INTERES_ID);


-- 
-- Agrega Foreign Keys a tabla: ARTICULO 
--

ALTER TABLE ARTICULO 
    ADD CONSTRAINT ART_STATUS_ARTICULO_FK
    FOREIGN KEY (STATUS_ARTICULO_ID)
    REFERENCES STATUS_ARTICULO(STATUS_ARTICULO_ID)
;

ALTER TABLE ARTICULO 
    ADD CONSTRAINT ART_AREA_INTERES_FK 
    FOREIGN KEY (AREA_INTERES_ID)
    REFERENCES AREA_INTERES(AREA_INTERES_ID)
;


-- 
-- Agrega Foreign Keys a tabla: ARTICULO_AUTOR 
--

ALTER TABLE ARTICULO_AUTOR 
    ADD CONSTRAINT ART_AUTOR_AUTOR_FK
    FOREIGN KEY (AUTOR_ID)
    REFERENCES AUTOR(AUTOR_ID)
;

ALTER TABLE ARTICULO_AUTOR 
    ADD CONSTRAINT ART_AUTOR_ARTICULO_FK
    FOREIGN KEY (ARTICULO_ID)
    REFERENCES ARTICULO(ARTICULO_ID)
;


-- 
-- Agrega Foreign Keys a tabla: ARTICULO_PDF 
--

ALTER TABLE ARTICULO_PDF 
    ADD CONSTRAINT ART_PDF_ARTICULO_FK
    FOREIGN KEY (ARTICULO_ID)
    REFERENCES ARTICULO(ARTICULO_ID)
;


-- 
-- Agrega Foreign Keys a tabla: ARTICULO_REVISOR 
--

ALTER TABLE ARTICULO_REVISOR 
    ADD CONSTRAINT ART_REV_ARTICULO_FK
    FOREIGN KEY (ARTICULO_ID)
    REFERENCES ARTICULO(ARTICULO_ID)
;

ALTER TABLE ARTICULO_REVISOR 
    ADD CONSTRAINT ART_REV_REVISOR_FK
    FOREIGN KEY (EMPLEADO_ID)
    REFERENCES REVISOR(EMPLEADO_ID)
;


-- 
-- Agrega Foreign Keys a tabla: ARTICULO_REVISTA 
--

ALTER TABLE ARTICULO_REVISTA 
    ADD CONSTRAINT ART_REVISTA_ART_FK
    FOREIGN KEY (ARTICULO_ID)
    REFERENCES ARTICULO(ARTICULO_ID)
;

ALTER TABLE ARTICULO_REVISTA 
    ADD CONSTRAINT ART_REVISTA_REV_FK
    FOREIGN KEY (REVISTA_ID)
    REFERENCES REVISTA(REVISTA_ID)
;


-- 
-- Agrega Foreign Keys a tabla: ARTICULO_STATUS_HISTORICO 
--

ALTER TABLE ARTICULO_STATUS_HISTORICO 
    ADD CONSTRAINT ART_HIST_ART_FK 
    FOREIGN KEY (ARTICULO_ID)
    REFERENCES ARTICULO(ARTICULO_ID)
;

ALTER TABLE ARTICULO_STATUS_HISTORICO 
    ADD CONSTRAINT ART_S_H_S_ART_FK 
    FOREIGN KEY (STATUS_ARTICULO_ID)
    REFERENCES STATUS_ARTICULO(STATUS_ARTICULO_ID)
;


-- 
-- Agrega Foreign Keys a tabla: EDITOR 
--

ALTER TABLE EDITOR 
    ADD CONSTRAINT EDITOR_EMPLEADO_FK
    FOREIGN KEY (EMPLEADO_ID)
    REFERENCES EMPLEADO(EMPLEADO_ID)
;


-- 
-- Agrega Foreign Keys a tabla: REVISOR 
--

ALTER TABLE REVISOR 
    ADD CONSTRAINT REVISOR_EMPLEADO_FK
    FOREIGN KEY (EMPLEADO_ID)
    REFERENCES EMPLEADO(EMPLEADO_ID)
;


-- 
-- Agrega Foreign Keys a tabla: SUSCRIPTOR_REVISTA 
--

ALTER TABLE SUSCRIPTOR_REVISTA 
    ADD CONSTRAINT SUSC_REVISTA_REV
    FOREIGN KEY (REVISTA_ID)
    REFERENCES REVISTA(REVISTA_ID)
;

ALTER TABLE SUSCRIPTOR_REVISTA 
    ADD CONSTRAINT SUSC_REV_SUSC_FK
    FOREIGN KEY (SUSCRIPTOR_ID)
    REFERENCES SUSCRIPTOR(SUSCRIPTOR_ID)
;
