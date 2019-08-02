WITH Clause方法的优点
     增加了SQL的易读性，如果构造了多个子查询，结构会更清晰；更重要的是：“一次分析，多次使用”，这也是为什么会提供性能的地方，达到了“少读”的目标。
     第一种使用子查询的方法表被扫描了两次，而使用WITH Clause方法，表仅被扫描一次。这样可以大大的提高数据分析和查询的效率。
      另外，观察WITH Clause方法执行计划，其中“SYS_TEMP_XXXX”便是在运行过程中构造的中间统计结果临时表。
      
--模拟生一个20行的数据     
select * from  ( SELECT LEVEL AS lv FROM DUAL CONNECT BY LEVEL < 20 ) tt  WHERE tt.lv > 10 AND tt.lv < 15

with TT as ( SELECT LEVEL AS lv FROM DUAL CONNECT BY LEVEL < 20 ) select lv from TTWHERE lv > 10 AND lv < 15
