/*
William, un análisis crítico: Queremos medir el nivel de interacción 
cruzada. Necesito saber el listado de los usuarios (su nombre y correo) 
de plan Premium que hayan visto contenido cuyo género sea Sci-Fi o Drama, 
pero que además su método de pago registrado sea Gift Card. El 
departamento de compras quiere trackear este comportamiento.
*/

WITH tendencias AS (
	SELECT 
		u.user_id, 
		u.user_name,
		u.email,
		s.plan_id,
		p.plan_name,
		m.genre,
		s.payment_method,
		COUNT(u.user_id) OVER(PARTITION BY u.user_id) AS cuenta
	FROM users AS u
	INNER JOIN subscriptions AS s
		ON u.user_id = s.user_id
	INNER JOIN plans AS p
		ON p.plan_id = s.plan_id
	INNER JOIN watch_history as W
		ON w.user_id = u.user_id
	INNER JOIN media AS m
		ON m.media_id = w.media_id
	WHERE 
		s.plan_id = 3 AND
		m.genre IN ('Sci-FI', 'Drama') AND
		s.payment_method = 'Gift Card'
)
SELECT *
FROM tendencias AS t
GROUP BY 
	t.user_id,
	t.user_name,
	t.email,
	t.plan_id,
	t.plan_name,
	t.genre,
	t.payment_method,
	t.cuenta
ORDER BY user_id;

/*
Hola, te envío el archivo adjunto con la información solicitada. 
*/