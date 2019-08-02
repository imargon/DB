----  ��������ת��
to_char(sysdate,'YYYY-MM-DD HH24:MI:SS');
----Oracle������
 select count(1) 
   from ALL_TAB_PARTITIONS
  where table_name = p_tgt_tbl_name
    and PARTITION_NAME = v_prt_name;
----���
 Select * From  ict_s_dic Where opttype = 'ID_TYPE';
decode �ڲ��ֶ�ƴ��
decode(Date_Nextvisit,'','�´θ���ʱ�䣺['||Date_Nextvisit||']') RMK1,

----ƴ���ֶ�,ɾ����
SELECT 'DROP TABLE '||TABLE_NAME||';' FROM TABS   WHERE TABLE_NAME LIKE 'M_ICT%';
Select * From tabs ;
----�������������������������Ƿ񽻻���
'ALTER TABLE '|| p_tgt_tbl_name ||' EXCHANGE PARTITION '||v_prt_name||' WITH TABLE '||p_src_tbl_name;
----��ѯĳ���Ƿ����
select count(1) from tabs
 where table_name = p_src_tbl_name;
----�ؽ�����
ALTER index ind_id_idx rebuild
----��������nologging
create index I_ICT_CUST_INFO__0 on ICT_CUST_INFO_20141222 (CUST_NO)
 nologging;
----��ѯ����������
select  count(1) from stg_ict_trade_info partition(ICT_PRT_2014005);
Select * From User_Ind_Partitions;
Select * From User_Part_Indexes;

-----��ѯ����
select index_name from ALL_INDEXES WHERE TABLE_NAME=p_src_tbl_name;
-----��ѯ����
select * from ALL_TAB_PARTITIONS 
  where table_name = p_tgt_tbl_name and PARTITION_NAME = v_prt_name;
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
 
-----oralce����ͬ���------------
 
create or replace public SYNONYM ICT_ORG_BPH  for iclientodata.ICT_ORG_BPH; 
 
-----oracle ��Ȩ�� 
grant select, insert, update, delete on ICT_ORG_BPH to ICLIENTOOPR;   --��Ȩ��
 
---------------DBA�鿴��ռ�------------
select a.tablespace_name,
       a.bytes / 1024 / 1024 / 1024 "Sum G",
      (a.bytes - b.bytes) / 1024 / 1024 / 1024 "used G",
       b.bytes / 1024 / 1024 / 1024 "free G",
       round(((a.bytes - b.bytes) / a.bytes) * 100, 2) "percent_used"
  from (select tablespace_name, sum(bytes) bytes
          from dba_data_files
         group by tablespace_name) a,
       (select tablespace_name, sum(bytes) bytes, max(bytes) largest
          from dba_free_space
         group by tablespace_name) b
where a.tablespace_name = b.tablespace_name
order by ((a.bytes - b.bytes) / a.bytes) desc

-------------------------------------------------
--oracle ����ɾ����䣬
SELECT 'DROP TABLE '||TABLE_NAME||';' FROM TABS   WHERE TABLE_NAME LIKE 'M_ICT%'
--��ѯoracle ��ICT��ͷ��
SELECT * FROM  tabs  WHERE TABLE_NAME LIKE 'ICT%'

----oracle ��������
 'ANALYZE TABLE ' || v_ana_tbl_name || ' estimate system statistics';       
 
���磺ANALYZE TABLE  ICT_SUM_AST_DBT_CUST    ESTIMATE SYSTEM STATISTICS;    
-----------�鿴�������󼰻Ự
SELECT OBJECT_NAME,MACHINE,S.SID,S.SERIAL#
FROM GV$LOCKED_OBJECT I,DBA_OBJECTS O,GV$SESSION S
WHERE I.OBJECT_ID=O.OBJECT_ID AND I.SESSION_ID=S.SID;
----------oralce����
ALTER SYSTEM KILL SESSION '280,219';
 
��Ȩ�ű����ɷ�����
select 'grant select on table dmccrm.'||tbl_name||' to public,ex_sdbods; ' from t_ict_tbl_type where tbl_type in('ALL','GP') and ETL_DIR IN( 'GP->ORACLE','����ͬ��');

-----------oracle��������ͬ���
SELECT  'create or replace public synonym '||table_name ||' for iclientodata.'||table_name FROM tabs WHERE  table_name like 'ICT_%'
 
-----------oracle���������޸ı��ֶεĳ���
select 'ALTER TABLE '||TABLE_NAME||' MODIFY '||COLUMN_NAME||' NUMBER(30,8);' from cols t
where t.DATA_TYPE = 'NUMBER'
  AND T.DATA_SCALE >0 AND SUBSTR(TABLE_NAME,-8,8)<>'20140531'

