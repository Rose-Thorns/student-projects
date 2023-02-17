use [master];
go

--if db_id('Academy') is not null
--begin
--	drop database [Academy];
--end
--go

--create database [Academy];
--go

use [Academy];
go

--create table [Curators]
--(
--	[Id] int not null identity(1, 1) primary key,
--	[Name] nvarchar(max) not null check ([Name] <> N''),
--	[Surname] nvarchar(max) not null check ([Surname] <> N'')
--);
--go

--create table [Departments]
--(
--	[Id] int not null identity(1, 1) primary key,
--	[Financing] money not null check ([Financing] >= 0.0) default 0.0,
--	[Name] nvarchar(100) not null unique check ([Name] <> N''),
--	[FacultyId] int not null
--);
--go

--create table [Faculties]
--(
--	[Id] int not null identity(1, 1) primary key,
--	[Financing] money not null check ([Financing] >= 0.0) default 0.0,
--	[Name] nvarchar(100) not null unique check ([Name] <> N'')
--);
--go

--create table [Groups]
--(
--	[Id] int not null identity(1, 1) primary key,
--	[Name] nvarchar(100) not null unique check ([Name] <> N''),
--	[Year] int not null check ([Year] between 1 and 5),
--	[DepartmentId] int not null
--);
--go

--create table [GroupsCurators]
--(
--	[Id] int not null identity(1, 1) primary key,
--	[CuratorId] int not null,
--	[GroupId] int not null
--);
--go

--create table [GroupsLectures]
--(
--	[Id] int not null identity(1, 1) primary key,
--	[GroupId] int not null,
--	[LectureId] int not null
--);
--go

--create table [Lectures]
--(
--	[Id] int not null identity(1, 1) primary key,
--	[LectureRoom] nvarchar(max) not null check ([LectureRoom] <> N''),
--	[SubjectId] int not null,
--	[TeacherId] int not null
--);
--go

--create table [Subjects]
--(
--	[Id] int not null identity(1, 1) primary key,
--	[Name] nvarchar(100) not null unique check ([Name] <> N'')
--);
--go

--create table [Teachers]
--(
--	[Id] int not null identity(1, 1) primary key,
--	[Name] nvarchar(max) not null check ([Name] <> N''),
--	[Salary] money not null check ([Salary] > 0.0),
--	[Surname] nvarchar(max) not null check ([Surname] <> N'')
--);
--go

--alter table [Departments]
--add foreign key ([FacultyId]) references [Faculties]([Id]);
--go

--alter table [Groups]
--add foreign key ([DepartmentId]) references [Departments]([Id]);
--go

--alter table [GroupsCurators]
--add foreign key ([CuratorId]) references [Curators]([Id]);
--go

--alter table [GroupsCurators]
--add foreign key ([GroupId]) references [Groups]([Id]);
--go

--alter table [GroupsLectures]
--add foreign key ([GroupId]) references [Groups]([Id]);
--go

--alter table [GroupsLectures]
--add foreign key ([LectureId]) references [Lectures]([Id]);
--go

--alter table [Lectures]
--add foreign key ([SubjectId]) references [Subjects]([Id]);
--go

--alter table [Lectures]
--add foreign key ([TeacherId]) references [Teachers]([Id]);
--go

--insert into Curators(Name, Surname)
--values('Андрей','Хаустович'),
--('Дмитрий','Трофимцов'),
--('Тарас','Мельник'),
--('Надежда','Полюхович');
--go
--insert into Faculties(Financing, Name)
--values(23000, 'Прикладная Математика'),
--(20000, 'Социиологии и права'),
--(15000, 'Радиотехнический');
--go
--insert into Subjects(Name)
--values('Програмирование'),
--('Математический анализ'),
--('Дискретная математика'),
--('Право'),
--('Физика');
--go
--insert into Teachers(Name, Salary, Surname)
--values('Владислав', 8000,'Глеб'),
--('Дмитрий', 10000,'Гломозда'),
--('Виталий', 9000,'Бусленко'),
--('Ольга', 7500,'Синивец');
--go
--insert into Departments(Financing, Name, FacultyId)
--values(30000, 'Комп. науки', 1),
--(27000, 'СПСКС', 2),
--(20000, 'Физики', 3);
--go
--insert into Groups(Name, Year, DepartmentId)
--values ('RV83', 2, 1),
--('KP71',3, 1),
--('IS63',4, 2),
--('KM52',5, 3);
--go
--insert into GroupsCurators(CuratorId, GroupId)
--values(1,1),
--(2,2),
--(3,4),
--(4,3);
--go
--insert into Lectures(LectureRoom, SubjectId, TeacherId)
--values('340-19', 1, 1),
--('720-22', 3,2),
--('92-15', 2,4),
--('12-16', 5,3);
--go
--insert into GroupsLectures(LectureId, GroupId)
--values(1,1),
--(2,3),
--(3,2),
--(4,4);
--go

--SELECT Teachers.Name AS Teacher, Groups.Name AS 'Group'
--FROM Teachers, Groups;

--SELECT Faculties.Name, Faculties.Financing AS 'FF', Departments.Financing AS 'DF'
--FROM Faculties JOIN Departments
--ON Departments.FacultyId = Faculties.id
--WHERE Departments.Financing > Faculties.Financing;

SELECT Curators.Surname, Groups.Name
FROM Curators JOIN GroupsCurators
ON Curators.Id = GroupsCurators.CuratorId
JOIN Groups
ON Groups.id = GroupsCurators.GroupId
ORDER BY Curators.Surname;