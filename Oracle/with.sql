WITH Clause方法的优点
     增加了SQL的易读性，如果构造了多个子查询，结构会更清晰；更重要的是：“一次分析，多次使用”，这也是为什么会提供性能的地方，达到了“少读”的目标。
     第一种使用子查询的方法表被扫描了两次，而使用WITH Clause方法，表仅被扫描一次。这样可以大大的提高数据分析和查询的效率。
      另外，观察WITH Clause方法执行计划，其中“SYS_TEMP_XXXX”便是在运行过程中构造的中间统计结果临时表。
      
---模拟生一个20行的数据     
select * from  ( SELECT LEVEL AS lv FROM DUAL CONNECT BY LEVEL < 20 ) tt  WHERE tt.lv > 10 AND tt.lv < 15

with TT as ( SELECT LEVEL AS lv FROM DUAL CONNECT BY LEVEL < 20 ) select lv from TTWHERE lv > 10 AND lv < 15

---相当于建了个e临时表
with e as (select * from scott.emp e where e.empno=7499)
select * from e;
 
---相当于建了e、d临时表
with
     e as (select * from scott.emp),
     d as (select * from scott.dept)
select * from e, d where e.deptno = d.deptno;

--- 虚拟视图
insert into table2
with
    s1 as (select rownum c1 from dual connect by rownum <= 10),
    s2 as (select rownum c2 from dual connect by rownum <= 10)
select a.c1, b.c2 from s1 a, s2 b where...;

--- 特别对于union all比较有用。因为union all的每个部分可能相同，但是如果每个部分都去执行一遍的话，则成本太高，
--- 所以可以使用with as短语，则只要执行一遍即可。如果with as短语所定义的表名被调用两次以上，则优化器会自动将with as短语所获取的数据放入一个temp表里，
--- 如果只是被调用一次，则不会。而提示materialize则是强制将with as短语里的数据放入一个全局临时表里。很多查询通过这种方法都可以提高速度
with
    sql1 as (select to_char(a) s_name from test_tempa),
    sql2 as (select to_char(b) s_name from test_tempb where not exists (select s_name from sql1 where rownum=1))
select * from sql1
union all
select * from sql2
union all
select 'no records' from dual
       where not exists (select s_name from sql1 where rownum=1)
       and not exists (select s_name from sql2 where rownum=1);
                                                                        
---- WITH AS： 就是将一个子查询部分独立出来，有时候是为了提高SQL语句的可读性，有时候是为了提高SQL语句性能。
----   如果一个SQL语句中，某个表会被访问多次，而且每次访问的限制条件一样的话，就可以使用with as来提高性能。
----   注意：如果 with as 短语没有被调用2次以上，CBO就不会讲这个短语获取的数据放入temp表，如果想要讲数据放入temp表需要使用materialize hint
----       如果 with as 短语被调用了2次以上，CBO会自动将 with as 短语的数据放入一个临时表，这个时候不用写materialize hint（执行计划请看下方的连个超链接）
                                                                                                  
                                                                        
