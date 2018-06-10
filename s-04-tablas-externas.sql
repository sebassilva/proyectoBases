CREATE DIRECTORY ext_tab_dir AS '/home/oracle/app';
GRANT READ ON DIRECTORY ext_tab_dir TO prueba1;


CREATE TABLE emp_load
      (employee_number      CHAR(5),
       employee_dob         CHAR(20),
       employee_last_name   CHAR(20),
       employee_first_name  CHAR(15),
       employee_middle_name CHAR(15),
       employee_hire_date   DATE)
    ORGANIZATION EXTERNAL
      (TYPE ORACLE_LOADER
      DEFAULT DIRECTORY ext_tab_dir
      ACCESS PARAMETERS
        (RECORDS DELIMITED BY NEWLINE
         FIELDS (employee_number      CHAR(2),
                 employee_dob         CHAR(20),
                 employee_last_name   CHAR(18),
                 employee_first_name  CHAR(11),
                 employee_middle_name CHAR(11),
                 employee_hire_date   CHAR(10) date_format DATE mask "mm/dd/yyyy"
                )
        )
      LOCATION ('info.dat')
     );
     --Id, Name, Description, StartDate "24-03-2008"