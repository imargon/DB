---select * from rep.D_DK_GS_FHZXX where  to_char(rq,'yyyymmdd')='20160329';
--- oracle 查看锁表语句

select object_name, machine, s.sid, s.serial#
  from v$locked_object I, dba_objects o, v$session s
 where I.locked_id = o.object_id
   and i.session_id = s.sid;
   

select p.spid,
       a.serial#,
       c.object_name,
       b.session_id,
       b.oracle_username,
       b.os_user_name
  from v$process p, v$session a,v$locked_object b, all_objects c
 where p.addr = a.paddr
   and a.process = b.process
   and c.object_id = b.object_id;


SELECT * from gv$locked_object
select * from  v$locked_object

alter system kill session '25,7357';

---导入储蓄分户账
---D_DS_FHZXX    
---ab10stat  0：正常1：销户2：长期不动户3：转收益不动户
select 
       ad10acno   zh,
       ab10ctid   khbh,
       ab10subj   kmh,
       ab10savcod jxbm,--储种号,计息代码
       ab10amt2   ye,
       ab10amtlim xzje,
       ab10amtctl kzje,
       ab10amtodc tzkzje,
       ab10itrt   zclv,--正常利率
       ab10itrm   tblv,--特别利率
       ab10datopn khr,
       ab10dateit qxr,
       ab10datmtr dqr
  from ods.abpf10, ods.adpf10
 where ab10acid = ad10id  
   and ((ab10stat = 1 and ab10amt2 > 0) or ab10stat = '0')
   and ab10dpnok like '12%';

---kettle.sql
---导入储蓄分户账
----abpf10： 储蓄分户
----adpf10:系统帐首文件

select * from  ods.aapf10 ;
select * from  ods.abpf10 t1 where t1.ab10name = '彭朕';


select t1.ab10dpnoa,
       t1.ab10dpnok,
       t1.ab10acid, --账号标注
       t1.ab10ctid, -- 客户标识
       t1.ab10prdcod,
       t1.ab10subj,
       t1.ab10name,
       t1.ab10savtyp,
       t1.ab10stat --0 0：正常1：销户2：长期不动户3：转收益不动户 
  from ods.abpf10 t1
 where t1.ab10name = '胡剑星'; 
 ---ab10ctid :客户标识

--- 襄城支行 账户    120200124300001001
---                  420321198809286318
---                  104290011975041805140

select  * from ods.aapf10 t;
select * from ods.acpf30;

select * from ods.capf10 t2 where t2.ca10cname='彭朕'; 
---ca10cid :客户标识号

select * from ods.capf10 t2 where t2.ca10cnotmp='120200124300001001';
 select * from ods.abpf20 t where t.ab20acno='120200124300001001';
                                              120000125100075275

select 
---?          rq,
       ad10acno   zh,
       ab10ctid   khbh,
       ab10subj   kmh,
       ab10savcod jxbm,
       ab10amt2   ye,
       ab10amtlim xzje,
       ab10amtctl kzje,
       ab10amtodc tzkzje,
       ab10itrt   zclv,
       ab10itrm   tblv,
       ab10datopn khr,
       ab10dateit qxr,
       ab10datmtr dqr
  from abpf10, adpf10
 where ab10acid = ad10id
   and ((ab10stat = 1 and ab10amt2 > 0) or ab10stat = '0')
   and ab10dpnok like '12%'
   and ab10ctid= '2856863';

---导入对公分户账 d_dg_fhzxx
---aapf10 :对公分户
  select 
         ad10acno   zh,
         aa10ctid   khbh,
         aa10subj   kmh,
         aa10baly   ye,
         aa10amtd   jfse, --累计借方发生额
         aa10amtc   dfse, --累计贷方发生额
         aa10limtx  xded, ---协定额度
         aa10limtd  xzje, ---限制金额
         aa10limtt  tdqxe,---通兑取现日限额
         aa10datec  khr,  ---起始日期
         aa10datee  dqr,
         aa10subcod jxbm,
         aa10itrz   zclv,
         aa10itrm   yxlv,
         aa10itrf   tzlv  ---透支利率
    from aapf10, adpf10
   where aa10acid = ad10id ;

