SELECT *
  FROM (SELECT   PARSING_USER_ID EXECUTIONS
                  ,SORTS
                  ,COMMAND_TYPE
                  ,DISK_READS
                  ,SQL_TEXT
           FROM  V$SQLAREA
          WHERE PARSING_SCHEMA_NAME = USER
        ORDER BY DISK_READS DESC)
 WHERE ROWNUM <= 10;