--							---1-----
--USE master   
--GO  
--CREATE DATABASE Airport   
--GO

USE Airport
GO

--CREATE TABLE Plane
--(
--	Number NVARCHAR(50) NOT NULL UNIQUE CHECK (Number <> N''),
--	Model NVARCHAR(50) NOT NULL CHECK (Model <> N''),
--	Speed INT NOT NULL CHECK (Speed > 0),
--	MaxRange INT NOT NULL CHECK (MaxRange > 0),
--	NumOfSeats INT NOT NULL CHECK (NumOfSeats > 0)
--);

--CREATE TABLE [Route]
--(
--	DeparturePoint NVARCHAR(100) NOT NULL CHECK (DeparturePoint <> N''),
--	ArrivalPoint NVARCHAR(100) NOT NULL CHECK (ArrivalPoint <> N''),
--	[Type] NVARCHAR(50) NOT NULL CHECK ([Type] <> N''),
--	Distance INT NOT NULL CHECK (Distance > 0)
--);

--CREATE TABLE Flight
--(
--	DepartureTime DATETIME2(0) NOT NULL,
--	ArrivalTime DATETIME2(0) NOT NULL,
--	AmountOfSoldTickets INT NOT NULL CHECK (AmountOfSoldTickets > 0) -- AmountOfSoldTickets < NumOfSeats
--);

												----INSERT----
--INSERT INTO Plane(Number, Model, Speed, MaxRange, NumOfSeats)
--VALUES
--('UR-ABZ', 'Airbus A310', 858, 3700, 183),
--('UR-ZYT', 'Boeing-737', 793, 2518, 122),
--('JA-ABZ', 'Airbus A310', 858, 3700, 183),
--('UN-ABZ', 'Boeing-737', 793, 2518, 122),
--('EX-ABZ', 'BAe ATP', 496, 1825, 64),
--('OD-ABZ', 'BAe ATP', 496, 1825, 64),
--('HB-ABZ', 'Boeing-737', 793, 2518, 122),
--('SP-ABZ', 'Piper PA-34', 348, 1611, 6),
--('N12345', 'Boeing-747', 917, 12100, 370),
--('G-13-47', 'Boeing-747', 917, 12100, 370);

--INSERT INTO [Route] (DeparturePoint, ArrivalPoint, [Type], Distance)
--VALUES 
--('Tokyo', 'Kyiv', 'Connecting', 8199),
--('Kyiv', 'Los Angeles', 'Connecting', 10180),
--('Kyiv', 'New York', 'Direct', 7540),
--('Paris', 'Kyiv', 'Nonstop', 2040), 
--('London', 'Kyiv', 'Nonstop', 2180),
--('London', 'Dubai', 'Direct', 7142),
--('Toronto', 'New York', 'Nonstop', 580),
--('Delhi', 'Mumbai', 'Connecting', 1163),
--('Krakow', 'Prague', 'Nonstop', 400),
--('Madrid', 'Rome', 'Direct', 1340);

--INSERT INTO Flight (DepartureTime, ArrivalTime, AmountOfSoldTickets)
--VALUES 
--('12/02/2019 15:30', '12/03/2019 9:30', 180), --Tokyo
--('12/15/2019 2:15', '12/15/2019 18:15', 118), --Los Angeles
--('12/18/2019 1:00', '12/18/2019 9:50', 175),  --New York
--('01/05/2020 4:15', '01/05/2019 7:30', 120), --Paris 
--('01/10/2020 10:10', '01/10/2020 13:30', 62), --London 
--('01/14/2020 23:45', '01/15/2020 8:35', 64), --London - Dubai 
--('01/26/2020 16:05', '01/26/2020 17:39', 115), --Toronto - New York 
--('02/02/2020 11:00', '02/02/2020 13:10', 6), --Delhi - Mumbai
--('02/19/2020 10:10', '02/19/2020 11:15', 356), --Krakow - Prague 
--('02/27/2020 4:10', '02/27/2020 8:50', 368)  --Madrid - Rome

								-----SELECT-----
--SELECT *
--FROM Plane;

--SELECT Model
--FROM Plane;

--SELECT DepartureTime, ArrivalTime
--FROM Flight;

--SELECT *
--FROM Plane
--WHERE Model LIKE 'Boeing%';

--SELECT * 
--FROM Plane
--WHERE Speed > 500;

--SELECT *
--FROM [Route]
--WHERE DeparturePoint IN ('Kyiv', 'London', 'Krakow');

--SELECT *
--FROM [Route]
--WHERE Distance BETWEEN 7000 AND 9000;

--SELECT *
--FROM Flight 
--WHERE DepartureTime LIKE '2019%'; 

--SELECT *
--FROM Flight 
--WHERE AmountOfSoldTickets < 100; 

--SELECT *
--FROM Plane
--ORDER BY Model, NumOfSeats;

--SELECT *
--FROM Flight
--ORDER BY AmountOfSoldTickets ASC;

--SELECT *
--FROM [Route]
--ORDER BY Distance DESC

------------------------------------------------------
--SELECT DeparturePoint, COUNT(*) AS DeparturePointsCount
--From [Route]
--GROUP BY DeparturePoint;

--SELECT ArrivalPoint, COUNT(*) AS ArrivalPointsCount
--From [Route]
--GROUP BY ArrivalPoint;

--SELECT Model, COUNT(*) AS ModelsCount
--From Plane
--GROUP BY Model;

--SELECT NumOfSeats, COUNT(*) AS NumOfSeatsCount
--From Plane
--GROUP BY NumOfSeats;

--SELECT [Type], COUNT(*) AS TypeCount
--From Route
--GROUP BY [Type];
-------------------------------------------------------
--SELECT DeparturePoint, COUNT(*) AS DeparturePointsCount, AVG(Distance) AS AverageDistance
--From [Route]
--GROUP BY DeparturePoint
--Having AVG(Distance) > 2500;

--SELECT ArrivalPoint, MIN(Distance) AS MinDistance
--From [Route]
--GROUP BY ArrivalPoint

--SELECT Model, COUNT(*) AS ModelsCount
--From Plane
--GROUP BY Model
--Having COUNT(*) > 3;

