
select * from gis_info;

---115701 
---insert into ods.imei_count
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

select *
  from ods.gis_info t1
  where t1.gis_imei in ('99e7e093f00fa32f36b051c18de98380','ff7cfb0e717cc3a48af443209168ef92','28b8be54616adf7f0be771a1c5e46968')
 order by t1.gis_imei, t1.gis_date;

select t1.gis_date, t1.gis_imei,avg(nvl(y_1,0)+nvl(y_2,0)+nvl(y_3,0)+nvl(y_4,0))
  from ods.gis_info t1
 where t1.gis_imei in ('99e7e093f00fa32f36b051c18de98380','ff7cfb0e717cc3a48af443209168ef92')
 group by t1.gis_date, t1.gis_imei
  order by t1.gis_imei, t1.gis_date;


select t1.gis_date,
       t1.gis_imei,
       (nvl(y_1, 0) + nvl(y_2, 0) + nvl(y_3, 0) + nvl(y_4, 0)) /
       decode(decode(y_1, null, 0, 1) + decode(y_2, null, 0, 1) +
              decode(y_3, null, 0, 1) + decode(y_4, null, 0, 1),
              0,
              1,
              decode(y_1, null, 0, 1) + decode(y_2, null, 0, 1) +
              decode(y_3, null, 0, 1) + decode(y_4, null, 0, 1)) as y1,
          (nvl(x_1, 0) + nvl(x_2, 0) + nvl(x_3, 0) + nvl(x_4, 0)) /
       decode(decode(x_1, null, 0, 1) + decode(x_2, null, 0, 1) +
              decode(x_3, null, 0, 1) + decode(x_4, null, 0, 1),
              0,
              1,
              decode(x_1, null, 0, 1) + decode(x_2, null, 0, 1) +
              decode(x_3, null, 0, 1) + decode(x_4, null, 0, 1)) as x2
  from ods.gis_info t1
 where t1.gis_imei in ('99e7e093f00fa32f36b051c18de98380','ff7cfb0e717cc3a48af443209168ef92');

-----------
select t1.gis_date,
       t1.gis_imei,
       y_1,
       y_2,
       y_3,
       y_4,
       y_5,
       y_6,
       y_7,
       y_8,
       y_9,
       y_9,
       y_10,
       y_11,
       y_12,
       y_13,
       y_14,
       y_15,
       y_16,
       y_17,
       y_18,
       y_19,
       y_20,
       y_21,
       y_22,
       y_23,
       y_24
  from ods.gis_info t1;

---大宁地区
--31.233495, 121.442832 
--31.297068, 121.442832 （上）
--31.233495, 121.495635 （右）
--31.297068, 121.495635 （右上）

--- 北外滩
--31.234144,121.500431
--31.280260,121.500431(上)
--31.234144,121.553251(右)
--31.280260,121.553251(右上)

--区域三：卢湾地区。具体区域：以点三（经度121.424973，纬度31.18102）为起始点，向上延伸5.8km,向右延伸7km　划定的长方形区域
---31.18102,121.424973
---31.2332，121.424973(上)
---31.18102，121.47772（右）
---31.2332，121.47772（右上）


---区域四：三林地区。具体区域：以点四（经度121.507267，纬度31.187762）为起始点的，向上延伸5km,向右延伸5km，划定的长方形区域。
---31.187762,121.507267
---31.234017,121.507267(上)
---31.188961,121.559988(右)
---31.234017,121.559988（右上）

--- 1:大宁
--- 2:北外滩
--- 3:卢湾
--- 4:三林
---drop table ods.gis_info_loc;

   
/* where t5.gis_loc1 is not null
   or t5.gis_loc2 is not null
   or t5.gis_loc3 is not null
   or t5.gis_loc4 is not null
 order by t5.gis_imei,t5.gis_date;*/

----gis_info_loc1 大宁地区早上
---drop view gis_info_loc1;



create view gis_info_loc1
as
select t5.gis_imei, count(*) c1
          from ods.gis_info_loc t5
         where t5.gis_loc1 = '1'
         group by t5.gis_imei
         order by c1 desc;

 select t0.c1, count(t0.c1) c2
  from (select t5.gis_imei, count(*) c1
          from ods.gis_info_loc t5
         where t5.gis_loc1 = '1'
         group by t5.gis_imei
         order by c1 desc) t0
 group by t0.c1
 order by t0.c1;
 
select *
  from ods.gis_info_loc t5
 where t5.gis_loc1 = '1'
