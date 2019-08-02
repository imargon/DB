select a.zh, a.khbh, a.khr, (a.ye * (-1)) ye
  from d_dg_fhzxx a, d_user_account_change b, d_sum_code c
 where a.zh = b.zh
   and c.sjdm in ('dgbzj', 'ndgck')
   and c.tjdm = to_number(a.kmh)
   and b.zgbh = '12150'
   and to_char(a.rq, 'yyyymmdd') = '20160531'
   and a.rq >= ksrq
   and a.rq <= jsrq;

-----
select a.zh, a.khbh
  from (select * from rep.d_dg_fhzxx t3 where to_char(t3.rq, 'yyyymmdd') = '20160101' and t3.rq >= ksrq  and t3.rq <= jsrq) a                                       
  LEFT JOin (select * from rep.d_user_account_change t1 where t1.zgbh = '999999') b                             
    on a.zh = b.zh
  left join (select * from rep.d_sum_code t2 where t2.sjdm in ('dgbzj', 'ndgck')) c 
         on c.tjdm = to_number(a.kmh)              
   ---and b.zgbh = '12150'
   and to_char(a.rq, 'yyyymmdd') = '20160101'
   and a.rq >= ksrq
   and a.rq <= jsrq;

---------------------------------------------------------- 对公存款恢复------------------------------------------------------
select t1.zgbh, count(*)
  from rep.d_user_account_change t1
  where t1.zgbh  in (select t.jgbm from rep.as2jg t union all select '999999' from dual)
 group by t1.zgbh;

select * from rep.as2jg;

---create table rep.azh as
select a.zh, a.khbh , a.khr, (a.ye * (-1)) ye
  from (select t1.rq,t1.zh,t1.khbh,t1.kmh from rep.d_dg_fhzxx t1 where to_char(t1.rq, 'yyyymmdd') = '20160531')a,
       (select t2.zh,t2.ksrq,t2.jsrq from rep.d_user_account_change t2 where t2.zgbh = '999999') b,
       (select t3.tjdm from rep.d_sum_code t3 where t3.sjdm in ('dgbzj', 'ndgck') )c
 where a.zh = b.zh
   and c.tjdm = to_number(a.kmh)
   ---and b.zgbh = '12150'
   and a.rq >= b.ksrq
   and a.rq <= b.jsrq;

select *
  from rep.d_accman_sub_sum t1
 where to_char(t1.rq, 'yyyymmdd')  in ('20160601','20160602'，'20160814')
   and t1.zgbh = '12150'
   order by t1.rq,t1.tjdm;

select zgbh, count(t1.zh)
  from rep.D_USER_ACCOUNT_CHANGE t1
 ---- where t1.zgbh in (select t.jgbm from rep.as2jg t union select '9999999' from dual)
 group by zgbh;


--- create table rep.azh2 as
selECT t1.zh,count( t1.zh) nu1
  from rep.d_user_account_change t1
 where t1.zh in (select t.zh from rep.azh t)
 group by t1.zh
 order by nu1;

----  账号出现一次
----create table rep.azh3 as 
select t1.zh,t3.aa10dpnok,t3.aa10name,t3.aa10cmng
  from rep.azh2 t1
  left join ods.adpf10 t2
    on t1.zh = t2.ad10acno
  left join ods.aapf10 t3
    on t2.ad10id = t3.aa10acid
   where t1.nu1 = 1
   and  t3.aa10dpnok = '12150';

------- 
update rep.d_user_account_change t1
set t1.zgbh ='12150'
--- select * from rep.d_user_account_change t1
where t1.zh in (select t2.zh  from rep.azh3 t2); 

--- 账号出现2次
create table rep.azh4 as 
select t1.zh,t3.aa10dpnok,t3.aa10name,t3.aa10cmng
  from rep.azh2 t1
  left join ods.adpf10 t2
    on t1.zh = t2.ad10acno
  left join ods.aapf10 t3
    on t2.ad10id = t3.aa10acid
   where t1.nu1 = 2
   and  t3.aa10dpnok = '12150';

--------账号出现2次调整
update rep.d_user_account_change t1
set t1.zgbh ='12150'
---select * from rep.d_user_account_change t1
 where t1.zh in (select t2.zh from rep.azh4 t2 where t2.zh not in ('420601000120090003586','420601000120090003677'))
   and t1.zgbh not in ('1293', '12010')
   and t1.zgbh = '999999'


-----账号出现3次
create table rep.azh5 as 
select t1.zh,t3.aa10dpnok,t3.aa10name,t3.aa10cmng
  from rep.azh2 t1
  left join ods.adpf10 t2
    on t1.zh = t2.ad10acno
  left join ods.aapf10 t3
    on t2.ad10id = t3.aa10acid
   where t1.nu1  in ('3','4','5')
   and  t3.aa10dpnok = '12150';


