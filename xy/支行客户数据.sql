select * from dba_tables where lower(table_name) ='papf30';
select ca10cname,ca10tel ,ca10addr from ods.capf10  where ca10dpno = '12050' and ca10tel is not null

select t1.ca10cname,t1.ca10tel ,t1.ca10addr,t1.ca10datek from ods.capf10 t1  where  t1.ca10dpno = '12050' and ca10tel is not null

select distinct(ca10dpno) from ods.capf10  where ca10dpno = 420605;
select * from ods.papf30 where pa30brano ='420605'

SELECT CA10CNAME, CA10TEL, CA10ADDR, CA10DATEK
  FROM ODS.CAPF10 T1
 WHERE CA10TEL IS NOT NULL AND CA10TEL <> '0' 
   and CA10TEL = '13797606872'
   AND CA10DPNO ='12050';
   
----
select * from D_ACCMAN_SUB_SUM t
select * from  ods.ulns_acct_loan

----获取机构号
select * from rep.as2jg ;
-----零售部需求

select * from ODS.aapf10 ;
select * from dba_tables
 where lower(table_name) = 'pbpf10';

-----capf90 客户贷款状况信息

-----要查的数据就是8月底有余额的数据，没有余额可以不要。 
-----贷款'122','123','126','129','130','136' 存款('201', '202', '205', '211', '215', '235', '243', '251') 

select count(distinct(t.aa10ctid))
  from ods.aapf10 t
 where substr(aa10subj, 0, 3) in ('201', '202', '205', '211', '215', '235', '243', '251')
   and -aa10baly > 0;
   
select count(distinct(t.aa10name))
  from ods.aapf10 t
 where substr(aa10subj, 0, 3) in ('122', '123', '126', '129', '130', '136')
   and aa10baly > 0;  
 
 select * from ods.adpf10 where ad10id = '931574';
 select * from ods.aapf10;

select aa10subj   from ods.aapf10 group by aa10subj order by aa10subj;
select substr(aa10subj,0,3)   from ods.aapf10 ;

select pb10subj,pb10name
  from ods.pbpf10 t
 where pb10subj in ('201', '202', '205', '211', '215', '235', '243', '251') 
    or pb10subj in ('122','123','126','129','130','136') ;
 
select '231312',substr2('231312',0,3) from dual;

---对公明细 2480户
select t.aa10ctid,sum(-t.aa10baly) 
  from ods.aapf10 t
  left join ods.adpf10 t1
    on t.aa10acid  = t1.ad10id 
 where substr(t.aa10subj, 0, 3) in ('201', '202', '205', '211', '215', '235', '243', '251')
   and -t.aa10baly > 0
   and t.aa10dpnok in ('12010','12020','12040','12050','12080','12100')
 group by t.aa10ctid;
 
select t.aa10dpnok,t.aa10ctid,t.aa10name,t1.ad10acno,-t.aa10baly ,sum(-t.aa10baly) over (partition by aa10ctid )
  from ods.aapf10 t
  left join ods.adpf10 t1
    on t.aa10acid  = t1.ad10id 
 where substr(t.aa10subj, 0, 3) in ('201', '202', '205', '211', '215', '235', '243', '251')
   and -t.aa10baly > 0
   and t.aa10dpnok in ('12010','12020','12040','12050','12080','12100')
   order by t.aa10dpnok;

----个人储蓄明细  90195户
select t.ab10dpnok,t.ab10acid,t.ab10ctid,t.ab10name,t1.ad10acno,t.ab10baly,sum(t.ab10baly) over (partition by t.ab10ctid  ) 
  from  ods.abpf10 t 
  left join ods.adpf10 t1
      on t.ab10acid  = t1.ad10id 
  where substr(t.ab10subj, 0, 3) in ('201', '202', '205', '211', '215', '235', '243', '251')
   and t.ab10dpnok in ('12010','12020','12040','12050','12080','12100')
   and t.ab10baly > 0
   order by t.ab10dpnok;
 
 --90195户
 select t.ab10ctid,sum(t.ab10baly) 
  from  ods.abpf10 t 
  left join ods.adpf10 t1
      on t.ab10acid  = t1.ad10id 
  where substr(t.ab10subj, 0, 3) in ('201', '202', '205', '211', '215', '235', '243', '251')
   and t.ab10dpnok in ('12010','12020','12040','12050','12080','12100')
 group by t.ab10ctid
   having( sum(t.ab10baly) ) > 0 ;

----建表语句查询
select dbms_metadata.get_ddl('TABLE','ADPF10','ODS') from user_tables where table_name='ADPF10';

select dbms_metadata.get_ddl("INDEX","INDXX_PQZJYW","SHQSYS") from dual;

select  * from user_tables ;

truncate  table ods.adpf10_test;

SELECT * FROM ODS.Adpf10_Test;
SELECT count(*) FROM ODS.Adpf10;


select * from ods.plns_acct_loan;
select * from ods.ulns_acct_loan;
---adpf10:储蓄分户
---abpf10:个人存款动户余额表
---abpf20:储蓄分户明细
---aapf10:对公分户
---aapf20:对公分户明细
---acpf10:理财卡垫款登记簿
---acpf40:一卡通子户信息
---capf10:客户基本信息
---gapf20:总帐明细日计表
---plns_acct_loan:
---plns_business_contract:
---plns_customer_info:
---plns_t_fact_loan:
---ulns_acct_loan:
---ulns_acct_subledger_detail:
---ulns_business_contract:
---ulns_business_duebill: 
---ulns_code_library: 
---ulns_customer_info: 
---ulns_t_fact_loan: 
---rapf10:开销户登记簿
---rapfl0:
---batchdetail: 

----个人储蓄明细  90195户
select t.ab10dpnok,
       t.ab10acid,
       t.ab10ctid,
       t.ab10name,
       t1.ad10acno,
       t.ab10baly,
       sum(t.ab10baly) over(partition by t.ab10ctid)
  from ods.abpf10 t
  left join ods.adpf10 t1
    on t.ab10acid = t1.ad10id
 where substr(t.ab10subj, 0, 3) in ('201', '202', '205', '211', '215', '235', '243', '251')
   and t.ab10dpnok in ('12010', '12020', '12040', '12050', '12080', '12100')
   and t.ab10baly > 0
 order by t.ab10dpnok;
   
-----
select * from ods.adpf10;
select * from ods.abpf20 where ab20acno ='621270071000044310' and ab20date='20131228';   
select * from ods.batchdetail where ACCTNO='621270071000044310';
select * from ods.abpf20 where ab20acno ='621270071000044310' ;
select * from ods.abpf10 where ab10acid='525615';
select * from ods.abpf30;
select * from plns_acct_loan;
select * from ods.plns_acct_loan;
   
   
--2150101 整存整取三个月储蓄存款
--2150102 整存整取六个月储蓄存款
--2150104 整存整取一年储蓄存款 
--2150105 整存整取两年储蓄存款
--2150106 整存整取三年储蓄存款
--2150107 整存整取五年储蓄存款

select * from rep.as2jg ;

select t1.ab10dpnoa,
       t1.ab10ctid,
       t1.ab10acid,
       t1.ab10name,
       t2.ca10tel,
       t1.ab10subj,
       t1.ab10dateit,
       t1.ab10datmtr,
       t1.ab10amt2
  from ods.abpf10 t1
  left join ods.capf10 t2
    on  t1.ab10ctid = t2.ca10cid
 where t1.ab10dpnoa = '12070' --核算机构？
      --- and ab10subj = '2150101' 
   and t1.ab10amt2 <> '0'
   and to_char(t1.ab10datmtr, 'yyyymmdd') >= '20160101'
   and to_char(t1.ab10datmtr, 'yyyymmdd') <= '20160331'
   and ab10name='陈利梅';
   
