--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      gerry
-- Project :      PROY1.DM1
-- Author :       gerry
--
-- Date Created : Friday, June 08, 2018 03:17:02
-- Target DBMS : Oracle 11g
--

CREATE SEQUENCE seq_by_one
MINVALUE 1
START WITH 1
INCREMENT BY 1
CACHE 20;


CREATE SEQUENCE seq_by_two
MINVALUE 2
START WITH 2
INCREMENT BY 2
CACHE 20;

CREATE TABLE t1 (
  id          NUMBER DEFAULT seq_by_one.NEXTVAL,
  description VARCHAR2(30)
);

CREATE TABLE t2 (
  id          NUMBER DEFAULT seq_by_one.NEXTVAL,
  description VARCHAR2(30)
);




-- 
-- TABLE: AREA_INTERES 
--

CREATE TABLE AREA_INTERES(
    AREA_INTERES_ID    NUMBER(10, 0)    NOT NULL DEFAULT t1_seq.NEXTVAL,
    CLAVE              VARCHAR2(40)     NOT NULL,
    DESCRIPCION        VARCHAR2(40)     NOT NULL,
    CONSTRAINT AREA_INTERES_PK PRIMARY KEY (AREA_INTERES_ID)
)
;



-- 
-- TABLE: AREA_INTERES_REVISOR 
--

CREATE TABLE AREA_INTERES_REVISOR(
    AREA_INTERES_REVISOR_ID    VARCHAR2(40)     NOT NULL,
    ANIOS                      VARCHAR2(40)     NOT NULL,
    EMPLEADO_ID                NUMBER(10, 0)    NOT NULL,
    AREA_INTERES_ID            NUMBER(10, 0)    NOT NULL,
    CONSTRAINT AREA_INTERES_REVISOR_PK PRIMARY KEY (AREA_INTERES_REVISOR_ID)
)
;



-- 
-- TABLE: ARTICULO 
--

CREATE TABLE ARTICULO(
    ARTICULO_ID           NUMBER(10, 0)    NOT NULL,
    FOLIO                 NUMBER(10, 0)    NOT NULL,
    TITULO                VARCHAR2(40)     NOT NULL,
    SINOPSIS              VARCHAR2(40)     NOT NULL,
    FECHA_STATUS          DATE             NOT NULL,
    STATUS_ARTICULO_ID    NUMBER(10, 0)    NOT NULL,
    AREA_INTERES_ID       NUMBER(10, 0)    NOT NULL,
    CONSTRAINT ARTICULO_PK PRIMARY KEY (ARTICULO_ID)
)
;



-- 
-- TABLE: ARTICULO_AUTOR 
--

CREATE TABLE ARTICULO_AUTOR(
    ARTICULO_AUTOR_ID    VARCHAR2(40)     NOT NULL,
    ARTICULO_ID          NUMBER(10, 0)    NOT NULL,
    AUTOR_ID             NUMBER(10, 0)    NOT NULL,
    CONSTRAINT ARTICULO_AUTOR_PK PRIMARY KEY (ARTICULO_AUTOR_ID)
)
;



-- 
-- TABLE: ARTICULO_PDF 
--

CREATE TABLE ARTICULO_PDF(
    ARTICULO_PDF_ID    NUMBER(10, 0)    NOT NULL,
    NUM_ARCHIVO        NUMBER(10, 0)    NOT NULL,
    ARTICULO_ID        NUMBER(10, 0)    NOT NULL,
    CONSTRAINT ARTICULO_PDF_PK PRIMARY KEY (ARTICULO_PDF_ID)
)
;



-- 
-- TABLE: ARTICULO_REVISOR 
--

CREATE TABLE ARTICULO_REVISOR(
    ARTICULO_REVISOR_ID    NUMBER(10, 0)    NOT NULL,
    CALIFICACION           NUMBER(10, 0)    NOT NULL,
    ARTICULO_ID            NUMBER(10, 0)    NOT NULL,
    EMPLEADO_ID            NUMBER(10, 0)    NOT NULL,
    CONSTRAINT ARTICULO_REVISOR_PK PRIMARY KEY (ARTICULO_REVISOR_ID)
)
;