--SELECT NumOfSeats, COUNT(*) AS NumOfSeatsCount
--From Plane
--GROUP BY NumOfSeats
--Having COUNT(*) > 2;

--SELECT [Type], COUNT(*) AS TypeCount, AVG(Distance) AS AveDistance
--From Route
--GROUP BY [Type];
-------------------------------------------------------

--UPDATE Flight
--SET AmountOfSoldTickets += 2;

--UPDATE Plane
--SET Number = 'OD-IAA'
--WHERE id = 6;

--UPDATE [Route]           
--SET [Type] = 'Direct'
--WHERE id = 2;

------------------------------------------------------

--GO
--ALTER DATABASE Airport 
--MODIFY FILE
--    (NAME = Airport_dat,
--    SIZE = 25MB,
--	MAXSIZE = 65MB);
--GO

------------------------------------------------------

--ALTER TABLE Plane
--ADD id INT IDENTITY(1, 1) NOT NULL;

--ALTER TABLE [Route]
--ADD id INT IDENTITY(1, 1) NOT NULL;

--ALTER TABLE Flight
--ADD id INT IDENTITY(1, 1) NOT NULL;

-------------------------------------------------------
----------ON CREATE

--DROP TABLE Plane;
--DROP TABLE [Route];
--DROP TABLE Flight;

--CREATE TABLE Plane
--(
--	id INT IDENTITY NOT NULL,
--	Number NVARCHAR(50) NOT NULL  CHECK (Number <> N''),
--	Model NVARCHAR(50) NOT NULL CHECK (Model <> N''),
--	Speed INT NOT NULL CHECK (Speed > 0),
--	MaxRange INT NOT NULL CHECK (MaxRange > 0),
--	NumOfSeats INT NOT NULL CHECK (NumOfSeats > 0),
--	constraint PK_P primary key (ID, Number)
--);


--CREATE TABLE [Route]
--(
--	id INT IDENTITY PRIMARY KEY NOT NULL,
--	DeparturePoint NVARCHAR(100) NOT NULL CHECK (DeparturePoint <> N''),
--	ArrivalPoint NVARCHAR(100) NOT NULL CHECK (ArrivalPoint <> N''),
--	[Type] NVARCHAR(50) NOT NULL CHECK ([Type] <> N''),
--	Distance INT NOT NULL CHECK (Distance > 0)
--);

--CREATE TABLE Flight
--(
--	id INT IDENTITY PRIMARY KEY NOT NULL,
--	DepartureTime DATETIME2(0) NOT NULL,
--	ArrivalTime DATETIME2(0) NOT NULL,
--	AmountOfSoldTickets INT NOT NULL CHECK (AmountOfSoldTickets > 0) -- AmountOfSoldTickets < NumOfSeats
--);

----------
--INSERT INTO [Route]
--VALUES
--(1, 'Kyiv', 'Tokyo', 'Connecting', 8199)
----------
--INSERT INTO Plane
--VALUES
--(1, 'UR-ABZ', 'Airbus A310', 858, 3700, 183)

----------ON UPDATE
/*Drop tables and create default tables without primary keys*/

--ALTER TABLE Plane
--ADD CONSTRAINT PK_Plane PRIMARY KEY(id, Number);

--ALTER TABLE [Route]
--ADD CONSTRAINT PK_Route PRIMARY KEY(id);

--ALTER TABLE Flight
--ADD CONSTRAINT PK_Flight PRIMARY KEY(id);

--ALTER TABLE Plane
--DROP CONSTRAINT PK_Plane;

--ALTER TABLE [Route]
--DROP CONSTRAINT PK_Route;

--ALTER TABLE Flight
--DROP CONSTRAINT PK_Flight;
----------

----------

-----------------------------------------------
----------ON CREATE
--DROP TABLE Plane;
--DROP TABLE [Route];
--DROP TABLE Flight;

	----Composite primary key----
--CREATE TABLE Plane
--(
--	id INT IDENTITY PRIMARY KEY NOT NULL,
--	Number NVARCHAR(50) /*PRIMARY KEY*/ NOT NULL UNIQUE CHECK (Number <> N''),
--	Model NVARCHAR(50) NOT NULL CHECK (Model <> N''),
--	Speed INT NOT NULL CHECK (Speed > 0),
--	MaxRange INT NOT NULL CHECK (MaxRange > 0),
--	NumOfSeats INT NOT NULL CHECK (NumOfSeats > 0)
--);

--CREATE TABLE [Route]
--(
--	id INT IDENTITY PRIMARY KEY NOT NULL,
--	DeparturePoint NVARCHAR(100) NOT NULL CHECK (DeparturePoint <> N''),
--	ArrivalPoint NVARCHAR(100) NOT NULL CHECK (ArrivalPoint <> N''),
--	[Type] NVARCHAR(50) NOT NULL CHECK ([Type] <> N''),
--	Distance INT NOT NULL CHECK (Distance > 0)
--);

--CREATE TABLE Flight
--(
--	id INT IDENTITY PRIMARY KEY NOT NULL,
--	DepartureTime DATETIME2(0) NOT NULL,
--	ArrivalTime DATETIME2(0) NOT NULL,
--	AmountOfSoldTickets INT NOT NULL CHECK (AmountOfSoldTickets > 0), -- AmountOfSoldTickets < NumOfSeats
--	PlaneId INT NOT NULL,
--	RouteId INT NOT NULL,
--	FOREIGN KEY (PLaneId) REFERENCES PLane(id),
--	FOREIGN KEY (RouteId) REFERENCES [Route](Id)
--);

--INSERT INTO Plane(Number, Model, Speed, MaxRange, NumOfSeats)
--VALUES
--('UR-ABZ', 'Airbus A310', 858, 3700, 183),
--('UR-ZYT', 'Boeing-737', 793, 2518, 122),
--('JA-ABZ', 'Airbus A310', 858, 3700, 183),
--('UN-ABZ', 'Boeing-737', 793, 2518, 122),
--('EX-ABZ', 'BAe ATP', 496, 1825, 64),
--('OD-ABZ', 'BAe ATP', 496, 1825, 64),
--('HB-ABZ', 'Boeing-737', 793, 2518, 122),
--('SP-ABZ', 'Piper PA-34', 348, 1611, 6),
--('N12345', 'Boeing-747', 917, 12100, 370),
--('G-13-47', 'Boeing-747', 917, 12100, 370);
/*--('HA-AII', 'Boeing-737', 793, 2518, 122),
--('SP-POL', 'Piper PA-34', 348, 1611, 6),
--('N98542', 'BAe ATP', 496, 1825, 64),
--('G-11-34', 'Airbus A310', 858, 3700, 183);*/