select t1.ca10cno, t1.ca10cname
  from ods.capf10 t1 
 where t1.ca10cname = '陈利梅';
 
 select * from ods.pbpf10;
 
 select * from ods.rapfl0; ---止付登记簿
 select * from ods.rapfl0; ---开销户登记簿

----襄城支行

select * from rep.cardflag;
----机构编码查询
select * from rep.as2jg;

---- 职工编号
select * from d_user_change where zgmc='胡剑星';

----部门编码120
select * from ods.pbpf10;
select * from rep.d_user_change;
select * from rep.d_user_account_change;
select * from rep.d_unit_sub_sum where bmdm='120' and to_char(rq,'yyyymmdd')='20151223';
select * from rep.d_sum_code;
select * from rep.ae30dkdz_new;


---- 职工编号对应多个账户，职工编号即为揽存人
select * from D_USER_ACCOUNT_CHANGE t where t.zgbh='1228';
select * from D_USER_ACCOUNT_CHANGE t where zh='120200124300001001';

---aapf10
----plns_t_fact_loan.unl 0

select count(*) from ods.capf10 t1 
where to_char(t1.aa20date,'yyyymmdd') = '20160111';


select count(*)  from ods.aapf20 t1 where  t1.date_t='20160111' ;

select * from ods.batchdetail t1 ;

select count(*) from ods.gapf20 t1 
where  to_char(t1.ga20date,'yyyymmdd')='20160111' ;

select count(*)  from ods.aapf10 t1 where t1.AB20DATE='20160111';


----数据核对
wc -l cat adpf10.unl abpf10.unl abpf20.unl aapf10.unl aapf20.unl acpf10.unl acpf40.unl capf10.unl gapf20.unl plns_acct_loan.unl plns_business_contract.unl plns_customer_info.unl plns_t_fact_loan.unl ulns_acct_loan.unl ulns_acct_subledger_detail.unl ulns_business_contract.unl ulns_business_duebill.unl ulns_code_library.unl ulns_customer_info.unl ulns_t_fact_loan.unl rapfl0.unl rapf10.unl batchdetail.unl  ulns_acct_subledger_detail
select count(*) from ods.adpf10;
select count(*) from ods.abpf10;
select count(*) from ods.aapf10;
select count(*) from ods.acpf10;
select count(*) from ods.acpf40;
select count(*) from ods.capf10;
select count(*) from ods.plns_acct_loan;
select count(*) from ods.plns_business_contract;
select count(*) from ods.plns_customer_info;
select count(*) from ods.plns_t_fact_loan;
select count(*) from ods.ulns_acct_loan;
select count(*) from ods.ulns_acct_subledger_detail;
select count(*) from ods.ulns_business_contract;
select count(*) from ods.ulns_business_duebill;
select count(*) from ods.ulns_code_library;
select count(*) from ods.ulns_customer_info;
select count(*) from ods.ulns_t_fact_loan;
select count(*) from ods.rapfl0;

-----append
wc -l abpf20.unl aapf20.unl gapf20.unl rapf10.unl batchdetail.unl 

select count(*) from ods.abpf20 t1 where t1.ab20date='20160410';
select count(*) from ods.aapf20 t2 where to_char(t2.aa20date,'yyyymmdd')='20160401';
select count(*) from ods.gapf20 t3 where to_char(t3.ga20date,'yyyymmdd')='20160401';
select count(*) from ods.rapf10 t4 where t4.ra10date='20160401';
select count(*) from ods.batchdetail t5 where t5.date_t='20160401'; 

-----科目表

select * from ods.pbpf10 t1 where t1.pb10name like '%汇款%';
select * from ods.pbpf10 t1 where t1.pb10name like '%保证金%';


select *
  from rep.as2jg t1
 where t1.jgmc in ('营业部',
                   '襄城支行',
                   '车城支行',
                   '长虹支行',
                   '汉江支行',
                   '光彩支行',
                   '中原支行',
                   '谷城支行',
                   '老河口支行',
                   '檀溪支行',
                   '前进支行',
                   '宜城支行',
                   '枣阳支行',
                   '襄州支行',
                   '宝石支行',
                   '南漳支行',
                   '紫薇支行',
                   '保康支行',
                   '胜利支行');
 select t1.ab10dpnoa,
       t1.ab10ctid,
       t1.ab10acid,
       t1.ab10name,
       t2.ca10tel,
       t1.ab10subj,
       t1.ab10dateit,
       t1.ab10datmtr,
       t1.ab10amt2
  from ods.abpf10 t1
  left join ods.capf10 t2
    on t1.ab10ctid = t2.ca10cid
 where t1.ab10dpnoa in ('12010','12020','12040','12050','12060','12070','12080','12090','12100','12110','12120','12130','12180','12140','12150','12160','12170','12190') --核算机构？
   and substr(t1.ab10subj,0,3) in ('215','211' )
   and t1.ab10amt2 <> '0'
   and to_char(t1.ab10datmtr, 'yyyymmdd') >= '20150101'
   and to_char(t1.ab10datmtr, 'yyyymmdd') <= '20151231';
   
--- and t1.ab10name in ('李志豪','袁芳洲','沈小燕','王金兰','刘春阳','张婕','黄林','吴筱','章张','李倩','佘礼云','王颖','王诗淇','汪羽','郑兴','尚爽','陈越','黄莹','陈亮','李鹏','郑琪','黄守瑞','张余  ','冯泳儒','陈婷婷','付媛媛','周倩','任晓光','卢倩文','王茜草','杨坤','向砚毫','李臻','尹诗','李娜','孟健','龚昭君','张玉娟');

select ab10oprm from abpf10;    
select * from rep.d_user_account_change  ;

----对公存款

select a.rq, b.zgmc, a.ZGBH, c.name, a.tjdm, a.kmye
  from D_ACCMAN_SUB_SUM a, D_USER_CHANGE b, D_BMCKJH c
 where a.zgbh = b.zgbh
   and to_char(b.jsrq, 'yyyymmdd') = '20991231'
   and b.bmdm = c.bmdm
   and a.TJDM = 'ndgck'
   and to_char(rq, 'yyyymmdd') = '20151231'
 order by c.name, a.zgbh;
 

----襄城支行账户对公查询 
 

select * from D_USER_ACCOUNT_CHANGE t where t.zgbh='1228';
select * from D_USER_ACCOUNT_CHANGE t where zh='120200124300001001';
select * from rep.as2jg;
select * from d_user_change t1
where length(t1.zgbh)=5
where zgmc='张民';

select *
  from D_USER_ACCOUNT_CHANGE t
 where t.zgbh in
       (select aa10cmng from ods.aapf10 t1 where t1.aa10cmng = '12200') ;
 
select *
  from D_USER_ACCOUNT_CHANGE t
 where t.zgbh in
       (select ab10oprm from ods.abpf10 t1 where t1.ab10oprm = '0461');

select * from ods.adpf10 t2 where t2.ad10acno ='120200124300001001';
select * from ods.aapf10 t3 where t3.aa10acid ='9474706'


select ad10acno zh,
       nvl(decode(substr(aa10cmng, 1, 1),
                  'x',
                  substr(aa10cmng, 2, 5),
                  substr(aa10cmng, 3, 4)),
           decode(aa10dpnok, '12000', '999999', aa10dpnok)) zgbh,
       to_date('20991231', 'yyyymmdd') jsrq
  from aapf10, adpf10
 where aa10acid = ad10id
   and substr(aa10actyp, 1, 1) in ('2', '5')
   and aa10stat != '1'
   and aa10dpnoa = '12020'
 ---  and aa10dpnoa like '12%'
   and ad10acno ='120200124300001001';
