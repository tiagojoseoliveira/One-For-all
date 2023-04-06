CREATE TABLE SpotifyClone.favorites  (
 
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  PRIMARY KEY (user_id, song_id),
  FOREIGN KEY (user_id) REFERENCES user(user_id)

/*ON DELETE CASCADE, isso significa que quando um registro da tabela principal é excluído, 
todos os registros relacionados da tabela referenciada serão automaticamente excluídos também, 
sem a necessidade de executar uma instrução DELETE separada. */

    ON DELETE CASCADE,
  FOREIGN KEY (song_id) REFERENCES song(song_id),

  /* UNIQUE_SONG é uma restrição de índice único que impede a 
  inserção de registros duplicados na tabela favorite_songs. */.

  CONSTRAINT unique_song UNIQUE (user_id, song_id)
) engine = InnoDB;



INSERT INTO SpotifyClone.favorites (user_id, song_id) VALUES
	('1', '3'),
	('1', '6'),
	('1', '10'),
	('2', '4'),
	('3', '1'),
	('3', '3'),
	('4', '7'),
	('4', '4'),
	('5', '10'),
	('5', '2'),
	('8', '4'),
	('9', '7'),
	('10', '3');
