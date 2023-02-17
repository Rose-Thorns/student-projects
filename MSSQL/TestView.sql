--create database TestBase
--go 
use TestBase
go
--create table Test
--(
--	Id int identity primary key,
--	Fname varchar(50),
--	Lname varchar(50),
--	Age int
--);

--insert into Test
--values
--('Ivan', 'Ivanov', 23),
--('Petr', 'Ivanov', 20),
--('Ivan', 'Petrov', 31),
--('Petr', 'Petrov', 42);
--go 

--select *
--from Test;

--create view TestView (Fname, Lname, Age) as 
--select Fname, Lname, Age
--from Test;

--select *
--from TestView;

--insert into TestView
--values ('Stephan', 'Razin', 84);

--select * from test;

--drop view TestView;

--create view dbo.TestView (Fname, Lname, Age) with schemabinding 
--as 
--select Fname, Lname, Age
--from dbo.Test