---------------------------
select * from D_USER_ACCOUNT_CHANGE t where t.zgbh='1228';
select * from D_USER_ACCOUNT_CHANGE t where zh='120200124300001001';
select * from rep.as2jg;
select * from d_user_change t1
where length(t1.zgbh)=5
where zgmc='张民';

select *
  from D_USER_ACCOUNT_CHANGE t
 where t.zgbh in
       (select aa10cmng from ods.aapf10 t1 where t1.aa10cmng = '12200') ;
 
select *
  from D_USER_ACCOUNT_CHANGE t
 where t.zgbh in
       (select ab10oprm from ods.abpf10 t1 where t1.ab10oprm = '0461');

select * from ods.adpf10 t2 where t2.ad10acno ='120200124300001001';
select * from ods.aapf10 t3 where t3.aa10acid ='9474706';


select ad10acno zh,
       nvl(decode(substr(aa10cmng, 1, 1),
                  'x',
                  substr(aa10cmng, 2, 5),
                  substr(aa10cmng, 3, 4)),
           decode(aa10dpnok, '12000', '999999', aa10dpnok)) zgbh,
       to_date('20991231', 'yyyymmdd') jsrq
  from aapf10, adpf10
 where aa10acid = ad10id
   and substr(aa10actyp, 1, 1) in ('2', '5')
   and aa10stat != '1'
   and aa10dpnoa = '12020'
 ---  and aa10dpnoa like '12%'
   and ad10acno ='120200124300001001';

-----稀土推广中心

select  * 
  from ods.adpf10 t1
  where t1.ad10acno='420601000120130001731';
  
select * from ods.aapf10 t2
  where t2.aa10acid='757339' ;
  
select * from ods.aapfb0;  

select * from ods.abpf10 t2 
 where t2.ab10acid='757339' ;
  
select * from ods.aapf20 t3 where t3.aa20acid = '757339';

----- 襄城支行有效开户数
select * from rep.as2jg;

select count(*) from ods.abpf10 t1
  where  t1.ab10dpnok ='12020'
  and    to_char(t1.ab10datopn,'yyyymmdd' )>= '20160101'
  and    t1.ab10stat != '1'
  and    t1.ab10bal >=1000;

---- 截止6月底应到期定期数（半年以上的）
  t1.ab10dpnok,
       t1.ab10dpnoa,
       t1.ab10acid,
       t1.ab10ctid,
       t1.ab10name,
       t1.ab10dateit,
       t1.ab10datmtr,
       t1.ab10bal,
       t1.ab10oprm     

select sum(t1.ab10bal)
  from ods.abpf10 t1
 where t1.ab10bal != 0
   and to_char(t1.ab10datmtr, 'yyyymmdd') <= '20160630'
   and to_char(t1.ab10datmtr, 'yyyymmdd') >= '20160331'
   and to_char(t1.ab10dateit, 'yyyymmdd') <= '20160101'
 --- and  t1.ab10dpnok !='12020' 
   and t1.ab10oprm in ('12020','1091','1219','1309','1320','1347','1352','1353','1357','1358','1360','1361','1502','1556','5296','5862','6408','6423')
  order by t1.ab10datmtr;

select * from rep.d_user_change t1 where t1.zgbh = '5296';

----获得工号
select distinct(zgbh)
  from rep.d_user_change t3
 where t3.zgmc in ('王雨霖',
                   '夏秋芳',
                   '李梅',
                   '王金兰',
                   '沈小燕',
                   '邹瑜',
                   '刘晓俊',
                   '李珊',
                   '李红',
                   '蔡少琴',
                   '邱海岚',
                   '胥应子',
                   '黄露',
                   '王昱菡',
                   '高青洲',
                   '肖静',
                   '徐珊珊')
   and bmdm = '114';

select * from rep.d_bankcode;
  

select * from rep.as2jg;
select * from rep.d_user_change t where t.zgbh='5869';
select * from ods.abpf10 t where t.ab10oprm ='5869';
select * from rep.d_user_account_change where zgbh='5869';

select *
  from rep.d_user_account_change
 where zgbh = '12070'
   and zh in (select zh from rep.d_user_account_change where zgbh = '5869');

select *
  from ods.abpf20
 where ab20acno in ('6230760000001908505' ,'6230760000004344955');

--,'6230760000001908505' '6230760000004344955'
select * from ods.adpf10 t where t.ad10acno ='6230760000004344955';
select * from ods.adpf10 t where t.ad10id in ('9639550','10211670');
select * from ods.abpf10 t where t.ab10acid in ('9639550','10211670');
---t.ab10acid ='10211669';
 t.ab10name='彭朕';

------ 光彩支行朱云路日均余额

--select t4.ab20acid, t4.ab20date, t4.ab20acno, sum(t4.ab20bal)

select t4.ab20date, sum(t4.ab20bal)
  from (select t2.ad10id
          from (select zh
                  from rep.d_user_account_change
                 where zgbh = '12070'
                   and zh in (select zh
                                from rep.d_user_account_change
                               where zgbh = '5869')) t1
          left join ods.adpf10 t2
            on t1.zh = t2.ad10acno) t3
  left join ods.abpf20 t4
    on t4.ab20acid = t3.ad10id
 where t4.ab20date >= '20160114'
   and t4.ab20date <= '20160331'
group by  t4.ab20date;

select  t2.ab10acid,ab10name from ods.abpf10 t2;

---- 对公日均余额
select sum(-t4.aa20bal) sum_bal
  from (select t2.ad10id
          from (select zh
                  from rep.d_user_account_change
                 where zgbh = '12190'
                   and zh in (select zh
                                from rep.d_user_account_change
                               where zgbh = '5776')) t1
          left join ods.adpf10 t2
            on t1.zh = t2.ad10acno) t3
  left join ods.aapf20 t4
    on t4.aa20acid = t3.ad10id
 where to_char(t4.aa20date, 'yyyymmdd') >= '20160101'
   and to_char(t4.aa20date, 'yyyymmdd') <= '20160331';

--62773.6

select t.ab20acid, sum(t.ab20bal)/count(*)
  from ods.abpf20 t
 where t.ab20acid in (select b.ad10id
                        from (select zh
                                from rep.d_user_account_change
                               where zgbh = '12070'
                                 and zh in (select zh from rep.d_user_account_change where zgbh = '5869')) a
                        left join ods.adpf10 b
                          on a.zh = b.ad10acno )
   and t.ab20date >= '20160115'
   and t.ab20date <= '20160120'
   and  t.ab20acid = '9598836'
 group by t.ab20acid;

----朱云路数据检测

select t.ab20date, sum(t.ab20bal)
  from ods.abpf20 t
 where t.ab20acid in (select b.ad10id
                        from (select zh
                                from rep.d_user_account_change
                               where zgbh = '12070'
                                 and zh in (select zh from rep.d_user_account_change where zgbh = '5869')) a
                        left join ods.adpf10 b
                          on a.zh = b.ad10acno )
   and t.ab20date >= '20160119'
   and t.ab20date <= '20160331'
  --- and  t.ab20acid = '9598836'
 group by t.ab20date;

---如果为定期存款，但是存款余额在20160119-20160331之间余额未有变动，则未计入，但是仍然在其名下

---20160115之前的揽存及20160331之后到期的定期,日均余额:1291827.32


