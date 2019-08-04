1.对于MySQL而言，“database 数据库” 和 “schema 模式” 是同一件事，所以MySQL可以拥有很多个数据库，但是对于Oracle，却只有一个orcl数据库。
根据最正宗的SQL标准，数据库都会做这样的划分，是这样划分的:Cluster > Catalog > Schema > Table
在SQL环境下Catalog和Schema都属于抽象概念，主要用来解决命名冲突问题
一个数据库系统包含多个Catalog，每个Catalog包含多个Schema，每个Schema包含多个数据库对象（表、视图、字段等）
如数据库对象表的全限定名可表示为：Catalog名.Schema名.表名
ＳＱＬ标准并不要求每个数据库对象的完全限定名称是唯一的，就象域名一样，如果喜欢的话，每个ＩＰ地址都可以拥有多个域名

Oracle Schema 与 Mysql DB 具体区分如下:

In MySQL:
    server instance == not identified with catalog, just a set of databases
    database == schema == catalog == a namespace within the server.
    user == named account, who is can connect to server and use (but can not own - no concept of ownership) objects in one or more databases
    to identify any object you need (database name + object name)

In Oracle:
    server instance == database == catalog == all data managed by same execution engine
    schema == namespace within database, identical to user account
    user == schema owner == named account, identical to schema, who can connect to database, who owns the schema and use objects possibly in other schemas
    to identify any object you need (schema name + object name)


2.MySQL介绍

1、MySQL是单进程多线程（而Oracle等是多进程），也就是说MySQL实例在系统上表现就是一个服务进程，即进程（通过多种方法可以创建多实例，
   再安装一个端口号不同的mysql，或者通过workbench来新建一个端口号不同的服务器实例等），该架构类似于SQL Server和Windows版本的Oracle；
2、MySQL实例是线程和内存组成，实例才是真正用于操作数据库文件的（MySQL数据库是由一些列物理文件组成，类似于frm、MYD、MYI、ibd结尾的文件）；
3、一般情况下一个实例操作一个或多个数据库（Oracle一个实例对应一个数据库）；集群情况下多个实例操作一个或多个数据库。

2.1 在实例启动的时候MySQL会读取配置文件，类似于Oracle的spfile文件，不同的是Oracle如果找不到参数文件会启动失败，MySQL如果找不到配置文件则会按照默认参数设置启动实例。
database、instance、session
MySQL中建立一个会话（session），不是和具体的数据库（database）相连接，而是跟某个实例（instance）建立会话（session，每个会话可以使用不同的用户身份）。
而一个实例（instance）可以操作多个数据库，故一个会话（session，在操作系统概念里，会话即是线程）可以操作一个实例上的多个数据库。
简单描述如下：instance >> database
    所以当使用web应用的持久层连接Mysql，实际上是连接Mysql的实例，所以当Spring这种框架操作事务时，出现如下操作时，是可以做到跨库的事务的：
    insert into t1 values (1,’测试’);
    insert into db2.t2 values (1,’测试’);
    db2是当前数据库实例中的另一个数据库名称。

