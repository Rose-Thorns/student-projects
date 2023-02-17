--create database MusicCollection
--go
--use MusicCollection
--go

--create table Styles
--(
--	id int not null identity primary key,
--	sName nvarchar(50) not null unique check (sName <> N'')
--);

--create table Performers
--(
--	id int not null identity primary key,
--	pName nvarchar(50) not null unique check (pName <> N'')
--);

--create table Publishers
--(
--	id int not null identity primary key,
--	pName nvarchar(50) not null unique check (pName <> N''),
--	country nvarchar(50) not null unique check (country <> N'')
--);

--create table Disks
--(
--	id int not null identity primary key,
--	dName nvarchar(50) not null unique check (dName <> N''),
--	publishDate date not null check (publishDate > cast(getdate() as date)),
--	performerId int not null,
--	styleId int not null,
--	publisherId int not null,
--	foreign key (performerId) references Performers(id),
--	foreign key (styleId) references Styles(id),
--	foreign key (publisherId) references Publishers(id)
--);

--create table Songs
--(
--	id int not null identity primary key,
--	sName nvarchar(50) not null unique check (sName <> N''),
--	duration float not null check (duration > 0.0),
--	diskId int not null,
--	foreign key (diskId) references Disks(id)
--);

----Insert----

----CREATE VIEW----

--create view CollectionView as 
--select *
--from Song/*s*/

--select *
--from CollectionView;

--create view DiskSong (Disks.dName, Song.sName) as
--select Disks.dName, Song.sName
--from Disks join song on disks.id = song.diskId