select sum(t.ab10bal)
---select t.ab10acid, t.ab10bal, t.ab10datmtr
  from ods.abpf10 t
 where t.ab10acid in (select b.ad10id
                        from (select zh
                                from rep.d_user_account_change
                               where zgbh = '12190'
                                 and zh in (select zh
                                              from rep.d_user_account_change
                                             where zgbh = '5776')) a
                        left join ods.adpf10 b
                          on a.zh = b.ad10acno)
   and to_char(t.ab10datmtr, 'yyyymmdd') > '20160331' ---到期日
   and to_char(t.ab10dateit, 'yyyymmdd') < '20150929';
  --- and t.ab10subj in 
  --- and t.ab10datmtr;
  --- 20160114 ~ 20160331 到期的定期

select t1.ab20acid,t1.ab20date,t1.ab20dateit,t1.ab20amt,t1.ab20bal
  from ods.abpf20 t1
 where t1.ab20acid in ('8544059',
                       '8934164',
                       '9007415',
                       '9118953',
                       '9151474',
                       '9194889',
                       '9261130',
                       '9337453',
                       '9898705',
                       '9951569',
                       '10038866',
                       '10044460',
                       '10049616',
                       '10102879')  
-- and t1.ab20dateit >='20160101'                                           
 order by t1.ab20acid,t1.ab20dateit;

select * from ods.abpf10 t1 where t1.ab10acid='8544059';

----活期日均储蓄：819386.429555556
---- 张泽光 75872.4788888889
select sum(t5.ab20bal)/90 from 
( select t.ab20acid, t.ab20date, t.ab20dateit, t.ab20amt, t.ab20bal
   from ods.abpf20 t
  where t.ab20acid in (select b.ad10id
                         from (select zh
                                 from rep.d_user_account_change
                                where zgbh = '12190'
                                  and zh in (select zh from rep.d_user_account_change
                                              where zgbh = '5776')) a
                         left join ods.adpf10 b
                           on a.zh = b.ad10acno)
    and t.ab20dateit >='20160101' 
    and t.ab20dateit <='20160331'  ---余额变动日期
  order by t.ab20acid,t.ab20dateit ) t5;                           

----是活期，但是余额在20160101~20160331 之间没有变动的

select sum(t5.ab20bal)/90 from 
( --select t.ab20acid, t.ab20date, t.ab20dateit, t.ab20amt, t.ab20bal
select distinct(t.ab20acid)
   from ods.abpf20 t
  where t.ab20acid in (select b.ad10id
                         from (select zh
                                 from rep.d_user_account_change
                                where zgbh = '12070'
                                  and zh in (select zh from rep.d_user_account_change
                                              where zgbh = '5869')) a
                         left join ods.adpf10 b
                           on a.zh = b.ad10acno)
    and t.ab20dateit >='20160331' 
 ---   and t.ab20date <='20160101'  ---余额变动日期
  order by t.ab20acid,t.ab20dateit ) t5;  
   group by t.ab10datmtr
   and to_char(t.ab10dateit,'yyyymmdd')<'20160115'; 

--------------------------------------------------------------------------------------------------------
and t.ab20acid not in ('9370999',
                          '9255833',
                          '9033934',
                          '9667123',
                          '9889296',
                          '8547054',
                          '9770467',
                          '9971733',
                          '8830036',
                          '9120025',
                          '8702050',
                          '9575356',
                          '9044112',
                          '9041318',
                          '10063146',
                          '9181746',
                          '9190436',
                          '9067133',
                          '9772661',
                          '9589684',
                          '9472441',
                          '8804550',
                          '9455656',
                          '8584835',
                          '9193042')
------------------------------------------------------------------------------------------------------
select * from ods.abpf10 t1 where t1.ab10acid ='10102879';
select * from ods.abpf20 t1 where t1.ab20acid ='10102879';


--1838908.27666667
----朱云路数据检测
select t1.ab10acid from ods.abpf10 t1 where t1.ab10name in ('邓绍华'); --'陈垦','李正凤',

select *
  from ods.adpf10 t1
 where t1.ad10id in ('8511712','8519765',
                     '8533224',
                     '8590775',
                     '8590840',
                     '10038839',
                     '10038866',
                     '10102879',
                     '10168546',
                     '10168556',
                     '10168667');

select * from ods.abpf10 t1 where t1.ab10acid in ('9598836','10647132','8396553','9953420');

select t1.ab20acid, t1.ab20date, t1.ab20dateit, t1.ab20amt, t1.ab20bal
  from ods.abpf20 t1
 where t1.ab20acid in ('8511712',
                       '8519765',
                       '8533224',
                       '8590775',
                       '8590840',
                       '10038839',
                       '10038866',
                       '10102879',
                       '10168546',
                       '10168556',
                       '10168667')
   and t1.ab20dateit >= '20160101'
 order by t1.ab20acid, t1.ab20date;

select zgmc, name, rjkmye
  from d_accman_year_rj a, d_user_change b, b_m_sys_bran
 where tjdm = 'ndsck'
   and rq = to_date('20160331', 'yyyymmdd')
   and b.ksrq <= to_date('20160331', 'yyyymmdd')
   and b.jsrq >= to_date('20160331', 'yyyymmdd')
   and bmdm = code
 order by code;

----人均余额
select rq, sum(RJKMYE)
  from rep.d_accman_year_rj
 where zgbh = '5869'
   and to_char(rq, 'yyyymmdd') >= '20160119'
   and to_char(rq, 'yyyymmdd') <= '20160331'
 group by rq;

select * from rep.d_user_account_change t1 where t1.zh in ('121000109200088550','621217169305510690');
select * from rep.d_user_account_change t1 where t1.zh in ('120700102000015084','120700102000022940');

select *
  from ods.abpf20 t3
 where t3.ab20acid = '9953420';
 
 select * from ods.abpf10 t1 where t1.ab10acid = '9953420';
--------------------------

select * from rep.as2jg;
select * from rep.ZHENGGE;
select * from ods.bdpf_avg_dly_bal;
select * from  rep.bbb;
select * from  rep.bbbb;


-----日均余额

select zgmc, name, count(*)
  from rep.d_user_account_change a, rep.d_user_change b, rep.b_m_sys_bran, rep.bbb c
 where b.ksrq <= to_date('20151231', 'yyyymmdd')
   and b.jsrq >= to_date('20151231', 'yyyymmdd')
   and a.ksrq <= to_date('20151231', 'yyyymmdd')
   and a.jsrq >= to_date('20151231', 'yyyymmdd')
   and a.zgbh = b.zgbh
   and bmdm = code
   and a.zh = c.zh
 group by zgmc, name;
 
 select b.zgbh, zgmc, name, sum(ye)
   from d_user_account_change a,
        d_user_change         b,
        d_ds_fhzxx            c,
        b_m_sys_bran
  where b.ksrq <= to_date('20160331', 'yyyymmdd')
    and b.jsrq >= to_date('20160331', 'yyyymmdd')
    and a.ksrq <= to_date('20160331', 'yyyymmdd')
    and a.jsrq >= to_date('20160331', 'yyyymmdd')
    and a.zgbh = b.zgbh
    and a.zh = c.zh
    and bmdm = code
    and c.kmh in ('2150104',
                  '2150105',
                  '2150106',
                  '2150107',
                  '2150108',
                  '2150505',
                  '2150506')
  group by b.zgbh, zgmc, name
  order by name;
  