--INSERT INTO [Route] (DeparturePoint, ArrivalPoint, [Type], Distance)
--VALUES 
----('Tokyo', 'Kyiv', 'Connecting', 8199),
----('Kyiv', 'Los Angeles', 'Connecting', 10180),
----('Kyiv', 'New York', 'Direct', 7540),
----('Paris', 'Kyiv', 'Nonstop', 2040), 
----('London', 'Kyiv', 'Nonstop', 2180),
----('London', 'Dubai', 'Direct', 7142),
----('Toronto', 'New York', 'Nonstop', 580),
----('Delhi', 'Mumbai', 'Connecting', 1163),
----('Krakow', 'Prague', 'Nonstop', 400),
----('Madrid', 'Rome', 'Direct', 1340);
/*('Tokyo', 'New York', 'Connecting', 10844),
('Krakow', 'New York', 'Nonstop', 6910),
('Rome', 'Kyiv', 'Direct', 2353),
('Paris', 'Amsterdam ', 'Connecting', 610);*/

--INSERT INTO Flight (DepartureTime, ArrivalTime, AmountOfSoldTickets, PlaneId, RouteId)
--VALUES 
--('12/02/2019 15:30', '12/03/2019 9:30', 180, 1, 1), --Tokyo
--('12/15/2019 2:15', '12/15/2019 18:15', 118, 2, 2), --Los Angeles
--('12/18/2019 1:00', '12/18/2019 9:50', 175, 3, 3),  --New York
--('01/05/2020 4:15', '01/05/2019 7:30', 120, 4, 4), --Paris 
--('01/10/2020 10:10', '01/10/2020 13:30', 62, 5, 5), --London 
--('01/14/2020 23:45', '01/15/2020 8:35', 64, 6, 6), --London - Dubai 
--('01/26/2020 16:05', '01/26/2020 17:39', 115, 7, 7), --Toronto - New York 
--('02/02/2020 11:00', '02/02/2020 13:10', 6, 8, 8), --Delhi - Mumbai
--('02/19/2020 10:10', '02/19/2020 11:15', 356, 9, 9), --Krakow - Prague 
--('02/27/2020 4:10', '02/27/2020 8:50', 368, 10, 10)  --Madrid - Rome
----------

----------

----------ON UPDATE
/*Drop tables and create default tables with primary keys*/

--ALTER TABLE Flight
--ADD CONSTRAINT FK_Flight_To_Plane FOREIGN KEY (PlaneId) REFERENCES Plane(Id) 
--GO

--ALTER TABLE Flight
--ADD CONSTRAINT FK_Flight_To_Route FOREIGN KEY (RouteId) REFERENCES [Route](Id) 
--GO

--ALTER TABLE Flight
--DROP CONSTRAINT FK_Flight_To_Route;

--ALTER TABLE Flight
--DROP CONSTRAINT FK_Flight_To_Plane;

----------
--INSERT INTO Flight (DepartureTime, ArrivalTime, AmountOfSoldTickets, PlaneId, RouteId)
--VALUES 
--('02/27/2020 4:10', '02/27/2020 8:50', 368, 11, 19)
----------
--------------------------------------------------------

--ALTER TABLE Flight
--ADD FOREIGN KEY (PlaneId) REFERENCES Plane(Id) ON UPDATE SET NULL
--GO

--ALTER TABLE Flight
--ADD FOREIGN KEY (RouteId) REFERENCES [Route](Id) ON UPDATE SET DEFAULT
--GO

--ALTER TABLE Flight
--ADD FOREIGN KEY (PlaneId) REFERENCES Plane(Id) ON DELETE CASCADE
--GO

--ALTER TABLE Flight
--ADD FOREIGN KEY (RouteId) REFERENCES [Route](Id) ON DELETE NO ACTION
--GO

---------------------------------------------------------

--CREATE TABLE Plane
--(
--	Number NVARCHAR(50) NOT NULL UNIQUE CHECK (Number <> N''),
--	Model NVARCHAR(50) NOT NULL CHECK (Model <> N''),
--	Speed INT NOT NULL CHECK (Speed > 0),
--	MaxRange INT NOT NULL CHECK (MaxRange > 0),
--	NumOfSeats INT NOT NULL CHECK (NumOfSeats > 0)
--);

--CREATE TABLE [Route]
--(
--	DeparturePoint NVARCHAR(100) NOT NULL CHECK (DeparturePoint <> N''),
--	ArrivalPoint NVARCHAR(100) NOT NULL CHECK (ArrivalPoint <> N''),
--	[Type] NVARCHAR(50) NOT NULL CHECK ([Type] <> N''),
--	Distance INT NOT NULL CHECK (Distance > 0)
--);

--CREATE TABLE Flight
--(
--	DepartureTime DATETIME2(0) NOT NULL,
--	ArrivalTime DATETIME2(0) NOT NULL,
--	AmountOfSoldTickets INT NOT NULL CHECK (AmountOfSoldTickets > 0) -- AmountOfSoldTickets < NumOfSeats
--);

--------------------------------------------------------------------------

--ALTER TABLE Plane
--ADD CONSTRAINT U_Number UNIQUE;

--ALTER TABLE Plane
--ADD CONSTRAINT CK_Speed CHECK (Speed > 0);

--ALTER TABLE Plane
--ADD CONSTRAINT CK_NumOfSeats CHECK (NumOfSeats > 0);

--ALTER TABLE [Route]
--ADD CONSTRAINT CK_DeparturePoint CHECK (DeparturePoint <> N'');

--ALTER TABLE [Route]
--ADD CONSTRAINT CK_ArrivalPoint CHECK (ArrivalPoint <> N'');