--- 数据备份
--create table rep.d_user_account_change_0817 as
 select * from rep.d_user_account_change;


select * from rep.d_user_change t3 where t3.zgbh  in ('1548','1573','1293','1395','1541');

select * from rep.azh2 t1 where t1.nu1 = 1;

--- create table rep.d_user_account_change_0816 as
select * from rep.d_user_account_change;

select * from rep.as2jg;

select * from rep.d_user_account_change t1 where t1.zh = '121500120100010268' for update;
 
select t1.*, t3.khmc
  from rep.azh t1
  left join i_khxx_new t3
    on t1.khbh = t3.khbh
 where t1.zh in (select t2.zh from rep.azh2 t2 where t2.nu1 = 1)
 order by t1.zh;

select * from rep.d_user_account_change t1;

select t2.*, t1.khr, t1.ye
  from rep.azh t1
  left join rep.d_user_account_change t2
    on t1.zh = t1.zh;

select * from rep.d_user_change t2 where t2.zgbh='1521';


----------------------------------------储蓄数据恢复---------------------------------------------------

/*create  table rep.d_user_account_change_08171
as
select * from rep.d_user_account_change;
*/

select * from rep.azh;

---create table rep.azh_cx as
select a.zh, a.khbh , a.khr, (a.ye * (-1)) ye
  from (select t1.rq,t1.zh,t1.khbh,t1.khr,t1.kmh,t1.ye from rep.d_ds_fhzxx t1 where to_char(t1.rq, 'yyyymmdd') = '20160531') a,
       (select t2.zh,t2.ksrq,t2.jsrq from rep.d_user_account_change t2 where t2.zgbh = '999999') b,
       (select t3.tjdm from rep.d_sum_code t3 where t3.sjdm in ('ndsck','dsbzj','24301','grdq','grhq') )c
 where a.zh = b.zh
   and c.tjdm = to_number(a.kmh)
   ---and b.zgbh = '12150'
   and a.rq >= b.ksrq
   and a.rq <= b.jsrq;
   

create table rep.azh_cx2 as
selECT t1.zh,count( t1.zh) nu1
  from rep.d_user_account_change t1
 where t1.zh in (select t.zh from rep.azh_cx t)
 group by t1.zh
 order by nu1;

---- 账号出现一次
---create table rep.azh_cx3 as 
select t1.zh,t3.ab10dpnok,t3.ab10name,t3.ab10oprm
  from rep.azh_cx2 t1
  left join ods.adpf10 t2
    on t1.zh = t2.ad10acno
  left join ods.abpf10 t3
    on t2.ad10id = t3.ab10acid
   where t1.nu1 = 1
   and  t3.ab10dpnok = '12150';

-------
------ --- 138	襄州支行	22 
update rep.d_user_account_change t1
set t1.zgbh ='12150'
---select * from rep.d_user_account_change t1
 where t1.zh in (select t2.zh  from rep.azh_cx3 t2)
   and t1.zgbh ='999999'; 

select distinct(t2.ab10oprm) from rep.azh_cx3 t2;

select *
  from rep.d_user_change t2
 where t2.zgbh in ('1327','1353','1389','1547','1549','1327','1367','1410','1437','1547','5015','5021','5282','6086','6419')
  order by t2.zgbh,zgmc;

------账号出现两次次

---create table rep.azh_cx4 as
select t1.zh,t3.ab10dpnok,t3.ab10name,t3.ab10oprm
  from rep.azh_cx2 t1
  left join ods.adpf10 t2
    on t1.zh = t2.ad10acno
  left join ods.abpf10 t3
    on t2.ad10id = t3.ab10acid
   where t1.nu1 = 2
   and  t3.ab10dpnok = '12150';
   
select distinct(t2.ab10oprm) from rep.azh_cx4 t2;

select *
  from rep.d_user_change t2
 where t2.zgbh in ('1548','1559','1460','1327')
  order by t2.zgbh,zgmc;  

select *
  from rep.d_user_change t2 where t2.zgmc ='龚昭君';
  
update rep.d_user_account_change t1
set t1.zgbh ='12150'
---select * from rep.d_user_account_change t1
where t1.zh in (select t.zh  from rep.azh_cx4 t)
  and t1.zgbh ='999999';
  
----------------------------数据恢复完毕------------------------------

--- 20160817   恢复完毕后备份


----create table rep.d_user_account_change_08172 as
select * from rep.d_user_account_change t1 where t1.zh in ('420601000120090003586','420601000120090003677'); 


select * from ods.adpf10 t2 where t2.ad10acno  in ('420601000120090003586','420601000120090003677');

select * from ods.aapf10 t3 where t3.aa10acid in ('756719','756710');

