---drop table gis_info;
---truncate table gis_info;
select count(*) from ods.gis_info

 for update ;

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

---truncate  table gis_info_cate;
create table ods.gis_info_cate (
gis_date varchar2(8),
gis_imei varchar2(100),
y1   number(16,9),       x1 number(16,9),
y2   number(16,9),       x2 number(16,9),
y3   number(16,9),       x3 number(16,9),
y4   number(16,9),       x4 number(16,9));


--- 时段划分
select t1.gis_date,
       t1.gis_imei,
       (nvl(y_1, 0) + nvl(y_2, 0) + nvl(y_3, 0) + nvl(y_4, 0) + nvl(y_5, 0) +
       nvl(y_6, 0) + nvl(y_7, 0) + nvl(y_24, 0)) /
       decode(decode(y_1, null, 0, 1) + decode(y_2, null, 0, 1) +
              decode(y_3, null, 0, 1) + decode(y_4, null, 0, 1) +
              decode(y_5, null, 0, 1) + decode(y_6, null, 0, 1) +
              decode(y_7, null, 0, 1) + decode(y_24, null, 0, 1),
              0,
              1,
              decode(y_1, null, 0, 1) + decode(y_2, null, 0, 1) +
              decode(y_3, null, 0, 1) + decode(y_4, null, 0, 1) +
              decode(y_5, null, 0, 1) + decode(y_6, null, 0, 1) +
              decode(y_7, null, 0, 1) + decode(y_24, null, 0, 1)) as y1,
       (nvl(x_1, 0) + nvl(x_2, 0) + nvl(x_3, 0) + nvl(x_4, 0) + nvl(x_5, 0) +
       nvl(x_6, 0) + nvl(x_7, 0) + nvl(x_24, 0)) /
       decode(decode(x_1, null, 0, 1) + decode(x_2, null, 0, 1) +
              decode(x_3, null, 0, 1) + decode(x_4, null, 0, 1) +
              decode(x_5, null, 0, 1) + decode(x_6, null, 0, 1) +
              decode(x_7, null, 0, 1) + decode(x_24, null, 0, 1),
              0,
              1,
              decode(x_1, null, 0, 1) + decode(x_2, null, 0, 1) +
              decode(x_3, null, 0, 1) + decode(x_4, null, 0, 1) +
              decode(x_5, null, 0, 1) + decode(x_6, null, 0, 1) +
              decode(x_7, null, 0, 1) + decode(x_24, null, 0, 1)) as x1,
       (nvl(y_8, 0) + nvl(y_9, 0) + nvl(y_10, 0) + nvl(y_11, 0) +
       nvl(y_12, 0)) /
       decode(decode(y_8, null, 0, 1) + decode(y_9, null, 0, 1) +
              decode(y_10, null, 0, 1) + decode(y_11, null, 0, 1) +
              decode(y_12, null, 0, 1),
              0,
              1,
              decode(y_8, null, 0, 1) + decode(y_9, null, 0, 1) +
              decode(y_10, null, 0, 1) + decode(y_11, null, 0, 1) +
              decode(y_12, null, 0, 1)) as y2,
       (nvl(x_8, 0) + nvl(x_9, 0) + nvl(x_10, 0) + nvl(x_11, 0) +
       nvl(x_12, 0)) /
       decode(decode(x_8, null, 0, 1) + decode(x_9, null, 0, 1) +
              decode(x_10, null, 0, 1) + decode(x_11, null, 0, 1) +
              decode(x_12, null, 0, 1),
              0,
              1,
              decode(x_8, null, 0, 1) + decode(x_9, null, 0, 1) +
              decode(x_10, null, 0, 1) + decode(x_11, null, 0, 1) +
              decode(x_12, null, 0, 1)) as x2,
       
       (nvl(y_13, 0) + nvl(y_14, 0) + nvl(y_15, 0) + nvl(y_16, 0) +
       nvl(y_17, 0) + nvl(y_18, 0)) /
       decode(decode(y_13, null, 0, 1) + decode(y_14, null, 0, 1) +
              decode(y_15, null, 0, 1) + decode(y_16, null, 0, 1) +
              decode(y_17, null, 0, 1) + decode(y_18, null, 0, 1),
              0,
              1,
              decode(y_13, null, 0, 1) + decode(y_14, null, 0, 1) +
              decode(y_15, null, 0, 1) + decode(y_16, null, 0, 1) +
              decode(y_17, null, 0, 1) + decode(y_18, null, 0, 1)) as y3,
       (nvl(x_13, 0) + nvl(x_14, 0) + nvl(x_15, 0) + nvl(x_16, 0) +
       nvl(x_17, 0) + nvl(x_18, 0)) /
       decode(decode(x_13, null, 0, 1) + decode(x_14, null, 0, 1) +
              decode(x_15, null, 0, 1) + decode(x_16, null, 0, 1) +
              decode(x_17, null, 0, 1) + decode(x_18, null, 0, 1),
              0,
              1,
              decode(x_13, null, 0, 1) + decode(x_14, null, 0, 1) +
              decode(x_15, null, 0, 1) + decode(x_16, null, 0, 1) +
              decode(x_17, null, 0, 1) + decode(x_18, null, 0, 1)) as x3,
       (nvl(y_19, 0) + nvl(y_20, 0) + nvl(y_21, 0) + nvl(y_22, 0) +
       nvl(y_23, 0)) /
       decode(decode(y_19, null, 0, 1) + decode(y_20, null, 0, 1) +
              decode(y_21, null, 0, 1) + decode(y_22, null, 0, 1) +
              decode(y_23, null, 0, 1),
              0,
              1,
              decode(y_19, null, 0, 1) + decode(y_20, null, 0, 1) +
              decode(y_21, null, 0, 1) + decode(y_22, null, 0, 1) +
              decode(y_23, null, 0, 1)) as y4,
       (nvl(x_19, 0) + nvl(x_20, 0) + nvl(x_21, 0) + nvl(x_22, 0) +
       nvl(x_23, 0)) /
       decode(decode(x_19, null, 0, 1) + decode(x_20, null, 0, 1) +
              decode(x_21, null, 0, 1) + decode(x_22, null, 0, 1) +
              decode(x_23, null, 0, 1),
              0,
              1,
              decode(x_19, null, 0, 1) + decode(x_20, null, 0, 1) +
              decode(x_21, null, 0, 1) + decode(x_22, null, 0, 1) +
              decode(x_23, null, 0, 1)) as x4
  from ods.gis_info t1;


