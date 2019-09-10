1.分析函数和聚合函数的不同之处
普通的聚合函数用group by分组，每个分组返回一个统计值，而分析函数采用partition by分组，并且每组每行都可以返回一个统计值。

2.分析函数
2.1 开窗函数指定了分析函数工作的数据窗口大小，这个数据窗口大小可能会随着行的变化而变化，
oracle开窗函数使用的话一般是和order、partition by、row_number()、rank()、dense_rank()几个函数一起使用
2.2 over函数和row_number一起使用：
开窗函数和row_number函数一起使用的话，就是返回一行，不过这里其实不适合用来统计，因为统计成绩的话，可以存在分数一样的两条数据，而row_number只返回一条数据。
2.3 over函数和rank一起使用：
rank函数功能也是排序，这里的话，假如有分数一样的两条数据的情况，是会返回两条的，但是假如第二名，就是从3开始计算了
2.4 over函数和dense_rank一起使用：
dense_rank函数是rank函数的补充，假如有分数一样的两条数据，是可以按照正常排序，第二名的情况，还是显示2

分析函数带有一个开窗函数over()，包含三个分析子句:分组(partition by), 排序(order by), 窗口(rows) ，
使用形式如下：over(partition by xxx order by yyy rows between zzz)。
 
3.理解over()函数

两个order by的执行时机
分析函数（以及与其配合的开窗函数over（））是在整个sql查询结束后(sql语句中的order by的执行比较特殊)再进行的操作, 也就是说sql语句中的order by也会影响分析函数的执行结果：

3.1 两者一致：如果sql语句中的order by满足与分析函数配合的开窗函数over（）分析时要求的排序，
即sql语句中的order by子句里的内容和开窗函数over（）中的order by子句里的内容一样，那么sql语句中的排序将先执行,分析函数在分析时就不必再排序；

3.2 两者不一致：如果sql语句中的order by不满足与分析函数配合的开窗函数over（）分析时要求的排序，
即sql语句中的order by子句里的内容和开窗函数over（）中的order by子句里的内容不一样，那么sql语句中的排序将最后在分析函数分析结束后执行排序。

3.3 开窗函数over（）分析函数中的分组/排序/窗口
开窗函数over（）分析函数包含三个分析子句：分组子句(partition by)， 排序子句(order by)， 窗口子句(rows)
窗口就是分析函数分析时要处理的数据范围，就拿sum来说,它是sum窗口中的记录而不是整个分组中的记录，因此我们在想得到某个栏位的累计值时，
我们需要把窗口指定到该分组中的第一行数据到当前行, 如果你指定该窗口从该分组中的第一行到最后一行,那么该组中的每一个sum值都会一样，即整个组的总和。
     
----https://www.cnblogs.com/cjm123/p/8033892.html    
----显示各部门员工的工资，并附带显示该部的最高工资。
SELECT E.DEPTNO,
       E.EMPNO,
       E.ENAME,
       E.SAL,
       LAST_VALUE(E.SAL) 
       OVER(PARTITION BY E.DEPTNO  ORDER BY E.SAL ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) MAX_SAL 
 FROM EMP E;
 
SELECT E.DEPTNO,
       E.EMPNO,
       E.ENAME,
       E.SAL,
       ROW_NUMBER() over(partition by E.DEPTNO order by E.SAL) sal_order_id
  FROM EMP E;

SELECT E.DEPTNO,
       E.EMPNO,
       E.ENAME,
       E.SAL,
       SUM(E.SAL) over(partition by E.DEPTNO order by E.SAL) sal_order_id
  FROM EMP E;

4. 常用统计函数
row_number() over(partition by ... order by ...)
rank() over(partition by ... order by ...)
dense_rank() over(partition by ... order by ...)
count() over(partition by ... order by ...)
max() over(partition by ... order by ...)
min() over(partition by ... order by ...)
sum() over(partition by ... order by ...)
avg() over(partition by ... order by ...)
first_value() over(partition by ... order by ...)
last_value() over(partition by ... order by ...)
lag() over(partition by ... order by ...)
lead() over(partition by ... order by ...)
