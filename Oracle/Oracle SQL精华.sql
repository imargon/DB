一.分区

----查询分区
select * from ALL_TAB_PARTITIONS 
 where table_name = p_tgt_tbl_name and PARTITION_NAME = v_prt_name;

----查询表名  
select * from tabs where table_name = p_tgt_tbl_name;
----查询oracle 中ICT开头的
SELECT * FROM  tabs  WHERE TABLE_NAME LIKE 'ICT%'

----交换分区，分区交换后数据是否交换？
'ALTER TABLE '|| p_tgt_tbl_name ||' EXCHANGE PARTITION '||v_prt_name||' WITH TABLE '||p_src_tbl_name;

----Oracle检查分区
 select count(1)  from ALL_TAB_PARTITIONS
  where table_name = p_tgt_tbl_name
    and PARTITION_NAME = v_prt_name;

----查询分区内数据
select  count(1) from stg_ict_trade_info partition(ICT_PRT_2014005);
Select * From User_Ind_Partitions;
Select * From User_Part_Indexes;
 
-----oracle分区语句
ALTER TABLE ICT_CUST_LEVEL_HIS ADD PARTITION ICT_PRT_20140531 VALUES LESS THAN ('2014-06-01') 
 
二.表空间

----查询某表是否存在
select count(1) from tabs
 where table_name = p_src_tbl_name;

----查看表名与表空间
Select * From user_tables Where table_name = 'ICT_RMT_APPO';
Select * From User_Tablespaces;


---------------DBA查看表空间------------
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
             
三.索引

-----查询索引
select index_name from ALL_INDEXES WHERE TABLE_NAME=p_src_tbl_name;
----重建索引
ALTER index ind_id_idx rebuild
----创建索引nologging
create index I_ICT_CUST_INFO__0 on ICT_CUST_INFO_20141222 (CUST_NO) nologging;



四.优化
五.存储过程与游标
六.DBA

select   userenv('language') from dual;
select * from sys.nls_database_parameters;
select * from sys.nls_session_parameters;
SELECT * FROM V$NLS_PARAMETERS;
select * from sys.dbms_lob;
select * from sys.dbms_output;


----查杀进程
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

----查看执行计划
----查询SQL 预估时间
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


----oracle 表分析语句
 'ANALYZE TABLE ' || v_ana_tbl_name || ' estimate system statistics';       
 
例如：ANALYZE TABLE  ICT_SUM_AST_DBT_CUST    ESTIMATE SYSTEM STATISTICS;    

----查看锁定对象及会话
SELECT OBJECT_NAME,MACHINE,S.SID,S.SERIAL#
  from GV$LOCKED_OBJECT I,DBA_OBJECTS O,GV$SESSION S
 WHERE I.OBJECT_ID=O.OBJECT_ID AND I.SESSION_ID=S.SID;

----oralce解锁
ALTER SYSTEM KILL SESSION '280,219';


七.同义词及授权

-----oralce创建同义词
create or replace public SYNONYM ICT_ORG_BPH  for iclientodata.ICT_ORG_BPH; 

----oracle批量生成同义词
SELECT  'create or replace public synonym '||table_name ||' for iclientodata.'||table_name FROM tabs WHERE  table_name like 'ICT_%'

----oracle 批量创建同义词
select 'create or replace public synonym '||table_name||' for iclientodata.'||table_name||';' from user_tables  WHERE table_name LIKE 'ICT_%'  AND table_name NOT LIKE '%20140531';

-----oracle 赋权限 
grant select, insert, update, delete on ICT_ORG_BPH to ICLIENTOOPR;   --赋权限

----授权脚本生成方法：
select 'grant select on table dmccrm.'||tbl_name||' to public,ex_sdbods; ' from t_ict_tbl_type where tbl_type in('ALL','GP') and ETL_DIR IN( 'GP->ORACLE','无需同步');

八.常用语法

----日期类型转换
to_char(sysdate,'YYYY-MM-DD HH24:MI:SS');

----码表
Select * From  ict_s_dic Where opttype = 'ID_TYPE';
decode(Date_Nextvisit,'','下次跟进时间：['||Date_Nextvisit||']') RMK1,

----拼接字段,删除表
SELECT 'DROP TABLE '||TABLE_NAME||';' FROM TABS   WHERE TABLE_NAME LIKE 'M_ICT%';

-----清空表分区数据
'ALTER TABLE '||p_tgt_tbl_name||' TRUNCATE PARTITION ' || v_prt_name;
-----增加表分区
'ALTER TABLE '||p_tgt_tbl_name||' ADD PARTITION ' || v_prt_name||' VALUES LESS THAN (''' ||v_monthend||''') TABLESPACE ICLIENT_O_DATA01 ';
-----重建索引
'ALTER INDEX '||cur_ind.index_name|| ' REBUILD PARALLEL 128 COMPUTE STATISTICS NOLOGGING';
-----交换分区
'ALTER TABLE '|| p_tgt_tbl_name ||' EXCHANGE PARTITION '||v_prt_name||' WITH TABLE '||p_src_tbl_name||' INCLUDING INDEXES';
 
----oracle批量生成修改表字段的长度
select 'ALTER TABLE '||TABLE_NAME||' MODIFY '||COLUMN_NAME||' NUMBER(30,8);' from cols t
where t.DATA_TYPE = 'NUMBER'
  AND T.DATA_SCALE >0 AND SUBSTR(TABLE_NAME,-8,8)<>'20140531'



--------MERGE使用方法
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

-------------oracle 树形查询，查询机构编号为‘9902’的和其下级子机构
 select org_id,org_name,org_level from (
       SELECT rownum rn, ioi.org_id , ioi.org_name,ioi.org_level 
           FROM ict_org_info ioi
          START WITH ioi.org_id ='9902'
           CONNECT BY  PRIOR ioi.org_id  = ioi.parent_org_id_b
           order by ioi.org_level desc
      ) where rn=1
      
-------------oracle 树形查询，查询机构编号为‘9902’的和上级机构
     
 select org_id,org_name,org_level from (
       SELECT rownum rn, ioi.org_id , ioi.org_name,ioi.org_level 
           FROM ict_org_info ioi
          START WITH ioi.org_id ='9902'
           CONNECT BY   ioi.org_id  = PRIOR ioi.parent_org_id_b
           order by ioi.org_level desc
      ) where rn=1
      
-------------oracle 树形查询，查询机构编号为‘9902’的上级机构
     
 select org_id,org_name,org_level from (
       SELECT rownum rn, ioi.org_id , ioi.org_name,ioi.org_level 
           FROM ict_org_info ioi
          START WITH ioi.org_id ='9902'
           CONNECT BY   ioi.org_id  = PRIOR ioi.parent_org_id_b
           order by ioi.org_level desc
      ) where rn=1    
      

         
------TYPE opty_cur IS REF CURSOR;
整体的意思是“创建一个类型变量cur，它引用游标”，除了cur外，其余全是关键字。
TYPE cur：定义类型变量 ,is ref cursor：相当于数据类型，不过是引用游标的数据类型。
这种变量通常用于存储过程和函数返回结果集时使用，
因为PL/SQL不允许存储过程或函数直接返回结果集，
但可以返回类型变量，于是引用游标的类型变量作为输出参数或返回值就应运而生了。