create  table ods.gis_info_loc (
gis_date varchar2(8),
gis_imei varchar2(100),
gis_loc1 number(2),
gis_loc2 number(2),
gis_loc3 number(2),
gis_loc4 number(2)
); 

select * from ods.gis_info_loc;
---truncate table ods.gis_info_loc;
---insert into ods.gis_info_loc
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
  
---insert into ods.gis_info_loc1 

create  table ods.gis_info_loc2 (
gis_date varchar2(8),
gis_imei varchar2(100),
gis_loc1 number(2),
gis_loc2 number(2),
gis_loc3 number(2),
gis_loc4 number(2)
);  
  
--select count(*)  from ods.gis_info
--- drop table ods.gis_info_count;
----create table ods.gis_info_count (gis_imei varchar2(100),y_1 number(16,9),x_1 number(16,9));
   insert /*+parallel(ods.gis_info_count,4)*/into ods.gis_info_count
       select /*+parallel(t1,4) */ t1.gis_imei, t1.y_1, t1.x_1
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_2, t1.x_2
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_3, t1.x_3
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_4, t1.x_4
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_5, t1.x_5
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_6, t1.x_6
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_7, t1.x_7
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_8, t1.x_8
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_9, t1.x_9
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_10, t1.x_10
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_11, t1.x_11
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_12, t1.x_12
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_13, t1.x_13
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_14, t1.x_14
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_15, t1.x_15
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_16, t1.x_16
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_17, t1.x_17
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_18, t1.x_18
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_19, t1.x_19
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_20, t1.x_20
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_21, t1.x_21
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_22, t1.x_22
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_23, t1.x_23
          from ods.gis_info t1
        union all
        select /*+parallel(t1,4) */ t1.gis_imei,t1.y_24, t1.x_24
          from ods.gis_info t1;
          
alter session enable parallel dml;
alter table ods.gis_info parallel;
alter table ods.gis_info_count parallel;


select /*+parallel(t1 4) */ t1.gis_imei,t1.y_24, t1.x_24
          from ods.gis_info t1;


