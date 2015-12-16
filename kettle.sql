select  ad10acno zh,aa10ctid khbh,aa10subj kmh,aa10baly ye,
aa10amtd jfse,aa10amtc dfse,aa10limtx xded,aa10limtd xzje,aa10limtt tdqxe,
aa10datec khr,aa10datee dqr,aa10subcod jxbm,
aa10itrz zclv,aa10itrm yxlv,aa10itrf tzlv
 from aapf10,adpf10
where  aa10acid = ad10id;
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
