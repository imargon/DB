insert into bbb
  select b.zh, yehz, yg, a.khbh
    from (select khbh, max(ye) yg, sum(ye) yehz
            from d_ds_fhzxx
           where rq = to_date('20151231', 'yyyymmdd')
             and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq')
        group by khbh
          having sum(ye) / 10000 >= 100) a,
         d_ds_fhzxx b
   where b.rq = to_date('20151231', 'yyyymmdd')
     and trim(kmh) in
         (select trim(tjdm) from d_sum_code where sjdm = 'grdq')
     and a.khbh = b.khbh
     and yg = ye;

insert into bbb
  select b.zh, yehz, yg, a.khbh
    from (select khbh, max(ye) yg, sum(ye) yehz
            from d_ds_fhzxx
           where rq = to_date('20151231', 'yyyymmdd')
             and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq')
           group by khbh
          having sum(ye) / 10000 >= 20 and sum(ye) / 10000 < 50) a,
         d_ds_fhzxx b
   where b.rq = to_date('20151231', 'yyyymmdd')
     and trim(kmh) in
         (select trim(tjdm) from d_sum_code where sjdm = 'grdq')
     and a.khbh = b.khbh
     and yg = ye;
     
     
insert into bbb
  select b.zh, yehz, yg, a.khbh
    from (select khbh, max(ye) yg, sum(ye) yehz
            from d_ds_fhzxx
           where rq = to_date('20151231', 'yyyymmdd')
             and trim(kmh) in
                 (select trim(tjdm) from d_sum_code where sjdm = 'grdq')
           group by khbh
          having sum(ye) / 10000 >= 50 and sum(ye) / 10000 < 100) a,
         d_ds_fhzxx b
   where b.rq = to_date('20151231', 'yyyymmdd')
     and trim(kmh) in
         (select trim(tjdm) from d_sum_code where sjdm = 'grdq')
     and a.khbh = b.khbh
     and yg = ye;

insert into bbb
  select b.zh, yehz, yg, a.khbh
    from (select khbh, max(ye) yg, sum(ye) yehz
            from d_ds_fhzxx
           where rq = to_date('20151231', 'yyyymmdd')
             and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq')
           group by khbh
          having sum(ye) >= 1000) a,
         d_ds_fhzxx b
   where b.rq = to_date('20151231', 'yyyymmdd')
     and trim(kmh) in
         (select trim(tjdm) from d_sum_code where sjdm = 'grhq')
     and a.khbh = b.khbh
     and yg = ye;

insert into bbb
  select b.zh, yehz, yg, a.khbh
    from (select khbh, max(ye) yg, sum(ye) yehz
            from d_ds_fhzxx
           where rq = to_date('20160331', 'yyyymmdd')
             and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq')
           group by khbh
          having sum(ye) / 10000 >= 20 and sum(ye) < 50) a,
         d_ds_fhzxx b
   where b.rq = to_date('20160331', 'yyyymmdd')
     and trim(kmh) in
         (select trim(tjdm) from d_sum_code where sjdm = 'grdq')
     and a.khbh = b.khbh
     and yg = ye;

