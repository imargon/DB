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

select aa10subj   from ods.aapf10 group by aa10subj order by aa10subj
select substr(aa10subj,0,3)   from ods.aapf10 

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
select dbms_metadata.get_ddl('TABLE','ADPF10','ODS') from user_tables
where table_name='ADPF10'

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


select count(*)  from ods.aapf20 t1 
where  t1.date_t='20160111' ;

select * from ods.batchdetail t1 ;

select count(*) from ods.gapf20 t1 
where  to_char(t1.ga20date,'yyyymmdd')='20160111' ;


select count(*)  from ods.aapf10 t1 
where t1.AB20DATE='20160111';


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
wc -l abpf20.unl aapf20.unl gapf20.unl .unl rapf10.unl batchdetail.unl 

select count(*) from ods.abpf20 t1 where t1.ab20date='20160410';
select count(*) from ods.aapf20 t2 where to_char(t2.aa20date,'yyyymmdd')='20160401';
select count(*) from ods.gapf20 t3 where to_char(t3.ga20date,'yyyymmdd')='20160401';
select count(*) from ods.rapf10 t4 where t4.ra10date='20160401';
select count(*) from ods.batchdetail t5 where t5.date_t='20160401'; 

-----科目表

select * from ods.pbpf10;

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

select  63682060.5/75 from dual;


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
---- 
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
select 

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
select * FROM ODS.papf30


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

----- 201 科目销户清单
select t1.aa10dpnok,t2.ad10acno, t1.aa10name, t1.aa10atr,t1.aa10stat,t1.aa10datee
  from ods.aapf10 t1
  left join ods.adpf10 t2
    on t1.aa10acid = t2.ad10id
 where substr(aa10subj, 0, 3) = '201'
   and aa10stat='1'
   and to_char(aa10datee,'yyyymmdd')>='20160401'
   and to_char(aa10datee,'yyyymmdd')<='20160430'
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

   and t3.ksrq <= to_date('20160331', 'yyyymmdd')
   and t3.jsrq >= to_date('20160331', 'yyyymmdd')
   and t4.ksrq <= to_date('20160331', 'yyyymmdd')
   and t4.jsrq >= to_date('20160331', 'yyyymmdd')

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
       JGMC,
       t1.CA10CNO,
       t1.CA10DATEK,
       t1.CA10CNAME,
       t1.CA10CRDTYP,
       t1.CA10CRDID,
       t1.CA10VLDDAT,
       t2.CA20ARTNM,
       t2.CA20ARTSGN,
       '法定代表人证件类型',
       '法定代表人证件号码',
       '法定代表人证件有效期',
       t1.CA10TEL,
       t1.CA10ADDR,
       t1.CA10PCOD,
       t2.CA20AREA,
       t2.CA20BLICID,
       t2.CA20OPNPRT,
       t2.CA20LICDAT,
       t2.CA20CAPI,
       t2.CA20LOGADD,
       t2.CA20RELPER,
       t2.CA20RELMOB,
       '法人代码证证号',
       t2.CA20GSNO,
       t2.CA20DSNO,
       t1.CA10STS
  from ods.capf10 t1
  left join ods.capf20 t2
    on t1.ca10cid = t2.ca20cid
  ---   on t1.CA10CRDID = t2.ca20relmal
  left join rep.as2jg t3
     on t1.ca10dpno = t3.jgbm
  where t1.ca10ctyp ='2';
  
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
card_num  varchar(128)
);



select CA10DPNO,
       JGMC,
       CA10CNO,
       CA10DATEK,
       CA10CNAME,
       CA10CRDTYP,
       CA10CRDID,
       CA10VLDDAT,
       DECODE(CA30SEX, '0', '男', '1', '女', CA30SEX),
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
   and t1.ca10crdid in (select card_num from ods.id_card_test);



------4206010001200300077036

select * from ods.abpf10;

select * from ods.adpf10 t1 
where t1.ad10acno='420601000120030007036';
select * from ods.aapf20 t2 where t2.aa20acid = '754961';
and t2.;


select * from ods.aapf10 t2 where t2.aa10acid = '754961';


select * from ods.capf10 t2 where t2.ca10cid= '754961';


select * from ods.capf20 t2 
where t2.ca20cid= '754961';
  
  
  
  
  
  
  
