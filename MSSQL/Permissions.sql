use BookShop
go

---------------1-------------------

create login Mark with password = 'mark'
go
create user User1 for login Mark
go
exec sp_addrolemember 'db_owner', 'User1'
go
-----------------------------------
create login Irina with password = 'irina'
go
create user User2 for login Irina
go
exec sp_addrolemember 'db_datareader', 'User2'
go
-----------------------------------
exec sp_addrolemember 'db_denydatawriter', 'User2'
go
-----------------------------------
create login Marat with password = 'marat'
go
create user User3 for login Marat
go
exec sp_addrolemember 'db_backupoperator', 'User3'
go
-----------------------------------
create login Oleg with password = 'oleg'
go
create user User4 for login Oleg
go
exec sp_addrolemember 'db_ddladmin', 'User4'

---------------2-------------------

create role Group1 authorization db_owner
go
-----------------------------------
create role Group2 authorization db_datareader
go
-----------------------------------
create role Group3 
go
grant select on BookShop.Shops to Group3
go
-----------------------------------
create role Group4 
go
exec sp_addrolemember 'db_denydatawriter', 'Group4'
go
exec sp_addrolemember 'db_denydatareader', 'Group4'
go
-----------------------------------
create role Group5 authorization db_ddladmin
go
-----------------------------------