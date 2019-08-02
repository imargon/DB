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
      ORACLE ����������������ʽΪ ICT_PRT_20140531
      Դ�����Ϊ STG ��ͷ�����ݱ� ����STG_ICT_CUST_LEVEL_HIS
      Ŀ���Ϊ Դ��   ICT_CUST_LEVEL_HIS
      ����Ϊ����Ϊ��ǰ��û�з��������ڣ���ʽΪ��yyyymmdd
*/
begin
  --1 ���Դ���Ƿ����
  v_step_no :='1';
  select count(1) into i_tbl_cnt from tabs
  where table_name = p_src_tbl_name;
  if(i_tbl_cnt = 0 ) then
     sp_log('sp_insert_tgt_prt_tbl',v_step_no,'3',p_tx_date,p_src_tbl_name||'������');
     return;
  end if;
  
  --1.1Դ�������ؽ�
  v_step_no :='1.1';
  sp_log('sp_insert_tgt_tbl',v_step_no,'1',p_tx_date,p_tgt_tbl_name||'�ؽ�������ʼ');
  for cur_ind in (select index_name from ALL_INDEXES WHERE TABLE_NAME=p_src_tbl_name) loop
     v_prt_sql := 'ALTER INDEX '||cur_ind.index_name|| ' REBUILD PARALLEL 128 COMPUTE STATISTICS NOLOGGING';
     execute immediate v_prt_sql;
     v_prt_sql :='ALTER INDEX '||cur_ind.index_name|| ' PARALLEL 1';
     execute immediate v_prt_sql;
  end loop;
  sp_log('sp_insert_tgt_prt_tbl',v_step_no,'2',p_tx_date,p_tgt_tbl_name||'�ؽ���������');
  --2 ���Ŀ����Ƿ����
  v_step_no :='2';
  select count(1) into i_tbl_cnt from tabs
  where table_name = p_tgt_tbl_name;
  if(i_tbl_cnt = 0 ) then
     sp_log('sp_insert_tgt_tbl',v_step_no,'3',p_tx_date,p_tgt_tbl_name||'������');
     return;
  end if;
  
  
  v_step_no :='3';
  sp_log('sp_insert_tgt_tbl',v_step_no,'1',p_tx_date,p_tgt_tbl_name||'�����������ݿ�ʼ');
  v_step_no :='3.1';
  
  --3.1 �������Ƿ����
  select count(1) into i_tbl_cnt
   from ALL_TAB_PARTITIONS
  where table_name = p_tgt_tbl_name
    and PARTITION_NAME = v_prt_name;
    
 
    
  ---���������������ո÷������ݣ������½�����
  if(i_tbl_cnt >0 ) then
     v_prt_sql :='ALTER TABLE '||p_tgt_tbl_name||' TRUNCATE PARTITION ' || v_prt_name;
     execute immediate v_prt_sql;
  else
       
     v_prt_sql :='ALTER TABLE '||p_tgt_tbl_name||' ADD PARTITION ' || v_prt_name||' VALUES LESS THAN (''' ||v_monthend||''') TABLESPACE ICLIENT_O_DATA01 ';
     
     DBMS_OUTPUT.PUT_LINE('v_prt_sql='||v_prt_sql);
     execute immediate v_prt_sql;
     DBMS_OUTPUT.PUT_LINE('v_prt_name='||v_prt_name);
  end if;
  --3.3 �������� Ŀ�����ԭ����з�������
  v_step_no :='3.3';
  v_prt_sql:='ALTER TABLE '|| p_tgt_tbl_name ||' EXCHANGE PARTITION '||v_prt_name||' WITH TABLE '||p_src_tbl_name||' INCLUDING INDEXES';
  execute immediate v_prt_sql;
  
  sp_log('sp_insert_tgt_tbl',v_step_no,'2',p_tx_date,p_tgt_tbl_name||'�����������ݽ���');
  exception
    when others then
    sp_log('sp_insert_tgt_prt_tbl',v_step_no,'3',p_tx_date,p_tgt_tbl_name||'����������ʧ��'||SQLERRM);
  end;
  