2.2 connection和session
连接(connection)是一个物理的概念，它指的是一个通过网络建立的客户端和专有服务器(Dedicated Server）或调度器(Shared Server)的一个网络连接。
会话(session)是一个逻辑的概念，它是存在于实例（instance）中。
创建一个连接(connection)实际上是在某个实例（instance，或者说是进程）中创建一个或多个线程（即多个session）。

关系：

一个连接可以拥有多个会话也可以没有会话（实际上，一条连接上的各个会话可以使用不同的用户身份），同一个连接上的不同会话之间不会相互影响。
两个会话之间的影响，体现在锁和锁之间，即对相同资源的操作（对象定义或数据块）或请求（CPU/内存），它们的处理一般是按队列来处理的，前面的没有处理好，后面的就要等待。如果以打电话来比喻：
connect就好比你接通对方，这时，connect就建立了，有没有通话，不管。双方进行通话，则session建立了，如果换人，则新的session建立，原session结束，类似的，可以在同一个connect上进行多个会话。最后，挂机，connect结束。

2.3 session和transaction

    会话（session）可以创建多个事务（transaction）
    比如：使用客端连接数据库，这样你就可以执行很多个事务了
    一个事务只能由一个会话产生
    在数据库里的事务，如果在执行的SQL都是由会话发起的，哪怕是自动执行的JOB也是由系统会话发起的
    一个事务可能会产生一个或多个线程
    比如RMAN备份，是可以创建多个线程可加快备份速度
    一个线程在同一时间内只能执行一个事务
    而一个线程，在没结束当前事务是无法释放资源来执行第二个事务

transaction、session、thread
事务（transaction）：简单理解就是一个业务需求的最小处理单位。
会话（session）：可以包含N个事务

4. Oracle的schema、方案、模式、用户                                              
一个用户一般对应一个schema,该用户的schema名等于用户名，并作为该用户缺省schema。这也就是我们在企业管理器的方案下看到schema名都为数据库用户名的原因。
Oracle数据库中不能新创建一个schema，要想创建一个schema，只能通过创建一个用户的方法解决(Oracle中虽然有create schema语句，
但是它并不是用来创建一个schema的)，在创建一个用户的同时为这个用户创建一个与用户名同名的schem并作为该用户的缺省shcema。即schema的个数同user的个数相同，
而且schema名字同user名字一一 对应并且相同，所有我们可以称schema为user的别名，虽然这样说并不准确，但是更容易理解一些。
 不过，PUBLIC只有shcema，但并没有对应的用户。

一个用户有一个缺省的schema，其schema名就等于用户名，当然一个用户还可以使用其他的schema。如果我们访问一个表时，没有指明该表属于哪一个schema中的，
系统就会自动给我们在表上加上缺省的sheman名。比如我们在访问数据库时，访问scott用户下的emp表，通过select * from emp;
其实，这sql语句的完整写法为select * from scott.emp。在数据库中一个对象的完整名称为schema.object，而不属user.object。
类似如果我们在创建对象时不指定该对象的schema，在该对象的schema为用户的缺省schema。这就像一个用户有一个缺省的表空间，但是该用户还可以使用其他的表空间，
如果我们在创建对象时不指定表空间，则对象存储在缺省表空间中，要想让对象存储在其他表空间中，我们需要在创建对象时指定该对象的表空间。
                                                                                                                                        
5. 语法差异

    mysql可以实现自增长主键（通过字段的auto_increment属性）；Oracle则需要通过序列（Sequence）来实现。
    mysql可以用双引号来引用字符串（当然单引号也行）；Oracle只能用单引号。
    mysql在查询语句中可以通过limit [offset,] <row count>来直接分页；而Oracle需要使用rownum伪列，且需要注意陷阱，具体参考：Oracle中ROWNUM的使用技巧（转）
    mysql对于真假的判断，0为假1为真；Oracle则是用true/false。
    mysql的查询可以 select sysdate(); ；而Oracle需要引用虚表（select sysdate from dual;）。
    mysql一个数据库在我的理解，相当于Oracle的一个用户（schema）。
    mysql中备份命令：mysqldump，执行结果是一个sql文件；oracle备份命令：dpdump，执行结果是一个dmp文件。前件是文本sql命令，可以直接导入到其它mysql数据库，甚至可以稍作修改导入到其它类型的数据库；后者导出文件是二进制的，只能Oracle自己用（甚至还有版本限制）。
    mysql中的命令默认是直接commit的；Oracle默认不是。
    mysql中注释行以“#“开始；Oracle以“--“开始。
    mysql中日期的转换用dateformat()函数；Oracle用to_date()与to_char()两个函数。
    mysql中多个字符串的连接用concat()；一般Oracle中用“||“连接多个字符串，它也有concat()，但它只能有两个参数。
    mysql中查询信息多用：show tables;格式的命令；Oracle中用select * from user_tables;格式的命令查询数据。
    mysql在Windows环境下大小写是不敏感的；unix/linux环境下，对数据库名、表名大小写敏感，列名大小写不敏感。Oracle则不论环境大小写都不敏感。
    mysql执行锐脚本命令：mysql>source a.sql; ；Oracle中执行外部命令：SQL>@a.sql。
    mysql支持枚举类型（enum）、集合类型（set）；Oracle不直接支持，需要使用外键等其它手段实现。
6.oracle 表空间
---https://blog.csdn.net/Huay_Li/article/details/80575538                                             
