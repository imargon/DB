Oracle Schema 与 Mysql DB
1.对于MySQL而言，“database 数据库” 和 “schema 模式” 是同一件事，所以MySQL可以拥有很多个数据库，但是对于Oracle，却只有一个orcl数据库。
根据最正宗的SQL标准，数据库都会做这样的划分，是这样划分的:Cluster > Catalog > Schema > Table
具体区分如下:

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

 
