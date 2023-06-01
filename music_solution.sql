-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
(
	id SERIAL PRIMARY KEY,
	artist_name TEXT NOT NULL
);

CREATE TABLE albums
(
	id SERIAL PRIMARY KEY,
	album_name TEXT NOT NULL,
	release_date DATE NOT NULL
);

CREATE TABLE artists_albums
(
	id SERIAL PRIMARY KEY,
	artist_id INTEGER NOT NULL,
	album_id INTEGER NOT NULL
);

CREATE TABLE songs
(
	id SERIAL PRIMARY KEY,
	song_name TEXT NOT NULL,
	duration_in_seconds INTEGER NOT NULL
	album_id INTEGER NOT NULL
);

CREATE TABLE producers
(
	id SERIAL PRIMARY KEY,
	producer_name TEXT NOT NULL
);

CREATE TABLE producers_albums
(
	id SERIAL PRIMARY KEY,
	producer_id INTEGER NOT NULL.
	album_id INTEGER NOT NULL
);

INSERT INTO artists
	(artist_name)
VALUES
	('Hanson'),
	('Queen'),
	('Mariah Carey'),
	('Boyz II Men'),
	('Lady Gaga'),
	('Bradley Cooper'),
	('Nickelback'),
	('Jay Z'),
	('Alicia Keys'),
	('Katy Perry'),
	('Juicy J'),
	('Maroon 5'),
	('Christina Aguilera'),
	('Avril Lavigne'),
	('Destiny''s Child');

INSERT INTO albums
	(album_name, release_date)
VALUES
	('Middle of Nowhere', '04-15-1997'),
	('A Night at the Opera', '10-31-1975'),
	('Daydream', '11-14-1995'),
	('A Star Is Born', '09-27-2018'),
	('Silver Side Up', '08-21-2001'),
	('The Blueprint 3', '10-20-2009'),
	('Prism', '12-17-2013'),
	('Hands All Over', '06-21-2011'),
	('Let Go', '05-14-2002'),
	('The Writing''s on the Wall', '11-07-1999');

INSERT INTO artists_albums
	(artist_id, album_id)
VALUES
	(1, 1),
	(2, 2),
	(3, 3),
	(4, 3),
	(5,4),
	(6,4),
	(7,5),
	(8,6),
	(9,6),
	(10,7),
	(11,7),
	(12,8),
	(13,8),
	(14,9),
	(15,10);

INSERT INTO songs
	(song_name, duration_in_seconds, album_id)
VALUES
	('MMMBop', 238, 1),
	('Bohemian Rhaopsody', 355, 2),
	('One Sweet Day', 282, 3),
	('Shallow', 216, 4),
	('How You Remind Me', 223, 5),
	('New York State of Mind', 276, 6),
	('Dark Horse', 215, 7),
	('Moves Like Jagger', 201, 8),
	('Complicated', 244, 9),
	('Say My Name', 240, 10);

INSERT INTO producers
	(producer_name)
VALUES
	('Dust Brothers'),
	('Stephen Lironi'),
	('Roy Thomas Baker'),
	('Walter Afanasieff'),
	('Benjamin Rice'),
	('Rick Parashar'),
	('Al Shux'),
	('Max Martin'),
	('Cirkut'),
	('Shellback'),
	('Benny Blanco'),
	('The Matrix'),
	('Darkchild');

INSERT INTO producers_albums
	(producer_id, album_id)
VALUES
	(1,1),
	(2,1),
	(3,2),
	(4,3),
	(5,4),
	(6,5),
	(7,6),
	(8,7),
	(9,7),
	(10,8),
	(11,8),
	(12,9),
	(13,10);