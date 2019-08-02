create or replace procedure sp_insert_tgt_prt_tbl( p_src_tbl_name varchar2,
                                                   p_tgt_tbl_name varchar2,
                                                   p_tx_date varchar2)
is
       v_prt_sql varchar2(4000) := '';
       v_prt_name varchar2(200) := 'ICT_PRT_'||substr(p_tx_date,1,6);
       i_tbl_cnt number(4,0) :=0;
       v_step_no varchar2(3):='';
       v_monthend varchar2(10):= to_char(to_date(substr(to_char(add_months(to_date(p_tx_date,'yyyy-mm-dd'),1),'yyyy-mm-dd'),1,8)||'01','YYYY-MM-DD'),'YYYY-MM-DD');
       
/*
      ORACLE 创建分区表，分区格式为 ICT_PRT_20140531
      源表必须为 STG 开头的数据表 例如STG_ICT_CUST_LEVEL_HIS
      目标表为 源表   ICT_CUST_LEVEL_HIS
      日期为必须为当前表没有分区的日期，格式为：yyyymmdd
*/
begin
  --1 检查源表是否存在
  v_step_no :='1';
  select count(1) into i_tbl_cnt from tabs
  where table_name = p_src_tbl_name;
  if(i_tbl_cnt = 0 ) then
     sp_log('sp_insert_tgt_prt_tbl',v_step_no,'3',p_tx_date,p_src_tbl_name||'不存在');
     return;
  end if;
  
  --1.1源表索引重建
  v_step_no :='1.1';
  sp_log('sp_insert_tgt_tbl',v_step_no,'1',p_tx_date,p_tgt_tbl_name||'重建索引开始');
  for cur_ind in (select index_name from ALL_INDEXES WHERE TABLE_NAME=p_src_tbl_name) loop
     v_prt_sql := 'ALTER INDEX '||cur_ind.index_name|| ' REBUILD PARALLEL 128 COMPUTE STATISTICS NOLOGGING';
     execute immediate v_prt_sql;
     v_prt_sql :='ALTER INDEX '||cur_ind.index_name|| ' PARALLEL 1';
     execute immediate v_prt_sql;
  end loop;
  sp_log('sp_insert_tgt_prt_tbl',v_step_no,'2',p_tx_date,p_tgt_tbl_name||'重建索引结束');
  --2 检查目标表是否存在
  v_step_no :='2';
  select count(1) into i_tbl_cnt from tabs
  where table_name = p_tgt_tbl_name;
  if(i_tbl_cnt = 0 ) then
     sp_log('sp_insert_tgt_tbl',v_step_no,'3',p_tx_date,p_tgt_tbl_name||'不存在');
     return;
  end if;
  
  
  v_step_no :='3';
  sp_log('sp_insert_tgt_tbl',v_step_no,'1',p_tx_date,p_tgt_tbl_name||'新增分区数据开始');
  v_step_no :='3.1';
  
  --3.1 检查分区是否存在
  select count(1) into i_tbl_cnt
   from ALL_TAB_PARTITIONS
  where table_name = p_tgt_tbl_name
    and PARTITION_NAME = v_prt_name;
    
 
    
  ---如果分区存在则清空该分区数据，否则新建分区
  if(i_tbl_cnt >0 ) then
     v_prt_sql :='ALTER TABLE '||p_tgt_tbl_name||' TRUNCATE PARTITION ' || v_prt_name;
     execute immediate v_prt_sql;
  else
       
     v_prt_sql :='ALTER TABLE '||p_tgt_tbl_name||' ADD PARTITION ' || v_prt_name||' VALUES LESS THAN (''' ||v_monthend||''') TABLESPACE ICLIENT_O_DATA01 ';
     
     DBMS_OUTPUT.PUT_LINE('v_prt_sql='||v_prt_sql);
     execute immediate v_prt_sql;
     DBMS_OUTPUT.PUT_LINE('v_prt_name='||v_prt_name);
  end if;
  --3.3 交换分区 目标表与原表进行分区交换
  v_step_no :='3.3';
  v_prt_sql:='ALTER TABLE '|| p_tgt_tbl_name ||' EXCHANGE PARTITION '||v_prt_name||' WITH TABLE '||p_src_tbl_name||' INCLUDING INDEXES';
  execute immediate v_prt_sql;
  
  sp_log('sp_insert_tgt_tbl',v_step_no,'2',p_tx_date,p_tgt_tbl_name||'新增分区数据结束');
  exception
    when others then
    sp_log('sp_insert_tgt_prt_tbl',v_step_no,'3',p_tx_date,p_tgt_tbl_name||'增加新数据失败'||SQLERRM);
  end;
  