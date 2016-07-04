select a.branno, a.unitname, a.operno, a.zgmc, dfnum, dfsum
  from (select branno, unitname, operno, zgmc, count(*) dfnum
          from ods.batchdetail, rep.d_user_change
         where time_t >= '20160401'
           and time_t <= '20160430'
           and operno = zgbh
           and ksrq <= to_date('20160430', 'yyyymmdd')
           and jsrq >= to_date('20160430', 'yyyymmdd')
         group by branno, unitname, operno, zgmc) a,
       (select branno, unitname, operno, zgmc, sum(amt) dfsum
          from ods.batchdetail, d_user_change
         where time_t >= '20160401'
           and time_t <= '20160430'
           and operno = zgbh
           and ksrq <= to_date('20160430', 'yyyymmdd')
           and jsrq >= to_date('20160430', 'yyyymmdd')
         group by branno, unitname, operno, zgmc) b
 where a.branno = b.branno
   and a.unitname = b.unitname
   and a.operno = b.operno
 order by a.branno, a.zgmc;


select a.branno, a.operno, zgmc, dfnum, dfamt
  from (select branno, operno, count(*) dfnum
          from ods.batchdetail
         where time_t >= '20160401'
           and time_t <= '20160430'
         group by branno, operno) a,
       (select operno, sum(amt) dfamt
          from ods.batchdetail
         where time_t >= '20160401'
           and time_t <= '20160430'
         group by operno) b,
       rep.d_user_change
 where a.operno = b.operno
   and a.operno = zgbh
   and ksrq <= to_date('20160430', 'yyyymmdd')
   and jsrq >= to_date('20160430', 'yyyymmdd')
 order by a.branno, a.operno;

---- 过滤掉重复工号
select *
  from D_USER_CHANGE t
 where ksrq <= to_date('20160430', 'yyyymmdd')
   and jsrq >= to_date('20160430', 'yyyymmdd')
-----
----- 201 科目销户清单
select t1.aa10dpnok,t2.ad10acno, t1.aa10name, t1.aa10atr,t1.aa10stat,t1.aa10datee
  from ods.aapf10 t1
  left join ods.adpf10 t2
    on t1.aa10acid = t2.ad10id
 where substr(aa10subj, 0, 3) = '201'
   and aa10stat='1'
   and to_char(aa10datee,'yyyymmdd')>='20160601'
   and to_char(aa10datee,'yyyymmdd')<='20160630'
   order by aa10datee;

---- 201 对公账户清单
select t1.aa10dpnok, t2.ad10acno,t1.aa10name, t1.AA10FUND,t1.aa10datec,-AA10BALY,t4.zgmc,DECODE(AA10STAT,'0','正常','2','长期不动户')
  from ods.aapf10 t1
  left join  ods.adpf10 t2
    on t1.aa10acid = t2.ad10id
  left join rep.d_user_account_change t3
    on t2.ad10acno = t3.zh
  left join rep.d_user_change t4
    on t3.zgbh = t4.zgbh
 where substr(aa10subj, 0, 3) = '201'
   and t1.AA10STAT in ('0','2')
   and t3.ksrq <= to_date('20160630', 'yyyymmdd')
   and t3.jsrq >= to_date('20160630', 'yyyymmdd')
   and t4.ksrq <= to_date('20160630', 'yyyymmdd')
   and t4.jsrq >= to_date('20160630', 'yyyymmdd')

---- 手机网银
select t1.CA10DPNO,
       JGMC as "机构名称",
       t1.CA10CNO as "客户号",
       t1.CA10DATEK as "开户日期",
       t1.CA10CNAME as "客户名称",
       t1.CA10CRDTYP as "客户类型",
       t1.CA10CRDID as "证件号码",
       t1.CA10VLDDAT as "证件有效期",
       t2.CA20ARTNM as "法定代表人",
       t2.CA20ARTSGN as "是否独立法人",
       '法定代表人证件类型',
       '法定代表人证件号码',
       '法定代表人证件有效期',
       t1.CA10TEL,
       t1.CA10ADDR,
       t1.CA10PCOD,
       t2.CA20AREA,
       t2.CA20BLICID as "营业执照号",
       t2.CA20OPNPRT as "开户许可政号",
       t2.CA20LICDAT as "发照日期",
       t2.CA20CAPI as "注册资本",
       t2.CA20LOGADD,
       t2.CA20RELPER as "联系人",
       t2.CA20RELMOB,
       '法人代码证证号',
       t2.CA20GSNO as "国税税务登记证证号",
       t2.CA20DSNO as "地税税务登记证证号",
       t1.CA10STS
  from ods.capf10 t1
  left join ods.capf20 t2
    on t1.ca10cid = t2.ca20cid
  ---   on t1.CA10CRDID = t2.ca20relmal
  left join rep.as2jg t3
     on t1.ca10dpno = t3.jgbm
  where t1.ca10ctyp ='2'
  order by t1.CA10DATEK;
  
-------- 网银手机银行明细

select CA10DPNO,
       JGMC,
       CA10CNO,
       CA10DATEK,
       CA10CNAME,
       CA10CRDTYP,
       CA10CRDID,
       CA10VLDDAT,
       DECODE(CA30SEX, '0', '男', '1', '女', CA30SEX) as "性别",
       CA30WRKADR,
       CA30UPCOD,
       CA10TEL,
       CA30WORK,
       CA10ADDR
  from ods.capf10 t1
  left join ods.capf30 t2
    on t1.ca10cid = t2.ca30cid
  left join rep.as2jg t3
    on t1.ca10dpno = t3.jgbm
 where t1.ca10ctyp = '1'
   and t1.ca10crdid in (select card_num from ods.id_card_test1)
   order by CA10DPNO ;
