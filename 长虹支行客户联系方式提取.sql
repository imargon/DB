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
select * from dba_tables where lower(table_name) ='pbpf10';

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
---aapf10:拆借业务明细
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