select a.zh, khbh "客户ID", zhye "单个账户余额", yehz "余额汇总", zgmc
  from d_user_account_change a,
       d_user_change b,
       (select *
          from bbb
         where khbh in (select khbh
                          from (select khbh, count(*)
                                  from bbb
                                 group by khbh
                                having count(*) > 1))) c
 where b.ksrq <= to_date('20160331', 'yyyymmdd')
   and b.jsrq >= to_date('20160331', 'yyyymmdd')
   and a.ksrq <= to_date('20160331', 'yyyymmdd')
   and a.jsrq >= to_date('20160331', 'yyyymmdd')
   and a.zgbh = b.zgbh
   and a.zh = c.zh;
  
-------聚丰天地交易明细及账号
select * from ods.adpf10 t1
 where t1.ad10acno='420603000120050001204';
  
select 
       AA20DPNOK,
       AA20ACID,
       AA20DATE,
       AA20SEQ,
       AA20BRIEF,
       AA20ABST,
       AA20CRDCLS,
       AA20CRDNO,
       AA20DC,
       AA20AMT,
       AA20BAL,
       AA20ACNO,
       AA20DPNO,
       AA20STAN,
       AA20TRCOD,
       AA20OPRR,
       AA20OPRC
  from ods.aapf20 t2
 where t2.aa20acid = '755582';

select t3.AA10DPNOK,t3.aa10acid,t3.aa10ctid,t3.aa10name,t3.AA10BAL from ods.aapf10 t3 where t3.aa10acid in 
(select t1.ad10id from ods.adpf10 t1
where t1.ad10acno in (select AA10DPNOA from ods.aapf10 t2
 where t2.aa10acid = '755582') );

----- 乌兰春都交易明细及账号
select * from ods.adpf10 t1
 where t1.ad10acno='120300120100011054';
 
select 
       AA20DPNOK,
       AA20ACID,
       AA20DATE,
       AA20SEQ,
       AA20BRIEF,
       AA20ABST,
       AA20CRDCLS,
       AA20CRDNO,
       AA20DC,
       AA20AMT,
       AA20BAL,
       AA20ACNO,
       AA20DPNO,
       AA20STAN,
       AA20TRCOD,
       AA20OPRR,
       AA20OPRC
  from ods.aapf20 t2
 where t2.aa20acid = '5516003';

------
select * FROM ODS.papf30;
select max(to_char(aa20date,'yyyymmdd')) from ods.aapf20;
select * from ods.capf10 t2 where t2.ca10cid ='755582';
select * from ods.capf20 t2 where t2.ca20cid ='755582';


drop table ods.test;
create table ods.test
(
  acc            varchar(12) not null,
  start_dt       varchar(32) not null, 
  bal_amt        varchar(12) not null
);

insert into ods.test values ('001','20140818','100.00');
insert into ods.test values ('001','20141003','200.00');
insert into test values ('001','20141005','400.00');
insert into test values ('001','20141021','100.00');
insert into test values ('002','20141006','500.00');
insert into test values ('002','20141008','100.00');
insert into test values ('002','20141014','300.00');
insert into test values ('002','20141024','100.00');

select * from ods.test;
select acc,sum(t1.bal_amt)/count(*) from  ods.test t1
group by t1.acc;

select acc,avg(t1.bal_amt) from  ods.test t1
group by t1.acc;

---20151231 各支行活期有效户
select * from rep.ccc;

insert into ccc
select b.zh, yehz, yg, a.khbh
  from (select khbh, max(ye) yg, sum(ye) yehz
          from d_ds_fhzxx
         where rq = to_date('20151231', 'yyyymmdd')
           and trim(kmh) in
               (select trim(tjdm) from d_sum_code where sjdm = 'grhq')
         group by khbh
        having sum(ye) >= 1000) a,
       rep.d_ds_fhzxx b
 where b.rq = to_date('20151231', 'yyyymmdd')
   and trim(kmh) in (select trim(tjdm) from d_sum_code where sjdm = 'grhq')
   and a.khbh = b.khbh
   and yg = ye;
   

select * from ccc;

--------- 工号1012 20160331半年期以上余额
select t2.AB20ACID,t2.ab20date,t2.ab20dateit,t2.ab20amt,t2.ab20bal
  from ods.abpf20 t2
 where t2.ab20acid in
       (select t1.ab10acid
          from ods.abpf10 t1
         where t1.ab10oprm = '1012'
          --- and substr(t1.ab10subj,0,3)= '215')
           and t1.ab10subj not in ('2150102','2150104','2150105','2150106','2150107'))
 and t2.ab20date = '20160331'
order  by t2.AB20ACID;

select substr('2150101',0,3) from dual;
 select t1.ab10acid,t1.ab10datmtr,t1.ab10datcur,t1.ab10baly,t1.ab10bal,t1.ab10subj
  from ods.abpf10 t1
 where t1.ab10oprm = '1012'
  and t1.ab10subj in ('2150102','2150104','2150105','2150106','2150107');
  
  
select * from ods.abpf20 t2 where t2.ab20acid='10112903';
  
-----襄阳市银行卡交易情况表  
  select * from ods.acpf10;
  select * from ods.acpf40;
  
  
----- 201 科目账户清单
--aa10atr :账户属性 0一般户 
select * from ods.aapf20; 

select t1.aa10dpnok, t2.ad10acno,t1.aa10name, t1.AA10FUND,t1.aa10datec,aa10bal,t4.zgmc,t1.aa10stat,t1.aa10datee
  from ods.aapf10 t1
  left join ods.adpf10 t2
    on t1.aa10acid = t2.ad10id
  left join rep.d_user_account_change t3
    on t2.ad10acno = t3.zh
  left join rep.d_user_change t4
    on t3.zgbh = t4.zgbh      
 where substr(aa10subj, 0, 3) = '201'
   and aa10stat in ('2','0')
   and to_char(t1.aa10datee,'yyyymmdd')<='20160331'
   and t3.ksrq <= to_date('20160331', 'yyyymmdd')
   and t3.jsrq >= to_date('20160331', 'yyyymmdd')
   and t4.ksrq <= to_date('20160331', 'yyyymmdd')
   and t4.jsrq >= to_date('20160331', 'yyyymmdd')
   order by aa10datee;


---- 车城大富豪酒店
select * from ods.adpf10 t1
 where t1.ad10acno='420604000120150005491';
 
select 
       AA20DPNOK,
       AA20ACID, ---账户标注
       AA20DATE,
       AA20SEQ,
       AA20BRIEF,--摘要编码
       AA20ABST, --摘要
       AA20CRDCLS, ---凭证种类
       AA20CRDNO,---凭证号
       AA20DC, ---借贷标志
       AA20AMT, ---发生额
       AA20BAL, ---余额
       AA20ACNO, ---对方账户
       AA20DPNO, ---发送机构
       AA20STAN, --- 流水号
       AA20TRCOD,--- 交易代码
       AA20OPRR,---记账员
       AA20OPRC --综合员
  from ods.aapf20 t2
 where t2.aa20acid = '758515';

----对公客户明细
select
 t2.ca20artnm
  from ods.aapf10 t1
  left join ods.capf20 t2
    on t1.aa10acid = t2.ca20cid;

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



--------
select *
  from ods.capf10 t1
 where t1.ca10crdid = '420625199107022525'
   and t1.ca10ctyp = '1';

select * from ods.capf30 t2 where t2.CA30WRKADR='谷城县富园化肥';
select * from ods.capf20 t0 where t0.CA20DSNO='420602568334812';

create table ods.id_card_test(
cust_name varchar(64),
card_type number(4),
card_num  varchar(128));


------4206010001200300077036
------420608000120040000125
select * from ods.abpf10;

