﻿---20151231定期贵宾
insert into bbb select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq') group by khbh   having sum(ye)/10000 >= 100   ) a , d_ds_fhzxx b where b.rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq') and a.khbh = b.khbh and yg = ye
insert into bbb select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq') group by khbh   having sum(ye)/10000 >= 20 and sum(ye)/10000 < 50   ) a , d_ds_fhzxx b where b.rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq') and a.khbh = b.khbh and yg = ye
insert into bbb select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq') group by khbh   having sum(ye)/10000 >= 50 and sum(ye)/10000 < 100   ) a , d_ds_fhzxx b where b.rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq') and a.khbh = b.khbh and yg = ye


---20151231,20160331 定活期有效户
insert into bbb select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh   having sum(ye) >= 1000  ) a , d_ds_fhzxx b where b.rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye
insert into bbb select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh   having sum(ye) >= 1000  ) a , d_ds_fhzxx b where b.rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye

---20151231活期贵宾
insert into bbb select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh   having sum(ye)/10000 >= 100   ) a , d_ds_fhzxx b where b.rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye
insert into bbb select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh   having sum(ye)/10000 >= 20 and sum(ye)/10000 < 50   ) a , d_ds_fhzxx b where b.rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye
insert into bbb select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh   having sum(ye)/10000 >= 50 and sum(ye)/10000 < 100   ) a , d_ds_fhzxx b where b.rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye

---20160331 定期贵宾
insert into bbb select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdh') group by khbh   having sum(ye)/10000 >= 100  ) a , d_ds_fhzxx b where b.rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdh') and a.khbh = b.khbh and yg = ye
insert into bbb select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdh') group by khbh   having sum(ye)/10000 >= 20 and sum(ye)/10000 < 50   ) a , d_ds_fhzxx b where b.rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdh') and a.khbh = b.khbh and yg = ye
insert into bbb select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdh') group by khbh   having sum(ye)/10000 >= 50 and sum(ye)/10000 < 100   ) a , d_ds_fhzxx b where b.rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdh') and a.khbh = b.khbh and yg = ye

---20160331 活期贵宾

insert into bbb select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh   having sum(ye)/10000 >= 100  ) a , d_ds_fhzxx b where b.rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye
insert into bbb select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh   having sum(ye)/10000 >= 20 and sum(ye)/10000 < 50   ) a , d_ds_fhzxx b where b.rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye
insert into bbb select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh   having sum(ye)/10000 >= 50 and sum(ye)/10000 < 100   ) a , d_ds_fhzxx b where b.rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye


--- 20151231,20160331各支行活期储蓄日均余额





LOCK TABLE "BBB" IN EXCLUSIVE MODE  NOWAIT 

