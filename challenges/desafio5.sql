SELECT
song_name AS 'cancao',
(SELECT COUNT(*) FROM SpotifyClone.history
WHERE song_id = song.song_id) AS "reproducoes"

FROM SpotifyClone.song AS song
ORDER BY reproducoes DESC, song_name
LIMIT 2;
