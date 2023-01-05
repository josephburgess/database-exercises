TRUNCATE TABLE albums, artists RESTART IDENTITY;

INSERT INTO albums (title, release_year) VALUES ('Parklife', '1995');
INSERT INTO albums (title, release_year) VALUES ('Demon Days', '2005');
INSERT INTO artists (name, genre) VALUES('Pixies', 'Rock');
INSERT INTO artists (name, genre) VALUES('ABBA', 'Pop');