-- 
-- TABLE: ARTICULO_REVISTA 
--

CREATE TABLE ARTICULO_REVISTA(
    ARTICULO_REVISTA_ID    NUMBER(10, 0)    NOT NULL,
    NUM_PAG                NUMBER(10, 0)    NOT NULL,
    ARTICULO_ID            NUMBER(10, 0)    NOT NULL,
    REVISTA_ID             NUMBER(10, 0)    NOT NULL,
    CONSTRAINT ARTICULO_REVISTA_PK PRIMARY KEY (ARTICULO_REVISTA_ID)
)
;



-- 
-- TABLE: ARTICULO_STATUS_HISTORICO 
--

CREATE TABLE ARTICULO_STATUS_HISTORICO(
    ARTICULO_STATUS_HISTORICO_ID    NUMBER(10, 0)    NOT NULL,
    FECHA                           DATE             NOT NULL,
    ARTICULO_ID                     NUMBER(10, 0)    NOT NULL,
    STATUS_ARTICULO_ID              NUMBER(10, 0)    NOT NULL,
    CONSTRAINT ARTICULO_STATUS_HISTORICO_PK PRIMARY KEY (ARTICULO_STATUS_HISTORICO_ID)
)
;



-- 
-- TABLE: AUTOR 
--

CREATE TABLE AUTOR(
    AUTOR_ID      NUMBER(10, 0)    NOT NULL,
    EMPRESA       VARCHAR2(40)     NOT NULL,
    EMAIL         VARCHAR2(40)     NOT NULL,
    NOMBRE        VARCHAR2(40)     NOT NULL,
    AP_PATERNO    VARCHAR2(40)     NOT NULL,
    AP_MATERNO    VARCHAR2(40)     NOT NULL,
    OCUPACION     VARCHAR2(40)     NOT NULL,
    CONSTRAINT AUTOR_PK PRIMARY KEY (AUTOR_ID)
)
;



-- 
-- TABLE: DIRECCION 
--

CREATE TABLE DIRECCION(
    DIRECCION_ID    VARCHAR2(10)     NOT NULL,
    CP              NUMBER(10, 0)    NOT NULL,
    CALLE           VARCHAR2(40)     NOT NULL,
    NUMERO          NUMBER(10, 0)    NOT NULL,
    ESTADO          VARCHAR2(40)     NOT NULL,
    MUNICIPIO       VARCHAR2(40)     NOT NULL,
    COLONIA         VARCHAR2(40)     NOT NULL,
    CONSTRAINT DIRECCION_PK PRIMARY KEY (DIRECCION_ID)
)
;



-- 
-- TABLE: EDITOR 
--

CREATE TABLE EDITOR(
    EMPLEADO_ID    NUMBER(10, 0)    NOT NULL,
    NUM_CEDULA     VARCHAR2(40)     NOT NULL,
    TITULO         VARCHAR2(40)     NOT NULL,
    CONSTRAINT EDITOR_PK PRIMARY KEY (EMPLEADO_ID)
)
;



-- 
-- TABLE: EMPLEADO 
--

CREATE TABLE EMPLEADO(
    EMPLEADO_ID      NUMBER(10, 0)    NOT NULL,
    ES_EDITOR        NUMBER(1, 0)     NOT NULL,
    ES_REVISOR       NUMBER(1, 0)     NOT NULL,
    NOMBRE           VARCHAR2(40)     NOT NULL,
    AP_PATERNO       VARCHAR2(40)     NOT NULL,
    AP_MATERNO       VARCHAR2(40)     NOT NULL,
    EMAIL            VARCHAR2(40)     NOT NULL,
    FECHA_INGRESO    DATE             NOT NULL,
    CONSTRAINT EMPLEADO_PK PRIMARY KEY (EMPLEADO_ID)
)
;



-- 
-- TABLE: REVISOR 
--

