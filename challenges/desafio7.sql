SELECT 
artist.artist_name AS artista,
album.album_name AS album,
COUNT(user_artist.artist_id) AS pessoas_seguidoras

FROM SpotifyClone.artist AS artist

INNER JOIN SpotifyClone.album AS album
ON album.artist_id = artist.artist_id

INNER JOIN SpotifyClone.follow_artist AS user_artist
ON user_artist.artist_id = artist.artist_id

GROUP BY artista, album
ORDER BY
    pessoas_seguidoras DESC,
    artista,
    album;
