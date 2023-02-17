--create database BookShop
--go
use BookShop
go

--create table Themes
--(
--id int not null identity primary key,
--name nvarchar(100) not null unique
--);

--create table Countries
--(
--id int not null identity primary key,
--name nvarchar(50) not null unique check (name <> N''),
--);

--create table Authors
--(
--id int not null identity primary key,
--name nvarchar(100) not null check (name <> N''),
--surname nvarchar(max) not null check (surname <> N''),
--countryId int not null,
--foreign key (countryId) references Countries(id)
--);

--create table Books
--(
--id int not null identity primary key,
--title nvarchar(max) not null check (title <> N''),
--pages int not null check (pages > 0),
--price int not null check (price > 0),
--publishDate date not null check (publishDate < cast(getdate() as date)),
--authorId int not null,
--themeId int not null,
--foreign key (authorId) references Authors(id),
--foreign key (themeId) references Themes(id)
--);

--create table Shops
--(
--id int not null identity primary key,
--name nvarchar(max) not null check (name <> N''),
--countryId int not null 
--foreign key (countryId) references Countries(id)
--);

--create table Sales
--(
--id int not null identity primary key,
--price int not null check (price > 0),
--quantity int not null check (quantity > 0),
--saleDate date not null default (cast(getdate() as date)),
--bookId int not null,
--shopId int not null
--foreign key (bookId) references Books(id),
--foreign key (shopId) references Shops(id)
--);

-----INSERT---
--insert into Themes (name)
--values
--('Детектив'),
--('Программирование'),
--('Администрирование'),
--('Дизайн'),
--('Хоррор');

--insert into Countries (name)
--values
--('Украина'),
--('Польша'),
--('США'),
--('Великобритания'),
--('Япония');

--insert into Shops (name, countryId)
--values
--('Буква', 2),
--('Yakaboo', 5),
--('Книжный клуб', 1),
--('Wonderful Book', 3),
--('Paragraph', 4),
--('Bookling Gulliver', 3),
--('Bookstore Ye', 5);

--insert into Authors (name, surname, countryId)
--values
--('Говард Филлипс', 'Лавкрафт', 3),
--('Джонатан', 'Виндермен', 3),
--('Эдгар Аллан', 'По', 3),
--('Герберт', 'Шилдт', 4),
--('Осаму', 'Дазай', 5),
--('Денис', 'Колисниченко', 1),
--('Иван', 'Франко', 1);

--insert into Books (title, pages, price, publishDate, authorId, ThemeId)
--values
--('Золотой жук', 125, 15, '03-12-2014', 3, 1),
--('Дизайн Microsoft', 523, 16, '11-02-2015', 2, 4),
--('Администрирование. Самоучитель', 550, 18, '05-20-2017', 7, 3),
--('Программирование для Microsoft Windows', 600, 56, '03-12-2014', 4, 2),
--('Захар Беркут', 636, 17, '07-25-2011', 8, 1),
--('Зов Ктулху', 150, 25, '04-15-2013', 1, 5),
--('Закатное солнце', 199, 20, '02-01-2012', 5, 5),
--('No Longer Human', 250, 35, '05-20-2015', 5, 5);

--insert into Sales (price, quantity, saleDate, bookId, shopId)
--values
--(15, 45, '09-01-2019', 1, 1),
--(50, 30, '09-02-2019', 2, 2),
--(16, 41, '09-05-2019', 3, 3),
--(18, 15, '09-15-2019', 4, 4),
--(56, 20, '09-16-2019', 5, 5),
--(17, 35, '09-30-2019', 6, 5),
--(25, 58, '10-01-2019', 7, 4),
--(20, 54, '10-01-2019', 8, 3),
--(15, 20, '10-15-2019', 1, 2),
--(50, 46, '10-16-2019', 2, 1),
--(16, 15, '10-19-2019', 3, 2),
--(18, 18, '10-19-2019', 4, 3),
--(56, 30, '10-20-2019', 5, 4),
--(17, 68, '10-30-2019', 6, 5),
--(25, 47, '10-31-2019', 7, 1),
--(20, 67, '10-31-2019', 8, 5);

----SELECT----
----1 Show all books with more than 500 but less than 650 pages.
--select *
--from Books
--where Books.pages > 500 and Books.pages < 650;

----2 Show all books where the first letter of the title is either "А", or "З".
--select *
--from Books
--where Books.title like 'А%' or Books.title like 'З%';

----3 Show all books of the "Детектив" genre with number of sold books more than 30 copies.
--select Books.title, Books.pages, Sales.quantity
--from Books, Themes, Sales
--where Themes.id = Books.themeId and Books.id = Sales.bookId 
--and Themes.[name] = 'Детектив' and Sales.quantity > 30;

----4 Show all books that have the word "Microsoft" in their title but not the word "Windows".
--select *
--from Books
--where Books.title like '%Microsoft%' and Books.title not like '%Windows%';

----5 Show all books (title, subject, full name of the author in one cell), with price of one page less than 0.65.
--select Books.title + ' ' + Themes.[name] + ' ' + Authors.[name] + ' ' + Authors.surname
--from Books, Authors, Themes
--where Themes.id = Books.themeId and Authors.id = Books.authorId
--and (Books.price / Books.pages) < 0.65;

----6 Show all books with 4 words in their titles.
--select *
--from Books
--WHERE LEN(Books.title)-LEN(REPLACE(Books.title, ' ', ''))+1 = 4;

----7
--select distinct Books.title, Themes.[name], Authors.[name] + Authors.surname AS 'Имя автора', Sales.price, Sales.quantity, Shops.[name]
--from Books, Themes, Sales, Authors, Shops, Countries
--where Themes.id = Books.themeId  and Books.id = Sales.bookId and Shops.id = Sales.shopId
--and Countries.id = Shops.countryId and Authors.id = Books.authorId
--and Books.title not like '%А%' and  Books.title not like '%а%' 
--and Themes.[name] <> 'Программирование' and Authors.[name] <> 'Герберт' and Authors.surname <> 'Шилдт'
--and Sales.price > 10 and Sales.price < 20 and Sales.quantity > 8 and Countries.[name] <> 'Украина';

----8
--SELECT COUNT(distinct Authors.id) AS 'Количество авторов',
--COUNT(distinct Books.id) AS 'Количество книг',
--AVG(distinct Sales.price) AS 'Средняя цена продажи',
--AVG(distinct Books.pages) AS 'Среднее количество страниц'
--from Authors, Books, Sales

----9
--SELECT Themes.[name], SUM(Books.pages) AS 'Сумма страниц'
--from Themes JOIN Books
--on Themes.id = Books.themeId
--group by Themes.[name]; 

----10
--SELECT Authors.[name] + ' ' + Authors.surname AS 'Имя автора', COUNT(Books.id) as 'Количество книг', SUM(Books.pages) AS 'Сумма страниц'
--from Authors JOIN Books
--on Authors.id = Books.authorId
--group by Authors.[name] + ' ' + Authors.surname; 

----11
--SELECT Books.title
--from Themes, Books
--where Themes.id = Books.themeId and Books.pages = (select max(pages) from books)
--group by Books.title;

----12
--SELECT Themes.[name], Books.pages
--from Themes, Books
--where Themes.id = Books.themeId and Books.pages < (select avg(pages) from books);
