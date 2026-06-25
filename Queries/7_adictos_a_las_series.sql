/*
Buenas. Queremos crear una insignia especial en el perfil 
para los usuarios más fieles a las series de televisión. 
Necesito el listado de los usuarios (su user_id y el conteo 
de plays) que hayan dado 'play' a contenidos de tipo 'Series' 
más de 10 veces en total históricos de la plataforma.
*/


WITH reproducciones AS(
	SELECT 
		user_id,
		COUNT(playing_id) AS reproducciones_series
	FROM watch_history AS w
	INNER JOIN media AS m
		ON w.media_id = m.media_id
	WHERE media_type = 'Series'
	GROUP BY user_id
)
SELECT 
	*
FROM reproducciones
ORDER BY reproducciones_series DESC;

/*
Hola. Revisando la información devuelta por la query, encontramos que 
no hay registros con reproducciones de series mayores a 10.
*/