CREATE TABLE REVISOR(
    EMPLEADO_ID           NUMBER(10, 0)    NOT NULL,
    FECHA_FIN_CONTRATO    DATE             NOT NULL,
    NUM_CONTRATO          VARCHAR2(40)     NOT NULL,
    CONSTRAINT REVISOR_PK PRIMARY KEY (EMPLEADO_ID)
)
;



-- 
-- TABLE: REVISTA 
--

CREATE TABLE REVISTA(
    REVISTA_ID             NUMBER(10, 0)    NOT NULL,
    BIMESTRE               NUMBER(10, 0)    NOT NULL,
    ANIO_PUBLICACION       NUMBER(10, 0)    NOT NULL,
    NUM_COPIAS             NUMBER(10, 0)    NOT NULL,
    NUM_COPIAS_VENDIDAS    NUMBER(10, 0)    NOT NULL,
    TITULO                 VARCHAR2(40)     NOT NULL,
    CONSTRAINT REVISTA_PK PRIMARY KEY (REVISTA_ID)
)
;



-- 
-- TABLE: STATUS_ARTICULO 
--

CREATE TABLE STATUS_ARTICULO(
    STATUS_ARTICULO_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE                 VARCHAR2(40)     NOT NULL,
    DESCRIPCION           VARCHAR2(40)     NOT NULL,
    CONSTRAINT STATUS_ARTICULO_PK PRIMARY KEY (STATUS_ARTICULO_ID)
)
;



-- 
-- TABLE: SUSCRIPTOR 
--

CREATE TABLE SUSCRIPTOR(
    SUSCRIPTOR_ID        VARCHAR2(40)    NOT NULL,
    VIGENCIA             DATE            NOT NULL,
    FECHA_SUSCRIPCION    VARCHAR2(40)    NOT NULL,
    NOMBRE               VARCHAR2(40)    NOT NULL,
    AP_PATERNO           VARCHAR2(40)    NOT NULL,
    AP_MATERNO           VARCHAR2(40)    NOT NULL,
    EMAIL                VARCHAR2(40)    NOT NULL,
    CONSTRAINT SUSCRIPTOR_PK PRIMARY KEY (SUSCRIPTOR_ID)
)
;



-- 
-- TABLE: SUSCRIPTOR_REVISTA 
--

CREATE TABLE SUSCRIPTOR_REVISTA(
    SUSCRIPTOR_REVISTA_ID    NUMBER(10, 0)    NOT NULL,
    FECHA_INICIO             DATE             NOT NULL,
    DIRECCION                VARCHAR2(120)    NOT NULL,
    REVISTA_ID               NUMBER(10, 0)    NOT NULL,
    SUSCRIPTOR_ID            VARCHAR2(40)     NOT NULL,
    CONSTRAINT SUSCRIPTOR_REVISTA_PK PRIMARY KEY (SUSCRIPTOR_REVISTA_ID)
)
;



-- 
-- TABLE: AREA_INTERES_REVISOR 
--

ALTER TABLE AREA_INTERES_REVISOR 
    ADD CONSTRAINT AREA_INTERES_REVISOR_REVISOR_FK
    FOREIGN KEY (EMPLEADO_ID)
    REFERENCES REVISOR(EMPLEADO_ID)
;

ALTER TABLE AREA_INTERES_REVISOR 
    ADD CONSTRAINT AREA_INTERES_REVISOR_AREA_INTERES_FK
    FOREIGN KEY (AREA_INTERES_ID)
    REFERENCES AREA_INTERES(AREA_INTERES_ID)
;


-- 
-- TABLE: ARTICULO 
--

ALTER TABLE ARTICULO 
    ADD CONSTRAINT ARTICULO_STATUS_ARTICULO_FK
    FOREIGN KEY (STATUS_ARTICULO_ID)
    REFERENCES STATUS_ARTICULO(STATUS_ARTICULO_ID)
;

ALTER TABLE ARTICULO 
    ADD CONSTRAINT ARTICULO_AREA_INTERES_FK 
    FOREIGN KEY (AREA_INTERES_ID)
    REFERENCES AREA_INTERES(AREA_INTERES_ID)
;


-- 
-- TABLE: ARTICULO_AUTOR 
--