select * from ods.adpf10 t1 
where t1.ad10acno='420608000120040000125';
select * from ods.aapf20 t2 where t2.aa20acid = '755382';


select * from ods.aapf10 t2 where t2.aa10acid = '754961';.
select * from ods.capf10 t2 where t2.ca10cid = '754961';


select * from ods.capf20 t2 
where t2.ca20cid= '754961';
  
------襄阳品星汽车 420601000120030003753
---- 湖北盛鼎九龙置业 420601000120040002233
---- 襄阳晨升商贸 120100120100013169
select * from ods.adpf10 t1
 where t1.ad10acno='120100120100013169';

select AA20DPNOK,
       AA20ACID   as "账户标注",
       AA20DATE as "日期",
       AA20SEQ,
       AA20BRIEF  as "要编码",
       AA20ABST   as "摘要",
       AA20CRDCLS as "凭证种类",
       AA20CRDNO  as "凭证号",
       AA20DC     as "借贷标志",
       AA20AMT    as "发生额",
       AA20BAL    as "余额",
       AA20ACNO   as "对方账户",
       AA20DPNO   as "发送机构",
       AA20STAN   as "流水号",
       AA20TRCOD  as "交易代码",
       AA20OPRR   as "记账员",
       AA20OPRC   as "综合员",
       aa20rmk,
       t2.aa20dpnod,
       t2.aa20dpname,
       t2.aa20named,
       t2.aa20occtm
  from ods.aapf20 t2
 where t2.aa20acid = '755382'
 ---'5565576';


----- 调户
select * from rep.D_USER_ACCOUNT_CHANGE;

select * from rep.d_user_change ;
 
select distinct (a.bmdm), b.name, b.ind
  from rep.D_UNIT_SUB_SUM a, rep.B_M_SYS_BRAN b
 where a.bmdm = b.code; --->106
 
select *
  from rep.d_user_change t1
 where t1.bmdm = '138'
   and to_char(t1.jsrq,'yyyymmdd') >='20991230'
   and  t1.zgmc = '胡利鸿'
   for update;
 
and bmdm ='132' for update;  
and zgbh ='1400' for update;   



--- 101	办公室	51
--- 133	安全保卫部	64

--- 112 公司金融
--- 132	前进支行	13
--- 121	汉江支行	15
--- 138	襄州支行	22
--- 139	宝石支行	16
--- 114	襄城支行	18
--- 131	檀溪支行	19
--- 115	樊城支行	14
--- 126	中原支行	12
--- 113	营业部	   10
--- 140	紫薇支行	17
--- 124	光彩支行	21
--- 115	樊城支行	14
--- 106	营运管理部	56
--- 128	河口支行	6
--- 116	车城支行	20

---人资要求调整
--- 2016/7/13

-- 
select * from rep.d_user_change t1 where t1.zgmc ='刘雪竹' for update;

select *
  from rep.d_user_change t2
 where zgbh in
       (select t1.zgbh from rep.d_user_change t1 where t1.bmdm = '138')
 order by t2.zgmc, t2.bmdm, t2.ksrq
   for update;

----襄州支行数据检测
select *
  from rep.d_user_account_change t2
 where t2.zgbh in
       (select zgbh
          from rep.d_user_change t1
         where t1.bmdm = '138'
           and to_char(t1.jsrq, 'yyyymmdd') >= '20991230')
           and t2.zgbh <> '1368'
   and to_char(t2.jsrq, 'yyyymmdd') = '20991231';

select * from rep.D_ACCMAN_SUB_SUM t3
where t3.zgbh in (select zgbh
          from rep.d_user_change t1
         where t1.bmdm = '138'
           and to_char(t1.jsrq, 'yyyymmdd') >= '20991230')
           and t3.zgbh <> '1368'
   and to_char(t2.jsrq, 'yyyymmdd') = '20991231';
select *  from fhzxx c;
select *
  from rep.d_user_account_change t2
 where t2.zgbh in
       (select zgbh
          from rep.d_user_change t1
         where t1.bmdm = '138'
           and to_char(t1.jsrq, 'yyyymmdd') >= '20991230')
           and t2.zgbh <> '1368'
   and to_char(t2.jsrq, 'yyyymmdd') = '20991231';

select * from rep.D_ACCMAN_SUB_SUM t3
where t3.zgbh in (select zgbh
          from rep.d_user_change t1
         where t1.bmdm = '138'
           and to_char(t1.jsrq, 'yyyymmdd') >= '20991230')
           and t3.zgbh <> '1368'
   and to_char(t2.jsrq, 'yyyymmdd') = '20991231';
   
---对公存贷款数据导入   
   
select ad10acno zh,
       nvl(ab10oprm, decode(ab10dpnok, '12000', '999999', ab10dpnok)) zgbh, ---揽存人
       to_date('20991231', 'yyyymmdd') jsrq
  from abpf10, adpf10
 where ab10acid = ad10id
   and ((ab10stat = 1 and ab10amt2 > 0) or ab10stat = '0')
   and ab10dpnoa like '12%'
   and ab10oprm ='1547'
   and ab10datopn = ? ---开户日期
   

select *
  from rep.d_user_account_change t9
 where t9.zgbh ='999999'
   and t9.zh =   

   
   
---对私存贷款数据导入    
select ad10acno zh,
       nvl(decode(substr(aa10cmng, 1, 1),
                  'x',
                  substr(aa10cmng, 2, 5),
                  substr(aa10cmng, 3, 4)),
           decode(aa10dpnok, '12000', '999999', aa10dpnok)) zgbh,
       ? ksrq,
       to_date('20991231', 'yyyymmdd') jsrq
  from aapf10, adpf10
 where aa10acid = ad10id
   and substr(aa10actyp, 1, 1) in ('2', '5')
   and aa10stat != '1'
   and aa10datec = ?
   and aa10dpnoa like '12%';

/*create table rep.d_user_account_change_1547
as */
select *
  from rep.d_user_account_change t9
 where t9.zgbh ='999999'
   and t9.zh in 
(select ad10acno zh
  from ods.abpf10, ods.adpf10
 where ab10acid = ad10id
   and ((ab10stat = 1 and ab10amt2 > 0) or ab10stat = '0')
   and ab10oprm in (select zgbh
          from rep.d_user_change t1
         where t1.bmdm = '138'
           and to_char(t1.jsrq, 'yyyymmdd') >= '20991230')
  and ab10oprm <> '1368'
  and ab10oprm ='1437'
  and ab10dpnoa like '12%' );
   
select ab10oprm from ods.abpf10;

select * from rep.D_ACCMAN_SUB_SUM   ;
select * from rep.d_user_account_change
  
----襄阳市公共资源交易中心存款日均
select * from ods.capf10 t1
where t1.ca10name like '%襄阳公共资源交易中心%';


select * from ods.aapf10 t2 where t2.aa10name ='襄阳市公共资源交易中心';

--AA10ACID	AA10CTID
--756507	357609
-- sum(-t1.aa20bal)/156
select t1.aa20date,t1.aa20bal,t1.aa20occtm,t1.aa20amt,t1.aa20named,t1.aa20dpname
  from ods.aapf20 t1
 where (t1.aa20date,t1.aa20occtm) in 
       (select t2.aa20date, max(t2.aa20occtm)
          from ods.aapf20 t2
         where t2.aa20acid = '756507'
           AND TO_CHAR(T2.aa20date, 'yyyymmdd') >= '20151221'
           and TO_CHAR(T2.aa20date, 'yyyymmdd') <= '20160620'
         group by t2.aa20date)
order by t1.aa20date ;

--- t2.aa20date,sum(-t2.aa20bal)/count(t2.aa20date)


