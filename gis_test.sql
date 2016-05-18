
---drop table gis_info;
truncate table gis_info;
select * from gis_info for update ;

/*create table gis_info (
gis_date varchar2(8),
gis_imei varchar2(100),
y_1   number(16,9),       x_1 number(16,9),
y_2   number(16,9),       x_2 number(16,9),
y_3   number(16,9),       x_3 number(16,9),
y_4   number(16,9),       x_4 number(16,9),
y_5   number(16,9),       x_5 number(16,9),
y_6   number(16,9),       x_6 number(16,9),
y_7   number(16,9),       x_7 number(16,9),
y_8   number(16,9),       x_8 number(16,9),
y_9   number(16,9),       x_9 number(16,9),
y_10  number(16,9),      x_10 number(16,9),
y_11  number(16,9),      x_11 number(16,9),
y_12  number(16,9),      x_12 number(16,9),
y_13  number(16,9),      x_13 number(16,9),
y_14  number(16,9),      x_14 number(16,9),
y_15  number(16,9),      x_15 number(16,9),
y_16  number(16,9),      x_16 number(16,9),
y_17  number(16,9),      x_17 number(16,9),
y_18  number(16,9),      x_18 number(16,9),
y_19  number(16,9),      x_19 number(16,9),
y_20  number(16,9),      x_20 number(16,9),
y_21  number(16,9),      x_21 number(16,9),
y_22  number(16,9),      x_22 number(16,9),
y_23  number(16,9),      x_23 number(16,9),
y_24  number(16,9),      x_24 number(16,9)); */


create table imei_cluster (
gis_imei varchar2(100),
im_cluster number(2)
);

create table imei_count (
gis_imei varchar2(100),
count_num number(4)
);


---115701 
insert into ods.imei_count
select gis_imei, count(gis_imei) as c1 from ods.gis_info 
group by gis_imei
order by  c1;

---1048576
select *
  from ods.gis_info t1
 where t1.gis_imei in ('02633ead2f2d8da761ec31e6ad1311a5',
                       '5ba50fae9423b0b3c6e40d7f779482b5',
                       '321960d39477194042813e73020dc38d',
                       'd41ceb9cad60cfe5a6fa320389c38dc2',
                       '2055113c7522c5f61511c4a7276af40b',
                       '006d86a9320f1fd053f6c7607d32fa07',
                       '8387aa3fc6a7006946b67e7450c13a98',
                       'da7eb05faecef79d2077ec48c6d26f24')
 order by t1.gis_imei, t1.gis_date;


select *
  from ods.gis_info t1
 where t1.gis_imei in ('5ba50fae9423b0b3c6e40d7f779482b5',
                       '321960d39477194042813e73020dc38d',
                       'd41ceb9cad60cfe5a6fa320389c38dc2',
                       '3ea9ed9d81300fcbf697faeccab228b1',
                       '837b17e6b5730105a82a7c5b3afaa268',
                       'aea3c0ea31d4d7d26b812b1f26b8a537',
                       'ac2128830b39562b8e72e32ce05f4878',
                       'f11c809f9aa1b0cdd11d74faa0b6ae4c',
                       '8d2e364d969255e290b17a4589450627',
                       '232351049b685b194566bf56394ccfee',
                       '4d44b94e0b0c09fa9dafa07097fe2c6d',
                       '45ea7468a01d49e17d6cc041c9a6273b',
                       '6bdcbd28859acb746f80bfdb0005771d',
                       '04225e06d9a9210438456f7fd687dc3f',
                       '5d51b6345a20db35711ae8a2540c6eb3',
                       'faa004319aa9cc922c6fcc91457bba81',
                       '977271176e2134209d1173da36abbff7',
                       '524f7d9f79c98ab556e1e5911540003a',
                       '0fa11318ee4ba9f458bb65ce0ed26e75',
                       'f1e450506f9d6ff7f9e5f75d774ef3af',
                       '983df632120d5d8f2f7024feb0517ebb',
                       'e3064afd09793634f2b2d51c3fecf149',
                       '3fc5612efe6d3c73a74209d4828f94a2',
                       '821029fcc970c8f6af2f9ea0cf03e08b',
                       '32122dea2b4db6846c3b2a2f45df2d8b',
                       '1ce251491c9e87587c33c8e18bdc5905',
                       'b0a45e2c8c686abccc5c42ac817a656e',
                       '8f1bc2f639af71710dfa3e570f5a2701',
                       '6f9d55912f385af345e7127bf2bffcd2',
                       '651af16d35739e63f9a2544fffb6d9ba',
                       'd15979b1192d0b32adaaf92dbe4d0937',
                       '271c1d10ed072a442be1dad324198c24',
                       '189911584946e81210631497ad1f5b5d',
                       '77078c137f1232bbf876f66960fbee7c')
 order by t1.gis_imei, t1.gis_date;

--- 验证聚类
select t1.gis_imei, t1.im_cluster, t2.count_num
  from ods.imei_cluster t1
  left join ods.imei_count t2
    on t1.gis_imei = t2.gis_imei
    order by t1.im_cluster


select *
  from ods.gis_info t1
 ---where t1.gis_imei in ('da7eb05faecef79d2077ec48c6d26f24')
 order by t1.gis_imei, t1.gis_date;


select gis_imei, count(gis_imei) as c1
  from ods.gis_info
 group by gis_imei
 order by c1;

select t1.gis_date,t1.gis_imei,
       (y_1+y_2+y_3+y_4+y_5+y_6+y_7+y_8)/8
  from ods.gis_info t1

 order by t1.gis_imei, t1.gis_date;



select t1.gis_date, t1.gis_imei, y_1,x_1
  from ods.gis_info t1
 where t1.y_1 is null;