insert into bbb select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh   having sum(ye) >= 1000  ) a , d_ds_fhzxx b where b.rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye;
insert into bbb select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh   having sum(ye)/10000 >= 100  ) a , d_ds_fhzxx b where b.rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye;
insert into bbb select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh   having sum(ye)/10000 >= 20 and sum(ye)/10000 < 50   ) a , d_ds_fhzxx b where b.rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye;
insert into bbb select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh   having sum(ye)/10000 >= 50 and sum(ye)/10000 < 100   ) a , d_ds_fhzxx b where b.rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye;




 
select distinct a.khbh,
                a.khmc,
                a.khye,
                a.zgbh,
                a.zgmc,
                b.zh,
                b.khr,
                b.ye,
                rownum
  from (select b.khbh khbh, sum(ye * (-1)) khye, d.zgmc zgmc, e.khmc, d.zgbh
          from d_user_account_change a,
               d_dg_fhzxx            b,
               d_sum_code            c,
               d_user_change         d,
               i_khxx_new            e
         where b.rq = :1
           and a.zh = b.zh
           and b.khbh = e.khbh
           and b.rq >= a.ksrq
           and b.rq <= a.jsrq
           and b.rq >= d.ksrq
           and b.rq <= d.jsrq
           and c.tjdm = to_number(b.kmh)
           and c.sjdm in ('dgbzj', 'ndgck')
           and a.zgbh = '5869'
           and a.zgbh = d.zgbh
         group by b.khbh, d.zgbh, d.zgmc, e.khmc) a,
       (select a.zh, a.khbh, a.khr, (a.ye * (-1)) ye
          from d_dg_fhzxx a, d_user_account_change b, d_sum_code c
         where a.zh = b.zh
           and c.sjdm in ('dgbzj', 'ndgck')
           and c.tjdm = to_number(a.kmh)
           and b.zgbh = '5869'
           and a.rq = :2
           and a.rq >= ksrq
           and a.rq <= jsrq) b
 where a.khbh = b.khbh
   and khye >= 1000
 order by khye desc;
 
select * from BBB t;
insert into bbb
  select b.zh, yehz, yg, a.khbh
    from (select khbh, max(ye) yg, sum(ye) yehz
            from d_ds_fhzxx
           where rq = to_date('20151231', 'yyyymmdd')
             and trim(kmh) in
                 (select trim(tjdm) from d_sum_code where sjdm = 'grhq')
           group by khbh
          having sum(ye) >= 1000) a,
         d_ds_fhzxx b
   where b.rq = to_date('20151231', 'yyyymmdd')
     and trim(kmh) in
         (select trim(tjdm) from d_sum_code where sjdm = 'grhq')
     and a.khbh = b.khbh
     and yg = ye;
     
select 
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
  from ods.abpf10, ods.adpf10
 where ab10acid = ad10id
   and ((ab10stat = 1 and ab10amt2 > 0) or ab10stat = '0')
   and ab10dpnok like '12%';
select * from D_USER_ACCOUNT_CHANGE t;
select * from D_USER_CHANGE t;

select khbh,
       zjlx,
       zjh,
       zwkhmc,
       to_date(zjxq, 'yyyymmdd') zjxq,
       zhzt,
       to_date(djrq, 'yyyymmdd') djrq,
       zh,
       dz,
       dh,
       bz,
       zgbh,
       zgmc,
       ye
  from (select ca10cno    khbh,
               ca10crdtyp zjlx,
               ca10crdid  zjh,
               ca10cname  zwkhmc,
               ca10vlddat zjxq,
               ab10stat   zhzt,
               ca10datek  djrq,
               a.zh,
               ca10addr   dz,
               ca10tel    dh,
               ab10ctls   bz,
               b.zgbh,
               b.zgmc,
               ab10amt2   ye
          from ods.capf10,
               ods.abpf10,
               ods.adpf10,
               d_user_account_change a,
               d_user_change         b
         where ca10cid = ab10ctid
           and ab10acid = ad10id
           and ca10cname like '%金联明%'
           and ad10acno = a.zh
           and a.ksrq <= to_date('20160331', 'yyyymmdd')
           and a.jsrq >= to_date('20160331', 'yyyymmdd')
           and b.ksrq <= to_date('20160331', 'yyyymmdd')
           and b.jsrq >= to_date('20160331', 'yyyymmdd')
           and a.zgbh = b.zgbh
           and bmdm != '120'
         order by a.zh, ca10cno);
         
  select khbh,
         zjlx,
         zjh,
         zwkhmc,
         to_date(zjxq, 'yyyymmdd') zjxq,
         zhzt,
         to_date(djrq, 'yyyymmdd') djrq,
         zh,
         dz,
         dh,
         bz,
         zgbh,
         zgmc,
         zl,
         ye
    from (select ca10cno khbh,
                 ca10crdtyp zjlx,
                 ca10crdid zjh,
                 ca10cname zwkhmc,
                 ca10vlddat zjxq,
                 aa10stat zhzt,
                 ca10datek djrq,
                 a.zh,
                 ca10addr dz,
                 ca10tel dh,
                 aa10ctls bz,
                 b.zgbh,
                 b.zgmc,
                 aa10actyp zl,
                 aa10baly * (-1) ye
            from ods.capf10,
                 ods.aapf10,
                 ods.adpf10,
                 d_user_account_change a,
                 d_user_change         b
           where ca10cid = aa10ctid
             and aa10acid = ad10id
             and ca10cname like '%湖北融汇投资担保集团%'
             and ad10acno = a.zh
             and a.ksrq <= to_date('20160331', 'yyyymmdd')
             and a.jsrq >= to_date('20160331', 'yyyymmdd')
             and b.ksrq <= to_date('20160331', 'yyyymmdd')
             and b.jsrq >= to_date('20160331', 'yyyymmdd')
             and a.zgbh = b.zgbh
             and bmdm != '120'
           order by ca10cno, a.zh);
  

