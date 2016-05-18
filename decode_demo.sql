drop table c_test;

create table ods.c_test(
c_name varchar(6),
c1 number(6),
c2 number(6),
c3 number(6)
);

select * from ods.c_test;

select (nvl(c1,0) + nvl(c2,0) + nvl(c3,0)) from ods.c_test;

select (nvl(c1,0) + nvl(c2,0) + nvl(c3,0))  /
       decode(decode(c1, null, 0, 1) + decode(c2, null, 0, 1) +
              decode(c3, null, 0, 1),
              0,
              1,
              decode(c1, null, 0, 1) + decode(c2, null, 0, 1) +
              decode(c3, null, 0, 1))
  from ods.c_test;
