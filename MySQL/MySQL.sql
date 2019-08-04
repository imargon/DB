Oracle Schema 与 Mysql DB

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

 