having count(t5.gis_imei) = 1;
  group by t5.gis_imei;

select * from ods.gis_info_cate t6
  where t6.gis_imei ='da7eb05faecef79d2077ec48c6d26f24'
  order by t6.gis_date;

---列最大最小值greatest,leatest
---行最大最小值max,min

select min(y1), min(x1)
  from ods.gis_info_cate t1
 where gis_imei in (select gis_imei from gis_info_loc1 where c1 = 7)
   and y1 != 0
   and x1 != 0;

---120.8851806,30.63446
---120.90879,30.63446,
---120.8851806,30.63446
---120.8851806,30.63446
---120.8851806,30.6378306
---120.92033,30.6378306
---120.8851806,30.71972601

select max(y1), max(x1)
  from ods.gis_info_cate t1
 where gis_imei in (select gis_imei from gis_info_loc1 where c1 = 7);
 
--122.0604694,31.84290001
--122.0604694,31.83738
--122.0604694,31.794718343
--122.0604694,31.77715001
--122.0604694,31.78423
--122.0604694,31.79010001
--121.92561,31.7849


select * from ods.gis_info_cate;
select * from ods.gis_info_loc;



--- 1:大宁 208760+4725(工作)
--- 2:北外滩 127774+2562(工作),130256()-770
--- 3:卢湾 238790+4391-444-65
--- 4:三林 103994++22285-5110


select * from ods.gis_info_loc1 t1 order by  t1.gis_imei,t1.gis_date;

select distinct(t1.gis_imei)
  from (select t0.gis_imei
          from ods.gis_info_loc t0
         where (nvl(t0.gis_loc1, 0) + nvl(t0.gis_loc2, 0) +
               nvl(t0.gis_loc3, 0) + nvl(t0.gis_loc4, 0)) /
               decode(decode(t0.gis_loc1, null, 0, 1) +
                      decode(t0.gis_loc2, null, 0, 1) +
                      decode(t0.gis_loc3, null, 0, 1) +
                      decode(t0.gis_loc4, null, 0, 1),
                      0,
                      1,
                      decode(t0.gis_loc1, null, 0, 1) +
                      decode(t0.gis_loc2, null, 0, 1) +
                      decode(t0.gis_loc3, null, 0, 1) +
                      decode(t0.gis_loc4, null, 0, 1)) = 1
                      or t0.gis_loc1 =2
                      or t0.gis_loc1 =2
                      or t0.gis_loc1 =2
                      or t0.gis_loc1 =2)t1 
  minus
                      select distinct(t1.gis_imei)
  from (select t0.gis_imei
          from ods.gis_info_loc t0
         where (nvl(t0.gis_loc1, 0) + nvl(t0.gis_loc2, 0) +
               nvl(t0.gis_loc3, 0) + nvl(t0.gis_loc4, 0)) /
               decode(decode(t0.gis_loc1, null, 0, 1) +
                      decode(t0.gis_loc2, null, 0, 1) +
                      decode(t0.gis_loc3, null, 0, 1) +
                      decode(t0.gis_loc4, null, 0, 1),
                      0,
                      1,
                      decode(t0.gis_loc1, null, 0, 1) +
                      decode(t0.gis_loc2, null, 0, 1) +
                      decode(t0.gis_loc3, null, 0, 1) +
                      decode(t0.gis_loc4, null, 0, 1)) = 2) t1;
                      
select count(distinct(t2.gis_imei))
  from ods.gis_info_loc t2
  where t2.gis_loc2=4
  and   t2.gis_loc3=4
  and   t2.gis_loc4=4
  and   t2.gis_loc1=4
 where t2.gis_imei in ('00198e653786001a4629a31d88d95873',
                       '0019cd8eb94a649af84f25b67de34733');


select *
  from ods.gis_info_loc t0
 where (nvl(t0.gis_loc1, 0) + nvl(t0.gis_loc2, 0) + nvl(t0.gis_loc3, 0) +
       nvl(t0.gis_loc4, 0)) /
       decode(decode(t0.gis_loc1, null, 0, 1) +
              decode(t0.gis_loc2, null, 0, 1) +
              decode(t0.gis_loc3, null, 0, 1) +
              decode(t0.gis_loc4, null, 0, 1),
              0,
              1,
              decode(t0.gis_loc1, null, 0, 1) +
              decode(t0.gis_loc2, null, 0, 1) +
              decode(t0.gis_loc3, null, 0, 1) +
              decode(t0.gis_loc4, null, 0, 1)) = 2
   and t0.gis_imei = 'a196b0f1a6ccf97902a764eb2d6f14f6';