---20160331 活期储蓄日均余额
select  name, sum(rjkmye)/91
  from d_accman_year_rj a, d_user_change b, b_m_sys_bran
 where tjdm = 'ndsck'
   and rq = to_date('20160331', 'yyyymmdd')
   and b.ksrq <= to_date('20160331', 'yyyymmdd')
   and b.jsrq >= to_date('20160331', 'yyyymmdd')
   and a.zgbh = b.zgbh
   and bmdm = code
   group by name;

   
select sysdate from dual;   
select to_char(to_date(t2.aa20date,'yyyymmdd'),'day') from ods.aapf20 t2;
select to_char(t2.aa20date, 'day'),t2.aa20date
  from ods.aapf20 t2
 where t2.aa20acid = '756507'
   AND TO_CHAR(T2.aa20date, 'yyyymmdd') >= '20151221'
   and TO_CHAR(T2.aa20date, 'yyyymmdd') <= '20160620'
   group by t2.aa20date;

---- 对公分户账信息
select zh, rq, -ye
  from D_DG_FHZXX
 where zh = '420606000120090000227'
   and rq >= to_date('20151221', 'yyyy-mm-dd')
   and rq <= to_date('20160620', 'yyyy-mm-dd')
 order by rq;

----宜城襄大农牧有限公司
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
           and ca10cname like '%宜城襄大农牧有限公司%'
           and ad10acno = a.zh
           and a.ksrq <= to_date('20160622', 'yyyymmdd')
           and a.jsrq >= to_date('20160622', 'yyyymmdd')
           and b.ksrq <= to_date('20160622', 'yyyymmdd')
           and b.jsrq >= to_date('20160622', 'yyyymmdd')
           and a.zgbh = b.zgbh
           and bmdm != '120'
         order by ca10cno, a.zh);
         
select aa10dpnok "开户机构",
        ad10acno  "账户",
        aa10name  "账户名称",
        aa10datec "开始时间",
        aa10datee "结束时间",
        aa10subj  "科目号",
        pb10name  "科目名称"
   from ods.aapf10, ods.adpf10, ods.pbpf10
  where aa10acid = ad10id
    and aa10subj = pb10subj
    and aa10stat = '1'
    and aa10datee >= to_date('20160101', 'yyyymmdd')
    and aa10subj in (select trim(tjdm) from d_sum_code where sjdm in ('ndgck', 'dgbzj'))
  order by aa10dpnok, aa10subj;         

-----南漳支行调户

select * from rep.d_user_change t1  where t1.zgmc = '葛云霞' for update;

select *
  from rep.d_user_account_change t1 where substr(t1.zh,0,6)='621270'
-- where t1.zh in ('120100120100016816') for update --- '621270102710048729'
   where t1.zgbh = '5031'
select * from ods.abpf20 t1 where t1.ab20acno ='621270102710048729';

select * from rep.fhzxx;
select * from ods.adpf10 t3 where t3.ad10id ='6765364';
select * from ods.abpf10 t3 where t3.ab10acid ='6765365';
select * from ods.acpf10 t4 where t4.ac10id ='6765364';
select * from ods.abpf20 t5 where t5.ab20acid ='6765365';

select *
  from adpf10 a, acpf10 b, capf10 c,acpf40
 where a.ad10id = b.ac10id
   and b.ac10ctid = c.ca10cid
   and a.ad10acno ='621270102710048729';
 
--- adpf10 -> acpf10 ->acpf40 ->abpf10  
select * from ods.adpf10 t3 where t3.ad10acno='621270102710048729';
select * from ods.acpf10 t2 where t2.ac10id ='6765364';
select * from ods.acpf40 t4 where t4.ac40id ='6765364'; --6765365
select * from ods.abpf10 t5 where t5.ab10acid = '6765365';
select * from ods.capf10 t where t.ca10crdid = '420321198809286318';

select * from ods.capf30


--- 郭志生 卡号查账号 个人明细

--- adpf10 -> acpf10 ->acpf40 ->abpf10

select * from ods.adpf10 t3 where t3.ad10acno='6229590610000856865';
select * from ods.abpf10 t1 where t1.ab10name = '彭朕';
select * from ods.adpf10 t2 where t2.ad10id in ('9639550','10211670','611123');
select * from ods.abpf10 t1 where t1.ab10acid ='611123';

select * from ods.acpf10 t2 where t2.ac10id ='726600';
select * from ods.acpf40 t4 where t4.ac40id ='726600'; --6765365
select * from ods.abpf10 t5 where t5.ab10acid = '10211670';

select * from ods.adpf10 t3 where t3.ad10id ='2856863';

select * from ods.abpf20 t1 where t1.ab20acid ='611123'

select 
     ab20dpnoa   as  "核算机构" ,
     ab20acid    as  "帐户标识" ,
     ab20numt    as  "明细序号" ,    
     ab20saseq   as  "子 户 号" ,      
     ab20cur     as  "币种" ,   
     ab20notexc  as  "钞汇标志" ,        
     ab20date    as  "发生日期" ,    
     ab20dateit  as  "起息日期" ,       
     ab20brief   as  "摘要" ,  
     ab20dc      as  "借贷标志" ,
     ab20amt     as  "交易金额" ,       
     ab20bal     as  "余额",
     ab20trcod   as  "交易代码",         
     ab20acno    as  "交易帐号/卡号",      
     ab20dpno    as  "发生机构",         
     ab20stan    as  "流水号",  
     ab20opr1    as  "记帐员",  
     ab20opr2    as  "综合员",      
     ab20attr    as  "属性", 
     ab20amr     as  "正常积数", 
     ab20amrfb   as  "违约积数",
     t2.ab20dpnod,
     t2.ab20hm,
     t2.ab20named,
     t2.ab20fy,
     t2.ab20jytime
  from ods.abpf20 t2
 where t2.ab20acid = '611123';

--- 420603000120030003650

select *
  from ods.adpf10 t3
 where t3.ad10acno = '6230760000001699062';
 
select *  from ods.acpf40 t4 where t4.ac40id = '9248192';
 
select * from  ods.adpf10 t2 where t2.ad10id = '9248193';
 
select * from ods.abpf10 t where t.ab10acid ='9248193';

--2016/5/13
select *
  from rep.d_user_account_change t
 where t.zh  ='121700109200033013' for update;


select *
  from rep.d_user_account_change t
 where t.zh in
       (select t2.ad10acno
          from ods.adpf10 t2
         where t2.ad10id in
               (select t4.ac40acid
                  from ods.acpf40 t4
                 where t4.ac40id in
                       (select t3.ad10id
                          from ods.adpf10 t3
                         where t3.ad10acno = '6212700202700244187')))
   for update;

select * from  ods.abpf10 t1 where t1.ab10name ='襄阳港科家纺股份有限公司';


select * from ods.acpf10 t2 where t2.ac10id ='6765364';
select * from ods.acpf40 t4 where t4.ac40id ='6765364'; --6765365

select * from rep.d_user_account_change t where t.zh in ('120100109200110231','120100109200124323','121700109200002380') for update;

     
select c.ca10cname, c.ca10tel, c.ca10crdid
  from adpf10 a, acpf10 b, capf10 c
 where a.ad10id = b.ac10id
   and b.ac10ctid = c.ca10cid
   and substr(a.ad10acno, 1, 9) in
       ('621270202',
        '623076200',
        '621270302',
        '623076300',
        '621270802',
        '623076800');

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
           and a.zh = '621270102710048729'
           and ad10acno = a.zh
           and a.ksrq <= to_date('20160330', 'yyyymmdd')
           and a.jsrq >= to_date('20160330', 'yyyymmdd')
           and b.ksrq <= to_date('20160330', 'yyyymmdd')
           and b.jsrq >= to_date('20160330', 'yyyymmdd')
           and a.zgbh = b.zgbh
           and bmdm != '120'
         order by a.zh, ca10cno)

