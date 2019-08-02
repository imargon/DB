---动态建表
create or replace procedure sp_crt_tbl_from_dic(p_src_tbl      varchar2,
                                                p_tgt_tbl_name varchar2,
                                                p_prt_flg      varchar2,
                                                p_tx_date      varchar2) is
  v_col           varchar2(500) := '';
  v_col_data_type varchar2(100) := '';
  v_sql           varchar2(25000) := '';
  v_col_list      varchar2(20000) := ' ';
  v_prt_sql       varchar2(2000) := '';
  v_grant_sql     varchar2(2000) := '';
  v_crt_syn_sql   varchar2(2000) := '';
  v_drop_tbl_sql  varchar2(2000) := '';
  i_tbl_cnt       number(1, 0) := 0;
  v_step_no varchar2(3) := '';
begin
  --step 1
  v_step_no := '1';
  select count(1) into i_tbl_cnt from tabs where table_name = p_src_tbl;
  if (i_tbl_cnt = 0) then
    sp_log('sp_crt_tbl', v_step_no, '3', p_tx_date, p_src_tbl || '不存在');
    return;
  end if;
  --step 2
  v_step_no := '2';
  select count(1)
    into i_tbl_cnt
    from tabs
   where table_name = p_tgt_tbl_name;
  if (i_tbl_cnt > 0) then
    v_drop_tbl_sql := 'drop table ' || p_tgt_tbl_name;
    execute immediate v_drop_tbl_sql;
  end if;
  v_step_no := '1';
  sp_log('sp_crt_tbl_from_dic',v_step_no,'1',p_tx_date,p_tgt_tbl_name || '建表开始');
  v_sql           := 'create table ' || p_tgt_tbl_name || '(';
  v_col           := '';
  v_col_data_type := '';
  v_col_list      := '';
  for cur_col_name in (
    SELECT  T.COLUMN_NAME col_name,
      CASE  WHEN T.DATA_TYPE IN ('VARCHAR2', 'CHAR') THEN T.DATA_TYPE || '(' || T.DATA_LENGTH || ')'
            WHEN T.DATA_TYPE IN ('NUMBER') THEN  T.DATA_TYPE || '(' || T.DATA_PRECISION || ',' || T.DATA_SCALE || ')'                   
            WHEN T.DATA_TYPE IN ('DATE')   THEN  T.DATA_TYPE ELSE '' END col_data_type 
      FROM COLS T                 
     where T.TABLE_NAME = p_src_tbl   
                      
 order by to_number(T.COLUMN_ID)) loop
    v_col           := trim(cur_col_name.col_name);
    v_col_data_type := trim(cur_col_name.col_data_type);
    v_col_list      := trim(v_col_list) || trim(v_col) || ' ' || trim(v_col_data_type) || ',';
  end loop;

v_sql := trim(v_sql) || trim(v_col_list) || ')';
  v_sql := replace(v_sql, ',)', ')');
  if (p_prt_flg = '1') then
    v_prt_sql := ' partition by range (part_id) (partition prt_1 values less than(2),partition prt_2 values less than(3),partition prt_3 values less than(4),partition prt_4 values less than(5))';
    v_sql     := v_sql || v_prt_sql;
  end if;
  
  execute immediate v_sql;
  sp_log('sp_crt_tbl_from_dic',v_step_no,'2',p_tx_date,p_tgt_tbl_name || '建表开始结束');
  v_step_no := '2';
  sp_log('sp_crt_tbl_from_dic', v_step_no,'1',p_tx_date,p_tgt_tbl_name || '赋权限开始');
  v_grant_sql := 'grant select,insert,update,delete on ' || p_tgt_tbl_name ||
                 ' to iclientoopr,iclientomoia';
  if (v_grant_sql is not null) then
    execute immediate v_grant_sql;
  end if;

  --- 给OPERQRY赋权限
  v_grant_sql := 'grant select  on ' || p_tgt_tbl_name || ' to  OPERQRY';
  if (v_grant_sql is not null) then
    execute immediate v_grant_sql;
  end if;
  sp_log('sp_crt_tbl_from_dic',v_step_no,'2',p_tx_date,p_tgt_tbl_name || '赋权限结束');
  --创建日标同义词
  --step 4
  
  v_step_no     := '3';
  v_crt_syn_sql := 'create or replace public synonym  ' || p_tgt_tbl_name ||
                   ' for iclientodata.' || p_tgt_tbl_name;
  if (v_crt_syn_sql is not null) then
    execute immediate v_crt_syn_sql;
  end if;
  sp_log('v_crt_syn_sql',v_step_no,'2',p_tx_date,p_tgt_tbl_name || '创建结束');
exception
  when others then
    sp_log('sp_crt_tbl_from_dic',v_step_no,'3',p_tx_date,p_tgt_tbl_name || '创建异常:' || SQLERRM);
end;