---导入公司贷款分户 D_DK_GR_FHZXX
  
select '20160215',
       a.SERIALNO zh,
       a.CUSTOMERID khbh,
       a.BUSINESSTYPE kmh,
       (a.NORMALBALANCE + a.OVERDUEBALANCE) ye,
       to_date(a.PUTOUTDATE, 'yyyymmdd') khr,
       to_date(a.MATURITYDATE, 'yyyymmdd') dqr,
       a.LOANSTATUS dkzt,
       a.BASERATETYPE jzlv,
       a.LOANRATEMODE lvmode,
       a.LOANRATEFLOATTYPE floatmode,
       a.LOANRATEFLOAT fdfd,
       a.LOANRATE dklv,
       a.FINERATETYPE,
       a.FINERATEMODE,
       a.FINERATEFLOATTYPE,
       a.FINERATEFLOAT,
       a.FINERATE,
       a.CLASSIFYRESULT
  from ods.ulns_acct_loan a
 where a.ORGID like '2004%'
   and a.LOANSTATUS in ('0', '1')
  
 ---导入个人贷款分户 D_DK_GR_FHZXX

select *  from ULNS_BUSINESS_CONTRACT;--TRUSTACCNAME
select 
       a.SERIALNO zh,
       a.CUSTOMERID khbh,
       a.BUSINESSTYPE kmh,
       (a.NORMALBALANCE + a.OVERDUEBALANCE) ye,
       to_date(a.PUTOUTDATE, 'yyyymmdd') khr,
       to_date(a.MATURITYDATE, 'yyyymmdd') dqr,
       a.LOANSTATUS dkzt,
       a.BASERATETYPE jzlv,
       a.LOANRATEMODE lvmode,
       a.LOANRATEFLOATTYPE floatmode,
       a.LOANRATEFLOAT fdfd,
       a.LOANRATE dklv,
       a.FINERATETYPE,
       a.FINERATEMODE,
       a.FINERATEFLOATTYPE,
       a.FINERATEFLOAT,
       a.FINERATE,
       a.CLASSIFYRESULT
  from ods.plns_acct_loan a
 where a.ORGID like '2004%'
   and a.LOANSTATUS in ('0', '1');

 ---对私存款导入
 ---ab10oprm 揽存人
 ---ab10dpnok 开户机构
 ---ab10stat = 1  销户
 ---ab10dpnoa 核算机构
 
select ad10acno zh,
       nvl(ab10oprm, decode(ab10dpnok, '12000', '999999', ab10dpnok)) zgbh,
       to_date('20991231', 'yyyymmdd') jsrq
  from abpf10, adpf10
 where ab10acid = ad10id
   and ((ab10stat = 1 and ab10amt2 > 0) or ab10stat = '0')
   and ab10dpnoa like '12%'
   and ab10datopn = ?; --开户日期
 
---对公存款导入
---aa10cmng  户管员

select ad10acno zh,
       nvl(decode(substr(aa10cmng, 1, 1),'x',substr(aa10cmng, 2, 5),substr(aa10cmng, 3, 4)),decode(aa10dpnok, '12000', '999999', aa10dpnok)) zgbh,
       ? ksrq,
       to_date('20991231', 'yyyymmdd') jsrq
  from aapf10, adpf10
 where aa10acid = ad10id
   and substr(aa10actyp, 1, 1) in ('2', '5') ---帐类：0表外 1内部帐 2存款帐 5贷款帐
   and aa10stat != '1'                       ---状态:0正常 1销户 2长期不动户3不动转收益
   and aa10datec = ?
   and aa10dpnoa like '12%';

---- 对公贷款 对私贷款插入到d_user_account_change

update d_user_account_change
   set zgbh = '999999'
 where zgbh not in (select zgbh
                      from d_user_change
                     where ksrq <= sysdate
                       and jsrq >= sysdate)
   and ksrq <= sysdate
   and jsrq >= sysdate;
   