select substr(zh,0,6),zh from rep.d_user_account_change  t1 where t1.zh ='990027171401797116';

------郭艳客户明细

select t1.ab10acid,t4.ad10acno, t1.ab10name, t1.ab10subj,t3.pb10name
  from ods.abpf10 t1
  left join ods.pbpf10 t3
    on t1.ab10subj = t3.pb10subj
  left join ods.adpf10 t4
    on t4.ad10id = t1.ab10acid
 where t1.ab10acid in
       (select t2.ad10id from ods.adpf10 t2
         where t2.ad10acno in ('120100102000149392',
'120100102000149517',
'120100102000150101',
'120100102000151893',
'120100102000158211',
'120100102000153105',
'120100102000152107',
'120100102000151349',
'120100102000166271',
'120100102000149723',
'120100102000151950',
'120100102000154004',
'120100102000149244',
'120100102000149251',
'120100102000153709',
'120100102000155217',
'120100102000151265',
'120100102000149210',
'120100102000149533',
'120100102000152354',
'120100102000153113',
'120100102000151158',
'120100102000151166',
'120100102000149756',
'120100102000149681',
'120100102000151117',
'120100102000149384',
'120100102000151893',
'120100102000149277',
'120100102000149657',
'120100102000157007',
'120100102000150192',
'120100102000174267',
'120100102000151562',
'120100102000170307',
'120100102000149731',
'120100102000151091',
'120100102000149194',
'120100102000151927',
'120100102000151356',
'120100102000151372',
'120100102000152297',
'120100102000151257',
'120100102000174259',
'120100102000151935',
'120100102000155316',
'120100102000152347',
'120100102000152073',
'120100102000149574',
'120100102000149459',
'120100102000149665',
'120100102000151190',
'120100102000149293',
'120100102000150663',
'120100102000152305',
'120100102000149137',
'120100102000151992',
'120100102000152008',
'120100102000149616',
'120100102000186808',
'120100102000163500',
'120100102000149053',
'120100102000149061',
'120100102000149707',
'120100102000151612',
'120100102000183474',
'120100102000183375',
'120100102000153402',
'120100102000180199',
'120100102000151281',
'120100102000152016',
'120100102000152024',
'120100102000149202',
'120100102000152149',
'120100102000149418',
'120100102000151885',
'120100102000149095',
'120100102000151448',
'120100102000152172',
'120100102000151109',
'120100102000182849',
'120100102000149228',
'120100102000152214',
'120100102000151547',
'120100102000151497',
'120100102000149467',
'120100102000153899',
'120100102000150051',
'120100102000157940',
'120100102000176171',
'120100102000151182',
'120100102000149541',
'120400102000084984',
'120100102000152131',
'120100102000151943',
'120100102000149624',
'120100102000151653',
'120100102000150077',
'120100102000149335',
'120100102000150093',
'120100102000150291',
'120100102000149368',
'120100102000152321',
'120100102000149442',
'120100102000152339',
'120100102000151133',
'120100102000149772',
'120100102000178052',
'120100102000158112',
'120100102000151638',
'120100102000152289',
'120100102000152057',
'120100102000151489',
'120100102000149186',
'120100102000155100',
'120100102000152925',
'120100102000150184',
'120100102000149301',
'120100102000152032',
'120100102000149400',
'120100102000151075',
'120100102000154137',
'120100102000152040',
'120100102000152644',
'120100102000151141',
'120100102000149798',
'120100102000151471',
'120100102000173798'));

---- 车城支行调户

select * from ods.adpf10 t1 where t1.ad10acno ='120400125100010310';
select * from ods.aapf20 t2 where t2.aa20acid ='5533830';

select *  from rep.d_user_account_change t3 where t3.zh in ('120400120100013752',
'120400120100013349',
'120200120100013812',
'120400120100013760',
'120400120100013257',
'121100120100016301',
'120400120100013554',
'120400120100013281',
'120400120100013208',
'120400120100013331',
'420603000120070001242',
'420601000120020003342',
'120400120100013141',
'120400120100013422',
'120400120100013513',
'120400120100013521',
'120400120100013596',
'120400120100013604',
'120400120100013729',
'420601000120020003284',
'120400120100013620',
'120400120100013711',
'120400120100013448',
'120400120100010550',
'420604000120150003934',
'120400120100013679',
'420604000120150001565',
'420604000120150005558',
'420604000120150005210',
'420604000120150005293',
'420604000120150005384',
'420604000120150005459',
'420604000120150005483',
'120400120100011855',
'120400120100010063',
'120400120100010113',
'420604000120030002130',
'120400120100010501',
'120400120100010535',
'20400120100010618',
'120400120100010824',
'120400120100011061',
'120200120100013531',
'120400125100026159',
'120400125100026167',
'120400125100026175',
'120400125100010278',
'420604000120150005707',
'420603000120090001370',
'420606000120090000185',
'420604000120150005798',
'420604000120150004932',
'120400120100012325',
'120400120100012408',
'120400125100022331',
'420604000120150004965',
'120400120100012309',
'120300125100015609',
'120200120100013531',
'120200120100014075',
'121100120100016301',
'420601000120020003342',
'420604000120150002357',
'420604000120150002506',
'420604000120150002761',
'420604000120150002779',
'420604000120150002928',
'420604000120150003074',
'420604000120150003116',
'420604000120150003157',
'420604000120150003173',
'420604000120150003298',
'420604000120150003413',
'420604000120150003579',
'420604000120150003736',
'420604000120150003744',
'420604000120150003975',
'420604000120150004031',
'420604000120150004049',
'420604000120150004080',
'420604000120150004338',
'420604000120150004742',
'20604000120150004759',
'420604000120150004791',
'420604000120150004908',
'420604000120150004965',
'420604000120150005038',
'420604000120150005145',
'420604000120150005095',
'420604000120150005426',
'420604000120150005467',
'420604000120150005574',
'420604000120130001172',
'420604000120130001198',
'420604000120150001102',
'420604000120150001193',
'420604000120150001201',
'420604000120150001300',
'420604000120150001334',
'420604000120150001672',
'420604000120150001698',
'420604000120150001706',
'420604000120150001771',
'420604000120150001870',
'420604000120150001888',
'420604000120150002027',
'420604000120150002183',
'420604000120150002290',
'420604000120030002155',
'420604000120030002205',
'420604000120030002239',
'420604000120030002247',
'420604000120040001031',
'420604000120040001064',
'420604000120040001130',
'420604000120040001254',
'420604000120060000285',
'420604000120060000350',
'420604000120060000392',
'420604000120060000418',
'420604000120060000426',
'420604000120070001042',
'420604000120090001154',
'420604000120090001345',
'420604000120100001061',
'420604000120020001118',
'420604000120020001126',
'420604000120020001563',
'420601000120120001220',
'420601000124280000097');

------

select * from rep.d_user_account_change t2 where t2.zgbh ='5007' ;
select * from rep.d_user_change t1  where t1.zgmc = '陈悦' for update ;
select * from ods.abpf10 t where t.ab10name='彭';
select t1.rowid,t1.* from ods.capf10 t1 where t1.ca10name = '彭';
select * from ods.plns_t_fact_loan;
select * from ods.ulns_customer_info t2 where t2.customername = '彭';
