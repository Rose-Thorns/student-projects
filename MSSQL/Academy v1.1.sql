--use [master];
--go

--if db_id('Academy') is not null
--begin
--	drop database [Academy];
--end
--go

--create database [Academy];
--go

--use [Academy];
--go

--create table [Departments]
--(
--	[Id] int not null identity(1, 1) primary key,
--	[Financing] money not null check ([Financing] >= 0.0),
--	[Name] nvarchar(100) not null unique check ([Name] <> N'')
--);
--go

--create table [Faculties]
--(
--	[Id] int not null identity(1, 1) primary key,
--	[Dean] nvarchar(max) not null check ([Dean] <> N''),
--	[Name] nvarchar(100) not null unique check ([Name] <> N''),
--);
--go

--create table [Groups]
--(
--	[Id] int not null identity(1, 1) primary key,
--	[Name] nvarchar(10) not null unique check ([Name] <> N''),
--	[Rating] float not null check ([Rating] between 0 and 5),
--	[Year] int not null check ([Year] between 1 and 5)
--);
--go

--create table [Teachers]
--(
--	[Id] int not null identity(1, 1) primary key,
--	[EmploymentDate] date not null check ([EmploymentDate] >= '1990-01-01'),
--	[IsAssistant] bit not null default 0,
--	[IsProfessor] bit not null default 0,
--	[Name] nvarchar(max) not null check ([Name] <> N''),
--	[Position] nvarchar(max) not null check ([Position] <> N''),
--	[Premium] money not null check ([Premium] >= 0.0) default 0.0,
--	[Salary] money not null check ([Salary] > 0.0),
--	[Surname] nvarchar(max) not null check ([Surname] <> N'')
--);
--go

---INSERT---
--INSERT INTO Faculties(Dean, [Name])
--VALUES 
--('Vinderman O.P.', 'Bioscience'),
--('Wick J.', 'Law'),
--('Lafizov J.', 'International Economics'),
--('Kuchma S.', 'Computer Science'),
--('Pavlyk S.', 'Music');

--INSERT INTO Departments (Financing, [Name])
--VALUES 
--(15000, 'Biology'),
--(19000, 'Social science'),
--(10100, 'Economics'),
--(32000, 'Software development'),
--(25500, 'Humanities');

--INSERT INTO Teachers ([EmploymentDate], [IsAssistant], [IsProfessor], [Name], [Position], [Premium], [Salary], [Surname] )
--VALUES 
--('05/07/1995', 0, 1, 'Samantha', 'Proffesor', 220, 2000, 'Adams'),
--('06/15/1993', 1, 0, 'Ivan', 'Assistant', 700, 500, 'Ivanov'),
--('03/20/2003', 1, 0, 'Masha','Assistant', 190, 800, 'Mashina'),
--('06/15/1993', 1, 0, 'Sasha', 'Assistant', 200, 700, 'Pasha'),
--('09/17/2010', 0, 0, 'Sasha', 'Docent', 600, 2500, 'Pavlyk'),
--('11/03/2018', 0, 1, 'Pavel', 'Proffesor', 500, 1000, 'Zagura');

--INSERT INTO Groups ([Name], [Rating], [Year])
--VALUES 
--('501-CS', 3, 5),
--('502-B', 4, 5),
--('201-L', 5, 2),
--('401-B', 4, 4),
--('101-M', 3, 1),
--('503-L', 5, 5),
--('504-B', 2, 5),
--('301-IE', 5, 3);

--SELECT *
--FROM Departments
--ORDER BY Id DESC;

--SELECT [Name] AS 'Group Name', [Rating] AS 'Group Rating'
--FROM Groups;

--SELECT [Surname], [Salary]/[Premium] AS 'Salary/Premium', [Salary]/([Premium]+[Salary]) AS 'Salary/Wage'
--FROM Teachers;

--SELECT 'The dean of faculty ' + [Name] + ' is ' + [Dean] AS 'Deans of faculties'
--FROM Faculties;

 --SELECT [Surname]
 --From Teachers
 --WHERE [IsProfessor] != 0 AND [Salary] > 1050;

 --SELECT [Name]
 --FROM Departments
 --WHERE Financing < 11000 OR Financing > 25000;

--SELECT [Name]
--FROM Faculties
--WHERE NOT [Name] = 'Computer Science';

--SELECT [Surname], [Position]
--From Teachers
--WHERE [IsProfessor] = 0;

--SELECT [Surname], [Position], [Salary], [Premium]
--From Teachers
--WHERE [Premium] > 160 AND [Premium] < 550 AND [IsAssistant] = 1;

--SELECT [Surname], [Salary]
--From Teachers
--WHERE [IsAssistant] = 1;

--SELECT [Surname], [Position]
--From Teachers
--WHERE [EmploymentDate] < '01/01/2000';

--SELECT [Name] AS 'Name of Department'
--FROM Departments
--ORDER BY [Name];

--SELECT [Surname]
--From Teachers
--WHERE [IsAssistant] = 1 AND (Salary + Premium) < 1200;

--SELECT [Name] AS 'Group Name'
--FROM Groups
--WHERE Rating > 1 AND Rating < 5 AND [Year] = 5;

--SELECT [Surname]
--From Teachers
--WHERE [IsAssistant] = 1 AND Salary < 550 OR Premium < 200;