select *
  from ods.gis_info_cate t1
 where t1.gis_imei = 'a196b0f1a6ccf97902a764eb2d6f14f6'
 order by t1.gis_date;


select *
  from ods.gis_info_loc t2
 where t2.gis_imei = 'a196b0f1a6ccf97902a764eb2d6f14f6'
 order by t2.gis_date;


--select count(distinct(t1.gis_imei)) from ods.gis_info t1;
--642548 IMEI

select count(*) from gis_info_loc1;
drop table ods.gis_info_loc1;

create view ogis_info_loc1
as select distinct(t1.gis_imei)
  from (select t0.gis_imei
          from ods.gis_info_loc t0
         where (nvl(t0.gis_loc1, 0) + nvl(t0.gis_loc2, 0) +
               nvl(t0.gis_loc3, 0) + nvl(t0.gis_loc4, 0)) /
               decode(decode(t0.gis_loc1, null, 0, 1) +
                      decode(t0.gis_loc2, null, 0, 1) +
                      decode(t0.gis_loc3, null, 0, 1) +
                      decode(t0.gis_loc4, null, 0, 1),
                      0,
                      1,
                      decode(t0.gis_loc1, null, 0, 1) +
                      decode(t0.gis_loc2, null, 0, 1) +
                      decode(t0.gis_loc3, null, 0, 1) +
                      decode(t0.gis_loc4, null, 0, 1)) = 1
                      or (t0.gis_loc2 =1
                      and t0.gis_loc3 =1
                      and t0.gis_loc1 !=1
                      and t0.gis_loc4 !=1)
                      or
                      (t0.gis_loc2 =1
                      and t0.gis_loc3 !=1
                      and t0.gis_loc1 =1
                      and t0.gis_loc4 =1)
                      ) t1;

select *
  from ods.gis_info_loc t1
 where t1.gis_imei in (select t0.gis_imei from ods.gis_info_loc1 t0);
 
 

select t1.gis_date,
       t1.gis_imei,               
  case when t1.y1 >= 121.442832 and t1.y1 <= 121.495635 and  t1.x1 >= 31.233495 and t1.x1<=31.297068 then '1'
       when t1.y1 >= 121.500431 and t1.y1 <= 121.553251 and  t1.x1 >= 31.234144 and t1.x1<=31.280260 then '2'        
       when t1.y1 >= 121.424973 and t1.y1 <= 121.47772  and  t1.x1 >= 31.18102  and t1.x1<=31.2332   then '3'
       when t1.y1 >= 121.507267 and t1.y1 <= 121.559988 and  t1.x1 >= 31.187762 and t1.x1<=31.234017 then '4' end c1,
  case when t1.y2 >= 121.442832 and t1.y2 <= 121.495635 and  t1.x2 >= 31.233495 and t1.x2<=31.297068 then '1'
       when t1.y2 >= 121.500431 and t1.y2 <= 121.553251 and  t1.x2 >= 31.234144 and t1.x2<=31.280260 then '2'        
       when t1.y2 >= 121.424973 and t1.y2 <= 121.47772  and  t1.x2 >= 31.18102  and t1.x2<=31.2332   then '3'
       when t1.y2 >= 121.507267 and t1.y2 <= 121.559988 and  t1.x2 >= 31.187762 and t1.x2<=31.234017 then '4' end c2,
  case when t1.y3 >= 121.442832 and t1.y3 <= 121.495635 and  t1.x3 >= 31.233495 and t1.x3<=31.297068 then '1'
       when t1.y3 >= 121.500431 and t1.y3 <= 121.553251 and  t1.x3 >= 31.234144 and t1.x3<=31.280260 then '2'        
       when t1.y3 >= 121.424973 and t1.y3 <= 121.47772  and  t1.x3 >= 31.18102  and t1.x3<=31.2332   then '3'
       when t1.y3 >= 121.507267 and t1.y3 <= 121.559988 and  t1.x3 >= 31.187762 and t1.x3<=31.234017 then '4' end c3, 
  case when t1.y4 >= 121.442832 and t1.y4 <= 121.495635 and  t1.x4 >= 31.233495 and t1.x4<=31.297068 then '1'
       when t1.y4 >= 121.500431 and t1.y4 <= 121.553251 and  t1.x4 >= 31.234144 and t1.x4<=31.280260 then '2'        
       when t1.y4 >= 121.424973 and t1.y4 <= 121.47772  and  t1.x4 >= 31.18102  and t1.x4<=31.2332   then '3'
       when t1.y4 >= 121.507267 and t1.y4 <= 121.559988 and  t1.x4 >= 31.187762 and t1.x4<=31.234017 then '4' end c4
  from ods.gis_info_cate t1; 
 
