CREATE DIRECTORY ext_tab_dir AS '/home/oracle/app';
GRANT READ ON DIRECTORY ext_tab_dir TO prueba1;

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