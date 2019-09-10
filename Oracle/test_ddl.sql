---
select * from proc_log;
select * from tabs 
where table_name = 'STUINFO';
select column_name from all_ind_columns  where index_name = 'STU_INFO' order by column_position

select *  from all_ind_columns where table_name = 'STU_INFO';

select * from SCOTT.stu_info;
---
drop table SCOTT.stuinfo;

ALTER TABLE SCOTT.stuinfo ADD part_id varchar2(10);
create index stuinfo_idx on  SCOTT.stuinfo (stuid);

--- Create table
create table SCOTT.stuinfo
(
  stuid      varchar2(11) not null,--学号：'S'+班号（7位数）+学生序号（3位数）(1)
  stuname    varchar2(50) not null,--学生姓名
  sex        char(1) not null,--性别
  age        number(2) not null,--年龄
  classno    varchar2(7) not null,--班号：'C'+年级（4位数）+班级序号（2位数）
  stuaddress varchar2(100) default '地址未录入',--地址 (2)
  grade      char(4) not null,--年级
  enroldate  date,--入学时间
  idnumber   varchar2(18) default '身份证未采集' not null--身份证
)
partition by range(age)
(  
  partition part01 values less than(6), --不及格  
  partition part02 values less than(7), --及格  
  partition part03 values less than(maxvalue) --优秀  
);
-- Add comments to the table 
comment on table SCOTT.stuinfo --(4)
  is '学生信息表';
-- Add comments to the columns 
comment on column SCOTT.stuinfo.stuid -- (5)
  is '学号';
comment on column SCOTT.stuinfo.stuname
  is '学生姓名';
comment on column SCOTT.stuinfo.sex
  is '学生性别';
comment on column SCOTT.stuinfo.age
  is '学生年龄';
comment on column SCOTT.stuinfo.classno
  is '学生班级号';
comment on column SCOTT.stuinfo.stuaddress
  is '学生住址';
comment on column SCOTT.stuinfo.grade
  is '年级';
comment on column SCOTT.stuinfo.enroldate
  is '入学时间';
comment on column SCOTT.stuinfo.idnumber
  is '身份证号';
  
insert into SCOTT.STUINFO (STUID, STUNAME, SEX, AGE, CLASSNO, STUADDRESS, GRADE, ENROLDATE, IDNUMBER)
values ('SC201801005', '龙七', '1', 26, 'C201801', '福建省厦门市XXX号', '2018', to_date('01-09-2018', 'dd-mm-yyyy'),
 '3503021992XXXXXXXX');  