----公司贷款录入
----公司贷款信息表，公司联系信息表

select b.SERIALNO zh,
       substr(MANAGEUSERID, 3, 4) zgbh,
       to_date(b.PUTOUTDATE, 'yyyymmdd') ksrq,
       to_date('20991231', 'yyyymmdd') jsrq,
       null,
       null,
       null
  from ODS.ULNS_BUSINESS_CONTRACT a, ODS.ULNS_ACCT_LOAN b
 where ORGID like '2004%'
   and LOANSTATUS in ('0', '1')
   and CONTRACTSERIALNO = a.SERIALNO
   and to_date(b.PUTOUTDATE, 'yyyymmdd') = '20160212';

--- 个人贷款录入

select b.SERIALNO zh,
       substr(MANAGEUSERID, 3, 4) zgbh,
       to_date(b.PUTOUTDATE, 'yyyymmdd') ksrq,
       to_date('20991231', 'yyyymmdd') jsrq,
       null,
       null,
       null
  from ODS.PLNS_BUSINESS_CONTRACT a, ODS.PLNS_ACCT_LOAN b
 where ORGID like '2004%'
   and LOANSTATUS in ('0', '1')
   and CONTRACTSERIALNO = a.SERIALNO
   and to_date(b.PUTOUTDATE, 'yyyymmdd') = ?;
   
----存款按科目统计
insert into d_accman_sub_sum
  (rq, zgbh, tjdm, kmye, ncye, kmhs, nchs)
  select ga20date, '999999', ga20subj, ga20balc, null, 1, 1
    from ods.gapf20 ---总帐明细日计表
   where ga20subj = '24301'
     and ga20dpno = '12999'
     and ga20date = to_date('20160212', 'yyyymmdd')

----求对私存款
select '20160212',
       b.zgbh,
       c.sjdm sjdm,
       nvl(sum(a.ye), 0) kmye,
       nvl(count(a.zh), 0) kmhs ---账号
  from d_ds_fhzxx a, D_USER_ACCOUNT_CHANGE b, D_SUM_CODE c
 where a.rq = trunc('20160212')
   and a.rq > = b.ksrq
   and a.rq < = b.jsrq
   and c.tjlx in ('2', '3')
   and c.tjjb = '0'
   and a.zh = b.zh
   and c.sjdm in ('dsbzj', 'ndsck', 'grdq', 'grhq')
   and c.tjdm = to_number(a.kmh)
 group by a.rq, b.zgbh, c.sjdm
 order by b.zgbh, c.sjdm ;

----求对公存款
--- select * from ods.pbpf10; 科目字典表
select  
       b.zgbh,
       c.sjdm sjdm,---科目代码
       nvl(sum(a.ye) * (-1), 0) kmye,
       nvl(count(a.zh), 0) kmhs
  from d_dg_fhzxx a, D_USER_ACCOUNT_CHANGE b, D_SUM_CODE c
 where a.rq > = b.ksrq
   and a.rq < = b.jsrq
   and c.tjlx = '2'
   and c.tjjb = '0'
   and a.zh = b.zh
   and c.sjdm in ('dgbzj', 'ndgck')
   and c.tjdm = to_number(a.kmh)
  --- and a.rq = trunc(20160212)    
 group by a.rq, b.zgbh, c.sjdm
having nvl(sum(a.ye) * (-1), 0) > 0
 order by b.zgbh, sjdm;

---应计贷款按账号统计
---取每日贷款余额

select rq,
       a.zgbh,
       'gsdk' tjdm,
       sum(ye) kmye,
       null ncye,
       count(a.zh) kmhs,
       null nchs
  from d_user_account_change a, d_dk_gs_fhzxx b, d_user_change c
 where b.rq = ?
   and a.jsrq >= b.rq
   and a.ksrq <= b.rq
   and c.ksrq <= b.rq
   and c.jsrq >= b.rq
   and a.zgbh = c.zgbh
   and a.zh = b.zh
   and dkzt = '0'
 group by rq, a.zgbh