--ALTER TABLE Flight
--ADD CONSTRAINT CK_AmountOfSoldTickets CHECK (AmountOfSoldTickets > 0);

------------
--ALTER TABLE Plane  
--NOCHECK CONSTRAINT U_Number;

--ALTER TABLE Plane  
--NOCHECK CONSTRAINT CK_Speed;

--ALTER TABLE [Route]  
--NOCHECK CONSTRAINT CK_DeparturePoint;

--ALTER TABLE Flight 
--NOCHECK CONSTRAINT CK_AmountOfSoldTickets;
------------
--ALTER TABLE Plane  
--DROP CONSTRAINT U_Number;

--ALTER TABLE Plane  
--DROP CONSTRAINT CK_Speed;

--ALTER TABLE [Route]  
--DROP CONSTRAINT CK_DeparturePoint;

--ALTER TABLE Flight  
--DROP CONSTRAINT CK_AmountOfSoldTickets;
----------------------------------------------------------------------------
/*--------------------------Without normalization------------------------------*/

--CREATE TABLE FlightSchedule
--(
--	Number NVARCHAR(50) PRIMARY KEY NOT NULL CHECK (Number <> N''),
--	Model NVARCHAR(50) NOT NULL CHECK (Model <> N''),
--	Speed INT NOT NULL CHECK (Speed > 0),
--	MaxRange INT NOT NULL CHECK (MaxRange > 0),
--	NumOfSeats INT NOT NULL CHECK (NumOfSeats > 0),
--	DeparturePoint NVARCHAR(100) NOT NULL CHECK (DeparturePoint <> N''),
--	ArrivalPoint NVARCHAR(100) NOT NULL CHECK (ArrivalPoint <> N''),
--	[Type] NVARCHAR(50) NOT NULL CHECK ([Type] <> N''),
--	Distance INT NOT NULL CHECK (Distance > 0),
--	DepartureTime DATETIME2(0) NOT NULL,
--	ArrivalTime DATETIME2(0) NOT NULL,
--	AmountOfSoldTickets INT NOT NULL CHECK (AmountOfSoldTickets > 0) -- AmountOfSoldTickets < NumOfSeats
--);

--INSERT INTO FlightSchedule(Number, Model, Speed, MaxRange, NumOfSeats, DeparturePoint, ArrivalPoint, [Type], Distance, DepartureTime, ArrivalTime, AmountOfSoldTickets)
--VALUES
--('UR-ABZ', 'Airbus A310', 858, 3700, 183, 'Japan, Tokyo', 'Ukraine, Kyiv', 'Connecting', 8199,'12/02/2019 15:30', '12/03/2019 9:30', 180),
--('UR-ZYT', 'Boeing-737', 793, 2518, 122, 'Ukraine, Kyiv', 'USA, Los Angeles', 'Connecting', 10180,'12/15/2019 2:15', '12/15/2019 18:15', 118),
--('JA-ABZ', 'Airbus A310', 858, 3700, 183, 'Ukraine, Kyiv', 'USA, New York', 'Direct', 7540,'12/18/2019 1:00', '12/18/2019 9:50', 175),
--('UN-ABZ', 'Boeing-737', 793, 2518, 122, 'France, Paris', 'Ukraine, Kyiv', 'Nonstop', 2040,'01/05/2020 4:15', '01/05/2019 7:30', 120),
--('EX-ABZ', 'BAe ATP', 496, 1825, 64, 'United Kingdom, London', 'Ukraine, Kyiv', 'Nonstop', 2180,'01/10/2020 10:10', '01/10/2020 13:30', 62), 
--('OD-ABZ', 'BAe ATP', 496, 1825, 64, 'United Kingdom, London', 'UAE, Dubai', 'Direct', 7142,'01/14/2020 23:45', '01/15/2020 8:35', 64),
--('HB-ABZ', 'Boeing-737', 793, 2518, 122, 'USA, Toronto', 'USA, New York', 'Nonstop', 580,'01/26/2020 16:05', '01/26/2020 17:39', 115),
--('SP-ABZ', 'Piper PA-34', 348, 1611, 6, 'India, Delhi', 'India, Mumbai', 'Connecting', 1163, '02/02/2020 11:00', '02/02/2020 13:10', 6),
--('N12345', 'Boeing-747', 917, 12100, 370, 'Poland, Krakow', 'Czech Republic, Prague', 'Nonstop', 400,'02/19/2020 10:10', '02/19/2020 11:15', 356),
--('G-13-47', 'Boeing-747', 917, 12100, 370, 'Spain, Madrid', 'Italy, Rome', 'Direct', 1340,'02/27/2020 4:10', '02/27/2020 8:50', 368);

/*----------------- 1 Normal Form ---------------------*/
--CREATE TABLE FlightSchedule
--(
--	id INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
--	Number NVARCHAR(50) NOT NULL CHECK (Number <> N''),
--	Model NVARCHAR(50) NOT NULL CHECK (Model <> N''),
--	Speed INT NOT NULL CHECK (Speed > 0),
--	MaxRange INT NOT NULL CHECK (MaxRange > 0),
--	NumOfSeats INT NOT NULL CHECK (NumOfSeats > 0),
--	DepartureCity NVARCHAR(50) NOT NULL CHECK (DepartureCity <> N''),
--	DepartureCountry NVARCHAR(50) NOT NULL CHECK (DepartureCountry <> N''),
--	ArrivalCity NVARCHAR(50) NOT NULL CHECK (ArrivalCity <> N''),
--	ArrivalCountry NVARCHAR(50) NOT NULL CHECK (ArrivalCountry <> N''),
--	[Type] NVARCHAR(50) NOT NULL CHECK ([Type] <> N''),
--	Distance INT NOT NULL CHECK (Distance > 0),
--	DepartureDate DATE NOT NULL,
--	DepartureTime TIME(0) NOT NULL,
--	ArrivalDate DATE NOT NULL,
--	ArrivalTime TIME(0) NOT NULL,
--	AmountOfSoldTickets INT NOT NULL CHECK (AmountOfSoldTickets > 0) -- AmountOfSoldTickets < NumOfSeats
--);

