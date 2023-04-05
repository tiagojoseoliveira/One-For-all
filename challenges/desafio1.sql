DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.artist(
  artist_id INT PRIMARY KEY auto_increment,
  artist_name VARCHAR(45) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.plan(
  plan_id INT PRIMARY KEY auto_increment,
  plan_name VARCHAR(45) NOT NULL,
  plan_price DOUBLE NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
  album_id INT PRIMARY KEY auto_increment,
  album_name VARCHAR(45) NOT NULL,
  artist_id INT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist (artist_id),
  release_year YEAR(4) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.user(
  user_id INT PRIMARY KEY auto_increment,
  user_name VARCHAR(45) NOT NULL,
  age INT NOT NULL,
  plan_id INT NOT NULL,
  FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plan(plan_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.song(
  song_id INT PRIMARY KEY auto_increment,
  song_name VARCHAR(45) NOT NULL,
  time SMALLINT(3) NULL,
  release_year YEAR(4) NOT NULL,
  artist_id INT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist (artist_id),
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.album (album_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.history(
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.user (user_id),
  song_id INT NOT NULL,
  FOREIGN KEY (song_id) REFERENCES SpotifyClone.song (song_id),
  reproduction_date DATETIME NOT NULL,
  PRIMARY KEY(user_id, song_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.follow_artist(
  user_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES SpotifyClone.user (user_id),
  artist_id INT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist (artist_id),
  PRIMARY KEY(user_id, artist_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.plan (plan_name, plan_price)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99),
  ('pessoal', 6.99);

INSERT INTO SpotifyClone.user (user_name, age, plan_id)
VALUES
  ('Barbara Liskov', 82, 1),
  ('Robert Cecil Martin', 58, 1),
  ('Ada Lovelace', 37, 2),
  ('Martin Fowler', 46, 2),
  ('Sandi Metz', 58, 2),
  ('Paulo Freire', 19, 3),
  ('Bell Hooks', 26, 3),
  ('Christopher Alexander', 85, 4),
  ('Judith Butler', 45, 4),
  ('Jorge Amado', 58, 4);

INSERT INTO SpotifyClone.artist (artist_name)
VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Baco Exu do Blues'),
  ('Blind Guardian'),
  ('Nina Simone');

INSERT INTO SpotifyClone.follow_artist (user_id, artist_id)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 4),
  (5, 5),
  (5, 6),
  (6, 6),
  (6, 1),
  (7, 6),
  (9, 3),
  (10, 2);

INSERT INTO SpotifyClone.album (album_name, artist_id, release_year)
VALUES
  ('Renaissance', 1, '2022'),
  ('Jazz', 2, '1978'),
  ('Hot Space', 2, '1982'),
  ('Falso Brilhante', 3, '1998'),
  ('Vento de Maio', 3, '2001'),
  ('QVVJFA?', 4, '2003'),
  ('Somewhere Far Beyond', 5, '2007'),
  ('I Put A Spell On You', 6, '2012');

INSERT INTO SpotifyClone.song (song_name, time, album_id, artist_id, release_year)
VALUES
  ("BREAK MY SOUL", 279, 1, 1, 2022),
  ("VIRGO'S GROOVE",369, 1, 1, 2022),
  ("ALIEN SUPERSTAR", 116, 1, 1, 2022),
  ("Don't Stop Me Now", 203, 2, 2, 1978),
  ("Under Pressure", 152, 3, 2, 1982),
  ("Como Nossos Pais", 105, 4, 3, 1998),
  ("O Medo de Amar é o Medo de Ser Livre", 207, 5, 3, 2001),
  ("Samba em Paris", 267, 6, 4, 2003),
  ("The Bard's Song", 244, 7, 5, 2007),
  ("Feeling Good", 100, 8, 6, 2012);

INSERT INTO SpotifyClone.history (user_id, song_id, reproduction_date)
VALUES
  (1, 8, "2022-02-28 10:45:55"),
  (1, 2, "2020-05-02 05:30:35"),
  (1, 10, "2020-03-06 11:22:33"),
  (2, 10, "2022-08-05 08:05:17"),
  (2, 7, "2020-01-02 07:40:33"),
  (3, 10, "2020-11-13 16:55:13"),
  (3, 2, "2020-12-05 18:38:30"),
  (4, 8, "2021-08-15 17:10:10"),
  (5, 8, "2022-01-09 01:44:33"),
  (5, 5, "2020-08-06 15:23:43"),
  (6, 7, "2017-01-24 00:31:17"),
  (6, 1, "2017-10-12 12:35:20"),
  (7, 4, "2011-12-15 22:30:49"),
  (8, 4, "2012-03-17 14:56:41"),
  (9, 9, "2022-02-24 21:14:22"),
  (10, 3, "2015-12-13 08:30:22");