union all
select rq,
       a.zgbh,
       'grdk' tjdm,
       sum(ye) kmye,
       null ncye,
       count(a.zh) kmhs,
       null nchs
  from d_user_account_change a, d_dk_gr_fhzxx b, d_user_change c
 where b.rq = ?
   and a.jsrq >= b.rq
   and a.ksrq <= b.rq
   and c.ksrq <= b.rq
   and c.jsrq >= b.rq
   and a.zgbh = c.zgbh
   and a.zh = b.zh
   and dkzt = '0'
 group by rq, a.zgbh;

---非应计贷款按账号统计
---取每日贷款余额
select rq,
       a.zgbh,
       'gsdk' tjdm,
       sum(ye) kmye,
       null ncye,
       count(a.zh) kmhs,
       null nchs
  from d_user_account_change a, d_dk_gs_fhzxx b, d_user_change c
 where b.rq = ?
   and a.jsrq >= b.rq
   and a.ksrq <= b.rq
   and c.ksrq <= b.rq
   and c.jsrq >= b.rq
   and a.zgbh = c.zgbh
   and a.zh = b.zh
   and dkzt = '0'
 group by rq, a.zgbh
union all
select rq,
       a.zgbh,
       'grdk' tjdm,
       sum(ye) kmye,
       null ncye,
       count(a.zh) kmhs,
       null nchs
  from d_user_account_change a, d_dk_gr_fhzxx b, d_user_change c
 where b.rq = ?
   and a.jsrq >= b.rq
   and a.ksrq <= b.rq
   and c.ksrq <= b.rq
   and c.jsrq >= b.rq
   and a.zgbh = c.zgbh
   and a.zh = b.zh
   and dkzt = '0'
 group by rq,a.zgbh

----插入总的绩效贷款数据
select a.rq,
       a.zgbh,
       b.sjdm tjdm,
       sum(a.kmye) kmye,
       sum(a.kmhs) kmhs,
       sum(a.ncye) ncye,
       sum(a.nchs) nchs
  from D_ACCMAN_SUB_SUM a, D_SUM_CODE b
 where a.tjdm = b.tjdm
   and b.tjlx = '2'
   and b.tjjb = '1'
   and a.rq = trunc(?)
 group by a.rq, a.zgbh, b.sjdm;
 
-----部门按统计代码统计
select rq,
       BMDM,
       a.tjdm,
       sum(kmye) kmye,
       sum(kmhs) kmhs,
       sum(ncye) ncye,
       sum(nchs) nchs
  from D_ACCMAN_SUB_SUM a, D_USER_CHANGE b, D_SUM_CODE c
 where  a.zgbh = b.zgbh
   and a.tjdm = c.tjdm
   and c.tjlx in ('2', '3')
   and ksrq <= rq
   and rq <= jsrq
   and c.tjdm in ('ndgck',
                  'dgbzj',
                  'ndsck',
                  'dsbzj',
                  '24301',
                  'grdq',
                  'grhq',
                  'gsdk',
                  'grdk')
 group by rq, bmdm, a.tjdm ;


select * from D_SUM_CODE t;

select rq,
       BMDM,
       a.tjdm,
       sum(kmye) kmye,
       sum(kmhs) kmhs,
       sum(ncye) ncye,
       sum(nchs) nchs
  from D_ACCMAN_SUB_SUM a, D_USER_CHANGE b, D_SUM_CODE c
 where to_char(rq, 'yyyymmdd') = '20151231'
   and a.zgbh = b.zgbh
   and a.tjdm = c.tjdm
   and c.tjlx in ('2', '3')
   and ksrq <= rq
   and rq <= jsrq
   and c.tjdm in ('ndgck',
                  'dgbzj',
                  'ndsck',
                  'dsbzj',
                  '24301',
                  'grdq',
                  'grhq',
                  'gsdk',
                  'grdk')
 group by rq, bmdm, a.tjdm;       

select trunc('20161231',1)  from dual;