--INSERT INTO FlightSchedule(Number, Model, Speed, MaxRange, NumOfSeats, DepartureCountry, DepartureCity, ArrivalCity, ArrivalCountry, [Type], Distance, DepartureDate, DepartureTime, ArrivalDate, ArrivalTime, AmountOfSoldTickets)
--VALUES
--('UR-ABZ', 'Airbus A310', 858, 3700, 183, 'Japan','Tokyo', 'Ukraine','Kyiv', 'Connecting', 8199,'12/02/2019','15:30', '12/03/2019','9:30', 180),
--('UR-ZYT', 'Boeing-737', 793, 2518, 122, 'Ukraine','Kyiv', 'USA','Los Angeles', 'Connecting', 10180,'12/15/2019','2:15', '12/15/2019','18:15', 118),
--('JA-ABZ', 'Airbus A310', 858, 3700, 183, 'Ukraine','Kyiv', 'USA','New York', 'Direct', 7540,'12/18/2019','1:00', '12/18/2019','9:50', 175),
--('UN-ABZ', 'Boeing-737', 793, 2518, 122, 'France','Paris', 'Ukraine','Kyiv', 'Nonstop', 2040,'01/05/2020','4:15', '01/05/2019','7:30', 120),
--('EX-ABZ', 'BAe ATP', 496, 1825, 64, 'United Kingdom','London', 'Ukraine','Kyiv', 'Nonstop', 2180,'01/10/2020','10:10', '01/10/2020','13:30', 62), 
--('OD-ABZ', 'BAe ATP', 496, 1825, 64, 'United Kingdom,','London', 'UAE','Dubai', 'Direct', 7142,'01/14/2020','23:45', '01/15/2020','8:35', 64),
--('HB-ABZ', 'Boeing-737', 793, 2518, 122, 'USA','Toronto', 'USA','New York', 'Nonstop', 580,'01/26/2020','16:05', '01/26/2020','17:39', 115),
--('SP-ABZ', 'Piper PA-34', 348, 1611, 6, 'India','Delhi', 'India','Mumbai', 'Connecting', 1163, '02/02/2020','11:00', '02/02/2020','13:10', 6),
--('N12345', 'Boeing-747', 917, 12100, 370, 'Poland','Krakow', 'Czech Republic','Prague', 'Nonstop', 400,'02/19/2020','10:10', '02/19/2020','11:15', 356),
--('G-13-47', 'Boeing-747', 917, 12100, 370, 'Spain','Madrid', 'Italy','Rome', 'Direct', 1340,'02/27/2020','4:10', '02/27/2020','8:50', 368);

/*----------------- 2 Normal Form ---------------------*/

--CREATE TABLE PlaneModel
--(
--	id INT IDENTITY PRIMARY KEY NOT NULL,
--	Model NVARCHAR(50) NOT NULL CHECK (Model <> N''),
--	Speed INT NOT NULL CHECK (Speed > 0),
--	MaxRange INT NOT NULL CHECK (MaxRange > 0),
--	NumOfSeats INT NOT NULL CHECK (NumOfSeats > 0)
--);

--CREATE TABLE Plane
--(
--	id INT IDENTITY PRIMARY KEY NOT NULL,
--	Number NVARCHAR(50) NOT NULL UNIQUE CHECK (Number <> N''),
--	PlaneModelId INT NOT NULL,
--	FOREIGN KEY (PlaneModelId) REFERENCES PlaneModel(Id)
--);

--CREATE TABLE [Route]
--(
--	id INT IDENTITY PRIMARY KEY NOT NULL,
--	DepartureCity NVARCHAR(50) NOT NULL CHECK (DepartureCity <> N''),
--	DepartureCountry NVARCHAR(50) NOT NULL CHECK (DepartureCountry <> N''),
--	ArrivalCity NVARCHAR(50) NOT NULL CHECK (ArrivalCity <> N''),
--	ArrivalCountry NVARCHAR(50) NOT NULL CHECK (ArrivalCountry <> N''),
--	[Type] NVARCHAR(50) NOT NULL CHECK ([Type] <> N''),
--	Distance INT NOT NULL CHECK (Distance > 0),
--);

--CREATE TABLE Flight
--(
--	id INT IDENTITY PRIMARY KEY NOT NULL,
--	DepartureDate DATE NOT NULL,
--	DepartureTime TIME(0) NOT NULL,
--	ArrivalDate DATE NOT NULL,
--	ArrivalTime TIME(0) NOT NULL,
--	AmountOfSoldTickets INT NOT NULL CHECK (AmountOfSoldTickets > 0), -- AmountOfSoldTickets < NumOfSeats
--	PlaneId INT NOT NULL,
--	RouteId INT NOT NULL,
--	FOREIGN KEY (PLaneId) REFERENCES PLane(id),
--	FOREIGN KEY (RouteId) REFERENCES [Route](id)
--);

--INSERT INTO PlaneModel(Model, Speed, MaxRange, NumOfSeats)
--VALUES
--('Airbus A310', 858, 3700, 183),
--('BAe ATP', 496, 1825, 64),
--('Boeing-737', 793, 2518, 122),
--('Piper PA-34', 348, 1611, 6),
--('Boeing-747', 917, 12100, 370);

--INSERT INTO Plane(Number, PlaneModelId)
--VALUES
--('UR-ABZ', 1),
--('UR-ZYT', 3),
--('JA-ABZ', 1),
--('UN-ABZ', 3),
--('EX-ABZ', 2),
--('OD-ABZ', 2),
--('HB-ABZ', 3),
--('SP-ABZ', 4),
--('N12345', 5),
--('G-13-47', 5);

--INSERT INTO [Route] (DepartureCountry, DepartureCity, ArrivalCity, ArrivalCountry, [Type], Distance)
--VALUES 
--('Japan','Tokyo', 'Ukraine','Kyiv', 'Connecting', 8199),
--('Ukraine','Kyiv', 'USA','Los Angeles', 'Connecting', 10180),
--('Ukraine','Kyiv', 'USA','New York', 'Direct', 7540),
--('France','Paris', 'Ukraine','Kyiv', 'Nonstop', 2040),
--('United Kingdom','London', 'Ukraine','Kyiv', 'Nonstop', 2180), 
--('United Kingdom,','London', 'UAE','Dubai', 'Direct', 7142),
--('USA','Toronto', 'USA','New York', 'Nonstop', 580),
--('India','Delhi', 'India','Mumbai', 'Connecting', 11636),
--('Poland','Krakow', 'Czech Republic','Prague', 'Nonstop', 400),
--('Spain','Madrid', 'Italy','Rome', 'Direct', 1340);

