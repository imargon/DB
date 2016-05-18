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