---------oracle ��������ͬ���
select 'create or replace public synonym '||table_name||' for iclientodata.'||table_name||';' from user_tables  WHERE table_name LIKE 'ICT_%'  AND table_name NOT LIKE '%20140531';

-----------oracle�����������
ALTER TABLE ICT_CUST_LEVEL_HIS ADD PARTITION ICT_PRT_20140531 VALUES LESS THAN ('2014-06-01')
--------MERGEʹ�÷���
MERGE INTO ICT_CUST_INFO_ALL a
USING 
(
SELECT t.CUST_MNG_UM_NO ,t.CUST_NO
  FROM ict_cust_mnger_rel t
 WHERE t.CUST_NO IN
       ('600021562650', '600037441214', '600036874754', '600038507516',
        '600020226746', '600038089420', '600041030403', '600038952992', 
        '600039468303')
)b
ON( a.cust_no= b.cust_no)
WHEN MATCHED  THEN 
UPDATE  SET a.MAX_ASSET_INTRO_NO=b.CUST_MNG_UM_NO;

-------------oracle ���β�ѯ����ѯ�������Ϊ��9902���ĺ����¼��ӻ���
 select org_id,org_name,org_level from (
       SELECT rownum rn, ioi.org_id , ioi.org_name,ioi.org_level 
           FROM ict_org_info ioi
          START WITH ioi.org_id ='9902'
           CONNECT BY  PRIOR ioi.org_id  = ioi.parent_org_id_b
           order by ioi.org_level desc
      ) where rn=1
      
-------------oracle ���β�ѯ����ѯ�������Ϊ��9902���ĺ��ϼ�����
     
 select org_id,org_name,org_level from (
       SELECT rownum rn, ioi.org_id , ioi.org_name,ioi.org_level 
           FROM ict_org_info ioi
          START WITH ioi.org_id ='9902'
           CONNECT BY   ioi.org_id  = PRIOR ioi.parent_org_id_b
           order by ioi.org_level desc
      ) where rn=1
      
-------------oracle ���β�ѯ����ѯ�������Ϊ��9902�����ϼ�����
     
 select org_id,org_name,org_level from (
       SELECT rownum rn, ioi.org_id , ioi.org_name,ioi.org_level 
           FROM ict_org_info ioi
          START WITH ioi.org_id ='9902'
           CONNECT BY   ioi.org_id  = PRIOR ioi.parent_org_id_b
           order by ioi.org_level desc
      ) where rn=1    
      
----------�鿴�������ռ�
Select * From user_tables Where table_name = 'ICT_RMT_APPO';
Select * From User_Tablespaces;
               
----------��ѯSQL Ԥ��ʱ��
SELECT SE.SID,
       OPNAME,      
       TRUNC(SOFAR / TOTALWORK * 100, 2) || '%' AS PCT_WORK,       
       ELAPSED_SECONDS ELAPSED,
       ROUND(ELAPSED_SECONDS * (TOTALWORK - SOFAR) / SOFAR) REMAIN_TIME,
       SQL_TEXT
  FROM V$SESSION_LONGOPS SL, V$SQLAREA SA, V$SESSION SE
WHERE SL.SQL_HASH_VALUE = SA.HASH_VALUE
   AND SL.SID = SE.SID
   AND SOFAR != TOTALWORK
ORDER BY START_TIME;              
------TYPE opty_cur IS REF CURSOR;
�������˼�ǡ�����һ�����ͱ���cur���������αꡱ������cur�⣬����ȫ�ǹؼ��֡�
TYPE cur���������ͱ��� ,is ref cursor���൱���������ͣ������������α���������͡�
���ֱ���ͨ�����ڴ洢���̺ͺ������ؽ����ʱʹ�ã�
��ΪPL/SQL������洢���̻���ֱ�ӷ��ؽ������
�����Է������ͱ��������������α�����ͱ�����Ϊ��������򷵻�ֵ��Ӧ�˶����ˡ�
----��ɱ����
SELECT dob.OBJECT_NAME Table_Name,
       lo.LOCKED_MODE,
       lo.SESSION_ID,
       vss.SERIAL#,
       vps.spid,
       vss.action Action,
       vss.osuser OSUSER,
       vss.process AP_PID,
       VPS.SPID DB_PID,
       'alter system kill session   ' || '''' || lo.SESSION_ID || ',' ||
       vss.SERIAL# || ''';' kill_command
  from v$locked_object lo, dba_objects dob, v$session vss, V$PROCESS VPS
 where lo.OBJECT_ID = dob.OBJECT_ID
   and lo.SESSION_ID = vss.SID
   AND VSS.paddr = VPS.addr
 order by 2, 3, DOB.object_name;