--INSERT INTO Flight (DepartureDate, DepartureTime, ArrivalDate, ArrivalTime, AmountOfSoldTickets, PLaneId, RouteId)
--VALUES 
--('12/02/2019', '15:30', '12/03/2019', '9:30', 180, 1, 1), --Tokyo
--('12/15/2019', '2:15', '12/15/2019', '18:15', 118, 2, 2), --Los Angeles
--('12/18/2019', '1:00', '12/18/2019', '9:50', 175, 3, 3),  --New York
--('01/05/2020', '4:15', '01/05/2019', '7:30', 120, 4, 4), --Paris 
--('01/10/2020', '10:10', '01/10/2020', '13:30', 62, 5, 5), --London 
--('01/14/2020', '23:45', '01/15/2020', '8:35', 64, 6, 6), --London - Dubai 
--('01/26/2020', '16:05', '01/26/2020', '17:39', 115, 7, 7), --Toronto - New York 
--('02/02/2020', '11:00', '02/02/2020', '13:10', 6, 8, 8), --Delhi - Mumbai
--('02/19/2020', '10:10', '02/19/2020', '11:15', 356, 9, 9), --Krakow - Prague 
--('02/27/2020', '4:10', '02/27/2020', '8:50', 368, 10, 10)  --Madrid - Rome
/*----------------- 3 Normal Form ---------------------*/
--drop table PlaneModel
--drop table Plane
--drop table RouteType
--drop table City
--drop table route
--drop table Flight

--CREATE TABLE PlaneModel
--(
--	id INT IDENTITY PRIMARY KEY NOT NULL,
--	Model NVARCHAR(50) NOT NULL CHECK (Model <> N''),
--	Speed INT NOT NULL CHECK (Speed > 0),
--	MaxRange INT NOT NULL CHECK (MaxRange > 0),
--	NumOfSeats INT NOT NULL CHECK (NumOfSeats > 0)
--);

--CREATE TABLE Plane
--(
--	id INT IDENTITY PRIMARY KEY NOT NULL,
--	Number NVARCHAR(50) NOT NULL UNIQUE CHECK (Number <> N''),
--	PlaneModelId INT NOT NULL,
--	FOREIGN KEY (PlaneModelId) REFERENCES PlaneModel(Id)
--);

--CREATE TABLE RouteType
--(
--	id INT IDENTITY PRIMARY KEY NOT NULL,
--	[Type] NVARCHAR(50) NOT NULL UNIQUE CHECK ([Type] <> N'')
--);

--CREATE TABLE City
--(
--	id INT IDENTITY PRIMARY KEY NOT NULL,
--	CityName NVARCHAR(50) NOT NULL CHECK (CityName <> N''),
--	CountryName NVARCHAR(50) NOT NULL CHECK (CountryName <> N'')
--);

--CREATE TABLE [Route]
--(
--	id INT IDENTITY PRIMARY KEY NOT NULL,
--	DeparturePointId INT NOT NULL,
--	ArrivalPointId INT NOT NULL,
--	TypeId  INT NOT NULL,
--	Distance INT NOT NULL CHECK (Distance > 0),
--	FOREIGN KEY (TypeId) REFERENCES RouteType(Id),
--	FOREIGN KEY (DeparturePointId) REFERENCES City(Id),
--	FOREIGN KEY (ArrivalPointId) REFERENCES City(Id)
--);

--CREATE TABLE Flight
--(
--	id INT IDENTITY PRIMARY KEY NOT NULL,
--	DepartureDate DATE NOT NULL,
--	DepartureTime TIME(0) NOT NULL,
--	ArrivalDate DATE NOT NULL,
--	ArrivalTime TIME(0) NOT NULL,
--	AmountOfSoldTickets INT NOT NULL CHECK (AmountOfSoldTickets > 0), -- AmountOfSoldTickets < NumOfSeats
--	PlaneId INT NOT NULL,
--	RouteId INT NOT NULL,
--	FOREIGN KEY (PLaneId) REFERENCES PLane(id),
--	FOREIGN KEY (RouteId) REFERENCES [Route](Id)
--);

--INSERT INTO PlaneModel(Model, Speed, MaxRange, NumOfSeats)
--VALUES
--('Airbus A310', 858, 3700, 183),
--('BAe ATP', 496, 1825, 64),
--('Boeing-737', 793, 2518, 122),
--('Piper PA-34', 348, 1611, 6),
--('Boeing-747', 917, 12100, 370);

--INSERT INTO Plane(Number, PlaneModelId)
--VALUES
--('UR-ABZ', 1),
--('UR-ZYT', 3),
--('JA-ABZ', 1),
--('UN-ABZ', 3),
--('EX-ABZ', 2),
--('OD-ABZ', 2),
--('HB-ABZ', 3),
--('SP-ABZ', 4),
--('N12345', 5),
--('G-13-47', 5);

--INSERT INTO [Route] (DeparturePointId, ArrivalPointId, TypeId, Distance)
--VALUES 
--(1, 2, 1, 8199),
--(2, 3, 1, 10180),
--(2, 4, 2, 7540),
--(13, 2, 3, 2040),
--(5, 2, 3, 2180), 
--(5, 14, 2, 7142),
--(6, 4, 3, 580),
--(7, 8, 1, 11636),
--(9, 12, 3, 400),
--(10, 11, 2, 1340);

--INSERT INTO City (CountryName, CityName)
--VALUES
--('Japan','Tokyo'),
--('Ukraine','Kyiv'),
--('USA','Los Angeles'),
--('USA','New York'),
--('United Kingdom','London'),
--('USA','Toronto'),
--('India','Delhi'),
--('India','Mumbai'),
--('Poland','Krakow'),
--('Spain','Madrid'),
--('Italy','Rome'),
--('Czech Republic','Prague'),
--('France','Paris'),
--('UAE','Dubai')

