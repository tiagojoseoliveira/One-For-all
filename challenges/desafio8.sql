SELECT 
artist.artist_name as artista, 
album.album_name as album
FROM SpotifyClone.artist as artist

INNER JOIN SpotifyClone.album as album 
ON album.artist_id = artist.artist_id

WHERE artist.artist_name = 'Elis Regina'
ORDER BY album.album_name;
