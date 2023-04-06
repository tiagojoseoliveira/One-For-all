SELECT
FORMAT(MIN(plan_price), 2) AS 'faturamento_minimo',

CONVERT(MAX(plan_price), CHAR) AS 'faturamento_maximo',

CONVERT(ROUND(SUM(plan.plan_price)/COUNT(user.plan_id),2), CHAR) 
AS 'faturamento_medio',

CONVERT(ROUND(SUM(plan.plan_price),2), CHAR) AS 'faturamento_total'

FROM SpotifyClone.user AS user
JOIN SpotifyClone.plan AS plan
ON user.plan_id = plan.plan_id;