--INSERT INTO RouteType (Type)
--VALUES
--('Connecting'),
--('Direct'),
--('Nonstop')

--INSERT INTO Flight (DepartureDate, DepartureTime, ArrivalDate, ArrivalTime, AmountOfSoldTickets, PLaneId, RouteId)
--VALUES 
--('12/02/2019', '15:30', '12/03/2019', '9:30', 180, 1, 1), --Tokyo
--('12/15/2019', '2:15', '12/15/2019', '18:15', 118, 2, 2), --Los Angeles
--('12/18/2019', '1:00', '12/18/2019', '9:50', 175, 3, 3),  --New York
--('01/05/2020', '4:15', '01/05/2019', '7:30', 120, 4, 4), --Paris 
--('01/10/2020', '10:10', '01/10/2020', '13:30', 62, 5, 5), --London 
--('01/14/2020', '23:45', '01/15/2020', '8:35', 64, 6, 6), --London - Dubai 
--('01/26/2020', '16:05', '01/26/2020', '17:39', 115, 7, 7), --Toronto - New York 
--('02/02/2020', '11:00', '02/02/2020', '13:10', 6, 8, 8), --Delhi - Mumbai
--('02/19/2020', '10:10', '02/19/2020', '11:15', 356, 9, 9), --Krakow - Prague 
--('02/27/2020', '4:10', '02/27/2020', '8:50', 368, 10, 10)  --Madrid - Rome


----------------------------------------------------------------
/*--------------INNER JOIN----------------*/
--SELECT Plane.Number, Plane.Model, Flight.DepartureTime, Flight.ArrivalTime, Flight.AmountOfSoldTickets
--FROM Flight
--INNER JOIN Plane ON Flight.PlaneId = Plane.id;

--SELECT [Route].DeparturePoint, [Route].ArrivalPoint, Flight.DepartureTime, Flight.ArrivalTime
--FROM Flight
--INNER JOIN [Route] ON Flight.RouteId = [Route].id;

--SELECT *
--FROM Flight
--INNER JOIN Plane ON Flight.PlaneId = Plane.id
--INNER JOIN [Route] ON Flight.RouteId = [Route].id;

/*--------------LEFT OUTER JOIN-----------*/
--SELECT Plane.Number, Plane.Model, Flight.DepartureTime, Flight.ArrivalTime, Flight.AmountOfSoldTickets
--FROM Plane
--LEFT OUTER JOIN Flight ON Plane.id = Flight.PlaneId;

--SELECT [Route].DeparturePoint, [Route].ArrivalPoint, Flight.DepartureTime, Flight.ArrivalTime
--FROM [Route]
--LEFT OUTER JOIN Flight ON [Route].id = Flight.RouteId;

--SELECT *
--FROM Plane
--LEFT OUTER JOIN Flight ON Plane.id = Flight.PlaneId
--LEFT OUTER JOIN [Route] ON Flight.RouteId = [Route].id;
/*--------------RIGHT OUTER JOIN----------*/
--SELECT Plane.Number, Plane.Model, Flight.DepartureTime, Flight.ArrivalTime, Flight.AmountOfSoldTickets
--FROM Plane
--RIGHT OUTER JOIN Flight ON Plane.id = Flight.PlaneId;

--SELECT [Route].DeparturePoint, [Route].ArrivalPointId, Flight.DepartureTime, Flight.ArrivalTime
--FROM [Route]
--RIGHT OUTER JOIN Plane ON [Route].id = Flight.RouteId;

--SELECT *
--FROM Plane
--RIGHT OUTER JOIN Flight ON Plane.id = Flight.PlaneId
--RIGHT OUTER JOIN [Route] ON Flight.RouteId = [Route].id;
/*--------------FULL OUTER JOIN-----------*/
--SELECT Plane.Number, Plane.Model, Flight.DepartureTime, Flight.ArrivalTime, Flight.AmountOfSoldTickets
--FROM Plane
--FULL OUTER JOIN Flight ON Plane.id = Flight.PlaneId;

--SELECT [Route].DeparturePoint, [Route].ArrivalPointId, Flight.DepartureTime, Flight.ArrivalTime
--FROM [Route]
--FULL OUTER JOIN Plane ON [Route].id = Flight.RouteId;

--SELECT *
--FROM Plane
--FULL OUTER JOIN Flight ON Plane.id = Flight.PlaneId
--FULL OUTER JOIN [Route] ON Flight.RouteId = [Route].id;
/*--------------CROSS JOIN----------------*/
--SELECT Plane.Number, Plane.Model, Flight.DepartureTime, Flight.ArrivalTime, Flight.AmountOfSoldTickets
--FROM Plane
--CROSS JOIN Flight;

--SELECT [Route].DeparturePoint, [Route].ArrivalPoint, Flight.DepartureTime, Flight.ArrivalTime
--FROM [Route]
--CROSS JOIN Flight;

/*----------------------UNION----------------------*/
--SELECT Model
--FROM Plane
--UNION SELECT DeparturePoint  
--FROM [Route];

--SELECT ArrivalPoint
--FROM [Route]
--UNION SELECT DeparturePoint  
--FROM [Route];
/*----------------------UNION ALL------------------*/
--SELECT Model
--FROM Plane
--UNION ALL SELECT DeparturePoint  
--FROM [Route];

--SELECT ArrivalPoint
--FROM [Route]
--UNION ALL SELECT DeparturePoint  
--FROM [Route];
/*----------------------EXCEPT---------------------*/
--SELECT ArrivalPoint
--FROM [Route]
--EXCEPT SELECT DeparturePoint  
--FROM [Route];

--SELECT NumOfSeats
--FROM Plane
--EXCEPT SELECT AmountOfSoldTickets  
--FROM Flight;
/*----------------------INTERSECT------------------*/
--SELECT ArrivalPoint
--FROM [Route]
--INTERSECT SELECT DeparturePoint  
--FROM [Route];

--SELECT NumOfSeats
--FROM Plane
--INTERSECT SELECT AmountOfSoldTickets  
--FROM Flight;