ALTER TABLE ARTICULO_AUTOR 
    ADD CONSTRAINT ARTICULO_AUTOR_AUTOR_FK
    FOREIGN KEY (AUTOR_ID)
    REFERENCES AUTOR(AUTOR_ID)
;

ALTER TABLE ARTICULO_AUTOR 
    ADD CONSTRAINT ARTICULO_AUTOR_ARTICULO_FK
    FOREIGN KEY (ARTICULO_ID)
    REFERENCES ARTICULO(ARTICULO_ID)
;


-- 
-- TABLE: ARTICULO_PDF 
--

ALTER TABLE ARTICULO_PDF 
    ADD CONSTRAINT ARTICULO_PDF_ARTICULO_FK
    FOREIGN KEY (ARTICULO_ID)
    REFERENCES ARTICULO(ARTICULO_ID)
;


-- 
-- TABLE: ARTICULO_REVISOR 
--

ALTER TABLE ARTICULO_REVISOR 
    ADD CONSTRAINT ARTICULO_REVISOR_ARTICULO_FK
    FOREIGN KEY (ARTICULO_ID)
    REFERENCES ARTICULO(ARTICULO_ID)
;

ALTER TABLE ARTICULO_REVISOR 
    ADD CONSTRAINT ARTICULO_REVISOR_REVISOR_FK
    FOREIGN KEY (EMPLEADO_ID)
    REFERENCES REVISOR(EMPLEADO_ID)
;


-- 
-- TABLE: ARTICULO_REVISTA 
--

ALTER TABLE ARTICULO_REVISTA 
    ADD CONSTRAINT ARTICULO_REVISTA_ARTICULO_FK
    FOREIGN KEY (ARTICULO_ID)
    REFERENCES ARTICULO(ARTICULO_ID)
;

ALTER TABLE ARTICULO_REVISTA 
    ADD CONSTRAINT ARTICULO_REVISTA_REVISTA_FK
    FOREIGN KEY (REVISTA_ID)
    REFERENCES REVISTA(REVISTA_ID)
;


-- 
-- TABLE: ARTICULO_STATUS_HISTORICO 
--

ALTER TABLE ARTICULO_STATUS_HISTORICO 
    ADD CONSTRAINT ARTICULO_STATUS_HISTORICO_ARTICULO_FK 
    FOREIGN KEY (ARTICULO_ID)
    REFERENCES ARTICULO(ARTICULO_ID)
;

ALTER TABLE ARTICULO_STATUS_HISTORICO 
    ADD CONSTRAINT ARTICULO_STATUS_HISTORICO_STATUS_ARTICULO_FK 
    FOREIGN KEY (STATUS_ARTICULO_ID)
    REFERENCES STATUS_ARTICULO(STATUS_ARTICULO_ID)
;


-- 
-- TABLE: EDITOR 
--

ALTER TABLE EDITOR 
    ADD CONSTRAINT EDITOR_EMPLEADO_FK
    FOREIGN KEY (EMPLEADO_ID)
    REFERENCES EMPLEADO(EMPLEADO_ID)
;


-- 
-- TABLE: REVISOR 
--

ALTER TABLE REVISOR 
    ADD CONSTRAINT REVISOR_EMPLEADO_FK
    FOREIGN KEY (EMPLEADO_ID)
    REFERENCES EMPLEADO(EMPLEADO_ID)
;


-- 
-- TABLE: SUSCRIPTOR_REVISTA 
--

ALTER TABLE SUSCRIPTOR_REVISTA 
    ADD CONSTRAINT SUSCRIPTOR_REVISTA_REVISTA
    FOREIGN KEY (REVISTA_ID)
    REFERENCES REVISTA(REVISTA_ID)
;

ALTER TABLE SUSCRIPTOR_REVISTA 
    ADD CONSTRAINT SUSCRIPTOR_REVISTA_SUSCRIPTOR_FK
    FOREIGN KEY (SUSCRIPTOR_ID)
    REFERENCES SUSCRIPTOR(SUSCRIPTOR_ID)
;


