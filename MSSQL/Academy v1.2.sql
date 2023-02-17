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

--create table [GroupsLectures]
--(
--	[Id] int not null identity(1, 1) primary key,
--	[DayOfWeek] int not null check ([DayOfWeek] between 1 and 7),
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

---INSERT---
--INSERT INTO Faculties([Name])
--VALUES 
--('Biology'),
--('Social science'),
--('Economics'),
--('Computer Science'),
--('Humanities');
--GO
--INSERT INTO Departments ([Financing], [Name], [FacultyId])
--VALUES 
--(15000, 'Bioscience', 1),
--(35000, 'Law', 2),
--(39000, 'Political sciennce', 2),
--(10100, 'International Economics', 3),
--(32000, 'Software development', 4),
--(22000, 'Web development', 4),
--(20000, 'Music', 5),
--(25500, 'Art', 5);
--GO
--INSERT INTO Groups ([Name], [Year], [DepartmentId])
--VALUES 
--('501-SD', 5, 5),
--('502-B', 5, 1),
--('201-L', 2, 2),
--('202-A', 2, 8),
--('401-PS', 4, 3),
--('101-M', 1, 7),
--('102-WD', 1, 6),
--('301-IE', 3, 4);
--GO
--INSERT INTO Subjects ([Name])
--VALUES
--('Bioengineering'),
--('Law'),
--('Political science'),
--('International economics'),
--('Software development'),
--('Data base theory'),
--('Web development'),
--('Art history'),
--('Music history');
--GO
--INSERT INTO Teachers ([Name], [Salary], [Surname] )
--VALUES 
--('Samantha', 5000, 'Adams'),
--('Dave', 6000, 'McQueen'),
--('Masha', 8000, 'Mashina'),
--('Jack', 7000, 'Underhill'),
--('Sasha', 9000, 'Pavlyk'),
--('Pavel', 5000, 'Zagura');
--GO
--INSERT INTO Lectures (LectureRoom, SubjectId, TeacherId)
--VALUES 
--('D201', 1, 1),
--('D203', 2, 2),
--('D304', 3, 3),
--('D201', 4, 4),
--('D203', 5, 5),
--('A105', 6, 6),
--('D201', 7, 1),
--('B103', 8, 2),
--('D304', 9, 3);
--GO
--INSERT INTO GroupsLectures ([DayOfWeek], [GroupId], [LectureId])
--VALUES
--(1, 1, 1),
--(2, 2, 2),
--(3, 3, 3),
--(4, 4, 4),
--(5, 5, 5),
--(1, 6, 6),
--(2, 7, 7),
--(3, 8, 8),
--(4, 1, 9),
--(5, 2, 2),
--(1, 3, 4),
--(2, 4, 2),
--(3, 5, 4),
--(4, 6, 4),
--(5, 7, 5);

----1
--SELECT COUNT(DISTINCT Teachers.Id) AS 'Software Development teachers'
--FROM Teachers, Lectures, GroupsLectures, Groups, Departments
--WHERE Teachers.Id = Lectures.TeacherId AND Lectures.Id = GroupsLectures.LectureId 
--AND Groups.Id = GroupsLectures.GroupId AND Departments.Id = Groups.DepartmentId AND Departments.Name = 'Software development';

----2
--SELECT COUNT(*) AS "Dave McQueen's lectures"
--FROM Lectures JOIN Teachers
--ON Teachers.Id = Lectures.TeacherId AND Teachers.Name = 'Dave' AND Teachers.Surname = 'McQueen';

----3
--SELECT COUNT(*) AS "D201 Lectures Count"
--FROM Lectures 
--WHERE LectureRoom = 'D201';

--4
--SELECT LectureRoom, COUNT(*) AS "Lectures Count"
--FROM Lectures
--GROUP BY LectureRoom;

----6
--SELECT AVG(Teachers.Salary) AS "Average Salary" 
--FROM Teachers, Lectures, GroupsLectures, Groups, Departments, Faculties
--WHERE Teachers.Id = Lectures.TeacherId AND Lectures.Id = GroupsLectures.LectureId 
--AND Groups.Id = GroupsLectures.GroupId AND Departments.Id = Groups.DepartmentId 
--AND Faculties.Id = Departments.FacultyId AND Faculties.Name = 'Computer Science';

----8
--SELECT AVG(Departments.Financing) AS "Average Financing" 
--FROM Departments;

----9
--SELECT Teachers.Name + ' ' + Teachers.Surname, COUNT(*) AS "Amount of Lectures"
--FROM Teachers, Lectures
--WHERE Teachers.Id = Lectures.TeacherId
--GROUP BY Teachers.Name + ' ' + Teachers.Surname;

----10
--SELECT GroupsLectures.DayOfWeek , COUNT(*) AS "Amount of Lectures"
--FROM GroupsLectures, Lectures
--WHERE Lectures.Id = GroupsLectures.LectureId
--GROUP BY GroupsLectures.DayOfWeek;

----11
--SELECT Lectures.LectureRoom, Departments.Name, COUNT(*) AS "Amount of Lectures"
--FROM Lectures, GroupsLectures, Groups, Departments
--WHERE Lectures.Id = GroupsLectures.LectureId AND Groups.Id = GroupsLectures.GroupId AND Departments.Id = Groups.DepartmentId
--GROUP BY Lectures.LectureRoom, Departments.Name;

----12
--SELECT DISTINCT Faculties.Name, COUNT(DISTINCT Subjects.Name) AS "Amount of Subjects"
--FROM Subjects, Lectures, GroupsLectures, Groups, Departments, Faculties
--WHERE Subjects.Id = Lectures.SubjectId AND Lectures.Id = GroupsLectures.LectureId 
--AND Groups.Id = GroupsLectures.GroupId AND Departments.Id = Groups.DepartmentId 
--AND Faculties.Id = Departments.FacultyId
--GROUP BY Faculties.Name;

----13
--SELECT Lectures.LectureRoom, COUNT(Distinct Teachers.Id) AS "Amount of Teachers"
--FROM Teachers, Lectures
--WHERE Teachers.Id = Lectures.TeacherId
--GROUP BY Lectures.LectureRoom;


