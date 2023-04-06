SELECT
user.user_name AS 'pessoa_usuaria',

IF(MAX(YEAR(reproduction_date)) >= 2021, 'Ativa', 'Inativa') 
AS 'status_pessoa_usuaria'

FROM SpotifyClone.user AS user
LEFT JOIN SpotifyClone.history AS history
ON history.user_id = user.user_id

GROUP BY pessoa_usuaria
ORDER BY user_name;
