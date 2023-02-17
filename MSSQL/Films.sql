/*CREATE DATABASE Films
GO
USE Films
CREATE TABLE Film
(
	id int IDENTITY PRIMARY KEY NOT NULL,
	title nvarchar(60) NOT NULL,
	director nvarchar(30),
	release_year int CHECK (release_year > 1900) default 1901,
	country nvarchar(20),
	genre nvarchar(100)	  
);*/

---INSERT---
/*INSERT INTO Film(title, director, release_year, country, genre)
VALUES ('Titanic', 'Cameron', 1997, 'USA', 'Comedy');*/
/*INSERT INTO Film(title, director, release_year, country, genre)
VALUES ('Terminator', 'Cameron', 1980, 'USA', 'Action'),
('Matrix', 'Vachovsky', 1996, 'USA', 'Action'),
('Batman', 'Nolan', 2008, 'USA', 'Comics'),
('Joker', ' ',  2019, 'USA', 'Drama'),
('Dambo', 'Someone', 2018, 'USA', 'Cartoon');*/

/*SELECT *
FROM Film;*/

/*SELECT title, release_year
FROM Film;*/

/*SELECT title AS 'Название', genre AS 'Жанр'
FROM Film  WHERE release_year > 2000;*/

/*UPDATE Film
SET country = 'UK'
WHERE id = 3 OR id = 1;*/

/*DELETE FROM Film
WHERE id = 2;*/

/*SELECT *
FROM Film
ORDER BY release_year;*/