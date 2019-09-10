--- 动态sql 执行日志
create or replace procedure sp_log (p_tbl_name  varchar2,
                                   p_step_no varchar2,
                                   p_proc_no varchar2,
                                   sysdate date,
                                   p_err_log varchar2) is
begin
DBMS_OUTPUT.PUT_LINE('check param...');
insert into proc_log (tbl_name,step_no,proc_no,tx_date,err_log) values (p_tbl_name,p_step_no,p_proc_no,sysdate,p_err_log) ;
commit;

exception
  when others then  
    DBMS_OUTPUT.PUT_LINE('错误号:'||SQLCODE);
    DBMS_OUTPUT.PUT_LINE('错误原因:'||SQLERRM);
end sp_log;