select * from ods.gis_info t1 where  t1.gis_imei='223e2b3756b4b1211f92cfdc39e76a78';
select * from ods.gis_info_cate t1 where  t1.gis_imei='223e2b3756b4b1211f92cfdc39e76a78';





---1	909dce543ee96651449696a301873d07	121.477643333	31.280563343

select c2,count(c1) from
(select t1.gis_imei c1, count(*) c2 from ods.gis_info t1 
group by t1.gis_imei ) t2
group by c2
order by c2
order by t1.gis_imei;

--- 每天记录数排序
/*GIS_DATE	COUNT(*)
20151227	515746
20151228	542088
20151229	542505
20151230	542752
20151231	547221
20160101	508271
20160102	495610
20160103	508768
20160104	538352
20160105	536140
20160106	499152*/

--- 记录数排序
/*1	14991
2	18521
3	19946
4	21689
5	23696
6	26340
7	33214
8	40505
9	52020
10	72860
11	317527
12	98
13	76
14	54
15	55
16	42
17	60
18	64
19	49
20	80
21	94
22	225
23	3
24	2
25	9
26	3
27	8
28	4
29	8
30	10
31	19
32	4
33	13
34	4
35	2
36	1
37	4
38	3
39	2
40	3
41	2
42	1
43	4
44	15
45	1
46	4
47	2
48	4
49	2
50	1
51	1
53	3
54	4
55	10
56	3
57	1
59	2
60	2
61	1
62	2
63	2
64	3
65	9
66	15
68	1
70	3
71	2
72	2
73	2
74	5
75	4
76	5
77	18
78	1
80	1
81	1
83	1
84	2
85	4
86	3
87	2
88	12
90	1
95	1
96	3
97	2
98	1
99	11
102	1
103	1
107	2
109	1
112	1
114	1
115	1
117	1
118	1
120	1
122	1
123	1
126	1
128	1
131	1
133	1
136	1
137	1
141	1
142	3
145	1
152	2
153	2
154	1
158	1
162	1
166	1
169	1
172	1
173	1
175	1
176	1
188	1
191	1
198	1
203	1
223	1
230	1
253	1
301	1
325	1
338	1
362	1
374	1
399	1
430	1
498	1
501	1
709	1
713	1
1082	1
2044	1
9068	1
*/


select t5.y2, t5.x2, round((count(t5.y2) / 117213) * 2000) c1
  from (select t1.y2, t1.x2
          from ods.gis_info_cate t1
         where (t1.y2 >= 121.500431 and t1.y2 <= 121.553251 and t1.x2 >= 31.234144 and t1.x2 <= 31.280260)
        union all
        select t1.y3, t1.x3
          from ods.gis_info_cate t1
         where (t1.y3 >= 121.500431 and t1.y3 <= 121.553251 and t1.x3 >= 31.234144 and t1.x3 <= 31.280260)) t5
 group by t5.y2, t5.x2
 order by c1 desc;
 
-- round((count(t5.y_1) / 5776605)
select /*+parallel(t5,4) */ t5.y_1, t5.x_1,count(t5.y_1) c1
  from  ods.gis_info_count t5
   --- t5.y_1 >= 121.442832 and t5.y_1 <= 121.495635 and  t5.x_1 >= 31.233495 and t5.x_1<=31.297068
   --- t5.y_1 >= 121.500431 and t5.y_1 <= 121.553251 and  t5.x_1 >= 31.234144 and t5.x_1<=31.280260
   --- t5.y_1 >= 121.424973 and t5.y_1 <= 121.47772  and  t5.x_1 >= 31.18102  and t5.x_1<=31.2332 
where t5.y_1 >= 121.507267 and t5.y_1 <= 121.559988 and  t5.x_1 >= 31.187762 and t5.x_1<=31.234017
 group by t5.y_1, t5.x_1
 order by c1 desc; 

 
 select distinct(t2.gis_imei), t2.y_9,t2.x_9,t2.y_12,t2.x_12,t2.y_20,t2.x_20
  from ods.gis_info t2
 where t2.y_9 is not null
   and t2.y_12 is not null
   and t2.y_9 != t2.y_20
   and t2.y_12 is not null
   and t2.y_20 is not null
 
 
 
 

