--
-- // sqlldr db_user/db_pwd@db_tnsname data=data.csv control=load_data.ctl log=load_data.log bad=load_data_badfile.csv
--

OPTIONS (
  SKIP=1,
  ROWS=1000,
  PARALLEL=true,
  DIRECT=true,
  SKIP_INDEX_MAINTENANCE=true
)
LOAD DATA
APPEND
INTO external TABLE external_data 
        FIELDS TERMINATED BY ","
	OPTIONALLY ENCLOSED BY '"' 
        TRAILING NULLCOLS
  (
    ID          ,
    NAME        ,
    DESCRIPTION CHAR(4000) "substr(:DESCRIPTION, 0, 50)",
    STARTDATE   DATE       "dd-mon-yy" "DECODE(:STARTDATE,'#','31-12-99')"
  )

  