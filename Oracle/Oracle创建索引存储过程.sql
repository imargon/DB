create or replace procedure sp_crt_stg_index( p_src_tbl_name varchar2,p_tgt_tbl_name varchar2,p_tx_date varchar2)
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
begin
  --step 1 检查索引定义是否存在
  v_step_no :='1';
  select count(1) into i_ind_col_cnt from all_ind_columns
  where table_name = p_src_tbl_name;
  if(i_ind_col_cnt = 0 ) then
     sp_log('sp_crt_stg_index',v_step_no,'3',p_tx_date,p_src_tbl_name||'不存在索引定义');
     return;
  end if;
  --step 2 检查目标表是否存在
  v_step_no :='2';
  select count(1) into i_tbl_cnt from tabs
  where table_name = p_tgt_tbl_name;
  if(i_tbl_cnt = 0 ) then
    sp_log('sp_crt_stg_index',v_step_no,'3',p_tx_date,p_src_tbl_name||'不存在');
    return;
  end if;
  --step 3 创建索引
  v_step_no :='3';
  for cur_ind in (select index_name from all_indexes where table_name = p_src_tbl_name) loop
    v_ind_name := cur_ind.index_name;
    v_col_name := '';
    v_col_list := '(';
    for cur_ind_col in (select column_name from all_ind_columns  where index_name = v_ind_name order by column_position) loop
       v_col_name :=  cur_ind_col.column_name;
       v_col_list := v_col_list||v_col_name||',';
    end loop;
    v_col_list := v_col_list||')';
    v_col_list := replace(v_col_list,',)',')');
    v_tgt_ind_name :=replace(v_ind_name,p_src_tbl_name,p_tgt_tbl_name);
    v_tgt_ind_name := v_tgt_ind_name||substr(p_tx_date,7,21);
    select count(1) into i_ind_cnt from all_indexes where index_name  = v_tgt_ind_name;
    if(i_ind_cnt > 0) then
      v_drop_ind_sql := 'drop index '||v_tgt_ind_name;
      execute immediate v_drop_ind_sql;
    end if;
    sp_log('sp_crt_stg_index',v_step_no,'1',p_tx_date,v_tgt_ind_name||'创建开始');
    v_crt_ind_sql := 'create index '||v_tgt_ind_name||' on '||p_tgt_tbl_name||v_col_list||' nologging';
    if(v_crt_ind_sql is not null) then
      execute immediate v_crt_ind_sql;
    end if;
    sp_log('sp_crt_stg_index',v_step_no,'1',p_tx_date,v_tgt_ind_name||'创建结束');
  end loop;
  exception
    when others then
    sp_log('sp_crt_stg_index',v_step_no,'3',p_tx_date,v_tgt_ind_name||'创建异常:'||SQLERRM);
end;