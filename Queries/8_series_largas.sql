/*
Hola, analista. Estamos evaluando implementar una función que pregunte 
'¿Sigues ahí?' como Netflix. Necesitamos identificar las reproducciones
donde el usuario vio de forma continua un video por un tiempo mayor o 
igual al 90% de la duración total de la película o serie. Muéstrame el 
título de la media, el género y la cantidad de reproducciones que cumplieron 
este comportamiento maratónico.
*/

WITH total_porcentaje_reproducciones AS (
	SELECT
		w.media_id,
		m.genre,
		m.title,
		w.minutes_played,
		m.duration_minutes,
		ROUND(((w.minutes_played * 100.0)/m.duration_minutes), 2) AS porcentaje
	FROM watch_history AS w
	INNER JOIN media AS m
		ON w.media_id = m.media_id
)
SELECT *
FROM total_porcentaje_reproducciones
WHERE porcentaje >= 90.00
ORDER BY porcentaje DESC;

/*
Hola. Revisando la información devuelta por la query, encontramos que hay un
total de 570 reproducciones que cumplen con el comportamiento maratónico de ver un video 
por un tiempo mayor o igual al 90% de la duración total de la película o serie.

El reporte se envía adjunto en un archivo CSV para su revisión. Por favor, 
revisa el archivo y notifícanos si necesitas

BTW, me llamo William para futuras referencias. Gracias por tu colaboración.
*/