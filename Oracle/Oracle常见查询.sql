-----��ѯ����
select index_name from ALL_INDEXES WHERE TABLE_NAME=p_src_tbl_name;
----- ��ѯ��
select * from all_ind_columns where table_name = p_src_tbl_name;
-----��ѯ����
select * from ALL_TAB_PARTITIONS where table_name = p_tgt_tbl_name and PARTITION_NAME = v_prt_name;
-----��ѯ����  
select * from tabs where table_name = p_tgt_tbl_name;
-----��ձ��������
'ALTER TABLE '||p_tgt_tbl_name||' TRUNCATE PARTITION ' || v_prt_name;
-----���ӱ����
'ALTER TABLE '||p_tgt_tbl_name||' ADD PARTITION ' || v_prt_name||' VALUES LESS THAN (''' ||v_monthend||''') TABLESPACE ICLIENT_O_DATA01 ';
-----�ؽ�����
'ALTER INDEX '||cur_ind.index_name|| ' REBUILD PARALLEL 128 COMPUTE STATISTICS NOLOGGING';
-----��������
'ALTER TABLE '|| p_tgt_tbl_name ||' EXCHANGE PARTITION '||v_prt_name||' WITH TABLE '||p_src_tbl_name||' INCLUDING INDEXES';
-------����ͨ���������һ����ȫ�����������ֶ����ͳ��ȣ�����--------
select 'ALTER TABLE '||TABLE_NAME||' MODIFY '||COLUMN_NAME||' VARCHAR2(100);' from cols t
where t.COLUMN_NAME = 'MAR_STATUS' ;

select 'ALTER TABLE '||TABLE_NAME||' MODIFY '||COLUMN_NAME||' NUMBER(30,8);' from cols t
where t.DATA_TYPE = 'NUMBER'
AND T.DATA_SCALE > 0;