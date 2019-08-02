select * from ods.abpf10 t where t.ab10name='彭朕';
select t1.rowid,t1.* from ods.capf10 t1 where t1.ca10name = '彭朕';

select userenv('language') from dual;
select * from sys.nls_database_parameters;
select * from sys.nls_session_parameters;

SELECT * FROM V$NLS_PARAMETERS;

select * from ods.plns_t_fact_loan;
select * from ods.ulns_customer_info t2 where t2.customername = '彭朕';


select * from sys.dbms_lob;
select * from sys.dbms_output;