----------------------------------------------------------
--SELECT *
--FROM Plane
--WHERE Speed = (SELECT MIN(Speed) FROM Plane)

--SELECT *
--FROM [Route]
--WHERE Distance = (SELECT MIN(Distance) FROM [Route])

--SELECT *
--FROM Flight
--WHERE AmountOfSoldTickets = (SELECT MIN(AmountOfSoldTickets) FROM Flight)
-----------------------------------------------------------
--SELECT * 
--FROM Plane 
--WHERE Speed IN 
--(SELECT Speed 
--FROM Plane 
--WHERE Speed > 800)

--SELECT * 
--FROM [Route] 
--WHERE Distance IN 
--(SELECT Distance 
--FROM Plane 
--WHERE Distance > 7000)

--SELECT *
--FROM [Route] 
--WHERE DeparturePoint IN 
--(SELECT DeparturePoint 
--FROM [Route] 
--WHERE DeparturePoint = 'Kyiv')
-------------------------------------------------
--SELECT Number, Model, DepartureTime, ArrivalTime
--FROM Plane JOIN Flight
--ON Plane.id = Flight.PlaneId
--WHERE 'Connecting' IN (SELECT [Type] FROM [Route] WHERE Flight.RouteId = Route.Id);

--SELECT DepartureTime, ArrivalTime, AmountOfSoldTickets
--FROM Flight
--WHERE 'Kyiv' IN (SELECT DeparturePoint FROM [Route] WHERE Flight.RouteId = Route.Id);

--SELECT Number, Model, DepartureTime, ArrivalTime
--FROM Plane JOIN Flight
--ON Plane.id = Flight.PlaneId
--WHERE 'Boeing-737' IN (SELECT Model FROM Plane WHERE Plane.Id = Flight.PlaneId);
-------------------------------------------------------------------------------------
--DECLARE plane_cursor CURSOR FOR  
--SELECT Number, Model, Speed 
--FROM Plane
--WHERE Speed > 700
--ORDER BY Speed;  

--OPEN plane_cursor;  
--FETCH NEXT FROM plane_cursor;  
--WHILE @@FETCH_STATUS = 0  
--BEGIN  
--FETCH NEXT FROM plane_cursor;  
--END   
--CLOSE plane_cursor;  
--DEALLOCATE plane_cursor; 

--DECLARE plane_cursor_prev CURSOR SCROLL FOR  
--SELECT Number, Model, Speed 
--FROM Plane
--WHERE Speed > 700
--ORDER BY Speed;   
--OPEN plane_cursor_prev;  
--FETCH LAST FROM plane_cursor_prev;  
--WHILE @@FETCH_STATUS = 0  
--BEGIN  
--FETCH PRIOR FROM plane_cursor_prev;  
--END   
--CLOSE plane_cursor_prev;  
--DEALLOCATE plane_cursor_prev;  


--DECLARE plane_cursor_last CURSOR SCROLL FOR  
--SELECT Number, Model, Speed 
--FROM Plane
--WHERE Speed > 700
--ORDER BY Speed;   
--OPEN plane_cursor_last
--FETCH LAST FROM plane_cursor_last
--CLOSE plane_cursor_last
--DEALLOCATE plane_cursor_last; 

--DECLARE plane_cursor_first CURSOR SCROLL FOR  
--SELECT Number, Model, Speed 
--FROM Plane
--WHERE Speed > 700
--ORDER BY Speed;   
--OPEN plane_cursor_first
--FETCH FIRST FROM plane_cursor_first
--CLOSE plane_cursor_first
--DEALLOCATE plane_cursor_first; 

--DECLARE plane_cursor CURSOR FOR  
--SELECT id, Number, Model, Speed 
--FROM Plane
--WHERE id = 7;  
--OPEN plane_cursor
--FETCH NEXT FROM plane_cursor;  
--CLOSE plane_cursor;  
--DEALLOCATE plane_cursor;

--DECLARE plane_cursor CURSOR SCROLL FOR  
--SELECT id, Number, Model, Speed 
--FROM Plane
--WHERE id = 7;  
--OPEN plane_cursor
--FETCH LAST FROM plane_cursor; 
--FETCH PRIOR FROM plane_cursor;
--CLOSE plane_cursor;  
--DEALLOCATE plane_cursor;

--DECLARE plane_cursor CURSOR LOCAL FOR  
--SELECT Number, Model, Speed 
--FROM Plane
--WHERE Speed > 700
--OPEN plane_cursor;
--FETCH NEXT FROM plane_cursor;  
--WHILE @@FETCH_STATUS = 0  
--BEGIN  
--FETCH NEXT FROM plane_cursor;  
--END   
--CLOSE plane_cursor;  
--DEALLOCATE plane_cursor;  

----------------------------------------------------
--SELECT *
--FROM Plane
--WHERE Number = 'SP-ABZ';

--SELECT *
--FROM Plane;

--CREATE CLUSTERED INDEX IX_Plane_Number  
--ON Plane (Number);

--SELECT *
--FROM Plane
--WHERE Number LIKE 'UR%';

--CREATE NONCLUSTERED INDEX IX_Plane_Number_NC  
--ON Plane (Number);
-------------------------------------------------------
--CREATE VIEW plane_view
--AS SELECT * 
--FROM Plane 
--WHERE Speed > 800

--SELECT *
--FROM plane_view  
--ORDER BY Number; 

--CREATE VIEW route_view
--AS SELECT * 
--FROM [Route] 
--WHERE DeparturePoint = 'Kyiv'

--SELECT *
--FROM route_view  
--ORDER BY DeparturePoint; 

--CREATE VIEW flight_view
--AS SELECT * 
--FROM Flight 
--WHERE AmountOfSoldTickets > 170

--SELECT *
--FROM flight_view

--CREATE VIEW view_all
--AS SELECT a.Number, a.Model, b.ArrivalTime, b.DepartureTime
--FROM Plane a JOIN Flight b
--ON a.id = b.PlaneId
--WHERE a.Model LIKE 'Boeing-737' 

--SELECT *
--FROM view_all

--UPDATE flight_view
--SET AmountOfSoldTickets += 2
--WHERE  PlaneId > 5;

