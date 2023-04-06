SELECT
  COUNT(*) AS musicas_no_historico
FROM
  SpotifyClone.history AS history
WHERE
  user_id = 1;
