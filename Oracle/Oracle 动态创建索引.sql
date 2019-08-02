create or replace procedure sp_crt_index( p_src_tbl_name varchar2,p_tgt_tbl_name varchar2,p_tx_date varchar2)
is
       v_crt_ind_sql varchar2(4000) := '';
       v_drop_ind_sql varchar2(4000) := '';
       v_ind_name varchar2(100) := '';
       v_tgt_ind_name varchar2(100) := '';
       v_col_list varchar2(1000) := '';
       v_col_name varchar2(100) := '';
       i_ind_col_cnt number(2,0) := 0;
       i_tbl_cnt number(2,0) := 0;
       i_ind_cnt number(2,0) := 0;
       v_step_no varchar2(3) :='';
       v_spe_sql varchar2(1000) := '';
       v_drop_date varchar2(100) := to_char(to_date(p_tx_date,'YYYYMMDD')-2,'YYYYMMDD');
begin
  --step 1 检查索引定义是否存在
  v_step_no :='1';
  select count(1) into i_ind_col_cnt from all_ind_columns
  where table_name = p_src_tbl_name;
  if(i_ind_col_cnt = 0 ) then
     sp_log('sp_crt_index',v_step_no,'3',p_tx_date,p_src_tbl_name||'不存在索引定义');
     return;
  end if;
--特殊处理
  if(p_src_tbl_name = 'M_ICT_CUST_INFO_ALL') THEN
     v_spe_sql := 'ANALYZE TABLE ' || p_tgt_tbl_name || ' estimate system statistics';
     execute immediate v_spe_sql;
     
     v_spe_sql :='create or replace public synonym ICT_CUST_INFO_ALL for iclientodata.'||p_tgt_tbl_name;
     execute immediate v_spe_sql;