select khbh,
       zjlx,
       zjh,
       zwkhmc,
       to_date(zjxq, 'yyyymmdd') zjxq,
       zhzt,
       to_date(djrq, 'yyyymmdd') djrq,
       zh,
       dz,
       dh,
       bz,
       zgbh,
       zgmc,
       ye
  from (select ca10cno    khbh,
               ca10crdtyp zjlx,
               ca10crdid  zjh,
               ca10cname  zwkhmc,
               ca10vlddat zjxq,
               ab10stat   zhzt,
               ca10datek  djrq,
               a.zh,
               ca10addr   dz,
               ca10tel    dh,
               ab10ctls   bz,
               b.zgbh,
               b.zgmc,
               ab10amt2   ye
          from ods.capf10,
               ods.abpf10,
               ods.adpf10,
               d_user_account_change a,
               d_user_change         b
         where ca10cid = ab10ctid
           and ab10acid = ad10id
           and ca10crdid = '420684199006132514'
           and ad10acno = a.zh
           and a.ksrq <= to_date('20160331', 'yyyymmdd')
           and a.jsrq >= to_date('20160331', 'yyyymmdd')
           and b.ksrq <= to_date('20160331', 'yyyymmdd')
           and b.jsrq >= to_date('20160331', 'yyyymmdd')
           and a.zgbh = b.zgbh
           and bmdm != '120'
         order by a.zh, ca10cno);
         
select khbh,
       zjlx,
       zjh,
       zwkhmc,
       to_date(zjxq, 'yyyymmdd') zjxq,
       zhzt,
       to_date(djrq, 'yyyymmdd') djrq,
       zh,
       dz,
       dh,
       bz,
       zgbh,
       zgmc,
       ye
  from (select ca10cno    khbh,
               ca10crdtyp zjlx,
               ca10crdid  zjh,
               ca10cname  zwkhmc,
               ca10vlddat zjxq,
               ab10stat   zhzt,
               ca10datek  djrq,
               a.zh,
               ca10addr   dz,
               ca10tel    dh,
               ab10ctls   bz,
               b.zgbh,
               b.zgmc,
               ab10amt2   ye
          from ods.capf10,
               ods.abpf10,
               ods.adpf10,
               d_user_account_change a,
               d_user_change         b
         where ca10cid = ab10ctid
           and ab10acid = ad10id
           and a.zh = '420609000120160003717'
           and ad10acno = a.zh
           and a.ksrq <= to_date('20160331', 'yyyymmdd')
           and a.jsrq >= to_date('20160331', 'yyyymmdd')
           and b.ksrq <= to_date('20160331', 'yyyymmdd')
           and b.jsrq >= to_date('20160331', 'yyyymmdd')
           and a.zgbh = b.zgbh
           and bmdm != '120'
         order by a.zh, ca10cno);
