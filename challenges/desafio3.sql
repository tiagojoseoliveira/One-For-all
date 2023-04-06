SELECT
user_name AS 'pessoa_usuaria',

(SELECT COUNT(*) FROM SpotifyClone.history
WHERE user_id = user.user_id) AS 'musicas_ouvidas',

ROUND((SELECT SUM(time) 
FROM SpotifyClone.song
WHERE song_id IN (
SELECT song_id FROM SpotifyClone.history 
WHERE user_id = user.user_id)) 
/ 60, 2) AS 'total_minutos'

FROM SpotifyClone.user AS user
ORDER BY user_name;
