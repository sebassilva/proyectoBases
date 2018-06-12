-- @Autores: López Santibáñez Jiménez, Luis Gerardo
--          Silva García, Carlos Sebastián
-- Fecha de creación: 09/06/2018
-- Descripción: Crea ua tabla externa partiendo de un archivo csv, podrían ser empleados de una base anterior

CREATE DIRECTORY ext_tab_dir AS '/home/oracle/app';
CONNECT system/system;
GRANT READ ON DIRECTORY ext_tab_dir TO LSSG_PROY_ADMIN;
CONNECT LSSG_PROY_ADMIN/LSSG_PROY_ADMIN;

CREATE TABLE ext_tab (
empno  CHAR(4),
ename  CHAR(20),
job    CHAR(20),
deptno CHAR(2))
ORGANIZATION EXTERNAL (
  TYPE oracle_loader
  DEFAULT DIRECTORY ext_tab_dir
    ACCESS PARAMETERS (
    RECORDS DELIMITED BY NEWLINE
    BADFILE 'bad_%a_%p.bad'
    LOGFILE 'log_%a_%p.log'
    FIELDS TERMINATED BY ','
    MISSING FIELD VALUES ARE NULL
    REJECT ROWS WITH ALL NULL FIELDS
    (
      empno, 
      ename, 
      job, 
      deptno))
    LOCATION ('info.dat')
  )
PARALLEL
REJECT LIMIT 0
NOMONITORING;
     --Id, Name, Description, StartDate "24-03-2008"