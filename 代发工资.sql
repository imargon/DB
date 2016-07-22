select a.branno, a.unitname, a.operno, a.zgmc, dfnum, dfsum
  from (select branno, unitname, operno, zgmc, count(*) dfnum
          from ods.batchdetail, rep.d_user_change
         where time_t >= '20160601'
           and time_t <= '20160630'
           and operno = zgbh
           and ksrq <= to_date('20160630', 'yyyymmdd')
           and jsrq >= to_date('20160630', 'yyyymmdd')
         group by branno, unitname, operno, zgmc) a,
       (select branno, unitname, operno, zgmc, sum(amt) dfsum
          from ods.batchdetail, rep.d_user_change
         where time_t >= '20160601'
           and time_t <= '20160630'
           and operno = zgbh
           and ksrq <= to_date('20160630', 'yyyymmdd')
           and jsrq >= to_date('20160630', 'yyyymmdd')
         group by branno, unitname, operno, zgmc) b
 where a.branno = b.branno
   and a.unitname = b.unitname
   and a.operno = b.operno
 order by a.branno, a.zgmc;


select a.branno, a.operno, zgmc, dfnum, dfamt
  from (select branno, operno, count(*) dfnum
          from ods.batchdetail
         where time_t >= '20160601'
           and time_t <= '20160630'
         group by branno, operno) a,
       (select operno, sum(amt) dfamt
          from ods.batchdetail
         where time_t >= '20160601'
           and time_t <= '20160630'
         group by operno) b,
       rep.d_user_change
 where a.operno = b.operno
   and a.operno = zgbh
   and ksrq <= to_date('20160630', 'yyyymmdd')
   and jsrq >= to_date('20160630', 'yyyymmdd')
 order by a.branno, a.operno;

---- 过滤掉重复工号
select *
  from D_USER_CHANGE t
 where ksrq <= to_date('20160630', 'yyyymmdd')
   and jsrq >= to_date('20160630', 'yyyymmdd')


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
