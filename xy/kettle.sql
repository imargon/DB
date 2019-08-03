select ad10acno   zh,
       aa10ctid   khbh,
       aa10subj   kmh,
       aa10baly   ye,
       aa10amtd   jfse,
       aa10amtc   dfse,
       aa10limtx  xded,
       aa10limtd  xzje,
       aa10limtt  tdqxe,
       aa10datec  khr,
       aa10datee  dqr,
       aa10subcod jxbm,
       aa10itrz   zclv,
       aa10itrm   yxlv,
       aa10itrf   tzlv
  from aapf10, adpf10
 where aa10acid = ad10id;
 
select to_date(rq, 'yyyy/mm/dd') from rep.d_dg_fhzxx;
select rq from rep.d_dg_fhzxx;
select length(rq) from rep.d_dg_fhzxx;
select count(*)
  from rep.d_dg_fhzxx
 where rq = to_date('20150201', 'yyyy-mm-dd');

select * from rep.d_dg_fhzxx where to_char(rq, 'yyyymmdd') = '20160329';

select * from rep.D_DS_FHZXX where to_char(rq, 'yyyymmdd') = '20160329';
--D_DS_FHZXX
delete from rep.D_DS_FHZXX where to_char(rq, 'yyyymmdd') = '20150201';
---2
delete from rep.d_dg_fhzxx where to_char(rq, 'yyyymmdd') = '20150201';
---d_dg_fhzxx
delete from rep.d_dg_fhzxx where to_char(rq, 'yyyymmdd') = '20150201';

delete from rep.D_DS_FHZXX where to_char(rq, 'yyyymmdd') = '20151214';
select ?          rq,
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
   and ab10dpnok like '12%';

---5 d_user_account_change
select *
  from rep.d_user_account_change
 where to_char(ksrq, 'yyyymmdd') = '20150201';
delete from rep.d_user_account_change
 where to_char(ksrq, 'yyyymmdd') = '20150201';
delete from rep.D_ACCMAN_SUB_SUM
 where to_char(rq, 'yyyymmdd') = '20150201';
---delete from rep.D_UNIT_SUB_SUM where to_char(rq, 'yyyymmdd') = '20150201';
 
 ---3 D_DK_GS_FHZXX
select * from rep.D_DK_GS_FHZXX;
----delete from rep.D_DK_GS_FHZXX where  to_char(rq,'yyyymmdd')='20150201';

select * from rep.D_DK_GR_FHZXX
---4
---delete from rep.D_DK_GR_FHZXX where  to_char(rq,'yyyymmdd')='20150201';

--- Kettle数据回滚
--- 1.select  count(*) from  rep.D_DS_FHZXX where  to_char(rq,'yyyymmdd')='20160228';

---delete from  rep.D_DS_FHZXX where  to_char(rq,'yyyymmdd')='20160405';

---2.d_dg_fhzxx
---delete  from rep.d_dg_fhzxx where  to_char(rq,'yyyymmdd')='20160405';

---3.D_DK_GR_FHZXX
---delete from rep.D_DK_GR_FHZXX where  to_char(rq,'yyyymmdd')='20160405';

---4.rep.d_user_account_change
---delete from rep.d_user_account_change where to_char(ksrq,'yyyymmdd')='20160405';

---5.rep.D_ACCMAN_SUB_SUM
---delete  from rep.D_ACCMAN_SUB_SUM where to_char(rq,'yyyymmdd')='20160405';

---6.rep.D_UNIT_SUB_SUM
---delete from rep.D_UNIT_SUB_SUM where to_char(rq,'yyyymmdd')='20160405';

---7.rep.D_DK_GS_FHZXX
--- select * from rep.D_DK_GS_FHZXX where  to_char(rq,'yyyymmdd')='20160228';
---delete from rep.D_DK_GS_FHZXX where  to_char(rq,'yyyymmdd')='20160405';

---8.
select * from ulns_t_fact_loan;
select * from rep.i_khxx_new;
select * from rep.d_user_account_change
select * from rep.d_accman_sub_sum where to_char(rq,'yyyymmdd')='20160405';

select * from rep.D_UNIT_SUB_SUM where to_char(rq,'yyyymmdd')='20160405';
select  ad10acno zh,aa10ctid khbh,aa10subj kmh,aa10baly ye,
aa10amtd jfse,aa10amtc dfse,aa10limtx xded,aa10limtd xzje,aa10limtt tdqxe,
aa10datec khr,aa10datee dqr,aa10subcod jxbm,
aa10itrz zclv,aa10itrm yxlv,aa10itrf tzlv from aapf10,adpf10 where  aa10acid = ad10id;
select to_date(rq,'yyyy/mm/dd') from rep.d_dg_fhzxx;
select rq from rep.d_dg_fhzxx where ;
select length(rq) from rep.d_dg_fhzxx;
select count(*) from rep.d_dg_fhzxx 
where rq=to_date('20151214','yyyy-mm-dd');

select *  from rep.d_dg_fhzxx where  to_char(rq,'yyyymmdd')='20151213';

select * from rep.D_DS_FHZXX where  to_char(rq,'yyyymmdd')='20151214';

delete from rep.D_DS_FHZXX where  to_char(rq,'yyyymmdd')='20151214';
select ? rq,ad10acno zh,ab10ctid khbh,ab10subj kmh,ab10savcod jxbm,
ab10amt2 ye,ab10amtlim xzje,ab10amtctl kzje,ab10amtodc tzkzje,
ab10itrt zclv,ab10itrm tblv,ab10datopn khr,ab10dateit qxr,ab10datmtr dqr
 from abpf10,adpf10
where ab10acid = ad10id
and ((ab10stat = 1 and   ab10amt2 >0 ) or  ab10stat = '0' )
and ab10dpnok like '12%' ;