select  b.zgmc,b.zgbh,b.bmdm from  D_USER_CHANGE b where   to_char(b.ksrq,'yyyymmdd') <= '20160401' and to_char(b.jsrq,'yyyymmdd') >= '20160401'
select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq') group by khbh   having sum(ye)/10000 >= 20 and sum(ye)/10000 < 50   ) a , d_ds_fhzxx b where b.rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq') and a.khbh = b.khbh and yg = ye
select  b.zh, yehz,yg,a.khbh from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq') group by khbh   having sum(ye)/10000 >= 20 and sum(ye)/10000 < 50   ) a , d_ds_fhzxx b where b.rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq') and a.khbh = b.khbh and yg = ye
select  n_desc,n_begin_date,n_end_date,n_xgsj,n_xgr,n_xgbm from b_m_notice where to_char(n_begin_date,'yyyy-mm-dd')<= '2016-04-03' and to_char(n_end_date,'yyyy-mm-dd')>='2016-04-03' order by n_ind
select  n_desc,n_begin_date,n_end_date,n_xgsj,n_xgr,n_xgbm from b_m_notice where to_char(n_begin_date,'yyyy-mm-dd')<= '2016-04-04' and to_char(n_end_date,'yyyy-mm-dd')>='2016-04-04' order by n_ind
select *  from ods.abpf20 where ab20date >=  '20150101' and ab20date <= '20151231' and ab20acid = '575997'
select *  from ods.abpf20 where ab20date >= to_date('20150101','yyyymmdd') and ab20date <= to_date('20151231','yyyymmdd') and ab20acid = '575997'
select * from  ( select khbh ,  max(ye) yg , sum(ye)   from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh ,zh  having sum(ye) >= 1000  ) a , d_ds_fhzxx b where b.rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye
select * from bbb  where khbh in (   '2852240', '2160576', '340159' )
select * from bbb  where khbh in ( '2703000', '3034505' )
select * from bbb  where khbh in ( select khbh from ( select khbh,count(*) from bbb group by khbh  having count(*) > 1 ) )
select * From d_ds_fhzxx  where  rq = to_date('20151231','yyyymmdd') and zh in ( '120100102000049345', '120100102000056225', '120100102000056258', '120100102000056274' )
select * from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and khbh in ( '217436', '263256', '227258', '2318244', '326713', '256265' )
select * from d_user_account_change a, d_user_change b  where   b.ksrq <= to_date('20151231','yyyymmdd') and b.jsrq >= to_date('20151231','yyyymmdd') and a.ksrq <= to_date('20151231','yyyymmdd') and a.jsrq >= to_date('20151231','yyyymmdd') and a.zgbh = b.zgbh  and a.zh in ( '120500101500000473', '120500101500000481', '120500109200051100', '120100101500000295', '120100101500000303', '120500109200051092' )
select * from d_user_account_change a, d_user_change b  where   b.ksrq <= to_date('20160331','yyyymmdd') and b.jsrq >= to_date('20160331','yyyymmdd') and a.ksrq <= to_date('20160331','yyyymmdd') and a.jsrq >= to_date('20160331','yyyymmdd') and a.zgbh = b.zgbh  and a.zh in ( '120300109200084269', '120300109200084277', '120200109200207358', '121100109200070631' )
select * from d_user_account_change where zh = '120700102000024755'
select * from d_user_account_change where zh = '120900120500012102'
select * from d_user_change where zgmc = '王铮'
select * from d_user_change where zgmc = '周婷'
select a,count(*) from  ( select khbh a,zh b , max(ye) c , sum(ye) d  from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh ,zh  having sum(ye) >= 1000   )  group by a
select a.khbh,b.zh,yg, yehz from  ( select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh   having sum(ye) >= 1000  ) a , d_ds_fhzxx b where b.rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye
select a.NAME,b.zgbh,b.zgmc,b.bmdm,c.user_level from B_M_SYS_BRAN a , D_USER_CHANGE b, b_m_sys_user c where c.account = b.zgbh and  a.code = b.bmdm and b.bmdm = 117 and to_char(b.ksrq,'yyyymmdd') <= '20160206' and to_char(b.jsrq,'yyyymmdd')>= '20160206'
select a.NAME,b.zgbh,b.zgmc,b.bmdm,c.user_level from B_M_SYS_BRAN a , D_USER_CHANGE b, b_m_sys_user c where c.account = b.zgbh and  a.code = b.bmdm and b.bmdm = 127 and to_char(b.ksrq,'yyyymmdd') <= '20160331' and to_char(b.jsrq,'yyyymmdd')>= '20160331'
select a.NAME,b.zgbh,b.zgmc,b.bmdm,c.user_level from B_M_SYS_BRAN a , D_USER_CHANGE b, b_m_sys_user c where c.account = b.zgbh and  a.code = b.bmdm and b.bmdm = 131 and to_char(b.ksrq,'yyyymmdd') <= '20160402' and to_char(b.jsrq,'yyyymmdd')>= '20160402'
select a.NAME,b.zgbh,b.zgmc,b.bmdm,c.user_level from B_M_SYS_BRAN a , D_USER_CHANGE b, b_m_sys_user c where c.account = b.zgbh and  a.code = b.bmdm and b.bmdm = 132 and to_char(b.ksrq,'yyyymmdd') <= '20160402' and to_char(b.jsrq,'yyyymmdd')>= '20160402'
select a.NAME,b.zgbh,b.zgmc,b.bmdm,c.user_level from B_M_SYS_BRAN a , D_USER_CHANGE b, b_m_sys_user c where c.account = b.zgbh and  a.code = b.bmdm and b.bmdm = 138 and to_char(b.ksrq,'yyyymmdd') <= '20160331' and to_char(b.jsrq,'yyyymmdd')>= '20160331'
select a.zh ,khbh "客户ID", zhye "单个账户余额",yehz "余额汇总",zgmc  from d_user_account_change a, d_user_change b ,( select * from bbb  where khbh in ( select khbh from ( select khbh,count(*) from bbb group by khbh  having count(*) > 1 ) ) ) c where   b.ksrq <= to_date('20151231','yyyymmdd') and b.jsrq >= to_date('20151231','yyyymmdd') and a.ksrq <= to_date('20151231','yyyymmdd') and a.jsrq >= to_date('20151231','yyyymmdd') and a.zgbh = b.zgbh  and a.zh = c.zh order by khbh
select a.zh ,khbh "客户ID", zhye "单个账户余额",yehz "余额汇总",zgmc  from d_user_account_change a, d_user_change b ,( select * from bbb  where khbh in ( select khbh from ( select khbh,count(*) from bbb group by khbh  having count(*) > 1 ) ) ) c where   b.ksrq <= to_date('20160331','yyyymmdd') and b.jsrq >= to_date('20160331','yyyymmdd') and a.ksrq <= to_date('20160331','yyyymmdd') and a.jsrq >= to_date('20160331','yyyymmdd') and a.zgbh = b.zgbh  and a.zh = c.zh
select a.zh ,khbh "客户ID", zhye "单个账户余额",yehz "余额汇总",zgmc  from d_user_account_change a, d_user_change b ,( select * from bbb  where khbh in ( select khbh from ( select khbh,count(*) from bbb group by khbh  having count(*) > 1 ) ) ) c where   b.ksrq <= to_date('20160331','yyyymmdd') and b.jsrq >= to_date('20160331','yyyymmdd') and a.ksrq <= to_date('20160331','yyyymmdd') and a.jsrq >= to_date('20160331','yyyymmdd') and a.zgbh = b.zgbh  and a.zh = c.zh order by khbh
select a.zh ,khbh "客户ID", zhye "单个账户余额",yehz "余额汇总",zgmc  from d_user_account_change a, d_user_change b ,bbb c where   b.ksrq <= to_date('20160331','yyyymmdd') and b.jsrq >= to_date('20160331','yyyymmdd') and a.ksrq <= to_date('20160331','yyyymmdd') and a.jsrq >= to_date('20160331','yyyymmdd') and a.zgbh = b.zgbh  and a.zh in ( '120300109200084269', '120300109200084277', '120200109200207358', '121100109200070631' ) and a.zh = c.zh
select ab20fy,ab20trcod , count(*)  from ods.abpf20 where ab20date >=  '20150101' and ab20date <= '20151231' and ab20acid = '575997' group by ab20fy,ab20trcod
select b.zgbh,zgmc ,name , sum(ye) from d_user_account_change a, d_user_change b , d_ds_fhzxx c , b_m_sys_bran where   b.ksrq <= to_date('20151231','yyyymmdd') and b.jsrq >= to_date('20151231','yyyymmdd') and a.ksrq <= to_date('20151231','yyyymmdd') and a.jsrq >= to_date('20151231','yyyymmdd') and a.zgbh = b.zgbh  and a.zh = c.zh and bmdm = code  and c.rq = to_date('20151231','yyyymmdd') and c.kmh in ( '2150104', '2150105', '2150106', '2150107', '2150108', '2150505', '2150506'  ) group by b.zgbh , zgmc ,name  order by name
select b.zgbh,zgmc ,name , sum(ye) from d_user_account_change a, d_user_change b , d_ds_fhzxx c , b_m_sys_bran where   b.ksrq <= to_date('20160331','yyyymmdd') and b.jsrq >= to_date('20160331','yyyymmdd') and a.ksrq <= to_date('20160331','yyyymmdd') and a.jsrq >= to_date('20160331','yyyymmdd') and a.zgbh = b.zgbh  and a.zh = c.zh and bmdm = code  and c.kmh in ( '2150104', '2150105', '2150106', '2150107', '2150108', '2150505', '2150506'  ) group by b.zgbh , zgmc ,name  order by name
select b.zgbh,zgmc ,name , sum(ye) from d_user_account_change a, d_user_change b , d_ds_fhzxx c , b_m_sys_bran where   b.ksrq <= to_date('20160331','yyyymmdd') and b.jsrq >= to_date('20160331','yyyymmdd') and a.ksrq <= to_date('20160331','yyyymmdd') and a.jsrq >= to_date('20160331','yyyymmdd') and a.zgbh = b.zgbh  and a.zh = c.zh and bmdm = code  and c.rq = to_date('20160331','yyyymmdd') and c.kmh in ( '2150104', '2150105', '2150106', '2150107', '2150108', '2150505', '2150506'  ) group by b.zgbh , zgmc ,name  order by name
select bmdm  from D_USER_CHANGE where zgbh = '1377' and to_char(ksrq,'yyyymmdd') <= '20160331' and to_char(jsrq,'yyyymmdd')>= '20160331'
select bmdm  from D_USER_CHANGE where zgbh = '1476' and to_char(ksrq,'yyyymmdd') <= '20160331' and to_char(jsrq,'yyyymmdd')>= '20160331'
select bmdm  from D_USER_CHANGE where zgbh = '1493' and to_char(ksrq,'yyyymmdd') <= '20160331' and to_char(jsrq,'yyyymmdd')>= '20160331'
select bmdm  from D_USER_CHANGE where zgbh = '1600' and to_char(ksrq,'yyyymmdd') <= '20160331' and to_char(jsrq,'yyyymmdd')>= '20160331'
select bmdm  from D_USER_CHANGE where zgbh = '5003' and to_char(ksrq,'yyyymmdd') <= '20160331' and to_char(jsrq,'yyyymmdd')>= '20160331'
select bmdm  from D_USER_CHANGE where zgbh = '5781' and to_char(ksrq,'yyyymmdd') <= '20160331' and to_char(jsrq,'yyyymmdd')>= '20160331'
select bmdm  from D_USER_CHANGE where zgbh = '6419' and to_char(ksrq,'yyyymmdd') <= '20160331' and to_char(jsrq,'yyyymmdd')>= '20160331'
select bmdm  from D_USER_CHANGE where zgbh = '6419' and to_char(ksrq,'yyyymmdd') <= '20160401' and to_char(jsrq,'yyyymmdd')>= '20160401'
select bmdm  from D_USER_CHANGE where zgbh = '6426' and to_char(ksrq,'yyyymmdd') <= '20160331' and to_char(jsrq,'yyyymmdd')>= '20160331'
select count(*) from  ( select khbh a,zh b , max(ye) c , sum(ye) d  from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh ,zh  having sum(ye) >= 1000   )  group by a
select count(*) from  ( select khbh, max(ye), sum(ye) from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh  having sum(ye) >= 1000   )
select count(*) from  ( select khbh, sum(ye) from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh having sum(ye) >= 1000  )
select count(*) from  ( select khbh,zh,max(ye), sum(ye) from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh,zh having sum(ye) >= 1000   )
select count(*) from ( select * from  ( select khbh ,  max(ye) yg , sum(ye)   from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh   having sum(ye) >= 1000  ) a , d_ds_fhzxx b where b.rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye   )
select count(*) from ( select * from  ( select khbh ,  max(ye) yg , sum(ye)   from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh ,zh  having sum(ye) >= 1000  ) a , d_ds_fhzxx b where b.rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') and a.khbh = b.khbh and yg = ye   )
select count(*) from ( select khbh,max(ye), sum(ye) from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh having sum(ye) >= 1000  )

select khbh ,  max(ye) yg , sum(ye)   from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh   having sum(ye) >= 1000
select khbh ,  max(ye) yg , sum(ye)   from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh ,zh  having sum(ye) >= 1000
select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq') group by khbh   having sum(ye)/10000 >= 50 and sum(ye)/10000 < 100
select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq') group by khbh
select khbh ,  max(ye) yg , sum(ye)  yehz from d_ds_fhzxx  where rq = to_date('20160331','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grdq') group by khbh   having sum(ye)/10000 >= 20 and sum(ye) < 50
select khbh ,count(*) from bbb group by  khbh
select khbh a,  max(ye) c , sum(ye) d  from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh ,zh  having sum(ye) >= 1000
select khbh,count(*) from bbb group by khbh  having count(*) > 1
select khbh,max(ye), sum(ye) from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh having sum(ye) >= 1000
select khbh,zh,max(ye), sum(ye) from d_ds_fhzxx  where rq = to_date('20151231','yyyymmdd') and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq') group by khbh,zh having sum(ye) >= 1000

select khbh,zjlx,zjh,zwkhmc,to_date(zjxq,'yyyymmdd') zjxq,zhzt,to_date(djrq,'yyyymmdd') djrq,zh,dz,dh,bz,zgbh,zgmc,ye  from  (  select ca10cno khbh,ca10crdtyp zjlx,ca10crdid zjh,ca10cname zwkhmc,ca10vlddat zjxq,ab10stat zhzt,ca10datek djrq,a.zh,ca10addr dz,ca10tel dh,ab10ctls bz,b.zgbh,b.zgmc,ab10amt2 ye  from ods.capf10 , ods.abpf10,ods.adpf10,d_user_account_change a,d_user_change b where ca10cid =ab10ctid and ab10acid = ad10id and ca10cname like '%陈建萍%' and ad10acno = a.zh  and a.ksrq <= to_date('20160404','yyyymmdd')  and a.jsrq >=to_date('20160404','yyyymmdd')  and b.ksrq <= to_date('20160404','yyyymmdd')  and b.jsrq >=to_date('20160404','yyyymmdd')  and a.zgbh =b.zgbh and bmdm !='120' order by a.zh,ca10cno )
select khbh,zjlx,zjh,zwkhmc,to_date(zjxq,'yyyymmdd') zjxq,zhzt,to_date(djrq,'yyyymmdd') djrq,zh,dz,dh,bz,zgbh,zgmc,ye  from  (  select ca10cno khbh,ca10crdtyp zjlx,ca10crdid zjh,ca10cname zwkhmc,ca10vlddat zjxq,ab10stat zhzt,ca10datek djrq,a.zh,ca10addr dz,ca10tel dh,ab10ctls bz,b.zgbh,b.zgmc,ab10amt2 ye  from ods.capf10 , ods.abpf10,ods.adpf10,d_user_account_change a,d_user_change b where ca10cid =ab10ctid and ab10acid = ad10id and ca10cname like '%陈宽财%' and ad10acno = a.zh  and a.ksrq <= to_date('20160404','yyyymmdd')  and a.jsrq >=to_date('20160404','yyyymmdd')  and b.ksrq <= to_date('20160404','yyyymmdd')  and b.jsrq >=to_date('20160404','yyyymmdd')  and a.zgbh =b.zgbh and bmdm !='120' order by a.zh,ca10cno )
select khbh,zjlx,zjh,zwkhmc,to_date(zjxq,'yyyymmdd') zjxq,zhzt,to_date(djrq,'yyyymmdd') djrq,zh,dz,dh,bz,zgbh,zgmc,ye  from  (  select ca10cno khbh,ca10crdtyp zjlx,ca10crdid zjh,ca10cname zwkhmc,ca10vlddat zjxq,ab10stat zhzt,ca10datek djrq,a.zh,ca10addr dz,ca10tel dh,ab10ctls bz,b.zgbh,b.zgmc,ab10amt2 ye  from ods.capf10 , ods.abpf10,ods.adpf10,d_user_account_change a,d_user_change b where ca10cid =ab10ctid and ab10acid = ad10id and ca10cname like '%刘云腾%' and ad10acno = a.zh  and a.ksrq <= to_date('20160404','yyyymmdd')  and a.jsrq >=to_date('20160404','yyyymmdd')  and b.ksrq <= to_date('20160404','yyyymmdd')  and b.jsrq >=to_date('20160404','yyyymmdd')  and a.zgbh =b.zgbh and bmdm !='120' order by a.zh,ca10cno )
select khbh,zjlx,zjh,zwkhmc,to_date(zjxq,'yyyymmdd') zjxq,zhzt,to_date(djrq,'yyyymmdd') djrq,zh,dz,dh,bz,zgbh,zgmc,ye  from  (  select ca10cno khbh,ca10crdtyp zjlx,ca10crdid zjh,ca10cname zwkhmc,ca10vlddat zjxq,ab10stat zhzt,ca10datek djrq,a.zh,ca10addr dz,ca10tel dh,ab10ctls bz,b.zgbh,b.zgmc,ab10amt2 ye  from ods.capf10 , ods.abpf10,ods.adpf10,d_user_account_change a,d_user_change b where ca10cid =ab10ctid and ab10acid = ad10id and ca10cname like '%尚清发%' and ad10acno = a.zh  and a.ksrq <= to_date('20160403','yyyymmdd')  and a.jsrq >=to_date('20160403','yyyymmdd')  and b.ksrq <= to_date('20160403','yyyymmdd')  and b.jsrq >=to_date('20160403','yyyymmdd')  and a.zgbh =b.zgbh and bmdm !='120' order by a.zh,ca10cno )
select khbh,zjlx,zjh,zwkhmc,to_date(zjxq,'yyyymmdd') zjxq,zhzt,to_date(djrq,'yyyymmdd') djrq,zh,dz,dh,bz,zgbh,zgmc,ye  from  (  select ca10cno khbh,ca10crdtyp zjlx,ca10crdid zjh,ca10cname zwkhmc,ca10vlddat zjxq,ab10stat zhzt,ca10datek djrq,a.zh,ca10addr dz,ca10tel dh,ab10ctls bz,b.zgbh,b.zgmc,ab10amt2 ye  from ods.capf10 , ods.abpf10,ods.adpf10,d_user_account_change a,d_user_change b where ca10cid =ab10ctid and ab10acid = ad10id and ca10cname like '%王国民%' and ad10acno = a.zh  and a.ksrq <= to_date('20160404','yyyymmdd')  and a.jsrq >=to_date('20160404','yyyymmdd')  and b.ksrq <= to_date('20160404','yyyymmdd')  and b.jsrq >=to_date('20160404','yyyymmdd')  and a.zgbh =b.zgbh and bmdm !='120' order by a.zh,ca10cno )
select khbh,zjlx,zjh,zwkhmc,to_date(zjxq,'yyyymmdd') zjxq,zhzt,to_date(djrq,'yyyymmdd') djrq,zh,dz,dh,bz,zgbh,zgmc,ye  from  (  select ca10cno khbh,ca10crdtyp zjlx,ca10crdid zjh,ca10cname zwkhmc,ca10vlddat zjxq,ab10stat zhzt,ca10datek djrq,a.zh,ca10addr dz,ca10tel dh,ab10ctls bz,b.zgbh,b.zgmc,ab10amt2 ye  from ods.capf10 , ods.abpf10,ods.adpf10,d_user_account_change a,d_user_change b where ca10cid =ab10ctid and ab10acid = ad10id and ca10cno ='1215001020000058480' and ad10acno = a.zh  and a.ksrq <= to_date('20160403','yyyymmdd')  and a.jsrq >=to_date('20160403','yyyymmdd')  and b.ksrq <= to_date('20160403','yyyymmdd')  and b.jsrq >=to_date('20160403','yyyymmdd')  and a.zgbh =b.zgbh and bmdm !='120' order by a.zh )
select khbh,zjlx,zjh,zwkhmc,to_date(zjxq,'yyyymmdd') zjxq,zhzt,to_date(djrq,'yyyymmdd') djrq,zh,dz,dh,bz,zgbh,zgmc,ye  from  (  select ca10cno khbh,ca10crdtyp zjlx,ca10crdid zjh,ca10cname zwkhmc,ca10vlddat zjxq,ab10stat zhzt,ca10datek djrq,a.zh,ca10addr dz,ca10tel dh,ab10ctls bz,b.zgbh,b.zgmc,ab10amt2 ye  from ods.capf10 , ods.abpf10,ods.adpf10,d_user_account_change a,d_user_change b where ca10cid =ab10ctid and ab10acid = ad10id and ca10cno ='121500102000058480' and ad10acno = a.zh  and a.ksrq <= to_date('20160403','yyyymmdd')  and a.jsrq >=to_date('20160403','yyyymmdd')  and b.ksrq <= to_date('20160403','yyyymmdd')  and b.jsrq >=to_date('20160403','yyyymmdd')  and a.zgbh =b.zgbh and bmdm !='120' order by a.zh )
select khbh,zjlx,zjh,zwkhmc,to_date(zjxq,'yyyymmdd') zjxq,zhzt,to_date(djrq,'yyyymmdd') djrq,zh,dz,dh,bz,zgbh,zgmc,ye  from  (  select ca10cno khbh,ca10crdtyp zjlx,ca10crdid zjh,ca10cname zwkhmc,ca10vlddat zjxq,ab10stat zhzt,ca10datek djrq,a.zh,ca10addr dz,ca10tel dh,ab10ctls bz,b.zgbh,b.zgmc,ab10amt2 ye  from ods.capf10 , ods.abpf10,ods.adpf10,d_user_account_change a,d_user_change b where ca10cid =ab10ctid and ab10acid = ad10id and ca10cno ='12150010200058480' and ad10acno = a.zh  and a.ksrq <= to_date('20160403','yyyymmdd')  and a.jsrq >=to_date('20160403','yyyymmdd')  and b.ksrq <= to_date('20160403','yyyymmdd')  and b.jsrq >=to_date('20160403','yyyymmdd')  and a.zgbh =b.zgbh and bmdm !='120' order by a.zh )
select khbh,zjlx,zjh,zwkhmc,to_date(zjxq,'yyyymmdd') zjxq,zhzt,to_date(djrq,'yyyymmdd') djrq,zh,dz,dh,bz,zgbh,zgmc,ye  from  (  select ca10cno khbh,ca10crdtyp zjlx,ca10crdid zjh,ca10cname zwkhmc,ca10vlddat zjxq,ab10stat zhzt,ca10datek djrq,a.zh,ca10addr dz,ca10tel dh,ab10ctls bz,b.zgbh,b.zgmc,ab10amt2 ye from ods.capf10 , ods.abpf10,ods.adpf10,d_user_account_change a,d_user_change b where ca10cid =ab10ctid and ab10acid = ad10id and a.zh ='121500102000018757' and ad10acno = a.zh  and a.ksrq <= to_date('20160403','yyyymmdd')  and a.jsrq >=to_date('20160403','yyyymmdd')  and b.ksrq <= to_date('20160403','yyyymmdd')  and b.jsrq >=to_date('20160403','yyyymmdd')  and a.zgbh =b.zgbh and bmdm !='120' order by a.zh,ca10cno )
select khbh,zjlx,zjh,zwkhmc,to_date(zjxq,'yyyymmdd') zjxq,zhzt,to_date(djrq,'yyyymmdd') djrq,zh,dz,dh,bz,zgbh,zgmc,ye  from  (  select ca10cno khbh,ca10crdtyp zjlx,ca10crdid zjh,ca10cname zwkhmc,ca10vlddat zjxq,ab10stat zhzt,ca10datek djrq,a.zh,ca10addr dz,ca10tel dh,ab10ctls bz,b.zgbh,b.zgmc,ab10amt2 ye from ods.capf10 , ods.abpf10,ods.adpf10,d_user_account_change a,d_user_change b where ca10cid =ab10ctid and ab10acid = ad10id and a.zh ='121500102000030976' and ad10acno = a.zh  and a.ksrq <= to_date('20160403','yyyymmdd')  and a.jsrq >=to_date('20160403','yyyymmdd')  and b.ksrq <= to_date('20160403','yyyymmdd')  and b.jsrq >=to_date('20160403','yyyymmdd')  and a.zgbh =b.zgbh and bmdm !='120' order by a.zh,ca10cno )
select khbh,zjlx,zjh,zwkhmc,to_date(zjxq,'yyyymmdd') zjxq,zhzt,to_date(djrq,'yyyymmdd') djrq,zh,dz,dh,bz,zgbh,zgmc,ye  from  (  select ca10cno khbh,ca10crdtyp zjlx,ca10crdid zjh,ca10cname zwkhmc,ca10vlddat zjxq,ab10stat zhzt,ca10datek djrq,a.zh,ca10addr dz,ca10tel dh,ab10ctls bz,b.zgbh,b.zgmc,ab10amt2 ye from ods.capf10 , ods.abpf10,ods.adpf10,d_user_account_change a,d_user_change b where ca10cid =ab10ctid and ab10acid = ad10id and a.zh ='121500102000036361' and ad10acno = a.zh  and a.ksrq <= to_date('20160403','yyyymmdd')  and a.jsrq >=to_date('20160403','yyyymmdd')  and b.ksrq <= to_date('20160403','yyyymmdd')  and b.jsrq >=to_date('20160403','yyyymmdd')  and a.zgbh =b.zgbh and bmdm !='120' order by a.zh,ca10cno )
select khbh,zjlx,zjh,zwkhmc,to_date(zjxq,'yyyymmdd') zjxq,zhzt,to_date(djrq,'yyyymmdd') djrq,zh,dz,dh,bz,zgbh,zgmc,ye  from  (  select ca10cno khbh,ca10crdtyp zjlx,ca10crdid zjh,ca10cname zwkhmc,ca10vlddat zjxq,ab10stat zhzt,ca10datek djrq,a.zh,ca10addr dz,ca10tel dh,ab10ctls bz,b.zgbh,b.zgmc,ab10amt2 ye from ods.capf10 , ods.abpf10,ods.adpf10,d_user_account_change a,d_user_change b where ca10cid =ab10ctid and ab10acid = ad10id and a.zh ='121500102000053721' and ad10acno = a.zh  and a.ksrq <= to_date('20160403','yyyymmdd')  and a.jsrq >=to_date('20160403','yyyymmdd')  and b.ksrq <= to_date('20160403','yyyymmdd')  and b.jsrq >=to_date('20160403','yyyymmdd')  and a.zgbh =b.zgbh and bmdm !='120' order by a.zh,ca10cno )
select khbh,zjlx,zjh,zwkhmc,to_date(zjxq,'yyyymmdd') zjxq,zhzt,to_date(djrq,'yyyymmdd') djrq,zh,dz,dh,bz,zgbh,zgmc,ye  from  (  select ca10cno khbh,ca10crdtyp zjlx,ca10crdid zjh,ca10cname zwkhmc,ca10vlddat zjxq,ab10stat zhzt,ca10datek djrq,a.zh,ca10addr dz,ca10tel dh,ab10ctls bz,b.zgbh,b.zgmc,ab10amt2 ye from ods.capf10 , ods.abpf10,ods.adpf10,d_user_account_change a,d_user_change b where ca10cid =ab10ctid and ab10acid = ad10id and a.zh ='121500102000058480' and ad10acno = a.zh  and a.ksrq <= to_date('20160403','yyyymmdd')  and a.jsrq >=to_date('20160403','yyyymmdd')  and b.ksrq <= to_date('20160403','yyyymmdd')  and b.jsrq >=to_date('20160403','yyyymmdd')  and a.zgbh =b.zgbh and bmdm !='120' order by a.zh,ca10cno )
select khbh,zjlx,zjh,zwkhmc,to_date(zjxq,'yyyymmdd') zjxq,zhzt,to_date(djrq,'yyyymmdd') djrq,zh,dz,dh,bz,zgbh,zgmc,ye  from  (  select ca10cno khbh,ca10crdtyp zjlx,ca10crdid zjh,ca10cname zwkhmc,ca10vlddat zjxq,ab10stat zhzt,ca10datek djrq,a.zh,ca10addr dz,ca10tel dh,ab10ctls bz,b.zgbh,b.zgmc,ab10amt2 ye from ods.capf10 , ods.abpf10,ods.adpf10,d_user_account_change a,d_user_change b where ca10cid =ab10ctid and ab10acid = ad10id and a.zh ='121500102000058605' and ad10acno = a.zh  and a.ksrq <= to_date('20160403','yyyymmdd')  and a.jsrq >=to_date('20160403','yyyymmdd')  and b.ksrq <= to_date('20160403','yyyymmdd')  and b.jsrq >=to_date('20160403','yyyymmdd')  and a.zgbh =b.zgbh and bmdm !='120' order by a.zh,ca10cno )
select khbh,zjlx,zjh,zwkhmc,to_date(zjxq,'yyyymmdd') zjxq,zhzt,to_date(djrq,'yyyymmdd') djrq,zh,dz,dh,bz,zgbh,zgmc,zl,ye  from  (   select ca10cno khbh,ca10crdtyp zjlx,ca10crdid zjh,ca10cname zwkhmc,ca10vlddat zjxq,aa10stat zhzt,ca10datek djrq,a.zh,ca10addr dz,ca10tel dh,aa10ctls bz,b.zgbh,b.zgmc,aa10actyp zl,aa10baly*(-1) ye from ods.capf10 , ods.aapf10,ods.adpf10,d_user_account_change a,d_user_change b  where ca10cid =aa10ctid  and aa10acid = ad10id  and a.zh ='420603000120090001685' and ad10acno = a.zh  and a.ksrq <= to_date('20160404','yyyymmdd')  and a.jsrq >=to_date('20160404','yyyymmdd')  and b.ksrq <= to_date('20160404','yyyymmdd')  and b.jsrq >=to_date('20160404','yyyymmdd')  and a.zgbh =b.zgbh and bmdm!='120' order by ca10cno,a.zh )

select name,kmye from d_unit_sub_sum   , b_m_sys_bran where bmdm = code  and rq = to_date('20151231','yyyymmdd') and tjdm = 'grdq' and parent_branch_id = '2' order by code
select name,kmye from d_unit_sub_sum   , b_m_sys_bran where bmdm = code  and rq = to_date('20160331','yyyymmdd') and tjdm = 'grdq' and parent_branch_id = '2' order by code
select name,kmye from d_unit_sub_sum   , b_m_sys_bran where bmdm = code  and rq = to_date('20160331','yyyymmdd') and tjdm = 'grdq' order by code


select zgmc,name,count(*) from d_user_account_change a , d_user_change b ,b_m_sys_bran , bbb c  where   b.ksrq <= to_date('20151231','yyyymmdd') and b.jsrq >= to_date('20151231','yyyymmdd') and a.ksrq <= to_date('20151231','yyyymmdd') and a.jsrq >= to_date('20151231','yyyymmdd') and a.zgbh = b.zgbh  and bmdm = code  and a.zh = c.zh  group by zgmc , name  order by name
select zgmc,name,count(*) from d_user_account_change a , d_user_change b ,b_m_sys_bran , bbb c  where   b.ksrq <= to_date('20160331','yyyymmdd') and b.jsrq >= to_date('20160331','yyyymmdd') and a.ksrq <= to_date('20160331','yyyymmdd') and a.jsrq >= to_date('20160331','yyyymmdd') and a.zgbh = b.zgbh  and bmdm = code  and a.zh = c.zh  group by zgmc , name  order by name
select zgmc,name,count(*) from d_user_account_change a , d_user_change b ,b_m_sys_bran , bbb c  where   b.ksrq <= to_date('20151231','yyyymmdd') and b.jsrq >= to_date('20151231','yyyymmdd') and a.ksrq <= to_date('20151231','yyyymmdd') and a.jsrq >= to_date('20151231','yyyymmdd') and a.zgbh = b.zgbh  and bmdm = code  and a.zh = c.zh  group by zgmc , name
select zgmc,name,count(*) from d_user_account_change a , d_user_change b ,b_m_sys_bran , bbb c  where   b.ksrq <= to_date('20151231','yyyymmdd') and b.jsrq >= to_date('20151231','yyyymmdd') and a.ksrq <= to_date('20151231','yyyymmdd') and a.jsrq >= to_date('20151231','yyyymmdd') and a.zgbh = b.zgbh  and bmdm = code  and a.zh = c.zh  group by zgmc , name  order by name

select zgmc,name,rjkmye from d_accman_year_rj  a , d_user_change b,b_m_sys_bran where tjdm = 'ndsck' and rq = to_date('20160331','yyyymmdd') and b.ksrq <= to_date('20160331','yyyymmdd') and b.jsrq >= to_date('20160331','yyyymmdd') and a.zgbh = b.zgbh  and bmdm = code  order by code
select zgmc,name,rjkmye from d_accman_year_rj  a , d_user_change b,b_m_sys_bran where tjdm = 'ndsck' and rq = to_date('20160331','yyyymmdd') and b.ksrq <= to_date('20160331','yyyymmdd') and b.jsrq >= to_date('20160331','yyyymmdd') and bmdm = code  order by code